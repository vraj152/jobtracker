package com.jt.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.jt.entity.Application;
import com.jt.entity.Job;
import com.jt.entity.Resume;
import com.jt.entity.User;
import com.jt.service.ApplicationService;
import com.jt.service.JobService;
import com.jt.service.ResumeService;
import com.jt.service.UserService;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.PutObjectRequest;

@Controller
public class MainController {

	@Autowired
	UserService uservice;
	
	@Autowired
	ApplicationService appservice;
	
	@Autowired
	JobService jservice;
	
	@Autowired
	ResumeService rservice;
	
	private static final int thumb = 3;
	private static String accessKey = "";
	private static String secretKey = "";
	
	public static Object checkSession(HttpServletRequest request){
		HttpSession session = request.getSession();
		
		if(session.getAttribute("loggedInUser")==null){
			return false;
		}return session.getAttribute("loggedInUser");
	}
	
	public static void setSession(HttpServletRequest request, User user){
		HttpSession session = request.getSession();
		session.setAttribute("loggedInUser", user);
	}
	
	@RequestMapping(value ="/verifyuser.htm", method = RequestMethod.POST)
	public ModelAndView verifyUser(@ModelAttribute User user, HttpServletRequest request) throws JSONException {
		ModelAndView modelAndView;
		
		Object response = uservice.validateUser(user.getUname(), user.getPwd());
		
		if(response.getClass().equals(User.class)){
			user = (User) response;
			setSession(request, user);
			modelAndView = new ModelAndView("landing","appres",appservice.fetchAllApps(user)).addObject("userDetails", user);
		}else{
			modelAndView = new ModelAndView("index", "credentials", new User());
		}
		return modelAndView;
	}
	
	@RequestMapping(value = "/add_pos.htm", method = RequestMethod.GET)
	public ModelAndView newPositionPage(HttpServletRequest request) {
		Object res = checkSession(request);
		if(res.getClass()!=User.class){
			return new ModelAndView("index","credentials",new User()).addObject("sessionMessage","Session Timeout, please login again!");
		}
		User u = (User) res;
		
		Map<String, Object> models = new HashMap<String, Object>();
		
		models.put("resumes", rservice.getAllResumes(u));
		models.put("positionDetails", new Application());
		models.put("userinfo", u);
		
		return new ModelAndView("addpos").addAllObjects(models);
	}
	
	@RequestMapping(value = "/save_job.htm", method = RequestMethod.POST)
	public ModelAndView saveJobDetails(@ModelAttribute Application app,HttpServletRequest request) {
		Object res = checkSession(request);
		if(res.getClass()!=User.class){
			return new ModelAndView("index","credentials",new User()).addObject("sessionMessage","Session Timeout, please login again!");
		}
		User u = (User) res;
		
		String jobBoard = request.getParameter("jobboard");
		
		String job_desc = "Not available";
		String job_title = "Not available";
		String date_posted = "Not available";
		String req_id = "Couldn't find";
		String location = "Not available";
		
		Job currentJob = app.getJob();
		
		if(jobBoard.equals("0")){
			String baseURL = "http://localhost:5000/";
			String endPoint = "getData?";
			JSONObject myResponse = null;
			
			try{
		    	URL url = new URL(baseURL + endPoint + "url=" + app.getJob().getUrl());
		    	HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		    	conn.setRequestMethod("GET");
	            
	            if (conn.getResponseCode() != 200) {
	                throw new RuntimeException("Failed : HTTP Error code : " + conn.getResponseCode());
	            }
	            
	            BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	            String inputLine;
	            StringBuffer sb = new StringBuffer();
	            while ((inputLine = in.readLine()) != null) {
	            	sb.append(inputLine);
	            }
	            in.close();
	            
	            myResponse = new JSONObject(sb.toString());
	            conn.disconnect();
		    }catch(Exception e){
		    	System.out.println(e.getMessage());
		    }

			try{
				if(myResponse!=null & myResponse.get("message").equals("Data found")){
					job_desc = (String) myResponse.get("job_desc");
					job_title = (String) myResponse.get("job_title");
					
					if(((String) myResponse.get("date_posted")).length()>0){
						date_posted = (String) myResponse.get("date_posted");
					}
					
					if(((String) myResponse.get("req_id")).length()>0){
						req_id = (String) myResponse.get("req_id");
					}
					location = (String) myResponse.get("location");
				}
			}catch(Exception e){
				System.out.println(e.getMessage());
			}
		}else{
			job_desc = request.getParameter("jd");
			job_title = request.getParameter("position");
			date_posted = request.getParameter("date_post");
			req_id = request.getParameter("req_id");
			location = request.getParameter("location");
			System.out.println("else");
			System.out.println(job_desc + " " + job_title + " " + date_posted + " " + req_id + " " + location);
		}
		
		currentJob.setJob_desc(job_desc);
		currentJob.setPosition(job_title);
		currentJob.setPosted_date(date_posted);
		currentJob.setLocation(location);
		currentJob.setRequisition_id(req_id);
		
		Object validOp = jservice.validateJob(currentJob);
		
		if(validOp.getClass()!=Job.class){
			jservice.insertJob(currentJob);
		}else{
			currentJob = (Job) validOp;
		}
		
		String temp = app.getEmail_used();
		
		if(!temp.equals(u.getPrimary_email())){
			String str = u.getAnother_email(); 
			if(str!=null){
				boolean test = Arrays.asList(str.split(",")).contains(temp);
		        if(!test){
		        	u.setAnother_email(u.getAnother_email()+","+temp);
		        }
			}else{
				u.setAnother_email(temp);
			}
			uservice.updateUser(u);
		}
		
		app.setJob(currentJob);
		app.setStatus("Applied");
		app.setUser(u);
		
		setSession(request, u);
		
		appservice.insertPosition(app);
		
		return new ModelAndView("landing","appres",appservice.fetchAllApps(u)).addObject("userDetails", u);
	}
	
	@RequestMapping(value = "/updateUser.htm", method = RequestMethod.POST)
	public ModelAndView updateDetail(@ModelAttribute User user, @RequestParam("file") CommonsMultipartFile file, HttpServletRequest request) {
		Object res = checkSession(request);
		if(res.getClass()!=User.class){
			return new ModelAndView("index","credentials",new User()).addObject("sessionMessage","Session Timeout, please login again!");
		}
		User existingDetail = (User) res;
		
		String profile_picture = "resources/jpg/avatar-4.jpg";
		
		if(file != null & file.getOriginalFilename().length() > 0){
			AWSCredentials awsCredentials = new BasicAWSCredentials(accessKey, secretKey);
			AmazonS3Client c = new AmazonS3Client(awsCredentials);
			
			String file_name = existingDetail.getUname() + "_avatar";
			
			String file_path = existingDetail.getUname() + "/" + file_name;
			String bucketName = "resumejobtracker";
			
			c.putObject(new PutObjectRequest(bucketName, file_path ,rservice.convert(file)).withCannedAcl(CannedAccessControlList.PublicRead));
			profile_picture = c.getResourceUrl(bucketName, file_path);
		}
		
		user.setAnother_email(existingDetail.getAnother_email());
		user.setUserid(existingDetail.getUserid());
		user.setPhoto(profile_picture);
		user.setUname(existingDetail.getUname());
		
		uservice.updateUser(user);
		setSession(request, user);
		
		return new ModelAndView("landing","appres",appservice.fetchAllApps(user)).addObject("userDetails", user);
	}
	
	@RequestMapping(value = "/saveResume.htm", method = RequestMethod.POST)
	public ModelAndView addNewResume(@ModelAttribute Resume resume, @RequestParam("file") List<CommonsMultipartFile> file, HttpServletRequest request) {
		Object res = checkSession(request);
		if(res.getClass()!=User.class){
			return new ModelAndView("index","credentials",new User()).addObject("sessionMessage","Session Timeout, please login again!");
		}
		User u = (User) res;
		
		resume.setRes_date(new SimpleDateFormat("dd/MM/yyyy").format(new Date()));
		resume.setUser(u);
		
		String objectUrl = "";
		
		AWSCredentials awsCredentials = new BasicAWSCredentials(accessKey, secretKey);
		AmazonS3Client c = new AmazonS3Client(awsCredentials);
		
		for(int j=0; j<file.size(); j++){
			String file_name = "";
			
			if(resume.getRes_name().length() > 0){
				file_name = resume.getRes_name();
			}else{
				file_name = file.get(j).getOriginalFilename();
			}
			
			String file_path = u.getUname() + "/" + file_name;
			String bucketName = "resumejobtracker";
			
			c.putObject(new PutObjectRequest(bucketName, file_path ,rservice.convert(file.get(j))).withCannedAcl(CannedAccessControlList.PublicRead));
			objectUrl = c.getResourceUrl(bucketName, file_path);
			
			resume.setRes_name(file_name);
			resume.setRes_url(objectUrl);
			resume.setRes_path(file_path);
			rservice.addNewResume(resume);
		}
		
		return new ModelAndView("manageResume","resumes",rservice.getAllResumes(u)).addObject("newResume", new Resume());
	}
	
	@RequestMapping(value = "/saveUser.htm", method = RequestMethod.POST)
	public ModelAndView saveUser(@ModelAttribute User user, HttpServletRequest request) {
		user.setPhoto("resources/jpg/avatar-4.jpg");
		uservice.addNewUser(user);
		return new ModelAndView("index","credentials",new User());
	}
	
	@RequestMapping(value = "/changestatus.htm", method = RequestMethod.POST)
	public ModelAndView updateStatus(HttpServletRequest request) {
		Object res = checkSession(request);
		if(res.getClass()!=User.class){
			return new ModelAndView("index","credentials",new User()).addObject("sessionMessage","Session Timeout, please login again!");
		}
		User user = (User) res;
		
		Application app = appservice.findApplication(Integer.parseInt(request.getParameter("app_id")));
		String new_stage = request.getParameter("job_stage");
		
		app.setStatus(new_stage);
		appservice.updateApplication(app);
		
		return new ModelAndView("landing","appres",appservice.fetchAllApps(user)).addObject("userDetails", user);
	}
	
	@RequestMapping(value = "/deleteApp.htm", method = RequestMethod.GET)
	public ModelAndView deleteApp(HttpServletRequest request) {
		Object res = checkSession(request);
		if(res.getClass()!=User.class){
			return new ModelAndView("index","credentials",new User()).addObject("sessionMessage","Session Timeout, please login again!");
		}
		User user = (User) res;
		
		int app_id = Integer.parseInt(request.getParameter("var"));
		appservice.deleteApplication(app_id);
		return new ModelAndView("landing","appres",appservice.fetchAllApps(user)).addObject("userDetails", user);
	}
	
}
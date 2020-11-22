package com.jt.dao;

import java.io.File;
import java.io.FileOutputStream;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.jt.entity.Resume;
import com.jt.entity.User;

@Repository
public class ResumeDAO {
	@Autowired
	SessionFactory sessionf;
	
	public File convert(MultipartFile mfile){
		File convFile = new File(mfile.getOriginalFilename());
	    try{
			convFile.createNewFile();
			FileOutputStream fos = new FileOutputStream(convFile); 
		    fos.write(mfile.getBytes());
		    fos.close(); 
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
	    return convFile;
	}

	public void addNewResume(Resume res){
		try{
			Session session = sessionf.openSession();
			Transaction tr = session.beginTransaction();
			session.save(res);
			tr.commit();
			session.close();
		}catch (Exception e){
			System.out.println(e.getMessage());
		}
	}
	
	public List<Resume> getAllResumes(User user){
		List<Resume> uList = null;
		
		try
		{
			Session session = sessionf.openSession();
			Query q = session.createQuery("from Resume where user_id='"+user.getUserid()+"'");
			uList = q.list();
			
			session.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return uList;
	}
}

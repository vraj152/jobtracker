package com.jt.service;

import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jt.dao.ApplicationDAO;
import com.jt.entity.Application;
import com.jt.entity.User;

@Service
public class ApplicationService {

	@Autowired
	ApplicationDAO appdao;
	
	public List  fetchAllApps(User user){
		return appdao.fetchAllApps(user);
	}

	public void insertPosition(Application app){
		appdao.insertPosition(app);
	}
	
	public void updateApplication(Application app){
		appdao.updateApplication(app);
	}
	
	public Application findApplication(int app_id){
		return appdao.findApplication(app_id);
	}
	
	public void deleteApplication(int app_id){
		appdao.deleteApplication(app_id);
	}
}
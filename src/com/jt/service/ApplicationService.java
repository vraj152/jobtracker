package com.jt.service;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jt.dao.ApplicationDAO;
import com.jt.entity.User;

@Service
public class ApplicationService {

	@Autowired
	ApplicationDAO appdao;
	
	public JSONObject  fetchAllApps(User user){
		return appdao.fetchAllApps(user);
	}
	
}
package com.jt.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jt.dao.UserDAO;

@Service
public class UserService {
	
	@Autowired
	UserDAO udao;
	
	public Object validateUser(String uname, String pwd){
		return udao.validateUser(uname, pwd);
	}	
}
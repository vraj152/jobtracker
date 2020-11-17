package com.jt.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jt.dao.UserDAO;
import com.jt.entity.Resume;
import com.jt.entity.User;

@Service
public class UserService {
	
	@Autowired
	UserDAO udao;
	
	public Object validateUser(String uname, String pwd){
		return udao.validateUser(uname, pwd);
	}	
	
	public List<Resume> getAllResumes(User user){
		return udao.getAllResumes(user);
	}
}
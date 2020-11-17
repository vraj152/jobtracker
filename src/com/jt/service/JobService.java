package com.jt.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jt.dao.JobDAO;
import com.jt.entity.Job;

@Service
public class JobService {

	@Autowired
	JobDAO jdao;
	
	public void insertJob(Job job){
		jdao.insertJob(job);
	}
}

package com.jt.service;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.jt.dao.ResumeDAO;
import com.jt.entity.Resume;
import com.jt.entity.User;

@Service
public class ResumeService {

	@Autowired
	ResumeDAO rdao;
	
	public void addNewResume(Resume res){
		rdao.addNewResume(res);
	}
	
	public File convert(MultipartFile mfile){
		return rdao.convert(mfile);
	}
	
	public List<Resume> getAllResumes(User user){
		return rdao.getAllResumes(user);
	}
}

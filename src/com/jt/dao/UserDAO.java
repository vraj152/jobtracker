package com.jt.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jt.entity.Resume;
import com.jt.entity.User;

@Repository
public class UserDAO {

	@Autowired
	SessionFactory sessionf;
	
	public Object validateUser(String uname, String pwd){
		Object response = null;
		try
		{
			Session session = sessionf.openSession();
			Query q = session.createQuery("from User where uname='"+uname+"' and pwd='"+pwd+"'");
			List<User> uList = q.list();
			if(uList.size()==0)
			{
				response = "Invalid User";
			}
			for (User u : uList) {
				response = u;
			}
			session.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return response;
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

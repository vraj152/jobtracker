package com.jt.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jt.entity.Application;
import com.jt.entity.User;

@Repository
public class ApplicationDAO {

	@Autowired
	SessionFactory sessionf;

	public List fetchAllApps(User user){
		List<Application> response = null;
		try
		{
			Session session = sessionf.openSession();
			Query q = session.createQuery("from Application where userid='"+user.getUserid()+"'");
			response = q.list();
			
			session.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return response;
	}
	
	public void insertPosition(Application app){
		try {
			Session session = sessionf.openSession();
			Transaction tr = session.beginTransaction();
			session.save(app);
			tr.commit();
			session.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	public void updateApplication(Application app){
		try {
			Session session = sessionf.openSession();
			Transaction tr = session.beginTransaction();
			session.update(app);
			tr.commit();
			session.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
}

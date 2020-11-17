package com.jt.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jt.entity.Job;

@Repository
public class JobDAO {

	@Autowired
	SessionFactory sessionf;

	public void insertJob(Job job){
		try {
			Session session = sessionf.openSession();
			Transaction tr = session.beginTransaction();
			session.save(job);
			tr.commit();
			session.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
}

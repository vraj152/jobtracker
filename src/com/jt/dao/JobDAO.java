package com.jt.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jt.entity.Job;
import com.jt.entity.User;

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
	
	public void updateJob(Job job){
		try {
			Session session = sessionf.openSession();
			Transaction tr = session.beginTransaction();
			session.update(job);
			tr.commit();
			session.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	public Object validateJob(Job job){
		Object response = null;
		try{
			Session session = sessionf.openSession();
			
			String position = job.getPosition();
			String company = job.getCompany();
			String req = job.getRequisition_id();
			
			Query q = session.createQuery("from Job where position= :position  and company= :company and requisition_id= :req")
					.setParameter("position", position).setParameter("company", company).setParameter("req",req);
			List<Job> jList = q.list();
			
			if(jList.size()>0){
				for (Job j : jList) {
					response = j;
				}
			}else{
				response = false;
			}
			session.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		return response;
	}
}
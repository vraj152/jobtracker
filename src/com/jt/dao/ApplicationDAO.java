package com.jt.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jt.entity.Application;
import com.jt.entity.User;

@Repository
public class ApplicationDAO {

	@Autowired
	SessionFactory sessionf;

	public JSONObject fetchAllApps(User user){
		JSONObject res = new JSONObject();
		try
		{
			Session session = sessionf.openSession();
			Query q = session.createQuery("from Application where userid='"+user.getUserid()+"'");
			List<Application> appList = q.list();
			if(appList.size()==0){
				res.put("message","No Applications");
			}else{
				res.put("message","Application Found");
			}
			
			res.put("data",appList);
			session.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return res;
	}
}

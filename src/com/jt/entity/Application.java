package com.jt.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="application")
public class Application {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int appid;
	
	@Column
	private int referral;
	
	@Column
	private String date;
	
	@Column
	private String status;
	
	@ManyToOne
	@JoinColumn(name="res_id")
	Resume resume;
	
	public Resume getResume() {
		return resume;
	}

	public void setResume(Resume resume) {
		this.resume = resume;
	}

	@ManyToOne
	@JoinColumn(name = "userid")
	User user;
	
	@ManyToOne
	@JoinColumn(name = "jobid")
	Job job;

	public int getAppid() {
		return appid;
	}

	public void setAppid(int appid) {
		this.appid = appid;
	}

	public int getReferral() {
		return referral;
	}

	public void setReferral(int referral) {
		this.referral = referral;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Job getJob() {
		return job;
	}

	public void setJob(Job job) {
		this.job = job;
	}
	
}

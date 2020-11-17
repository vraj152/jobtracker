package com.jt.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="user")
public class User {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int userid;
	
	@Column
	private String fname;
	
	@Column
	private String lname;
	
	@Column
	private String uname;
	
	@Column
	private String pwd;
	
	@Column
	private String primary_email;
	
	@Column
	private String another_email;
	
	@Column
	private String photo;
	
	@Column
	private String dob;
	
	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getPrimary_email() {
		return primary_email;
	}

	public void setPrimary_email(String primary_email) {
		this.primary_email = primary_email;
	}

	public String getAnother_email() {
		return another_email;
	}

	public void setAnother_email(String another_email) {
		this.another_email = another_email;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}
}

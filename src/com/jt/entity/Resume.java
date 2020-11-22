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
@Table(name="resume")
public class Resume {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int res_id;
	
	@Column
	private String res_name;
	
	@Column
	private String res_url;
	
	@Column
	private String res_date;
	
	@Column
	private String res_path;
	
	public String getRes_path() {
		return res_path;
	}

	public void setRes_path(String res_path) {
		this.res_path = res_path;
	}

	@ManyToOne
	@JoinColumn(name = "user_id")
	User user;

	public int getRes_id() {
		return res_id;
	}

	public void setRes_id(int res_id) {
		this.res_id = res_id;
	}

	public String getRes_name() {
		return res_name;
	}

	public void setRes_name(String res_name) {
		this.res_name = res_name;
	}

	public String getRes_url() {
		return res_url;
	}

	public void setRes_url(String res_url) {
		this.res_url = res_url;
	}

	public String getRes_date() {
		return res_date;
	}

	public void setRes_date(String res_date) {
		this.res_date = res_date;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
}

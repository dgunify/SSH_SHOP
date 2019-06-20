package com.yd.model;


import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
* @author YD
* @version 1.0
* @Description 用户
*/
@Entity
@Table(name="t_User")
public class User {
	
	@Id
	@GeneratedValue
	public int id;//主键

	public int deletestatus;// 删除状态 0表示未删除 1表示已删除
	
	public String username;//用户名
	
	public String password;//密码
	
	public String truename;//真实姓名
	
	public String address;//住址
	
	public String phone;//联系电话
	
	public String email;//邮箱
	
	public String qq;//QQ号
	
	public Date createtime;//添加时间


	
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}



	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getTruename() {
		return truename;
	}

	public void setTruename(String truename) {
		this.truename = truename;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}


	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

	public int getDeletestatus() {
		return deletestatus;
	}

	public void setDeletestatus(int deletestatus) {
		this.deletestatus = deletestatus;
	}

	
	

	

	

	

	

	
	
	
	
	
}

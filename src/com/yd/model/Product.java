package com.yd.model;


import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
* @author YD
* @version 1.0
* @Description 商品
*/
@Entity
@Table(name="t_Product")
public class Product {
	

	@Id
	@GeneratedValue
	private int id;//主键
	
	private String name;//商品名
	
	private int deletestatus;//删除状态 0表示未删除 1表示删除
	
	private String imgpath;//商品图片
	
	private Date createtime;//添加时间
	
	@ManyToOne
	@JoinColumn(name="classifyid")
	private Classify classify;//商品分类 关联分类的ID 外键
	
	private double jiage;//商品价格
	
	private String tuijian;//是否推荐  未推荐 已推荐
	
	private int dianjishu;//商品点击数
	
	private int xiaoliang;//商品销量
	
	private String maoshu;//商品介绍  

	public String getMaoshu() {
		return maoshu;
	}

	public void setMaoshu(String maoshu) {
		this.maoshu = maoshu;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getDeletestatus() {
		return deletestatus;
	}

	public void setDeletestatus(int deletestatus) {
		this.deletestatus = deletestatus;
	}

	public String getImgpath() {
		return imgpath;
	}

	public void setImgpath(String imgpath) {
		this.imgpath = imgpath;
	}

	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}
	

	public Classify getClassify() {
		return classify;
	}

	public void setClassify(Classify classify) {
		this.classify = classify;
	}

	public double getJiage() {
		return jiage;
	}

	public void setJiage(double jiage) {
		this.jiage = jiage;
	}

	public String getTuijian() {
		return tuijian;
	}

	public void setTuijian(String tuijian) {
		this.tuijian = tuijian;
	}

	public int getDianjishu() {
		return dianjishu;
	}

	public void setDianjishu(int dianjishu) {
		this.dianjishu = dianjishu;
	}

	public int getXiaoliang() {
		return xiaoliang;
	}

	public void setXiaoliang(int xiaoliang) {
		this.xiaoliang = xiaoliang;
	}
	
	
}

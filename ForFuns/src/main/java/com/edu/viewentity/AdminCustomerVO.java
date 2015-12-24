package com.edu.viewentity;

import java.util.ArrayList;
import java.util.List;

import com.edu.model.CustomerBean;

public class AdminCustomerVO {
	private Integer id;
	private String userid;
	private String name;
	private String avator;
	private String telephone;
	private String personnumber;
	private String realname;
	private Integer isartist;
	private String password;
	public AdminCustomerVO(Integer id, String name, String avator) {
		super();
		this.id = id;
		this.name = name;
		this.avator = avator;
	}
	public AdminCustomerVO(CustomerBean customerBean) {
		super();
		this.id = customerBean.getId();
		this.name = customerBean.getUsername();
		this.avator = customerBean.getAvator();
		this.userid = customerBean.getUserid();
		this.telephone = customerBean.getTelphone();
		this.personnumber = customerBean.getPersonnumber();
		this.isartist = customerBean.getIsartist();
		this.realname = customerBean.getRealname();
		this.password = customerBean.getPassword();
	}
	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public AdminCustomerVO(Integer id, String userid, String name, String avator,
			String telephone, String personnumber, String realname,
			Integer isartist) {
		super();
		this.id = id;
		this.userid = userid;
		this.name = name;
		this.avator = avator;
		this.telephone = telephone;
		this.personnumber = personnumber;
		this.realname = realname;
		this.isartist = isartist;
	}
	public static List<AdminCustomerVO> ChangeToList(List<CustomerBean> temp){
		List<AdminCustomerVO> list = new ArrayList<AdminCustomerVO>();
		if(temp.size()==0||null==temp){
			return list;
		}
		for(CustomerBean customerBean : temp){
			list.add(new AdminCustomerVO(customerBean));
		}
		return list;
	}
	
	public AdminCustomerVO() {
		super();
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAvator() {
		return avator;
	}
	public void setAvator(String avator) {
		this.avator = avator;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getPersonnumber() {
		return personnumber;
	}
	public void setPersonnumber(String personnumber) {
		this.personnumber = personnumber;
	}
	public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	public Integer getIsartist() {
		return isartist;
	}
	public void setIsartist(Integer isartist) {
		this.isartist = isartist;
	}
	
}

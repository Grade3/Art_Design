package com.edu.viewentity;

import java.util.ArrayList;
import java.util.List;

import com.edu.model.CustomerBean;

public class CustomerVO {
	private Integer id;
	private String name;
	private String avator;
	public CustomerVO(Integer id, String name, String avator) {
		super();
		this.id = id;
		this.name = name;
		this.avator = avator;
	}
	public CustomerVO(CustomerBean customerBean) {
		super();
		this.id = customerBean.getId();
		this.name = customerBean.getUsername();
		this.avator = customerBean.getAvator();
	}
	
	public static List<CustomerVO> ChangeToList(List<CustomerBean> temp){
		List<CustomerVO> list = new ArrayList<CustomerVO>();
		if(temp.size()==0||null==temp){
			return list;
		}
		for(CustomerBean customerBean : temp){
			list.add(new CustomerVO(customerBean));
		}
		return list;
	}
	
	public CustomerVO() {
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
}

package com.edu.base;

public class TreeChildItemBean {
	private String id;
	private String name;
	public TreeChildItemBean(String id, String name) {
		super();
		this.id = id;
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public TreeChildItemBean() {
		super();
	}
	
}

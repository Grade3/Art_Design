package com.edu.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 商品类型表
 * @author Gy
 *
 */
@Entity
@Table(name="pt_producttype")
public class ProductTypeBean{
	private Integer id;
	private String name;
	
	public ProductTypeBean(String name) {
		super();
		this.name = name;
	}
	
	public ProductTypeBean(Integer id, String name) {
		super();
		this.id = id;
		this.name = name;
	}
	public ProductTypeBean(){
		super();
	}
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	@Column(name = "name")
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
}

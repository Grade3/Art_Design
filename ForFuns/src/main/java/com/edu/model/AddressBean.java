package com.edu.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.hibernate.annotations.DynamicInsert;
import org.springframework.stereotype.Repository;

@Entity
@Table(name="ad_address")
@DynamicInsert
@JsonIgnoreProperties(value={"userBean"})
@Repository
public class AddressBean
{
	private Integer id;
	private String address;
	private CustomerBean customerBean;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	public Integer getId()
	{
		return id;
	}
	public void setId(Integer id)
	{
		this.id = id;
	}
	
	@Column(name="address")
	public String getAddress()
	{
		return address;
	}
	public void setAddress(String address)
	{
		this.address = address;
	}
	
	@ManyToOne(cascade=CascadeType.ALL,fetch=FetchType.EAGER)
	@JoinColumn(name="userid")
	public CustomerBean getCustomerBean()
	{
		return customerBean;
	}
	public void setCustomerBean(CustomerBean customerBean)
	{
		this.customerBean = customerBean;
	}
}

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

@Table(name="ad_address")
@Entity
public class AddressBean
{
	private Integer id;
	private String address;
	private String name;
	private String telephone;
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
	
	@Column(name="name")
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	
	@Column(name="telephone")
	public String getTelephone()
	{
		return telephone;
	}
	public void setTelephone(String telephone)
	{
		this.telephone = telephone;
	}
	
	public AddressBean(String address, String name, String telephone,
			CustomerBean customerBean)
	{
		super();
		this.address = address;
		this.name = name;
		this.telephone = telephone;
		this.customerBean = customerBean;
	}
	
	public AddressBean(Integer id, String address, String name,
			String telephone, CustomerBean customerBean)
	{
		super();
		this.id = id;
		this.address = address;
		this.name = name;
		this.telephone = telephone;
		this.customerBean = customerBean;
	}
	
	public AddressBean()
	{
		super();
	}
}

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
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="ca_customeraddress")
public class CustomerAddressBean {
	private Integer id;
	private CustomerBean customerBean;
	private AddressBean addressBean;
	public CustomerAddressBean(Integer id, CustomerBean customerBean,
			AddressBean addressBean) {
		super();
		this.id = id;
		this.customerBean = customerBean;
		this.addressBean = addressBean;
	}
	public CustomerAddressBean() {
		super();
	}
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	@ManyToOne(cascade=CascadeType.ALL,fetch=FetchType.EAGER)
	@JoinColumn(name="customerid")
	public CustomerBean getCustomerBean() {
		return customerBean;
	}
	public void setCustomerBean(CustomerBean customerBean) {
		this.customerBean = customerBean;
	}
	@OneToOne(cascade=CascadeType.ALL,fetch=FetchType.EAGER)
	@JoinColumn(name="addressid")
	public AddressBean getAddressBean() {
		return addressBean;
	}
	
	public void setAddressBean(AddressBean addressBean) {
		this.addressBean = addressBean;
	}
}

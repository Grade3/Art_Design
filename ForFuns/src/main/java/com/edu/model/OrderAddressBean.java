package com.edu.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Entity;

import org.hibernate.annotations.Cascade;

@Entity
@Table(name="oa_orderaddress")
public class OrderAddressBean {
	private Integer id;
	private OrderBean orderBean;
	private AddressBean addressBean;
	public OrderAddressBean(Integer id, OrderBean orderBean, AddressBean addressBean) {
		super();
		this.id = id;
		this.orderBean = orderBean;
		this.addressBean = addressBean;
	}
	public OrderAddressBean() {
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
	@OneToOne(cascade=CascadeType.ALL,fetch=FetchType.EAGER)
	@JoinColumn(name="orderid")
	public OrderBean getOrderBean() {
		return orderBean;
	}
	public void setOrderBean(OrderBean orderBean) {
		this.orderBean = orderBean;
	}
	@ManyToOne(cascade=CascadeType.ALL,fetch=FetchType.EAGER)
	@JoinColumn(name="addressid")
	public AddressBean getAddressBean() {
		return addressBean;
	}
	public void setAddressBean(AddressBean addressBean) {
		this.addressBean = addressBean;
	}
	
}

package com.edu.model;

import java.util.Date;

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

@Table(name="o_order")
@Entity
public class OrderBean {
	private Integer id;
	private Date current;
	private Integer ispay;
	private ProductBean productBean;
	private CustomerBean customerBean;
	private OrderAddressBean orderAddressBean;

	public OrderBean(Integer id, Date current, Integer ispay,
			ProductBean productBean, CustomerBean customerBean,
			OrderAddressBean orderAddressBean) {
		super();
		this.id = id;
		this.current = current;
		this.ispay = ispay;
		this.productBean = productBean;
		this.customerBean = customerBean;
		this.orderAddressBean = orderAddressBean;
	}
	public OrderBean() {
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
	@Column(name="current")
	public Date getCurrent() {
		return current;
	}
	public void setCurrent(Date current) {
		this.current = current;
	}
	@OneToOne(fetch=FetchType.LAZY)  
    @JoinColumn(name="productid") 
	public ProductBean getProductBean() {
		return productBean;
	}
	public void setProductBean(ProductBean productBean) {
		this.productBean = productBean;
	}
	@OneToOne(fetch=FetchType.EAGER)  
    @JoinColumn(name="customerid") 
	public CustomerBean getCustomerBean() {
		return customerBean;
	}
	public void setCustomerBean(CustomerBean customerBean) {
		this.customerBean = customerBean;
	}
	@Column(name="ispay")
	public Integer getIspay() {
		return ispay;
	}
	public void setIspay(Integer ispay) {
		this.ispay = ispay;
	}
	@OneToOne(mappedBy="orderBean")
	public OrderAddressBean getOrderAddressBean() {
		return orderAddressBean;
	}

	public void setOrderAddressBean(OrderAddressBean orderAddressBean) {
		this.orderAddressBean = orderAddressBean;
	}
	
}

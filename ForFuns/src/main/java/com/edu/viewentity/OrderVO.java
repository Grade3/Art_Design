package com.edu.viewentity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.edu.model.CustomerBean;
import com.edu.model.OrderBean;
import com.edu.model.ProductBean;

public class OrderVO
{
	private Integer id;
	private String telephone;
	private String address;
	private Date current;
	private Integer ispay;
	private Integer productid;
	private Integer customerid;
	
	public Integer getId()
	{
		return id;
	}
	public void setId(Integer id)
	{
		this.id = id;
	}
	public String getTelephone()
	{
		return telephone;
	}
	public void setTelephone(String telephone)
	{
		this.telephone = telephone;
	}
	public String getAddress()
	{
		return address;
	}
	public void setAddress(String address)
	{
		this.address = address;
	}
	public Date getCurrent()
	{
		return current;
	}
	public void setCurrent(Date current)
	{
		this.current = current;
	}
	public Integer getIspay()
	{
		return ispay;
	}
	public void setIspay(Integer ispay)
	{
		this.ispay = ispay;
	}
	public Integer getProductid()
	{
		return productid;
	}
	public void setProductid(Integer productid)
	{
		this.productid = productid;
	}
	public Integer getCustomerid()
	{
		return customerid;
	}
	public void setCustomerid(Integer customerid)
	{
		this.customerid = customerid;
	}
	
	public OrderVO(OrderBean orderBean)
	{
		super();
		id = orderBean.getId();
		telephone = orderBean.getTelephone();
		address = orderBean.getAddress();
		current = orderBean.getCurrent();
		ispay = orderBean.getIspay();
		productid = orderBean.getProductBean().getId();
		customerid = orderBean.getCustomerBean().getId();
	}
	public OrderVO(Integer id, String telephone, String address, Date current,
			Integer ispay, Integer productid, Integer customerid)
	{
		super();
		this.id = id;
		this.telephone = telephone;
		this.address = address;
		this.current = current;
		this.ispay = ispay;
		this.productid = productid;
		this.customerid = customerid;
	}
	
	/**
	 * 将list中的orderBean实体转变为ordervo
	 * @param list
	 * @return
	 */
	public static List<OrderVO> ChangeListProductToOrderVo(List<OrderBean> list ){
		List<OrderVO> orderVOs = new ArrayList<OrderVO>();
		for(int i=0;i<list.size();i++){
			OrderVO orderVO = new OrderVO(list.get(i));
			orderVOs.add(orderVO);
		}
		return orderVOs;
	}
}

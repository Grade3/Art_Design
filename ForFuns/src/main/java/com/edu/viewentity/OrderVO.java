package com.edu.viewentity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.edu.model.Customer;
import com.edu.model.Order;
import com.edu.model.Product;

public class OrderVO
{
	private Integer id;
	private String telephone;
	private String address;
	private Date current;
	private Integer ispay;
	private Integer productid;
	private Integer customerid;
	private String productname;
	private Integer money;
	private String artistname;
	private String productimg;
	private String receiver;
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
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
	
	public OrderVO(Order orderBean)
	{
		super();
		this.id = orderBean.getId();
		this.address = orderBean.getOrderAddressBean().getAddressBean().getAddress();
		this.current = orderBean.getCurrent();
		this.ispay = orderBean.getIspay();
		this.productid = orderBean.getProductBean().getId();
		this.customerid = orderBean.getCustomerBean().getId();
		this.productname = orderBean.getProductBean().getName();
		this.money = orderBean.getProductBean().getMoney();
		this.artistname = orderBean.getCustomerBean().getUsername();
		this.productimg = orderBean.getProductBean().getImgurl();
		this.receiver = orderBean.getOrderAddressBean().getAddressBean().getReceiver();
		this.telephone = orderBean.getOrderAddressBean().getAddressBean().getTelephone();
	}
	
	
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getProductimg() {
		return productimg;
	}
	public void setProductimg(String productimg) {
		this.productimg = productimg;
	}
	public Integer getMoney() {
		return money;
	}
	public void setMoney(Integer money) {
		this.money = money;
	}
	public String getArtistname() {
		return artistname;
	}
	public void setArtistname(String artistname) {
		this.artistname = artistname;
	}
	public OrderVO(Integer id, String telephone, String address, Date current,
			Integer ispay, Integer productid, Integer customerid,
			String productname, Integer money, String artistname) {
		super();
		this.id = id;
		this.telephone = telephone;
		this.address = address;
		this.current = current;
		this.ispay = ispay;
		this.productid = productid;
		this.customerid = customerid;
		this.productname = productname;
		this.money = money;
		this.artistname = artistname;
	}
	/**
	 * 将list中的orderBean实体转变为ordervo
	 * @param list
	 * @return
	 */
	public static List<OrderVO> ChangeListProductToOrderVo(List<Order> list ){
		List<OrderVO> orderVOs = new ArrayList<OrderVO>();
		if(null==list)
			return orderVOs;
		for(int i=0;i<list.size();i++){
			OrderVO orderVO = new OrderVO(list.get(i));
			orderVOs.add(orderVO);
		}
		return orderVOs;
	}
}

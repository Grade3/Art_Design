package com.edu.service;

import java.util.List;

import com.edu.base.IBaseService;
import com.edu.model.Order;

public interface IOrderService extends IBaseService<Order>{
	
	/**
	 * 验证后添加订单
	 * @return
	 * @throws Exception 
	 */
	public int AddOrder(Integer productid,Integer customerid,String address,String telephone) throws Exception;
	
	/**
	 * 通过productid获取对应订单
	 * @param productid
	 * @return
	 * @throws Exception 
	 */
	public Order getOrderByProductId(Integer productid) throws Exception;
	
	/**
	 * 通过userid获取用户订单
	 * @param customerUserid
	 * @return
	 */
	public List<Order> getCusertomerOrder(String customerUserid);
}

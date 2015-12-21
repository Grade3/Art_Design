package com.edu.dao;

import java.util.List;

import com.edu.base.IBaseDao;
import com.edu.model.OrderBean;

public interface IOrderDao extends IBaseDao<OrderBean>{
	/**
	 * 通过商品id和用户id查找订单
	 * @param productid
	 * @param customerid
	 * @return
	 */
	public OrderBean getOrderByIds(Integer productid,Integer customerid);
	
	
	/**
	 * 通过userid获取用户订单
	 * @param customerUserid
	 * @return
	 */
	public List<OrderBean> getCusertomerOrder(String customerUserid);
}

package com.edu.service;

import com.edu.base.IBaseService;
import com.edu.model.OrderBean;

public interface IOrderService extends IBaseService<OrderBean>{
	
	/**
	 * 验证后添加订单
	 * @return
	 * @throws Exception 
	 */
	public int AddOrder(Integer productid,Integer customerid,String address,String telephone) throws Exception;
	
	
	
}

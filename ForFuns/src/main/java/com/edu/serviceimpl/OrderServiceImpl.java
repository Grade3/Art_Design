package com.edu.serviceimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.edu.model.CustomerBean;
import com.edu.model.OrderBean;
import com.edu.model.ProductBean;
import com.edu.service.IOrderService;
import com.edu.service.IProductService;
import com.edu.base.BaseServiceImpl;
import com.edu.dao.ICustomerDao;
import com.edu.dao.IOrderDao;
import com.edu.dao.IProductDao;
@Transactional
@Service("orderService")
public class OrderServiceImpl extends BaseServiceImpl<OrderBean> implements IOrderService{

	@Autowired
	private IProductDao productDao;
	@Autowired
	private ICustomerDao customerDao;
	@Autowired
	private IOrderDao orderDao;
	
	@Override
	public int AddOrder(Integer productid, Integer customerid,String address,String telephone) {
		OrderBean orderBean = orderDao.getOrderByIds(productid, customerid);
		if(null == orderBean)
			return 0;
		ProductBean productBean = (ProductBean) productDao.getEntitybyId(ProductBean.class, productid);
		CustomerBean customerBean = (CustomerBean) customerDao.getEntitybyId(CustomerBean.class, customerid);
		orderBean.setCustomerBean(customerBean);
		orderBean.setProductBean(productBean);
		orderBean.setAddress(address);
		orderBean.setTelephone(telephone);
		orderDao.addEntity(orderBean);
		return 1;
	}
	
}

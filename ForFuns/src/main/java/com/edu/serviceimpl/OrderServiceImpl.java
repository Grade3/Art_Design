package com.edu.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.edu.model.CustomerBean;
import com.edu.model.OrderBean;
import com.edu.model.ProductBean;
import com.edu.service.IOrderService;
import com.edu.service.IProductService;
import com.edu.table.OrderTable;
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
	
	//如果存在的订单与用户名不一致，则为已经被购买。如果为空则添加。
	@Override
	public int AddOrder(Integer productid, Integer customerid,String address,String telephone) throws Exception {
		OrderBean orderBean = orderDao.GetBeanByCondition(OrderBean.class, OrderTable.PRODUCTID, productid+"", null);
		if(null== orderBean){//不存在改商品的订单 
			ProductBean productBean = (ProductBean) productDao.getEntitybyId(ProductBean.class, productid);
			CustomerBean customerBean = (CustomerBean) customerDao.getEntitybyId(CustomerBean.class, customerid);
			orderBean.setCustomerBean(customerBean);
			orderBean.setProductBean(productBean);
			orderBean.setAddress(address);
			orderBean.setTelephone(telephone);
			orderDao.addEntity(orderBean);
			return 3;//添加成功
		}else if(customerid != orderBean.getCustomerBean().getId())
			return 1;//不属于该用户的订单
		else if(customerid == orderBean.getCustomerBean().getId()){
			return 2;//属于该用户的订单
		}
		return 0;//添加失败
	}

	@Override
	public OrderBean getOrderByProductId(Integer productid) throws Exception {
		OrderBean orderBean = orderDao.GetBeanByCondition(OrderBean.class, OrderTable.PRODUCTID, productid+"", null);
		return orderBean;
	}
	
}

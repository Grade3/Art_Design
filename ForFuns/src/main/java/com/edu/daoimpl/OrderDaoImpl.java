package com.edu.daoimpl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.edu.dao.IOrderDao;
import com.edu.model.OrderBean;
import com.edu.base.BaseDaoImpl;

@Repository("orderDao")
public class OrderDaoImpl extends BaseDaoImpl<OrderBean> implements IOrderDao{

	@Override
	public OrderBean getOrderByIds(Integer productid, Integer customerid) {
		String hql = "from OrderBean where productid=? and customerid=? ";
		Query query = getSession().createQuery(hql);
		query.setInteger(0, productid);
		query.setInteger(1, customerid);
		List<OrderBean> list = query.list();
		if(list.size()==0)
			return null;
		return (OrderBean) query.list().get(0);
	}

	@Override
	public List<OrderBean> getCusertomerOrder(String customerUserid) {
		String hql = "select order from OrderBean order inner join order.customerBean cc ";//inner join order.customerBean cc where cc.userid = ?";
		Query query = getSession().createQuery(hql);
		//query.setString(0, customerUserid);
		List<OrderBean> list =query.list();
		if(list.size()==0)
			return null;
		return list;
	}

}

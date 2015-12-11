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

}

package com.edu.daoimpl;

import java.util.List;
import java.util.Map;

import org.hibernate.Query;

import com.edu.base.BaseDaoImpl;
import com.edu.dao.ICustomerDao;
import com.edu.model.CustomerBean;
import com.edu.model.UserBean;

public class CustomerDaoImpl extends BaseDaoImpl<CustomerBean> implements
		ICustomerDao
{
	@Override
	public boolean isExist(CustomerBean customer) 
	{
		 String hql = "from CustomerBean where username=? and password=?";
		 Query query = getSession().createQuery(hql);
		 query.setString(0, customer.getUsername());
		 query.setString(1, customer.getPassword());
		 if(query.list().size()>=1)
		 {
			 return true;
		 }
		 else
		 {
			 return false;
		 }
	}
}

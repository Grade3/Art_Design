package com.edu.dao;

import com.edu.base.IBaseDao;
import com.edu.model.CustomerBean;

public interface ICustomerDao extends IBaseDao<CustomerBean>
{
	public boolean isExist(CustomerBean customer);
}

package com.edu.dao;

import java.util.List;

import com.edu.base.IBaseDao;
import com.edu.model.CustomerBean;

public interface ICustomerDao extends IBaseDao<CustomerBean>
{
	public boolean isExist(CustomerBean customer);
	public boolean exist(CustomerBean customer);
	public int countCustomer();
	public String getIdbyUserid(String userid);
}

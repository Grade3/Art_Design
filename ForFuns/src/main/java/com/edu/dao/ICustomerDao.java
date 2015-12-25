package com.edu.dao;

import java.util.List;

import com.edu.base.IBaseDao;
import com.edu.model.Customer;

public interface ICustomerDao extends IBaseDao<Customer>
{
	public boolean isExist(Customer customer);
	public boolean exist(Customer customer);
	public int countCustomer();
	public String getIdbyUserid(String userid);
}

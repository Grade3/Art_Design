/**
 * 
 */
package com.edu.service;

import java.util.Map;

import com.edu.base.IBaseService;
import com.edu.model.CustomerBean;
import com.edu.model.UserBean;

public interface ICustomerService extends IBaseService<CustomerBean>
{
	/**
	 * 判断用户是否存在
	 * @param customer
	 * @return
	 */
	public boolean isExist(CustomerBean customer);
	
	/**
	 * 保存实体
	 * @param customer
	 */
	public void save(CustomerBean customer);
	
/*	*//**
	 * 获取树状
	 * @param page
	 * @param pageSize
	 * @return
	 *//*
	public Map<String , Object> GetCustomerTree(int page,int pageSize);*/
}
package com.edu.dao;

import java.util.List;

import com.edu.base.IBaseDao;
import com.edu.model.Customer;
import com.edu.model.ExamineArtist;

public interface IArtistDao extends IBaseDao<Customer>
{
	public boolean isExist(Customer customer);
	
	public List<Customer> getAllEntity(Class clz);
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Customer> getPageBeanFilter(Class clz,int page,int pageSize,String selectname,String value);
	public int countEa();
}

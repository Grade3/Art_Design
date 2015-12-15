package com.edu.dao;

import java.util.List;

import com.edu.base.IBaseDao;
import com.edu.model.CustomerBean;
import com.edu.model.ExamineArtistBean;

public interface IArtistDao extends IBaseDao<CustomerBean>
{
	public boolean isExist(CustomerBean customer);
	
	public List<CustomerBean> getAllEntity(Class clz);
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<CustomerBean> getPageBeanFilter(Class clz,int page,int pageSize,String selectname,String value);
	public int countEa();
}

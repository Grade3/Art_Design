/**
 * 
 */
package com.edu.service;

import java.util.List;
import java.util.Map;

import com.edu.base.IBaseService;
import com.edu.model.ArtistBean;
import com.edu.model.CustomerBean;
import com.edu.model.ExamineArtistBean;

public interface IArtistService extends IBaseService<CustomerBean>
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
	
	
	
	/**
	 * 计算数量
	 * @param ea
	 * @return
	 */
	public int countEa();
	
	
	@SuppressWarnings("rawtypes")
	public List<CustomerBean> GetAllBean(Class clz);
	
	@SuppressWarnings("rawtypes")
	public List<CustomerBean> GetPageBeanFilter(Class clz,int page,int pageSize,String selectname,String value);
	
	@SuppressWarnings("rawtypes")
	public int GetPageBeanFilterTotal(Class clz, int page, int pageSize,
			String selectname, String value);


	/**
	 * 通过userid获取艺术家信息
	 * @param userid
	 * @return
	 * @throws Exception
	 */
	public CustomerBean getArtistByUserId(String userid) throws Exception;
}
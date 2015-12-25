package com.edu.service;


import java.util.List;
import java.util.Map;

import com.edu.base.IBaseService;
import com.edu.model.Advert;
import com.edu.model.News;

public interface IAdvertService extends IBaseService<Advert>
{
	/**
	 * 通过userid获取咨询分页
	 * @param userid
	 * @param page
	 * @param pageSize
	 * @param param
	 * @return
	 */
	public Map<String, Object>  GetAdvertBeanPageByUserid(String userid, int page,int pageSize, Map<String, String> param);

	public List<Advert> GetFirstAdvert();
	
	public List<Advert> GetSecondAdvert();
	
	public List<Advert> GetThirdAdvert();
}

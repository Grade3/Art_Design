package com.edu.service;


import java.util.List;
import java.util.Map;

import com.edu.base.IBaseService;
import com.edu.model.AdvertBean;
import com.edu.model.NewsBean;

public interface IAdvertService extends IBaseService<AdvertBean>
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

	public List<AdvertBean> GetFirstAdvert();
	
	public List<AdvertBean> GetSecondAdvert();
	
	public List<AdvertBean> GetThirdAdvert();
}

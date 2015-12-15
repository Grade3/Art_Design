package com.edu.service;


import java.util.Map;

import com.edu.base.IBaseService;
import com.edu.model.AdvertBean;

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
}

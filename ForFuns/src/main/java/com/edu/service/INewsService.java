package com.edu.service;

import java.util.List;
import java.util.Map;

import com.edu.model.NewsBean;
import com.edu.base.IBaseService;

public interface INewsService extends IBaseService<NewsBean>{
	
	/**
	 * 获取热点新闻
	 * @return
	 */
	public List<NewsBean> GetHotNews();
	
	/**
	 * 获取上线新闻
	 * @return
	 */
	public List<NewsBean> GetOnlineNews();

	/**
	 * 通过userid获取咨询分页
	 * @param userid
	 * @param page
	 * @param pageSize
	 * @param param
	 * @return
	 */
	public Map<String, Object>  GetNewsBeanPageByUserid(String userid, int page,int pageSize, Map<String, String> param);
}

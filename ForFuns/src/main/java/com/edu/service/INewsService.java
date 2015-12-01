package com.edu.service;

import java.util.List;

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
}

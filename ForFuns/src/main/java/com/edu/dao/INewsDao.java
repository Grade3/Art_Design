package com.edu.dao;

import java.util.List;

import com.edu.model.NewsBean;
import com.edu.base.IBaseDao;

public interface INewsDao extends IBaseDao<NewsBean>{

	/**
	 * 获取热点新闻
	 * @return
	 */
	public List<NewsBean> GetHotNews();
}

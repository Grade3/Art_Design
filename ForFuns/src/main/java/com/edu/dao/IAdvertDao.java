package com.edu.dao;


import java.util.List;

import com.edu.base.IBaseDao;
import com.edu.model.AdvertBean;
import com.edu.model.NewsBean;

public interface IAdvertDao extends IBaseDao<AdvertBean>
{
	/**
	 * 获取第1行广告
	 * @return
	 */
	public List<AdvertBean> GetFirstAdvert();
	
	/**
	 * 获取第2行广告
	 * @return
	 */
	public List<AdvertBean> GetSecondAdvert();
	
	/**
	 * 获取第3行广告
	 * @return
	 */
	public List<AdvertBean> GetThirdAdvert();
}

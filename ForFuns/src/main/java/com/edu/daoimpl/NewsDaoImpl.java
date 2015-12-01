package com.edu.daoimpl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.edu.model.NewsBean;
import com.edu.table.NewsTable;
import com.edu.base.BaseDaoImpl;
import com.edu.dao.INewsDao;

@Repository("newsDao")
public class NewsDaoImpl extends BaseDaoImpl<NewsBean> implements INewsDao{

	@Override
	public List<NewsBean> GetHotNews() {
		String hql ="from NewsBean where "+NewsTable.ISHOT+" = 1 and "+NewsTable.ISONLINE+" = 1";
		return getSession().createQuery(hql).list();
	}

	@Override
	public List<NewsBean> GetOnlineNews() {
		String hql ="from NewsBean where "+NewsTable.ISONLINE+" = 1";
		return getSession().createQuery(hql).list();
	}

}

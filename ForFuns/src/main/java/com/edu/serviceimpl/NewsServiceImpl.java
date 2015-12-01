package com.edu.serviceimpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.base.BaseServiceImpl;
import com.edu.dao.INewsDao;
import com.edu.model.NewsBean;
import com.edu.service.INewsService;
import com.edu.table.NewsTable;

@Service("newsService")
public class NewsServiceImpl extends BaseServiceImpl<NewsBean> implements INewsService{

	@Autowired
	private INewsDao newsDao;
	
	@Override
	public List<NewsBean> GetHotNews() {
		Map<String, String> require = new HashMap<String, String>();
		List<NewsBean> list = null;
		require.put(NewsTable.ISHOT, "1");
		require.put(NewsTable.ISONLINE, "1");
		list = (List<NewsBean>) newsDao.GetHotNews();
		return list;
	}

}

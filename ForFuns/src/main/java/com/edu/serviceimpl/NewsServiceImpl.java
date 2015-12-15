package com.edu.serviceimpl;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.base.BaseServiceImpl;
import com.edu.dao.INewsDao;
import com.edu.model.NewsBean;
import com.edu.service.INewsService;
import com.edu.table.NewsTable;
import com.edu.viewentity.NewsVO;

@Service("newsService")
public class NewsServiceImpl extends BaseServiceImpl<NewsBean> implements INewsService{

	@Autowired
	private INewsDao newsDao;
	
	@Override
	public List<NewsBean> GetHotNews() {
		List<NewsBean> list = null;
		list = (List<NewsBean>) newsDao.GetHotNews();
		return list;
	}

	@Override
	public List<NewsBean> GetOnlineNews() {
		return newsDao.GetOnlineNews();
	}

	@Override
	public Map<String, Object> GetNewsBeanPageByUserid(String userid,int page,int  pageSize,Map<String, String> param) {
		
		String selectname = "";
		String value = "";
		if(null!=param){
			Iterator<Map.Entry<String, String>> enIterators = param.entrySet().iterator();
			while(enIterators.hasNext()){
				Map.Entry<String, String> entry = enIterators.next(); 
				selectname= entry.getKey();
				value= entry.getValue();
			}
		}
		List<NewsBean> list = newsDao.getPageBeanFilterMore(NewsBean.class, page, pageSize, selectname, value, NewsTable.USERID, userid);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total",list.size());
		map.put("rows",NewsVO.changeToNewsVOs(list));
		return map;
	}

}

package com.edu.daoimpl;

import org.springframework.stereotype.Repository;

import com.edu.model.NewsBean;
import com.edu.base.BaseDaoImpl;
import com.edu.dao.INewsDao;

@Repository("newsDao")
public class NewsDaoImpl extends BaseDaoImpl<NewsBean> implements INewsDao{

}

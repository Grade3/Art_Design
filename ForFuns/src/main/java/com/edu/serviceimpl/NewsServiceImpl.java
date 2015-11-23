package com.edu.serviceimpl;

import org.springframework.stereotype.Service;

import com.edu.base.BaseServiceImpl;
import com.edu.model.NewsBean;
import com.edu.service.INewsService;

@Service("newsService")
public class NewsServiceImpl extends BaseServiceImpl<NewsBean> implements INewsService{

}

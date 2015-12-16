package com.edu.serviceimpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.base.BaseServiceImpl;
import com.edu.dao.IExamineArtistDao;
import com.edu.dao.INewsDao;
import com.edu.model.ExamineArtistBean;
import com.edu.model.NewsBean;
import com.edu.service.IExamineArtistService;
import com.edu.service.INewsService;
import com.edu.table.NewsTable;

@Service("examineartistService")
public class ExamineArtistServiceImpl extends BaseServiceImpl<ExamineArtistBean> implements IExamineArtistService{

	@Autowired
	private IExamineArtistDao examineartistDao;
	

}

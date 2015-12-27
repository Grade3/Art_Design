package com.edu.dao;

import java.util.List;

import com.edu.model.ExamineArtist;
import com.edu.model.News;
import com.edu.base.IBaseDao;

public interface IExamineArtistDao extends IBaseDao<ExamineArtist>{

	List<ExamineArtist> getPageBeanFilterrWhereSugNotEqualOne(Class clz, int page, int pageSize, String selectname,
			String value);

	
}

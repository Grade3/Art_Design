package com.edu.service;

import java.util.List;

import com.edu.model.ExamineArtist;
import com.edu.model.News;
import com.edu.base.IBaseService;

public interface IExamineArtistService extends IBaseService<ExamineArtist>{

	List<ExamineArtist> GetPageBeanFilterWhereSugNotEqualOne(Class clz, int page, int pageSize,
			String selectname, String value);
	
}

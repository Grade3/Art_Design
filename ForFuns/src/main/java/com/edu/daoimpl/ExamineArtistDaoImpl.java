package com.edu.daoimpl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.edu.model.ExamineArtistBean;
import com.edu.model.NewsBean;
import com.edu.table.NewsTable;
import com.edu.base.BaseDaoImpl;
import com.edu.dao.IExamineArtistDao;
import com.edu.dao.INewsDao;

@Repository("examineartistDao")
public class ExamineArtistDaoImpl extends BaseDaoImpl<ExamineArtistBean> implements IExamineArtistDao{


}

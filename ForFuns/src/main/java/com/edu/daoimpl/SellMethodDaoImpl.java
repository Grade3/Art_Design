package com.edu.daoimpl;

import org.springframework.stereotype.Repository;

import com.edu.base.BaseDaoImpl;
import com.edu.dao.ISellMethodDao;
import com.edu.model.SellMethodBean;

@Repository("sellMethodDao")
public class SellMethodDaoImpl extends BaseDaoImpl<SellMethodBean> implements ISellMethodDao{

}

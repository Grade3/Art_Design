package com.edu.daoimpl;

import java.util.List;

import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Repository;

import com.edu.base.BaseDaoImpl;
import com.edu.dao.IFunctionDao;
import com.edu.model.FunctionBean;
@Lazy(true)
@Repository("functionDao")
public class FunctionDaoImpl extends BaseDaoImpl<FunctionBean> implements IFunctionDao{

	@Override
	public List<FunctionBean> GetAllTopMenu() {
		String hql ="from FunctionBean where istopmenu = 1";
		return getSession().createQuery(hql).list();
	}

	@Override
	public List<FunctionBean> GetAllSecondMenu() {
		String hql ="from FunctionBean where istopmenu = 0";
		return getSession().createQuery(hql).list();
	}

}

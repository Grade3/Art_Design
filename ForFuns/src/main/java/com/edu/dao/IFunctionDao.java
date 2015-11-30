package com.edu.dao;

import java.util.List;

import com.edu.base.IBaseDao;
import com.edu.model.FunctionBean;

public interface IFunctionDao extends IBaseDao<FunctionBean>{
	/**
	 * 获取所有的顶部菜单
	 * @return
	 */
	public List<FunctionBean> GetAllTopMenu();
	
	/**
	 * 获取所有的非顶部菜单
	 * @return
	 */
	public List<FunctionBean> GetAllSecondMenu();
}

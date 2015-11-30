package com.edu.service;

import java.util.List;

import com.edu.base.IBaseService;
import com.edu.model.FunctionBean;

public interface IFunctionService extends IBaseService<FunctionBean>{
	public List<FunctionBean> GetAllFunction();
	
	
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

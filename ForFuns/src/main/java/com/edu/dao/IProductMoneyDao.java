package com.edu.dao;

import com.edu.base.IBaseDao;
import com.edu.model.ProductMoneyBean;

public interface IProductMoneyDao extends IBaseDao<ProductMoneyBean>{
	/**
	 * 获取最高价位
	 * @return
	 */
	public ProductMoneyBean GetMaxMoney();
}

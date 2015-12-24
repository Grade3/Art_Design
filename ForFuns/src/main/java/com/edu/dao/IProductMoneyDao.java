package com.edu.dao;

import com.edu.base.IBaseDao;
import com.edu.model.ProductMoneyBean;

public interface IProductMoneyDao extends IBaseDao<ProductMoneyBean>{
	/**
	 * 获取最高价位
	 * @param productid
	 * @return
	 */
	public Integer GetMaxMoneyid(Integer productid);
}

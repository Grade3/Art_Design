package com.edu.dao;

import com.edu.base.IBaseDao;
import com.edu.model.ProductBean;

public interface IProductDao extends IBaseDao<ProductBean>{
	/**
	 * 修改商品状态 
	 * @param situation
	 * @return
	 */
	public int ChangeSituation(ProductBean productBean,Integer situation);
}

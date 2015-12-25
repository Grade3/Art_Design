package com.edu.service;

import com.edu.base.IBaseService;
import com.edu.model.ProductType;
import com.edu.model.User;

public interface IProductTypeService extends IBaseService<ProductType>
{
	/**
	 * 判断用户是否存在
	 * @param user
	 * @return
	 */
	public boolean isExist(ProductType productType);
	
	/**
	 * 保存实体
	 * @param user
	 */
	public void save(ProductType productType);
}

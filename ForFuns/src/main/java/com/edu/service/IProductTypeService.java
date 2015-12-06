package com.edu.service;

import com.edu.base.IBaseService;
import com.edu.model.ProductTypeBean;
import com.edu.model.UserBean;

public interface IProductTypeService extends IBaseService<ProductTypeBean>
{
	/**
	 * 判断用户是否存在
	 * @param user
	 * @return
	 */
	public boolean isExist(ProductTypeBean productType);
	
	/**
	 * 保存实体
	 * @param user
	 */
	public void save(ProductTypeBean productType);
}

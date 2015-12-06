package com.edu.dao;

import com.edu.base.IBaseDao;
import com.edu.model.ProductTypeBean;
import com.edu.model.UserBean;

public interface IProductTypeDao extends IBaseDao<ProductTypeBean>
{
	public boolean isExist(ProductTypeBean productType);
}

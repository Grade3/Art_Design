package com.edu.serviceimpl;

import javax.annotation.Resource;

import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.edu.base.BaseServiceImpl;
import com.edu.dao.IProductTypeDao;
import com.edu.model.ProductTypeBean;
import com.edu.service.IProductTypeService;

@Lazy(true)
@Transactional
@Service("productTypeService")
public class ProductTypeServiceImpl extends BaseServiceImpl<ProductTypeBean> implements IProductTypeService
{
	@Resource
	private IProductTypeDao productTypeDao;

	@Override
	public boolean isExist(ProductTypeBean productType) 
	{
		return productTypeDao.isExist(productType);
	}

	@Override
	public void save(ProductTypeBean productType) 
	{
		productTypeDao.addEntity(productType);

	}
}

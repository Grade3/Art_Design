package com.edu.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.edu.base.BaseServiceImpl;
import com.edu.dao.IProductDao;
import com.edu.model.CustomerBean;
import com.edu.model.ProductBean;
import com.edu.proxy.ProductProxy;
import com.edu.service.IProductService;
@Transactional
@Service("productService")
public class ProductServiceImpl extends BaseServiceImpl<ProductBean> implements IProductService{

	@Autowired
	private IProductDao productDao;
	
	@Override
	public List<ProductBean> getOnlineProduct(int page, int pageSize,int typeid,int methodid) {
		return productDao.GetOnlineProduct(page, pageSize, typeid,methodid);
	}

	@Override
	public int getOnlineProductTotal(int typeid,int methodid) {
		return productDao.getOnlineProductTotal(typeid,methodid);
	}
	
	@Override
	public List<ProductBean> getArtistProduct(int page, int pageSize,int artistid) {
		return productDao.GetArtistProduct(page, pageSize, artistid);
	}

	@Override
	public int getArtistProductTotal(int artistid) {
		return productDao.getArtistProductTotal(artistid);
	}
}

package com.edu.serviceimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.edu.base.BaseServiceImpl;
import com.edu.dao.IProductMoneyDao;
import com.edu.daoimpl.ProductDaoImpl;
import com.edu.model.ProductBean;
import com.edu.model.ProductMoneyBean;
import com.edu.service.IProductMoneyService;
@Lazy
@Service("productMoneyService")
@Transactional
public class ProductMoneyServiceImpl extends BaseServiceImpl<ProductMoneyBean> implements IProductMoneyService{

	@Autowired
	private IProductMoneyDao productMoneyDao;
	@Override
	public ProductMoneyBean getMaxMoney(Integer productid) {
		Integer MaxMoneyid = productMoneyDao.GetMaxMoneyid(productid);
		ProductMoneyBean productMoneyBean  = (ProductMoneyBean) productMoneyDao.getEntitybyId(ProductMoneyBean.class, MaxMoneyid);
		return productMoneyBean;
	}

}

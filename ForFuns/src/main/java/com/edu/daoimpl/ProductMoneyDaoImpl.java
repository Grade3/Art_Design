package com.edu.daoimpl;

import org.springframework.stereotype.Repository;

import com.edu.model.ProductMoneyBean;
import com.edu.base.BaseDaoImpl;
import com.edu.dao.IProductMoneyDao;

@Repository("productMoneyDao")
public class ProductMoneyDaoImpl extends BaseDaoImpl<ProductMoneyBean> implements IProductMoneyDao{

}

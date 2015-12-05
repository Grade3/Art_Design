package com.edu.daoimpl;

import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Repository;

import com.edu.base.BaseDaoImpl;
import com.edu.dao.IProductDao;
import com.edu.model.ProductBean;

@Lazy(true)
@Repository("productDao")
public class ProductDaoImpl extends BaseDaoImpl<ProductBean> implements IProductDao{

}

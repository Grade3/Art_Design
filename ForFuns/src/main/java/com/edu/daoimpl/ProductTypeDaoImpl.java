package com.edu.daoimpl;

import org.hibernate.Query;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Repository;

import com.edu.base.BaseDaoImpl;
import com.edu.dao.IProductTypeDao;
import com.edu.model.ProductTypeBean;
import com.edu.model.UserBean;

@Lazy(true)
@Repository("productTypeDao")

public class ProductTypeDaoImpl extends BaseDaoImpl<ProductTypeBean> implements IProductTypeDao
{
	@Override
	public boolean isExist(ProductTypeBean productType) {
		 String hql = "from ProductTypeBean where id=?";
		 Query query = getSession().createQuery(hql);
		 query.setLong(0, productType.getId());
		 if(query.list().size()>=1){
			 return true;
		 }else{
			 return false;
		 }
	}
}

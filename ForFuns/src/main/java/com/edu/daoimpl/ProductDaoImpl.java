package com.edu.daoimpl;

import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Repository;

import com.edu.base.BaseDaoImpl;
import com.edu.dao.IProductDao;
import com.edu.model.ProductBean;
import com.edu.table.ProductTable;

@Lazy(true)
@Repository("productDao")
public class ProductDaoImpl extends BaseDaoImpl<ProductBean> implements IProductDao{

	@Override
	public int ChangeSituation(ProductBean productBean,Integer situation) {
		this.sqlWithNone("update "+ProductTable.TABLENAME+" set "+ProductTable.SITUATION+" ="+situation+" and "+ProductTable.ARTISTID+" ="+productBean.getId());
		return 1;
	}

}

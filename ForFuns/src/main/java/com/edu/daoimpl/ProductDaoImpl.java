package com.edu.daoimpl;

import java.util.List;

import org.hibernate.Query;
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

	@Override
	public List<ProductBean> GetOnlineProduct(int page, int pageSize,int typeid) {
		String hql ="";
		List<ProductBean> list = null;
		try {
			hql = "from "+ProductBean.class.newInstance().getClass().getName()+" where  current_date() >= timestart and current_date()<=timeout  and typeid="+typeid;
			System.out.println(hql);
			Query query = getSession().createQuery(hql);
			query.setFirstResult((page-1)*pageSize); 
			query.setMaxResults(pageSize); 
			list = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int getOnlineProductTotal(int typeid) {
		String hql ="";
		List<ProductBean> list = null;
		try {
			hql = "from "+ProductBean.class.newInstance().getClass().getName()+" where  current_date() >= timestart and current_date()<=timeout  and typeid="+typeid;
			System.out.println(hql);
			Query query = getSession().createQuery(hql);
			list = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list.size();
	}

}

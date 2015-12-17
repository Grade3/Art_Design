/**
 * 
 */
package com.edu.daoimpl;



import org.hibernate.Query;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Repository;

import com.edu.base.BaseDaoImpl;
import com.edu.dao.ICustomerDao;
import com.edu.model.CustomerBean;

@Lazy(true)
@Repository("customerDao")
public class CustomerDaoImpl extends BaseDaoImpl<CustomerBean> implements ICustomerDao {


	@Override
	public boolean isExist(CustomerBean user) {
		 String hql = "from CustomerBean where userid=? and password=?";
		 Query query = getSession().createQuery(hql);
		 query.setString(0, user.getUserid());
		 query.setString(1, user.getPassword());
		 if(query.list().size()>=1){
			 return true;
		 }else{
			 return false;
		 }
	}

	public int countCustomer() {
		// TODO Auto-generated method stub
		 String hql ="select count(id) from CustomerBean as user";
		 Query query = getSession().createQuery(hql);
		 return ((Number)query.uniqueResult()).intValue();  
	}

	@Override
	public boolean exist(CustomerBean customer) {
		 String hql = "from CustomerBean where userid=?";
		 Query query = getSession().createQuery(hql);
		 query.setString(0, customer.getUserid());
		 if(query.list().size()>=1){
			 return true;
		 }else{
			 return false;
		 }
	}

	@Override
	public String  getIdbyUserid(String userid) {
		// TODO Auto-generated method stub
		String hql ="select id from CustomerBean where userid=?";
		Query query = getSession().createQuery(hql);
		 query.setString(0, userid);
		 int i = ((Number)query.uniqueResult()).intValue();  
		 return  Integer.toString(i);
	}


	
	


}

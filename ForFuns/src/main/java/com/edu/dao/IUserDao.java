/**
 * 
 */
package com.edu.dao;

import com.edu.base.IBaseDao;
import com.edu.model.User;


public interface IUserDao extends IBaseDao<User>{
	
	public boolean isExist(User user);
	
	public void TestNamedQuery();
}

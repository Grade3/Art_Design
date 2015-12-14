package com.edu.serviceimpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.edu.base.BaseServiceImpl;
import com.edu.base.TreeBean;
import com.edu.base.TreeChildItemBean;
import com.edu.dao.IArtistDao;
import com.edu.dao.ICustomerDao;
import com.edu.model.ArtistBean;
import com.edu.model.FunctionBean;
import com.edu.model.RoleBean;
import com.edu.model.CustomerBean;
import com.edu.service.ICustomerService;
import com.edu.table.CustomerTable;


@Lazy(true)
@Transactional
@Service("customerService")
public class CustomerServiceImpl extends BaseServiceImpl<CustomerBean> implements
		ICustomerService
{
	@Autowired
	private ICustomerDao customerDao;
	
	@Override
	public boolean isExist(CustomerBean customer)
	{
		return customerDao.isExist(customer);
	}

	@Override
	public void save(CustomerBean customer) 
	{
		customerDao.addEntity(customer);
	}

	@Override
	public int countCustomer() {
		return customerDao.countCustomer();
	}
	
	public boolean exist(CustomerBean customer)
	{
		return customerDao.exist(customer);
	}

	@Override
	public CustomerBean getCustomerByUserId(String userid) throws Exception {
		return customerDao.GetBeanByCondition(CustomerBean.class, CustomerTable.USERID, userid, null);
	}

	/*@Override
	public Map<String, Object> GetCustomerTree(int page, int pageSize)
	{
		List<CustomerBean> list = this.GetPageBean(CustomerBean.class, page, pageSize);
		List<TreeBean> temp = new ArrayList<TreeBean>();
		int total = 0;
		for(int i=0;i<list.size();i++){
			CustomerBean userBean = list.get(i);
			Set<RoleBean> set =userBean.getRoleBeans();
			if (set.size()!=0) 
			{
				total++;
				TreeBean treeBean = new TreeBean();
				treeBean.setId(userBean.getId()+"");
				treeBean.setName(userBean.getUsername());
				for(RoleBean  roleBean : set){
					treeBean.getChildren().add(new TreeChildItemBean(userBean.getId()+"_"+roleBean.getId(),
							roleBean.getRolename()));
				}
				temp.add(treeBean);
			}
		}
		//String treeString= FastJsonTool.createJsonString(temp);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rows", temp);
		map.put("total", total);
		return map;
	}*/
}

package com.edu.serviceimpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.base.BaseServiceImpl;
import com.edu.base.TreeBean;
import com.edu.base.TreeChildItemBean;
import com.edu.dao.IAddressDao;
import com.edu.dao.ICustomerDao;
import com.edu.model.AddressBean;
import com.edu.model.CustomerAddressBean;
import com.edu.model.CustomerBean;
import com.edu.model.RoleBean;
import com.edu.model.UserBean;
import com.edu.service.IAddressService;
import com.edu.service.ICustomerService;

@Service("addressService")
public class AddressServiceImpl extends BaseServiceImpl<AddressBean> implements IAddressService
{
	@Autowired
	private IAddressDao addressDao;
	@Autowired
	private ICustomerService customerService;
	@Autowired
	private ICustomerDao customerDao;
	@Override
	public Map<String, Object> GetAddressTree(int page, int pageSize) {
		List<CustomerBean> list = customerService.GetPageBean(CustomerBean.class, page, pageSize);
		List<TreeBean> temp = new ArrayList<TreeBean>();
		int total = 0;
		for(int i=0;i<list.size();i++){
			CustomerBean customerBean = list.get(i);
			Set<CustomerAddressBean> set =customerBean.getCustomerAddressBeans();
			if (set.size()!=0) {
				total++;
				TreeBean treeBean = new TreeBean();
				treeBean.setId(customerBean.getId()+"");
				treeBean.setName(customerBean.getUserid());
				for(CustomerAddressBean  customerAddressBean : set){
					treeBean.getChildren().add(new TreeChildItemBean(customerBean.getId()+"_"+customerAddressBean.getAddressBean().getId(),
							customerAddressBean.getAddressBean().getAddress()));
				}
				temp.add(treeBean);
			}
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rows", temp);
		map.put("total", total);
		return map;
	}
	@Override
	public List<AddressBean> GetAddressByCusetomerUserId(String CusetomerUserId) {
		return null;
	}
}

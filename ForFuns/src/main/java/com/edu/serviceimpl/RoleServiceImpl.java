package com.edu.serviceimpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.edu.base.BaseServiceImpl;
import com.edu.base.TreeBean;
import com.edu.base.TreeChildItemBean;
import com.edu.model.FunctionBean;
import com.edu.model.RoleBean;
import com.edu.model.RoleFunctionBean;
import com.edu.service.IRoleService;
import com.edu.util.FastJsonTool;

@Lazy(true)
@Transactional
@Service("roleService")
public class RoleServiceImpl extends BaseServiceImpl<RoleBean> implements IRoleService {

	@Override
	public Map<String, Object> GetPowerTree(int page,int pageSize) {
		List<RoleBean> list =  this.GetPageBean(RoleBean.class, page, pageSize);
		List<TreeBean> temp = new ArrayList<TreeBean>();
		int total = 0;
		for(int i=0;i<list.size();i++){
			RoleBean roleBean = list.get(i);
			Set<FunctionBean> set = roleBean.getFunctionBeans();
			if (set.size()!=0) {
				total++;
				TreeBean treeBean = new TreeBean();
				treeBean.setId(roleBean.getId()+"");
				treeBean.setName(roleBean.getRolename());
				for(FunctionBean functionBean : set){
					treeBean.getChildren().add(new TreeChildItemBean(roleBean.getId()+"_"+functionBean.getId(),
							functionBean.getFunctionname()));
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
	public List<RoleBean> GetAllRole() {
		List<RoleBean> list = this.GetAllBean(RoleBean.class);
		List<RoleBean> temp  = new  ArrayList<RoleBean>();
		for(int i =0;i<list.size();i++){
			RoleBean role = list.get(i);
			RoleBean one = new RoleBean(role.getId(), role.getRolename());
			temp.add(one);
		}
		return temp;
	}

}

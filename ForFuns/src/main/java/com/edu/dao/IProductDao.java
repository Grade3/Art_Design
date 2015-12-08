package com.edu.dao;

import java.util.List;

import com.edu.base.IBaseDao;
import com.edu.model.ProductBean;

public interface IProductDao extends IBaseDao<ProductBean>{
	/**
	 * 修改商品状态 
	 * @param situation
	 * @return
	 */
	public int ChangeSituation(ProductBean productBean,Integer situation);
	
	/**
	 * 获取可上线商品
	 * @param page
	 * @param pageSize
	 * @return
	 */
	public List<ProductBean> GetOnlineProduct(int page,int pageSize,int typeid,int methodi);
	
	/**
	 * 获取上线商品数量
	 * @param page
	 * @param pageSize
	 * @return
	 */
	public int getOnlineProductTotal(int typeid);
}

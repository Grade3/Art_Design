package com.edu.service;

import java.util.List;

import com.edu.base.IBaseService;
import com.edu.model.CustomerBean;
import com.edu.model.ProductBean;
import com.edu.proxy.ProductProxy;

public interface IProductService extends IBaseService<ProductBean>{
	/**
	 * 获取上线商品
	 * @param page
	 * @param pageSize
	 * @return
	 */
	public List<ProductBean> getOnlineProduct(int page,int pageSize,int typeid,int methodid);
	
	
	/**
	 * 获取上线商品数量
	 * @param page
	 * @param pageSize
	 * @return
	 */
	public int getOnlineProductTotal(int typeid);
	
	
	/**
	 * 获取对应艺术家的商品
	 * @param page
	 * @param pageSize
	 * @return
	 */
	public List<ProductBean> getArtistProduct(int page,int pageSize,int artist);
	
	
	/**
	 * 获取对应艺术家商品的数量
	 * @param page
	 * @param pageSize
	 * @return
	 */
	public int getArtistProductTotal(int artist);
	
}

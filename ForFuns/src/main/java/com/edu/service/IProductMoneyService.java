package com.edu.service;

import com.edu.base.IBaseService;
import com.edu.model.ProductMoneyBean;

public interface IProductMoneyService extends IBaseService<ProductMoneyBean>{
	
	/**
	 * 获取这个拍卖商品的最高价
	 * @param id
	 * @return
	 */
	public ProductMoneyBean getMaxMoney(Integer productid);
}

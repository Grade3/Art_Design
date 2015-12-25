package com.edu.service;

import com.edu.base.IBaseService;
import com.edu.model.ProductMoney;

public interface IProductMoneyService extends IBaseService<ProductMoney>{
	
	/**
	 * 获取这个拍卖商品的最高价
	 * @param id
	 * @return
	 */
	public ProductMoney getMaxMoney(Integer productid);
}

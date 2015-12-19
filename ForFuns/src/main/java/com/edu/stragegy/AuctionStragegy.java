package com.edu.stragegy;

import java.util.Map;

import com.edu.base.IBaseDao;
import com.edu.dao.IProductDao;
import com.edu.dao.IProductMoneyDao;
import com.edu.model.CustomerBean;
import com.edu.model.ProductBean;

/**
 * 拍卖策略
 * @author Gy
 *
 */
public class AuctionStragegy implements ISellStrategy{

	@Override
	public String SellProduct(ProductBean productBean, CustomerBean customerBean,
			Integer money, Map<String, Object> params) throws Exception {
		return 0;
	}




}

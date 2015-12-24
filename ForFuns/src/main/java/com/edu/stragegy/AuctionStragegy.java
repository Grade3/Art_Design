package com.edu.stragegy;

import java.util.Date;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.edu.base.IBaseDao;
import com.edu.dao.IProductDao;
import com.edu.dao.IProductMoneyDao;
import com.edu.model.CustomerBean;
import com.edu.model.ProductBean;
import com.edu.model.ProductMoneyBean;
import com.edu.table.ProductMoneyTable;

/**
 * 拍卖策略
 * @author Gy
 *
 */
public class AuctionStragegy implements ISellStrategy{

	
	@Autowired
	private IProductDao productDao ;
	@Autowired
	private IProductMoneyDao productMoneyDao;
	
	
	@Override
	public String SellProduct(ProductBean productBean, CustomerBean customerBean,
			Integer money, Map<String, Object> params) throws Exception {
		ProductMoneyBean productMoneyBean = productMoneyDao.GetBeanByCondition(ProductMoneyBean.class, ProductMoneyTable.PRODUCTID, productBean.getId()+"", null);
		if(null == productMoneyBean){
			productMoneyBean.setCustomerBean(customerBean);
			productMoneyBean.setProductBean(productBean);
			productMoneyBean.setMoney(money);
			productMoneyBean.setCurrenttime(new Date());
			productMoneyDao.addEntity(productMoneyBean);
		}else{
			
		}
		
		
		return 0+"";
	}




}

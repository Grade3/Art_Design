package com.edu.stragegy;

import java.util.Date;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.edu.base.BaseDaoImpl;
import com.edu.base.BaseServiceImpl;
import com.edu.base.IBaseDao;
import com.edu.base.IBaseService;
import com.edu.dao.IProductDao;
import com.edu.dao.IProductMoneyDao;
import com.edu.daoimpl.ProductDaoImpl;
import com.edu.daoimpl.ProductMoneyDaoImpl;
import com.edu.model.CustomerBean;
import com.edu.model.ProductBean;
import com.edu.model.ProductMoneyBean;

/**
 * 一口价策略
 * @author Gy
 *
 */
@Transactional
@Service("FixedPriceStrategy")
public class FixedPriceStrategy extends BaseServiceImpl<ProductBean> implements ISellStrategy,IBaseService<ProductBean>{
	@Resource
	private IProductDao productDao ;
	@Resource
	private IProductMoneyDao productMoneyDao;
	
	@Override
	public int SellProduct(ProductBean productBean,CustomerBean customerBean,Integer money) {
		if(productBean.getSituation()==1){
			productBean.setSituation(2);
			productDao.updateEntity(productBean);
			ProductMoneyBean productMoneyBean = new ProductMoneyBean( productBean, customerBean, money, new Date());
			productMoneyDao.addEntity(productMoneyBean);
			//int x= 0;
			//int y=0;
			//double z =  x/y;
		}
		return 1;
	}
	
	/*@Override
	public void Init(IProductDao productDao,
			IProductMoneyDao productMoneyDao) {
		this.productDao = productDao;
		this.productMoneyDao = productMoneyDao;
	}
	*/
}

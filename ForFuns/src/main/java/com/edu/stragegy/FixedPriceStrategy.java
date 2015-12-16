package com.edu.stragegy;

import java.util.Date;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.edu.base.BaseDaoImpl;
import com.edu.base.BaseServiceImpl;
import com.edu.base.IBaseDao;
import com.edu.base.IBaseService;
import com.edu.dao.IOrderDao;
import com.edu.dao.IProductDao;
import com.edu.dao.IProductMoneyDao;
import com.edu.daoimpl.ProductDaoImpl;
import com.edu.daoimpl.ProductMoneyDaoImpl;
import com.edu.model.CustomerBean;
import com.edu.model.OrderBean;
import com.edu.model.ProductBean;
import com.edu.model.ProductMoneyBean;
import com.edu.table.OrderTable;

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
	@Autowired
	private IOrderDao orderDao;
	@Override
	public int SellProduct(ProductBean productBean,CustomerBean customerBean,Integer money,Map<String, Object>params) throws Exception {
		OrderBean orderBean = orderDao.GetBeanByCondition(OrderBean.class, OrderTable.PRODUCTID, productBean.getId()+"", null);
		if(null== orderBean){//不存在改商品的订单 
			orderBean = new OrderBean();
			orderBean.setCustomerBean(customerBean);
			orderBean.setProductBean(productBean);
			orderBean.setAddress(params.get(OrderTable.ADDRESS).toString());
			orderBean.setTelephone(params.get(OrderTable.TELEPHONE).toString());
			orderBean.setCurrent(new Date());
			orderBean.setIspay(1);
			orderDao.addEntity(orderBean);
			return 3;//添加成功
		}else if(customerBean.getId() != orderBean.getCustomerBean().getId())
			return 1;//不属于该用户的订单
		else if(customerBean.getId() == orderBean.getCustomerBean().getId()){
			return 2;//属于该用户的订单
		}
		return 0;//添加失败
	}
	
	/*@Override
	public void Init(IProductDao productDao,
			IProductMoneyDao productMoneyDao) {
		this.productDao = productDao;
		this.productMoneyDao = productMoneyDao;
	}
	*/
}

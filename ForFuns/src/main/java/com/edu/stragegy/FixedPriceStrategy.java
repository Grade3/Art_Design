package com.edu.stragegy;

import java.util.Date;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.edu.base.BaseServiceImpl;
import com.edu.base.IBaseService;
import com.edu.dao.IAddressDao;
import com.edu.dao.IOrderAddressDao;
import com.edu.dao.IOrderDao;
import com.edu.dao.IProductDao;
import com.edu.dao.IProductMoneyDao;
import com.edu.model.AddressBean;
import com.edu.model.CustomerBean;
import com.edu.model.OrderAddressBean;
import com.edu.model.OrderBean;
import com.edu.model.ProductBean;
import com.edu.table.OrderTable;

/**
 * 一口价策略
 * @author Gy
 *
 */
@Transactional
@Service("FixedPriceStrategy")
public class FixedPriceStrategy extends BaseServiceImpl<ProductBean> implements ISellStrategy,IBaseService<ProductBean>{
	@Autowired
	private IProductDao productDao ;
	@Autowired
	private IProductMoneyDao productMoneyDao;
	@Autowired
	private IOrderDao orderDao;
	@Autowired
	private IOrderAddressDao orderAddressDao;
	@Autowired
	private IAddressDao addressDao;
	@Override
	public String SellProduct(ProductBean productBean,CustomerBean customerBean,Integer money,Map<String, Object>params) throws Exception {
		OrderBean orderBean = orderDao.GetBeanByCondition(OrderBean.class, OrderTable.PRODUCTID, productBean.getId()+"", null);
		if(null== orderBean){//不存在改商品的订单 
			orderBean = new OrderBean();
			orderBean.setCustomerBean(customerBean);
			orderBean.setProductBean(productBean);
			orderBean.setCurrent(new Date());
			orderBean.setIspay(1);
			OrderAddressBean orderAddressBean = new OrderAddressBean();
			AddressBean addressBean = (AddressBean) addressDao.getEntitybyId(AddressBean.class, Integer.parseInt(params.get("addressid").toString()));
			orderAddressBean.setOrderBean(orderBean);
			orderAddressBean.setAddressBean(addressBean);
			orderAddressDao.addEntity(orderAddressBean);
			//orderDao.addEntity(orderBean);
			return "redirect:/font/success.jsp";//添加成功
		}else if(customerBean.getId() != orderBean.getCustomerBean().getId())
			return "redirect:/font/error.jsp?errorid=1";//不属于该用户的订单
		else if(customerBean.getId() == orderBean.getCustomerBean().getId()){
			return "redirect:/font/goodsdetail.jsp?productid="+productBean.getId();//属于该用户的订单
		}
		return "redirect:/font/error.jsp;";//添加失败
		//return 3;//添加成功
		//return 1;//不属于该用户的订单
		//return 2;//属于该用户的订单
		//return 0;//添加失败
	}
	
	/*@Override
	public void Init(IProductDao productDao,
			IProductMoneyDao productMoneyDao) {
		this.productDao = productDao;
		this.productMoneyDao = productMoneyDao;
	}
	*/
}

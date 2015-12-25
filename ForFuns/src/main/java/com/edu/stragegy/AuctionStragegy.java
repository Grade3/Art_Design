package com.edu.stragegy;

import java.util.Date;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.edu.base.IBaseDao;
import com.edu.dao.IOrderDao;
import com.edu.dao.IProductDao;
import com.edu.dao.IProductMoneyDao;
import com.edu.model.Customer;
import com.edu.model.Order;
import com.edu.model.Product;
import com.edu.model.ProductMoney;
import com.edu.service.IProductMoneyService;
import com.edu.table.ProductMoneyTable;

/**
 * 拍卖策略
 * @author Gy
 *
 */
@Transactional
@Service("AuctionStragegy")//通过存储过程来判断。如果时间到，添加一个对应订单 
public class AuctionStragegy implements ISellStrategy{

	
	@Autowired
	private IProductDao productDao ;
	@Autowired
	private IProductMoneyDao productMoneyDao;
	@Autowired
	private IOrderDao orderDao;
	
	@Override
	public String SellProduct(Product productBean, Customer customerBean,
			Integer money, Map<String, Object> params) throws Exception {
		ProductMoney productMoneyBean = productMoneyDao.GetBeanByCondition(ProductMoney.class, ProductMoneyTable.PRODUCTID, productBean.getId()+"", null);
		ProductMoney maxProductMoneyBean  = null;
		if(!(null == productMoneyBean)){//如果有人竞拍,找出最高价
			Integer id   = productMoneyDao.GetMaxMoneyid(productBean.getId());
			maxProductMoneyBean = (ProductMoney) productMoneyDao.getEntitybyId(ProductMoney.class, id);
		}
		Date starttime = productBean.getTimestart();
		Date endtime = productBean.getTimeout();
		Date now = new Date();
		if((now.compareTo(starttime)<0)){
			return "redirect:/font/error.jsp?errorid=3";
		}
		
		if((now.compareTo(endtime)>0)){//拍卖尚未开始或者或者已经结束 //此时拍卖结束
			if(maxProductMoneyBean.getCustomerBean().getId()==customerBean.getId()){//如果最高价与用户相等  则扣钱
				Order order = orderDao.getOrderByProductid(productBean.getId());
				//先付款
				
				//修改订单状态
				order.setIspay(1);
				orderDao.updateEntity(order);
				return "redirect:/font/success.jsp?successid=1";
			}else{
				return "redirect:/font/error.jsp?errorid=3";
			}
			
		}
		
		
		if(null == productMoneyBean){//如果无人竞拍，添加
			ProductMoney newproductMoney =  new ProductMoney();
			newproductMoney.setCustomerBean(customerBean);
			newproductMoney.setProductBean(productBean);
			newproductMoney.setMoney(money);
			newproductMoney.setCurrenttime(new Date());
			productMoneyDao.addEntity(newproductMoney);
			return "xxxxxxxx";
		}else{//如果存在，找出最高值
			
			if(maxProductMoneyBean.getMoney()>=money){//如果竞价的值比原来的小，拒绝
				return "redirect:/font/error.jsp?errorid=4";
			}else{
				ProductMoney newproductMoney =  new ProductMoney();
				newproductMoney.setCustomerBean(customerBean);
				newproductMoney.setProductBean(productBean);
				newproductMoney.setMoney(money);
				newproductMoney.setCurrenttime(new Date());
				productMoneyDao.addEntity(newproductMoney);
				return "redirect:/font/success.jsp?successid=4";
			}
		}
	}




}

package com.edu.proxy;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.edu.base.IBaseDao;
import com.edu.dao.IProductDao;
import com.edu.dao.IProductMoneyDao;
import com.edu.model.CustomerBean;
import com.edu.model.ProductBean;
import com.edu.stragegy.ISellStrategy;
import com.edu.util.GetConfigData;
import com.edu.util.SpringContextUtil;

/**
 * 商品代理
 * @author Gy
 *
 */
@Transactional
@Service("productProxy")
public class ProductProxy {
	private ProductBean productBean;
	private ISellStrategy sellStrategy;
	@Resource
	private IProductDao productDao ;
	@Resource
	private IProductMoneyDao productMoneyDao;
	@Resource
	private SpringContextUtil springContextUtil;
	public void Init(ProductBean productBean){
		this.productBean = productBean;
		int methodid = productBean.getProductSellBean().getSellMethodBean().getId();
		try {
			//this.sellStrategy = (ISellStrategy) Class.forName(GetConfigData.getDatabyKey(methodid+"")).newInstance();
			//this.sellStrategy.Init(productDao, productMoneyDao);
			this.sellStrategy = (ISellStrategy) SpringContextUtil.getBean(GetConfigData.getDatabyKey(methodid+""));
		} catch(Exception e){
			e.printStackTrace();
		}
	}
	/**
	 * 出售商品
	 * @return
	 */
	public int BuyProduct(CustomerBean customerbean,Integer money,Map<String, Object> params)throws Exception{
		return sellStrategy.SellProduct(productBean,customerbean,money,params);
	}

	public ProductProxy(ProductBean productBean) {
		super();
		this.productBean = productBean;
		int methodid = productBean.getProductSellBean().getSellMethodBean().getId();
		try {
			//this.sellStrategy = (ISellStrategy) Class.forName(GetConfigData.getDatabyKey(methodid+"")).newInstance();
			//this.sellStrategy.Init(productDao, productMoneyDao);
			//让spring通过类名生成对应的策略实体
			this.sellStrategy = (ISellStrategy) SpringContextUtil.getBean(GetConfigData.getDatabyKey(methodid+""));
		} catch(Exception e){
			e.printStackTrace();
		}
	}

	public ProductProxy() {
		super();
	}
	
}

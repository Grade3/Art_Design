package com.edu.proxy;

import com.edu.model.ProductBean;
import com.edu.stragegy.ISellStrategy;
import com.edu.util.GetConfigData;

/**
 * 商品代理
 * @author Gy
 *
 */
public class ProductProxy {
	private ProductBean productBean;
	private ISellStrategy sellStrategy;
	
	/**
	 * 出售商品
	 * @return
	 */
	public int BuyProduct(){
		return sellStrategy.SellProduct();
	}

	public ProductProxy(ProductBean productBean) {
		super();
		this.productBean = productBean;
		int methodid = productBean.getProductSellBean().getSellMethodBean().getId();
		try {
			this.sellStrategy = (ISellStrategy) Class.forName(GetConfigData.getDatabyKey(methodid+"")).newInstance();
		} catch(Exception e){
			e.printStackTrace();
		}
	}

	public ProductProxy() {
		super();
	}
	
}

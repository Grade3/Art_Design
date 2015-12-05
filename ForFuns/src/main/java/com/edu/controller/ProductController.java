package com.edu.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.naming.spi.DirStateFactory.Result;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.edu.model.CustomerBean;
import com.edu.model.ProductBean;
import com.edu.proxy.ProductProxy;
import com.edu.service.ICustomerService;
import com.edu.service.IProductService;
import com.edu.viewentity.ProductVO;


@Controller
@RequestMapping("/product.do")
public class ProductController {
	
	@Autowired
	private IProductService productService;
	
	@Autowired
	private ICustomerService customerService;
	@Resource
	private ProductProxy productProxy;
	
	/**
	 * 获取分页列表
	 * 
	 * @param page
	 * @param pageSize
	 * @return
	 */
	@RequestMapping(params = "method=getProductbypage")
	@ResponseBody
	public Map<String, Object> JsonGetPageProduct(
			@RequestParam(value = "page") int page,
			@RequestParam(value = "rows") int pageSize,
			@RequestParam(value="selectname",defaultValue="id")String selectname,
			@RequestParam(value="value",defaultValue="")String value) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<ProductBean> list = productService.GetPageBeanFilter(ProductBean.class, page,
				pageSize,selectname,value);
		List<ProductVO> productVOs = ProductVO.ChangeListProductToProductVo(list);
		int total = productService.GetPageBeanFilterTotal(ProductBean.class, page, pageSize, selectname, value);
		map.put("rows", productVOs);
		map.put("total", total);
		return map;
	}
	
	/**
	 * 购买商品   首先得初始化商品代理类，通过Init函数，Init函数获取该商品对应的出售方法和策略，通过委托的方式，调用buy方法。
	 * @param productid
	 * @param customerid
	 * @param money
	 * @return
	 */
	@RequestMapping(params = "method=BuyProduct")
	@ResponseBody
	@Transactional
	public Map<String, Object> JsonBuyProduct(@RequestParam(value="productid")Integer productid,
			@RequestParam(value="customerid")Integer customerid,@RequestParam(value="money")Integer money){
		ProductBean productBean = productService.GetEntityById(ProductBean.class, productid);
		CustomerBean customerBean = customerService.GetEntityById(CustomerBean.class, customerid);
		productProxy.Init(productBean);
		int result = 0;
		try{
			result = productProxy.BuyProduct(customerBean,money);
		}catch(Exception e){
			e.printStackTrace();
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result",result);
		return map;
	}
	
	
	
}

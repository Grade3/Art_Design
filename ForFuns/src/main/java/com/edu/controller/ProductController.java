package com.edu.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.naming.spi.DirStateFactory.Result;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.edu.model.CustomerBean;
import com.edu.model.NewsBean;
import com.edu.model.ProductBean;
import com.edu.model.ProductSellBean;
import com.edu.model.ProductTypeBean;
import com.edu.model.SellMethodBean;
import com.edu.proxy.ProductProxy;
import com.edu.service.ICustomerService;
import com.edu.service.IProductService;
import com.edu.service.IProductTypeService;
import com.edu.service.ISellMethodService;
import com.edu.table.NewsTable;
import com.edu.viewentity.ProductVO;


@Controller
@RequestMapping("/product.do")
public class ProductController {
	
	@Autowired
	private IProductService productService;
	
	@Autowired
	private ICustomerService customerService;
	@Autowired
	private ProductProxy productProxy;
	
	@Autowired
	private ISellMethodService sellMethodService;
	@Autowired
	private IProductTypeService productTypeService;
	
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
	
	/*@RequestMapping(params="method=AlertProduct")
	public String JsonAlertProduct(@RequestParam(value="name")String productname,@RequestParam(value="typename")Integer typeid,
			@RequestParam(value="methodname")Integer methodid,@RequestParam(value="situation")Integer situation,
			@RequestParam(value="timestart")Date timestart,@RequestParam(value="timeout")Date timeout){
		return "";
	}*/
	@ResponseBody
	@RequestMapping(params="method=AlertProduct")
	public String JsoonAlertProduct(@RequestParam(value="data")String data){
		try {
			data = URLDecoder.decode(data,"utf-8");
			data = data.substring(1,data.length()-1);
			System.out.println(data);
			JSONObject jsonObject = new JSONObject(data);
			Integer id = jsonObject.getInt("id");
			ProductBean productBean = productService.GetEntityById(ProductBean.class, id);
			String name = jsonObject.getString("name");
			productBean.setName(name);
			Integer typeid = jsonObject.getInt("typeid");
			Integer methodid = jsonObject.getInt("methodid");
			SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
			Date timestart = sdf.parse(jsonObject.getString("timestart"));
			productBean.setTimestart(timestart);
			Date timeout = sdf.parse(jsonObject.getString("timeout"));
			productBean.setTimeout(timeout);
			SellMethodBean sellMethodBean = sellMethodService.GetEntityById(SellMethodBean.class, methodid);
			productBean.getProductSellBean().setSellMethodBean(sellMethodBean);
			//System.out.println(productBean.getProductSellBean().getSellMethodBean().getName());
			ProductTypeBean productTypeBean = productTypeService.GetEntityById(ProductTypeBean.class, typeid);
			productBean.setProductTypeBean(productTypeBean);
			productService.UpdataBean(productBean);
			return "1";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "0";
	}
	
	
	/**
	 * 获取对应分配商品
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params="method=GetOnlineProduct")
	public Map<String, Object> JsonGetOnlineNews(@RequestParam(value="page")Integer page,@RequestParam(value="pageSize")Integer pageSize,@RequestParam(value="typeid")Integer typeid){
		Map<String , Object> map = new HashMap<String, Object>();
		List<ProductBean> list = productService.getOnlineProduct(page, pageSize, typeid);
		int total = productService.getOnlineProductTotal(typeid);
		List<ProductVO> productVOs = ProductVO.ChangeListProductToProductVo(list);
		map.put("list", productVOs);
		map.put("total", total);
		return map;
	}
	
}

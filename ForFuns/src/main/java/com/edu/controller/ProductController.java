package com.edu.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.naming.spi.DirStateFactory.Result;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.ServletConfigAware;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;

import com.edu.model.ArtistBean;
import com.edu.model.CustomerBean;
import com.edu.model.NewsBean;
import com.edu.model.OrderBean;
import com.edu.model.ProductBean;
import com.edu.model.ProductSellBean;
import com.edu.model.ProductTypeBean;
import com.edu.model.SellMethodBean;
import com.edu.proxy.ProductProxy;
import com.edu.service.ICustomerService;
import com.edu.service.IOrderService;
import com.edu.service.IProductService;
import com.edu.service.IProductTypeService;
import com.edu.service.ISellMethodService;
import com.edu.table.NewsTable;
import com.edu.table.OrderTable;
import com.edu.util.CheckTokenTool;
import com.edu.viewentity.ProductVO;


@Controller
@RequestMapping("/product.do")
public class ProductController implements ServletConfigAware,
ServletContextAware {
	private ServletContext servletContext;

	@Override
	public void setServletContext(ServletContext arg0){
		this.servletContext = arg0;
	}

	private ServletConfig servletConfig;

	@Override
	public void setServletConfig(ServletConfig arg0){
		this.servletConfig = arg0;
	}

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
	
	@Autowired
	private IOrderService orderService;
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
	/*@RequestMapping(params = "method=BuyProduct")
	@ResponseBody
	@Transactional
	public Map<String, Object> JsonBuyProduct(@RequestParam(value="productid")Integer productid,
			@RequestParam(value="customerid")Integer customerid,@RequestParam(value="money")Integer money){
		ProductBean productBean = productService.GetEntityById(ProductBean.class, productid);
		CustomerBean customerBean = customerService.GetEntityById(CustomerBean.class, customerid);
		productProxy.Init(productBean);
		int result = 0;
		try{
			result = productProxy.BuyProduct(customerBean,money,null);
		}catch(Exception e){
			e.printStackTrace();
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result",result);
		return map;
	}*/
	
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
	 * 获取上线对应分类商品
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params="method=GetOnlineProduct")
	public Map<String, Object> JsonGetOnlineNews(@RequestParam(value="page")Integer page,@RequestParam(value="pageSize")Integer pageSize,
			@RequestParam(value="typeid")Integer typeid,@RequestParam(value="methodid")Integer methodid){
		Map<String , Object> map = new HashMap<String, Object>();
		List<ProductBean> list = productService.getOnlineProduct(page, pageSize, typeid,methodid);
		int total = productService.getOnlineProductTotal(typeid);
		List<ProductVO> productVOs = ProductVO.ChangeListProductToProductVo(list);
		map.put("list", productVOs);
		map.put("total", total);
		return map;
	}
	
	
	/**
	 * 获取对应艺术家的所有商品
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params="method=GetArtistProduct")
	public Map<String, Object> JsonGetArtitsProducts(@RequestParam(value="page")Integer page,@RequestParam(value="pageSize")Integer pageSize,
			@RequestParam(value="artistid")Integer artistid){
		Map<String , Object> map = new HashMap<String, Object>();
		//System.out.println("at getArtistProduct s");
		//System.out.println(page+" + "+pageSize+" + "+artistid);
		List<ProductBean> list = productService.getArtistProduct(page, pageSize, artistid);
		//System.out.println("\r\nThe result of getArtistProduct");
		//System.out.println("at getArtistProduct f");
		int total = productService.getArtistProductTotal(artistid);
		List<ProductVO> productVOs = ProductVO.ChangeListProductToProductVo(list);
		map.put("list", productVOs);
		map.put("total", total);
		System.out.println(total);
		return map;
	}
	
	/**
	 * 根据id获取商品
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params="method=GetProductById")
	public Map<String, Object> JsonGetProductById(@RequestParam(value="productid")Integer id){
		Map<String , Object> map = new HashMap<String, Object>();
		ProductBean productBean = productService.GetEntityById(ProductBean.class, id);
		ProductVO productVO = new ProductVO(productBean);
		map.put("product",productVO);
		return map;
	}
	
	
	
	
	/**
	 * 通过口令判断是否是有订单
	 * @param id
	 * @param useridtoken
	 * @return
	 */
	/*@RequestMapping(params="method=AddOrder")
	public String AddOrder(@RequestParam(value="productid")Integer id,@CookieValue(value = "useridtoken", required = false,defaultValue="") String useridtoken,
			@RequestParam(value="address")String address,@RequestParam(value="telephone")String telephone){
		if("".equals(useridtoken))//未登陆
			return "redirect:/font/Login.jsp?error=2";
		boolean flag = CheckTokenTool.CheckToken(useridtoken);
		if(!flag)
			return "redirect:/font/Login.jsp?error=2";
		String userid = CheckTokenTool.GetUserid(useridtoken);
		CustomerBean customerBean = null;
		ProductBean productBean = null;
		Map<String, Object> params = new HashMap<String, Object>();
		try {
			customerBean =  customerService.getCustomerByUserId(userid);
			productBean = productService.GetEntityById(ProductBean.class, id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(null==customerBean)
			return "redirect:/font/error.jsp";
		int respons = 0;
		try {
			params.put(OrderTable.TELEPHONE, telephone);
			params.put(OrderTable.ADDRESS, address);
			productProxy.Init(productBean);
			respons =productProxy.BuyProduct(customerBean, productBean.getMoney(),params);
			//respons =  orderService.AddOrder(id, customerBean.getId(), address, telephone);
		} catch (Exception e) {
			e.printStackTrace();
		}
		//return 3;//添加成功
		//return 1;//不属于该用户的订单
		//return 2;//属于该用户的订单
		//return 0;//添加失败
		if(respons==0){
			return "redirect:/font/error.jsp";
		}else if(respons==1){
			return "redirect:/font/error.jsp?errorid=1";
		}else if(respons==2){
			return "redirect:/font/goodsdetail.jsp?productid="+id;
		}else if(respons==3){
			return "redirect:/font/success.jsp";
		}
		return "redirect:/font/error.jsp";
	}*/
	
	/**
	 * 通过口令判断是否是有订单
	 * @param id
	 * @param useridtoken
	 * @return
	 */
	@RequestMapping(params="method=AddOrder")
	public String CheckLoginAddOrder(@CookieValue(value = "useridtoken", required = false,defaultValue="") String useridtoken,@RequestParam(value="productid")Integer id,
			@RequestParam(value="addressid")Integer addressid){
		String userid = CheckTokenTool.GetUserid(useridtoken);
		CustomerBean customerBean = null;
		ProductBean productBean = null;
		Map<String, Object> params = new HashMap<String, Object>();
		try {
			customerBean =  customerService.getCustomerByUserId(userid);
			productBean = productService.GetEntityById(ProductBean.class, id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(null==customerBean)
			return "redirect:/font/error.jsp";
		String respons = "redirect:/font/error.jsp";
		try {
			params.put("addressid", addressid);
			productProxy.Init(productBean);
			respons =productProxy.BuyProduct(customerBean, productBean.getMoney(),params);
			System.out.println(respons);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return respons;
	}
	/**
	 * 检测用户是否存在相应的订单。
	 * @param id
	 * @param useridtoken
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params="method=checkOrder")
	public String jsonCheckOrder(@RequestParam(value="productid")Integer id,@CookieValue(value = "useridtoken", required = false,defaultValue="") String useridtoken){
		if("".equals(useridtoken)||null==useridtoken)//未登陆
			return "0";
		boolean flag = CheckTokenTool.CheckToken(useridtoken);
		if(!flag)
			return "0";//未登录
		String userid = CheckTokenTool.GetUserid(useridtoken);
		CustomerBean customerBean = null;
		try {
			customerBean =  customerService.getCustomerByUserId(userid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		OrderBean orderBean = null;
		try {
			orderBean  = orderService.getOrderByProductId(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(null==orderBean)
			return "1";//不存在这个订单
		if(!userid.equals(orderBean.getCustomerBean().getUserid())){
			return "3";//订单与用户不符合
		}
		return "2";//订单与用户相符
	}
	/**
	 * 验证登录后进入发布页面 
	 * @param useridtoken
	 * @return
	 */
	@RequestMapping(params="method=EnterPublish")
	public String CheckLoginPublish(@CookieValue(value = "useridtoken", required = false,defaultValue="") String useridtoken){
		return "/font/Publish.jsp";
	}
	/**
	 * 
	 * @param useridtoken
	 * @param request
	 * @param file
	 * @return
	 */
	@RequestMapping(params="method=PublishProduct")
	public String CheckLoginAddProduct(@CookieValue(value = "useridtoken", required = false,defaultValue="") String useridtoken,HttpServletRequest request,
			@RequestParam(value = "imgurl", required = true) MultipartFile file,@RequestParam(value = "imgone", required = true) MultipartFile imgone,
			@RequestParam(value = "imgtwo", required = true) MultipartFile imgtwo,@RequestParam(value = "imgthree", required = true) MultipartFile imgthree,
			@RequestParam(value="productname")String productname,@RequestParam(name="money")Integer money,@RequestParam(name="typeid")Integer typeid,
			@RequestParam(value="sellid")Integer sellid,@RequestParam(value="starttime")String starttime,@RequestParam(value="endtime")String endtime,
			@RequestParam(value="content")String content){
		
		ProductBean productBean = new ProductBean();
		try {
			CustomerBean customerBean = customerService.getCustomerByUserId(CheckTokenTool.GetUserid(useridtoken));
			productBean.setArtistBean(new ArtistBean(customerBean));
		} catch (Exception e2) {
			e2.printStackTrace();
			return "redirect:/font/error.jsp?";
		}
		productBean.setName(productname);
		productBean.setMoney(money);
		try  {  
		    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");  
		    Date date = sdf.parse(starttime); 
		    productBean.setTimestart(date);
		}  catch (ParseException e)  {  
		    System.out.println(e.getMessage());  
		    return "redirect:/font/error.jsp?";
		}  
		try  {  
		    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");  
		    Date date = sdf.parse(endtime); 
		    productBean.setTimeout(date);
		}  catch (ParseException e)  {  
		    System.out.println(e.getMessage());  
		    return "redirect:/font/error.jsp?";
		}  
		productBean.setContent(content);
		productBean.setProductTypeBean(productTypeService.GetEntityById(ProductTypeBean.class, typeid));
		
		
		
		
		
		
		String filePath = servletContext.getRealPath("/") + "avatorupload/";
		String saveUrl = request.getContextPath() + "/avatorupload/";
		System.out.println(filePath);
		File filedir = new File(filePath);
		if (!filedir.exists()){
			filedir.mkdir();
			return "redirect:/font/error.jsp?";
		}
		String ext = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
		String newfilename = System.currentTimeMillis() + ext;
		String PathAndName = filePath + newfilename;
		saveUrl = saveUrl + newfilename;
		File resultFile = new File(PathAndName);
		try{
			file.transferTo(resultFile);
		} catch (IOException e1){
			e1.printStackTrace();
			return "redirect:/font/error.jsp?";
		}
		productBean.setImgurl(saveUrl);
		ext = imgone.getOriginalFilename().substring(imgone.getOriginalFilename().lastIndexOf("."));
		newfilename = System.currentTimeMillis() + ext;
		PathAndName = filePath + newfilename;
		saveUrl = saveUrl + newfilename;
		resultFile = new File(PathAndName);
		try{
			imgone.transferTo(resultFile);
		} catch (IOException e1){
			e1.printStackTrace();
			return "redirect:/font/error.jsp?";
		}
		productBean.setImgone(saveUrl);
		ext = imgtwo.getOriginalFilename().substring(imgtwo.getOriginalFilename().lastIndexOf("."));
		newfilename = System.currentTimeMillis() + ext;
		PathAndName = filePath + newfilename;
		saveUrl = saveUrl + newfilename;
		resultFile = new File(PathAndName);
		try{
			imgtwo.transferTo(resultFile);
		} catch (IOException e1){
			e1.printStackTrace();
			return "redirect:/font/error.jsp?";
		}
		productBean.setImgtwo(saveUrl);
		ext = imgthree.getOriginalFilename().substring(imgthree.getOriginalFilename().lastIndexOf("."));
		newfilename = System.currentTimeMillis() + ext;
		PathAndName = filePath + newfilename;
		saveUrl = saveUrl + newfilename;
		resultFile = new File(PathAndName);
		try{
			imgthree.transferTo(resultFile);
		} catch (IOException e1){
			e1.printStackTrace();
			return "redirect:/font/error.jsp?";
		}
		productBean.setImgthree(saveUrl);
		
		
		
		ProductSellBean productSellBean = new ProductSellBean();
		productSellBean.setSellMethodBean(sellMethodService.GetEntityById(SellMethodBean.class, sellid));
		productSellBean.setProductBean(productBean);
		productBean.setProductSellBean(productSellBean);
		productService.AddBean(productBean);
		return "redirect:/font/success.jsp?successid=2";
		
	}
}

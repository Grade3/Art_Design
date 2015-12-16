package com.edu.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.edu.dao.ICustomerDao;
import com.edu.dao.IProductDao;
import com.edu.model.CustomerBean;
import com.edu.model.OrderBean;
import com.edu.model.ProductBean;
import com.edu.model.UserBean;
import com.edu.service.ICustomerService;
import com.edu.service.IOrderService;
import com.edu.service.IProductService;
import com.edu.service.IUserService;
import com.edu.table.OrderTable;
import com.edu.table.UserTable;
import com.edu.viewentity.OrderVO;

@Controller
@RequestMapping("/order.do")
public class OrderController
{
	@Resource
	private IOrderService orderService;
	@Resource
	private ICustomerService customerService;
	@Resource
	private IProductService productService;
	
	/**
	 * 获取分页列表
	 * 
	 * @param page
	 * @param pageSize
	 * @return
	 */
	@RequestMapping(params = "method=getOrderbypage")
	@ResponseBody
	public Map<String, Object> JsonGetPageOrder(
			@RequestParam(value = "page") int page,
			@RequestParam(value = "rows") int pageSize,
			@RequestParam(value="selectname",defaultValue="id")String selectname,
			@RequestParam(value="value",defaultValue="")String value) 
	{
		Map<String, Object> map = new HashMap<String, Object>();
		List<OrderBean> list = orderService.GetPageBeanFilter(OrderBean.class, page,
				pageSize,selectname,value);
		int total = orderService.GetPageBeanFilterTotal(OrderBean.class, page, pageSize, selectname, value);
		List<OrderVO> listVO = OrderVO.ChangeListProductToOrderVo(list);
		
		map.put("rows", listVO);
		map.put("total", total);
		return map;
	}

	
	/**
	 * 删除用户
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "method=deleteOrder")
	@ResponseBody
	public String JsonDeleteOrder(@RequestParam(value = "ids") String ids) {
		String[] id = ids.split(",");
		int[] temp = new int[id.length];
		for (int i = 0; i < id.length; i++) {
			temp[i] = Integer.parseInt(id[i]);
		}
		try {
			orderService.DeleteBatch(OrderBean.class, temp);
			return "true";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	
	
	/**
	 * 添加用户
	 * @param rowstr
	 * @return
	 */
	@RequestMapping(params="method=addOrder")
	@ResponseBody
	public int JsonAddOrder(@RequestParam(value="data") String data){
		try {
			data = URLDecoder.decode(data,"utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		try {
			//data = URLDecoder.decode(data, "utf-8");
			DateFormat df = new SimpleDateFormat("MM/dd/yyyy");
			data = data.substring(1,data.length()-1);
			System.out.println(data);
			JSONObject jsonObject = new JSONObject(data);
			Date current = df.parse(jsonObject.getString(OrderTable.CURRENT));
			String address = jsonObject.getString(OrderTable.ADDRESS);
			Integer customerid = jsonObject.getInt(OrderTable.CUSTOMERID);
			Integer productid = jsonObject.getInt(OrderTable.PRODUCTID);
			String telephone = jsonObject.getString(OrderTable.TELEPHONE);
			Integer ispay = jsonObject.getInt(OrderTable.ISPAY);
			
			CustomerBean customerBean = customerService.GetEntityById(CustomerBean.class, customerid);
			ProductBean productBean = productService.GetEntityById(ProductBean.class, productid);
			
			OrderBean orderBean = new OrderBean(telephone, address, current, ispay, productBean, customerBean);
			orderService.AddBean(orderBean);
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	/**
	 * 更新
	 * @param rowstr
	 * @return
	 * @throws ParseException 
	 * @throws JSONException 
	 */
	@RequestMapping(params="method=updateOrder")
	@ResponseBody
	public String JsonUpdate(@RequestParam(value="data") String data) throws JSONException, ParseException{
		try {
			data = URLDecoder.decode(data,"utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		data = data.substring(1,data.length()-1);
		DateFormat df = new SimpleDateFormat("MM/dd/yyyy");
		System.out.println(data);
		JSONObject jsonObject = new JSONObject(data);
		Integer id = jsonObject.getInt("id");
		Date current = df.parse(jsonObject.getString(OrderTable.CURRENT));
		String address = jsonObject.getString(OrderTable.ADDRESS);
		Integer customerid = jsonObject.getInt(OrderTable.CUSTOMERID);
		Integer productid = jsonObject.getInt(OrderTable.PRODUCTID);
		String telephone = jsonObject.getString(OrderTable.TELEPHONE);
		Integer ispay = jsonObject.getInt(OrderTable.ISPAY);
		
		CustomerBean customerBean = customerService.GetEntityById(CustomerBean.class, customerid);
		ProductBean productBean = productService.GetEntityById(ProductBean.class, productid);
		
		OrderBean orderBean = orderService.GetEntityById(OrderBean.class, id);
		
		orderBean.setAddress(address);
		orderBean.setCurrent(current);
		orderBean.setCustomerBean(customerBean);
		orderBean.setIspay(ispay);
		orderBean.setProductBean(productBean);
		orderBean.setTelephone(telephone);
		
		orderService.UpdataBean(orderBean);
		return "true";
	}
	//[{\"id\":1,\"name\":\"C\",\"size\":\"\",\"date\":\"02/19/2010\",\"children\":[{\"id\":2,\"name\":\"Program Files\",\"size\":\"120 MB\",\"date\":\"03/20/2010\",\"children\":[{\"id\":21,\"name\":\"Java\",\"size\":\"\",\"date\":\"01/13/2010\",\"state\":\"closed\",\"children\":[{\"id\":211,\"name\":\"java.exe\",\"size\":\"142 KB\",\"date\":\"01/13/2010\"},{\"id\":212,\"name\":\"jawt.dll\",\"size\":\"5 KB\",\"date\":\"01/13/2010\"}]}]}]}]
	@RequestMapping(params="method=gettest")
	@ResponseBody
	public String JsonGetTree(){
		return "[{\"id\":1,\"name\":\"C\",\"children\":[{\"id\":2,\"name\":\"Program Files\"}]}]";
	}
	
	/**
	 * 获取所有的用户
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params="method=getAllOrder")
	public Map<String, Object> GetAllOrder(){
		List<OrderBean> list = orderService.GetAllBean(OrderBean.class);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("orders", list);
		return map;
	}
}

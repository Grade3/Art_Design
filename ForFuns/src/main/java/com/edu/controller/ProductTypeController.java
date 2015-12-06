/**
 * 
 */
package com.edu.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.edu.dao.IProductTypeDao;
import com.edu.model.FunctionBean;
import com.edu.model.ProductTypeBean;
import com.edu.model.RoleBean;
import com.edu.model.UserBean;
import com.edu.service.IProductTypeService;
import com.edu.service.IUserService;
import com.edu.serviceimpl.UserServiceImpl;
import com.edu.table.ProductTypeTable;
import com.edu.table.UserTable;
import com.edu.util.MD5Util;

/**
 * 用户管理controller
 * @author kh
 * 
 */
@Controller
@RequestMapping("/productType.do")
public class ProductTypeController
{
	@Resource
	private IProductTypeService productTypeService;
	
	/**
	 * Delete productType
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "method=deleteProductType")
	@ResponseBody
	public String JsonDeleteUser(@RequestParam(value = "ids") String ids) {
		String[] id = ids.split(",");
		int[] temp = new int[id.length];
		for (int i = 0; i < id.length; i++) {
			temp[i] = Integer.parseInt(id[i]);
		}
		int result = productTypeService.DeleteBatch(ProductTypeBean.class, temp);
		if (result == 1)
			return "true";
		return "error";
	}
	
	
	/**
	 * Add productType
	 * @param rowstr
	 * @return
	 */
	@RequestMapping(params="method=addProductType")
	@ResponseBody
	public int JsonAddUser(@RequestParam(value="data") String data){
		try {
			data = URLDecoder.decode(data,"utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		try {
			//data = URLDecoder.decode(data, "utf-8");
			data = data.substring(1,data.length()-1);
			System.out.println(data);
			JSONObject jsonObject = new JSONObject(data);
			String name = jsonObject.getString(ProductTypeTable.NAME);
			ProductTypeBean productTypeBean = new ProductTypeBean(name);
			productTypeService.AddBean(productTypeBean);
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		
	}

	/**
	 * update
	 * @param rowstr
	 * @return
	 */
	@RequestMapping(params="method=updateProductType")
	@ResponseBody
	public String JsonUpdate(@RequestParam(value="data") String data){
		try {
			data = URLDecoder.decode(data,"utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		data = data.substring(1,data.length()-1);
		System.out.println(data);
		JSONObject jsonObject = new JSONObject(data);
		int id = jsonObject.getInt(ProductTypeTable.ID);
		String name = jsonObject.getString(ProductTypeTable.NAME);
		ProductTypeBean productTypeBean = new ProductTypeBean(id, name);
		productTypeService.UpdataBean(productTypeBean);
		return "true";
	}

	@RequestMapping(params="method=gettest")
	@ResponseBody
	public String JsonGetTree(){
		return "[{\"id\":1,\"name\":\"C\",\"children\":[{\"id\":2,\"name\":\"Program Files\"}]}]";
	}

	/**
	 * 获取所有的类型
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params="method=getAllProductType")
	public Map<String, Object> GetAllProductType(){
		List<ProductTypeBean> list = productTypeService.GetAllBean(ProductTypeBean.class);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("productTypes", list);
		return map;
	}
	
	/**
	 * 获取分页列表
	 * 
	 * @param page
	 * @param pageSize
	 * @return
	 */
	@RequestMapping(params = "method=getProductTypeByPage")
	@ResponseBody
	public Map<String, Object> JsonGetPageProductType(
			@RequestParam(value = "page") int page,
			@RequestParam(value = "rows") int pageSize,
			@RequestParam(value="selectname",defaultValue="id")String selectname,
			@RequestParam(value="value",defaultValue="")String value) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<ProductTypeBean> list = productTypeService.GetPageBeanFilter(ProductTypeBean.class, page,
				pageSize,selectname,value);
		int total = productTypeService.GetPageBeanFilterTotal(ProductTypeBean.class, page, pageSize, selectname, value);
		map.put("rows", list);
		map.put("total", total);
		return map;
	}
}

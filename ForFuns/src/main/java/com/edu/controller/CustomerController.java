/**
 * 
 */
package com.edu.controller;

import java.net.URLDecoder;
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

import com.edu.model.RoleBean;
import com.edu.model.CustomerBean;
import com.edu.model.UserBean;
import com.edu.service.ICustomerService;
import com.edu.service.IUserService;
import com.edu.serviceimpl.CustomerServiceImpl;
import com.edu.table.CustomerTable;
import com.edu.table.UserTable;
import com.edu.util.MD5Util;

/**
 * 客户管理controller
 * @author kh
 * 
 */
@Controller
@RequestMapping("/customer.do")
public class CustomerController {
	@Resource
	private ICustomerService customerService;

	/**
	 * 登录功能
	 * 
	 * @param username
	 * @param password
	 * @return
	 */
	@RequestMapping(params = "method=login")
	public String login(
			@RequestParam(value = "username", required = false) String username,
			@RequestParam(value = "password", required = false) String password,
			HttpServletRequest request, HttpServletResponse response,
			@CookieValue(value = "token", required = false) String token) {
		if (null != token) {
			if (null == username) {
				System.out.println(token);
				String[] parts = token.split("\\&");
				System.out.println(parts.length);
				String temp = MD5Util.convertMD5(parts[1]);
				System.out.println(temp);
				if (parts[0].equals(temp))
					return "redirect:/admin/main.jsp";
				return "redirect:/jsp/login.jsp?error=1";
			}
		}
		CustomerBean user = new CustomerBean();
		user.setPassword(password);
		user.setUsername(username);
		System.out.println(user.toString());
		boolean loginResult = customerService.isExist(user);
		if (loginResult) {
			Cookie cookie = new Cookie("token", username + "&"
					+ MD5Util.convertMD5(username));
			response.addCookie(cookie);
			return "redirect:/admin/main.jsp";
		} else {
			return "redirect:/jsp/login.jsp?error=1";
		}
	}



	/**
	 * 获取分页列表
	 * 
	 * @param page
	 * @param pageSize
	 * @return
	 */
	@RequestMapping(params = "method=getCustomerbypage")
	@ResponseBody
	public Map<String, Object> JsonGetPageCustomer(
			@RequestParam(value = "page") int page,
			@RequestParam(value = "rows") int pageSize,
			@RequestParam(value="selectname",defaultValue="id")String selectname,
			@RequestParam(value="value",defaultValue="")String value) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<CustomerBean> list = customerService.GetPageBeanFilter(CustomerBean.class, page,
				pageSize,selectname,value);
		int total = customerService.GetPageBeanFilterTotal(CustomerBean.class, page, pageSize, selectname, value);
		map.put("rows", list);
		map.put("total", total);
		return map;
	}

	
	/**
	 * 删除用户
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "method=deleteCustomer")
	@ResponseBody
	public String JsonDeleteUser(@RequestParam(value = "ids") String ids) 
	{
		String[] id = ids.split(",");
		int[] temp = new int[id.length];
		for (int i = 0; i < id.length; i++) {
			temp[i] = Integer.parseInt(id[i]);
		}
		int result = customerService.DeleteBatch(CustomerBean.class, temp);
		if (result == 1)
			return "true";
		return "error";
	}
	
	
	/**
	 * 添加用户
	 * @param rowstr
	 * @return
	 */
	@RequestMapping(params="method=addCustomer")
	@ResponseBody
	public int JsonAddUser(@RequestParam(value="data") String data){
		try {
			//data = URLDecoder.decode(data, "utf-8");
			data = data.substring(1,data.length()-1);
			System.out.println(data);
			JSONObject jsonObject = new JSONObject(data);
			String userid = jsonObject.getString(CustomerTable.USERID);
			String username = jsonObject.getString(CustomerTable.USERNAME);
			String password = jsonObject.getString(CustomerTable.PASSWORD);
			String personnumber = jsonObject.getString(CustomerTable.PERSONNUMBER);
			String telphone = jsonObject.getString(CustomerTable.TELPHONE);
			String realname = jsonObject.getString(CustomerTable.REALNAME);
			String avator = jsonObject.getString(CustomerTable.AVATOR);
			Integer isartist = Integer.parseInt(jsonObject.getString(CustomerTable.ISARTIST)) ;
			CustomerBean customerBean = new CustomerBean(userid, username,
					password, personnumber, telphone,
					realname, avator, isartist);
			customerService.AddBean(customerBean);
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
	 */
	@RequestMapping(params="method=updateCustomer")
	@ResponseBody
	public String JsonUpdate(@RequestParam(value="data") String data){
		data = data.substring(1,data.length()-1);
		System.out.println(data);
		JSONObject jsonObject = new JSONObject(data);
		int id = jsonObject.getInt(CustomerTable.ID);
		String userid = jsonObject.getString(CustomerTable.USERID);
		String username = jsonObject.getString(CustomerTable.USERNAME);
		String password = jsonObject.getString(CustomerTable.PASSWORD);
		String personnumber = jsonObject.getString(CustomerTable.PERSONNUMBER);
		String telphone = jsonObject.getString(CustomerTable.TELPHONE);
		String realname = jsonObject.getString(CustomerTable.REALNAME);
		String avator = jsonObject.getString(CustomerTable.AVATOR);
		Integer isartist = Integer.parseInt(jsonObject.getString(CustomerTable.ISARTIST)) ;
		CustomerBean userBean = new CustomerBean(id,userid, username,
				password, personnumber, telphone,
				realname, avator, isartist);
		customerService.UpdataBean(userBean);
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
	@RequestMapping(params="method=getallcustomer")
	public Map<String, Object> GetAllCustomer(){
		List<CustomerBean> list = customerService.GetAllBean(CustomerBean.class);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("customers", list);
		return map;
	}
}


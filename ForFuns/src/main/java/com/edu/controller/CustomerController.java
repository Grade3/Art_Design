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
 * 
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
	public String login(@RequestParam(value = "userid", required = false) String userid,
			@RequestParam(value = "password", required = false) String password, HttpServletRequest request,
			HttpServletResponse response, @CookieValue(value = "useridtoken", required = false) String token) {
		if (null != token) {
			if (null == userid) {
				System.out.println(token);
				String[] parts = token.split("\\&");
				System.out.println(parts.length);
				String temp = MD5Util.convertMD5(parts[1]);
				System.out.println(temp);
				if (parts[0].equals(temp))
					return "redirect:/font/home.jsp";
				return "redirect:/font/Login.jsp?error=1";
			}
		}
		CustomerBean user = new CustomerBean();
		user.setPassword(password);
		user.setUserid(userid);
		System.out.println(user.toString());
		boolean loginResult = customerService.isExist(user);
		if (loginResult) {
			String temp = null;
			try {
				temp = URLEncoder.encode(MD5Util.convertMD5(userid), "utf-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			String value = userid + "&" + temp;
			System.out.println(value);
			Cookie cookie = new Cookie("useridtoken", value);
			response.addCookie(cookie);
			return "redirect:/font/home.jsp";
		} else {
			return "redirect:/font/Login.jsp?error=1";
		}
	}

	/**
	 * 注册功能
	 * 
	 * @param userid
	 * @param password
	 * @param confirm_password
	 * @param username
	 * @param realname
	 * @param telphone
	 * @param personnumber
	 * @return
	 */
	@RequestMapping(params = "method=register")
	public String register(@RequestParam(value = "userid", required = false) String userid,
			@RequestParam(value = "password", required = false) String password,
			@RequestParam(value = "confirm_password", required = false) String confirm_password,
			@RequestParam(value = "username", required = false) String username,
			@RequestParam(value = "realname", required = false) String realname,
			@RequestParam(value = "telphone", required = false) String telphone,
			@RequestParam(value = "personnumber", required = false) String personnumber, HttpServletRequest request,
			HttpServletResponse response, @CookieValue(value = "token", required = false) String token) {
		// if (null != token) {
		// if (null == userid) {
		// System.out.println(token);
		// String[] parts = token.split("\\&");
		// System.out.println(parts.length);
		// String temp = MD5Util.convertMD5(parts[1]);
		// System.out.println(temp);
		// if (parts[0].equals(temp))
		// return "redirect:/font/news.jsp";
		// return "redirect:/font/Login.jsp?error=1";
		// }
		// }
		CustomerBean user = new CustomerBean();
		int registFlag = 0;
		if (userid.equals("") || password.equals("") || confirm_password.equals("") || username.equals("")
				|| realname.equals("") || telphone.equals("") || personnumber.equals(""))
			registFlag = 1;
		if (!password.equals(confirm_password))
			registFlag = 2;


		if (registFlag == 0) {
			user.setUserid(userid);
			if(customerService.exist(user)){registFlag = 3;System.out.println("重名！");}
			else registFlag=4;
		}
		if (registFlag == 4) {
			user.setId(customerService.countCustomer() + 1);
			user.setPassword(password);
			user.setUserid(userid);
			user.setUsername(username);
			user.setPersonnumber(personnumber);
			user.setRealname(realname);
			user.setTelphone(telphone);
			user.setIsartist(0);
			System.out.println(user.toString());
			customerService.AddBean(user);

			String temp = null;
			try {
				temp = URLEncoder.encode(MD5Util.convertMD5(userid), "utf-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			String value = userid + "&" + temp;
			System.out.println(value);
			Cookie cookie = new Cookie("useridtoken", value);
			response.addCookie(cookie);
			return "redirect:/font/Login.jsp";
		}
		//密码不同
		if (registFlag == 2)
			return "redirect:/font/Register.jsp?error=2";
		//用户名重复
		if (registFlag == 3)
			return "redirect:/font/Register.jsp?error=3";
		//没填全
		else
			return "redirect:/font/Register.jsp?error=1";

	}

	/**
	 * 注册功能
	 * 
	 * @param userid
	 * @param password
	 * @param confirm_password
	 * @param username
	 * @param realname
	 * @param telphone
	 * @param personnumber
	 * @return
	 */
	@RequestMapping(params = "method=checkUserid")
	public Boolean isExist(@RequestParam(value = "userid", required = false) String userid)
	{
		CustomerBean user = new CustomerBean();

		user.setUserid(userid);
		if(customerService.exist(user))
		{
			return true;
		}
		
		return false;
	}
	
	/**
	 * 添加用户
	 * 
	 * @param rowstr
	 * @return
	 */
	@RequestMapping(params = "method=addCustomer")
	@ResponseBody
	public int JsonAddUser(@RequestParam(value = "data") String data) {
		try {
			data = URLDecoder.decode(data, "utf-8");
			data = data.substring(1, data.length() - 1);
			System.out.println(data);
			JSONObject jsonObject = new JSONObject(data);
			String userid = jsonObject.getString(CustomerTable.USERID);
			String username = jsonObject.getString(CustomerTable.USERNAME);
			String password = jsonObject.getString(CustomerTable.PASSWORD);
			String personnumber = jsonObject.getString(CustomerTable.PERSONNUMBER);
			String telphone = jsonObject.getString(CustomerTable.TELPHONE);
			String realname = jsonObject.getString(CustomerTable.REALNAME);
			String avator = jsonObject.getString(CustomerTable.AVATOR);
			Integer isartist = 0;
			CustomerBean customerBean = new CustomerBean(userid, username, password, personnumber, telphone, realname,
					avator, isartist);
			customerService.AddBean(customerBean);
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}

	}

	/**
	 * 更新
	 * 
	 * @param rowstr
	 * @return
	 */
	@RequestMapping(params = "method=updateCustomer")
	@ResponseBody
	public String JsonUpdate(@RequestParam(value = "data") String data) {
		try {
			data = URLDecoder.decode(data, "utf-8");
			data = data.substring(1, data.length() - 1);
			System.out.println(data);
			JSONObject jsonObject = new JSONObject(data);
			int id = jsonObject.getInt(CustomerTable.ID);
			CustomerBean customerBean = customerService.GetEntityById(CustomerBean.class, id);
			String userid = jsonObject.getString(CustomerTable.USERID);
			customerBean.setUserid(userid);
			String username = jsonObject.getString(CustomerTable.USERNAME);
			customerBean.setUsername(username);
			String password = jsonObject.getString(CustomerTable.PASSWORD);
			customerBean.setPassword(password);
			String personnumber = jsonObject.getString(CustomerTable.PERSONNUMBER);
			customerBean.setPersonnumber(personnumber);
			String telphone = jsonObject.getString(CustomerTable.TELPHONE);
			customerBean.setTelphone(telphone);
			String realname = jsonObject.getString(CustomerTable.REALNAME);
			customerBean.setRealname(realname);
			String avator = jsonObject.getString(CustomerTable.AVATOR);
			customerBean.setAvator(avator);
			customerService.UpdataBean(customerBean);
			return "true";
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return "error";
	}

	@RequestMapping(params = "method=gettest")
	@ResponseBody
	public String JsonGetTree() {
		return "[{\"id\":1,\"name\":\"C\",\"children\":[{\"id\":2,\"name\":\"Program Files\"}]}]";
	}

	/**
	 * 获取所有的用户
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params = "method=getallcustomer")
	public Map<String, Object> GetAllCustomer() {
		List<CustomerBean> list = customerService.GetAllBean(CustomerBean.class);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("customers", list);
		return map;
	}
	
	
	/**
	 * 通过id获取username
	 * @param username
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params="method=GetCustomerName",produces="text/html;charset=UTF-8")
	public String JsonGetUserName(@RequestParam(value="customerid")String customerid){
		return customerService.GetBeanByCondition(CustomerBean.class, CustomerTable.USERID, customerid, null).getUsername();
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
	 * 退出登录
	 * @param token
	 * @param response
	 * @return
	 */
	@RequestMapping(params="method=loginout")
	public String LoginOut(@CookieValue(value = "useridtoken", required = false) Cookie token,HttpServletResponse response){
		if(null!=token){
			token.setMaxAge(0);
			response.addCookie(token);
		}
		return "font/Login.jsp";
	}
	
}

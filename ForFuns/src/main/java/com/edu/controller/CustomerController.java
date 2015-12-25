/**
 * 
 */
package com.edu.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.channels.FileChannel;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
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
import org.springframework.web.context.ServletConfigAware;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;

import com.edu.model.News;
import com.edu.model.Role;
import com.edu.model.Customer;
import com.edu.model.User;
import com.edu.service.ICustomerService;
import com.edu.service.IUserService;
import com.edu.serviceimpl.CustomerServiceImpl;
import com.edu.table.CustomerTable;
import com.edu.table.UserTable;
import com.edu.util.MD5Util;
import com.edu.viewentity.AdminCustomerVO;
import com.edu.viewentity.CustomerVO;

/**
 * 客户管理controller
 * 
 * @author kh
 * 
 */
@Controller
@RequestMapping("/customer.do")
public class CustomerController implements ServletConfigAware,
		ServletContextAware
{
	private ServletContext servletContext;

	@Override
	public void setServletContext(ServletContext arg0)
	{
		this.servletContext = arg0;
	}

	private ServletConfig servletConfig;

	@Override
	public void setServletConfig(ServletConfig arg0)
	{
		this.servletConfig = arg0;
	}

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
			@RequestParam(value = "userid", required = false) String userid,
			@RequestParam(value = "password", required = false) String password,
			HttpServletRequest request, HttpServletResponse response,
			@CookieValue(value = "useridtoken", required = false) String token)
	{
		if (null != token)
		{
			// System.out.println("get id");
			if (null == userid)
			{
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
		Customer user = new Customer();
		user.setPassword(password);
		user.setUserid(userid);
		System.out.println(user.toString());
		boolean loginResult = customerService.isExist(user);
		if (loginResult)
		{
			String temp = null;
			try
			{
				temp = URLEncoder.encode(MD5Util.convertMD5(userid), "utf-8");
			} catch (UnsupportedEncodingException e)
			{
				e.printStackTrace();
			}
			String value = userid + "&" + temp;
			System.out.println(value);
			Cookie cookie = new Cookie("useridtoken", value);
			response.addCookie(cookie);
			return "redirect:/font/home.jsp";
		} else
		{
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
	public String register(
			@RequestParam(value = "userid", required = false) String userid,
			@RequestParam(value = "username", required = false) String username,
			@RequestParam(value = "realname", required = false) String realname,
			@RequestParam(value = "telphone", required = false) String telphone,
			@RequestParam(value = "password", required = false) String password,
			@RequestParam(value = "personnumber", required = false) String personnumber,
			HttpServletRequest request, HttpServletResponse response,
			@CookieValue(value = "token", required = false) String token)
	{
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
		Customer user = new Customer();
		int registFlag = 0;
		if (userid.equals("") || username.equals("") || realname.equals("")
				|| telphone.equals("") || personnumber.equals(""))
			registFlag = 1;
		if (registFlag == 0)
		{
			user.setUserid(userid);
			if (customerService.exist(user))
			{
				registFlag = 3;
				System.out.println("重名！");
			}
		}
		if (registFlag == 0)
		{
			user.setUsername(username);
			user.setPersonnumber(personnumber);
			user.setRealname(realname);
			user.setTelphone(telphone);
			user.setPassword(password);
			user.setAvator("/forfun/image/293.jpg");
			System.out.println(user.toString());

			customerService.AddBean(user);

			String temp = null;
			try
			{
				temp = URLEncoder.encode(MD5Util.convertMD5(userid), "utf-8");
			} catch (UnsupportedEncodingException e)
			{
				e.printStackTrace();
			}
			String value = userid + "&" + temp;
			System.out.println(value);
			Cookie cookie = new Cookie("useridtoken", value);
			response.addCookie(cookie);
			return "redirect:/font/personal.jsp";
		}
		// 用户名重复
		if (registFlag == 3)
			return "redirect:/font/Register.jsp?error=2";
		// 没填全
		else
			return "redirect:/font/Register.jsp?error=1";

	}

	/**
	 * 修改个人信息功能
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
	@RequestMapping(params = "method=modify")
	public String modify(
			@RequestParam(value = "username", required = false) String username,
			@RequestParam(value = "realname", required = false) String realname,
			@RequestParam(value = "telphone", required = false) String telphone,
			@RequestParam(value = "personnumber", required = false) String personnumber,
			HttpServletRequest request, HttpServletResponse response,
			@CookieValue(value = "useridtoken", required = false) String token)
	{
		String userid = null;
		if (null != token)
		{
			if (null == userid)
			{
				System.out.println(token);
				String[] parts = token.split("\\&");
				System.out.println(parts.length);
				String temp = MD5Util.convertMD5(parts[1]);
				System.out.println(temp);
				userid = temp;
			}
		}
		// CustomerBean user = new CustomerBean();
		int registFlag = 0;
		if (userid.equals("") || username.equals("") || realname.equals("")
				|| telphone.equals("") || personnumber.equals(""))
			registFlag = 1;

		if (registFlag == 0)
		{
			// System.out.println("a");
			System.out.println(customerService.getCustomerIdByUserid(userid));
			Customer user = customerService.GetEntityById(
					Customer.class, Integer.valueOf(customerService
							.getCustomerIdByUserid(userid)));
			System.out.println(user.toString());
			// user.setUserid(userid);
			user.setUsername(username);
			user.setPersonnumber(personnumber);
			user.setRealname(realname);
			user.setTelphone(telphone);
			System.out.println(user.toString());
			customerService.UpdataBean(user);

			// String temp = null;
			// try {
			// temp = URLEncoder.encode(MD5Util.convertMD5(userid), "utf-8");
			// } catch (UnsupportedEncodingException e) {
			// e.printStackTrace();
			// }
			// String value = userid + "&" + temp;
			// System.out.println(value);
			// Cookie cookie = new Cookie("useridtoken", value);
			// response.addCookie(cookie);

			return "redirect:/font/personal.jsp";
		}
		// 没填全
		else
			return "redirect:/font/modify.jsp?error=1";

	}

	/**
	 * 修改个人头像
	 * 
	 * @param file
	 * @return
	 */
	@RequestMapping(params = "method=alertAvator")
	public String AlertAvator(
			@RequestParam(value = "file", required = false) MultipartFile file,
			HttpServletRequest request,
			@CookieValue(value = "useridtoken", required = false) String token)
	{
		String userid = null;
		if (null != token)
		{
			if (null == userid)
			{
				System.out.println(token);
				String[] parts = token.split("\\&");
				System.out.println(parts.length);
				String temp = MD5Util.convertMD5(parts[1]);
				System.out.println(temp);
				userid = temp;
			}
		}

		String filePath = servletContext.getRealPath("/") + "avatorupload/";
		String saveUrl = request.getContextPath() + "/avatorupload/";
		System.out.println(filePath);
		File filedir = new File(filePath);
		if (!filedir.exists())
		{
			filedir.mkdir();
		}
		String ext = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
		String newfilename = System.currentTimeMillis() + ext;
		String PathAndName = filePath + newfilename;
		saveUrl = saveUrl + newfilename;
		File resultFile = new File(PathAndName);
		try
		{
			file.transferTo(resultFile);
		} catch (IOException e1)
		{
			e1.printStackTrace();
		}

		Customer customerBean = customerService.GetEntityById(
				Customer.class,
				Integer.valueOf(customerService.getCustomerIdByUserid(userid)));

		customerBean.setAvator(saveUrl);

		customerService.UpdataBean(customerBean);

		return "redirect:/font/modify.jsp";
	}

	/**
	 * 功能
	 * 
	 * @return
	 */
	@RequestMapping(params = "method=checkUserid")
	public Boolean isExist(
			@RequestParam(value = "userid", required = false) String userid)
	{
		Customer user = new Customer();

		user.setUserid(userid);
		if (customerService.exist(user))
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
	public int JsonAddUser(@RequestParam(value = "data") String data)
	{
		try
		{
			data = URLDecoder.decode(data, "utf-8");
			data = data.substring(1, data.length() - 1);
			System.out.println(data);
			JSONObject jsonObject = new JSONObject(data);
			String userid = jsonObject.getString(CustomerTable.USERID);
			String username = jsonObject.getString(CustomerTable.USERNAME);
			String password = jsonObject.getString(CustomerTable.PASSWORD);
			String personnumber = jsonObject
					.getString(CustomerTable.PERSONNUMBER);
			String telphone = jsonObject.getString(CustomerTable.TELPHONE);
			String realname = jsonObject.getString(CustomerTable.REALNAME);
			String avator = jsonObject.getString(CustomerTable.AVATOR);
			Integer isartist = 0;
			Customer customerBean = new Customer(userid, username,
					password, personnumber, telphone, realname, avator,
					isartist);
			customerService.AddBean(customerBean);
			return 1;
		} catch (Exception e)
		{
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
	public String JsonUpdate(@RequestParam(value = "data") String data)
	{
		try
		{
			data = URLDecoder.decode(data, "utf-8");
			data = data.substring(1, data.length() - 1);
			System.out.println(data);
			JSONObject jsonObject = new JSONObject(data);
			int id = jsonObject.getInt(CustomerTable.ID);
			Customer customerBean = customerService.GetEntityById(
					Customer.class, id);
			String userid = jsonObject.getString(CustomerTable.USERID);
			customerBean.setUserid(userid);
			String username = jsonObject.getString(CustomerTable.USERNAME);
			customerBean.setUsername(username);
			String password = jsonObject.getString(CustomerTable.PASSWORD);
			customerBean.setPassword(password);
			String personnumber = jsonObject
					.getString(CustomerTable.PERSONNUMBER);
			customerBean.setPersonnumber(personnumber);
			String telphone = jsonObject.getString(CustomerTable.TELPHONE);
			customerBean.setTelphone(telphone);
			String realname = jsonObject.getString(CustomerTable.REALNAME);
			customerBean.setRealname(realname);
			String avator = jsonObject.getString(CustomerTable.AVATOR);
			customerBean.setAvator(avator);
			customerService.UpdataBean(customerBean);
			return "true";
		} catch (UnsupportedEncodingException e)
		{
			e.printStackTrace();
		}
		return "error";
	}


	/**
	 * 获取所有的用户
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params = "method=getallcustomer")
	public Map<String, Object> GetAllCustomer()
	{
		List<Customer> list = customerService
				.GetAllBean(Customer.class);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("customers", list);
		return map;
	}

	/**
	 * 通过id获取customer
	 * 
	 * @param customer
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params = "method=getCustomerByUserid")
	public Map<String, Object> JsonGetCustomerByUserid(
			@RequestParam(value = "customerid") String customerid)
	{
		Customer customerBean = customerService.GetBeanByCondition(
				Customer.class, CustomerTable.USERID, customerid, null);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("customer",new  CustomerVO(customerBean));
		System.out.println(customerid);
		return map;
	}

	/**
	 * 通过id获取customer
	 * 
	 * @param customer
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params = "method=getCustomervoByid")
	public Map<String, Object> JsonGetCustomervoByid(
			@RequestParam(value = "customerid") String customerid)
	{
		Customer customerBean = customerService.GetEntityById(
				Customer.class, Integer.parseInt(customerid));
		CustomerVO customerVO = new CustomerVO(customerBean);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("customer", customerVO);
		return map;
	}

	/**
	 * 通过id获取username
	 * 
	 * @param username
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params = "method=GetCustomerName", produces = "text/html;charset=UTF-8")
	public String JsonGetUserName(
			@RequestParam(value = "customerid") String customerid)
	{
		return customerService.GetBeanByCondition(Customer.class,
				CustomerTable.USERID, customerid, null).getUsername();
	}

	/**
	 * 通过userid获取id
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params = "method=GetCustomerid", produces = "text/html;charset=UTF-8")
	public String JsonGetid(
			@RequestParam(value = "customerid") String customerid)
	{
		return customerService
				.GetBeanByCondition(Customer.class, CustomerTable.USERID,
						customerid, null).getId().toString();
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
			@RequestParam(value = "selectname", defaultValue = "id") String selectname,
			@RequestParam(value = "value", defaultValue = "") String value)
	{
		Map<String, Object> map = new HashMap<String, Object>();
		List<Customer> list = customerService.GetPageBeanFilter(
				Customer.class, page, pageSize, selectname, value);
		int total = customerService.GetPageBeanFilterTotal(Customer.class,
				page, pageSize, selectname, value);
		map.put("rows", AdminCustomerVO.ChangeToList(list));
		map.put("total", total);
		return map;
	}

	/**
	 * 退出登录
	 * 
	 * @param token
	 * @param response
	 * @return
	 */
	@RequestMapping(params = "method=loginout")
	public String LoginOut(
			@CookieValue(value = "useridtoken", required = false) Cookie token,
			HttpServletResponse response)
	{
		if (null != token)
		{
			token.setMaxAge(0);
			response.addCookie(token);
		}
		return "font/Login.jsp";
	}

	/**
	 * 修改用户
	 * 
	 * @param userid
	 * @param username
	 * @param personnumber
	 * @param telphone
	 * @param realname
	 * @param avator
	 * @return
	 */
	@RequestMapping(params = "method=alertcustomer")
	public String JsonAlertCustomer(
			@RequestParam(value = "userid") String userid,
			@RequestParam(value = "username") String username,
			@RequestParam(value = "personnumber") String personnumber,
			@RequestParam(value = "telphone") String telphone,
			@RequestParam(value = "realname") String realname,
			HttpServletRequest request)
	{
		Customer customerBean = customerService.GetBeanByCondition(
				Customer.class, CustomerTable.USERID, userid, null);

		customerBean.setRealname(realname);
		customerBean.setTelphone(telphone);
		customerBean.setPersonnumber(personnumber);
		customerBean.setUsername(username);

		try
		{
			customerService.UpdataBean(customerBean);
		} catch (Exception e)
		{
			return "redirect:/font/modify";
		}
		return "redirect:/font/personal.jsp";
	}

	/**
	 * 检验登录后进入修改密码页面
	 * 
	 * @return
	 */
	@RequestMapping(params = "method=EnterPassword")
	public String CheckLoginEnterPassword(
			@CookieValue(value = "useridtoken", required = false, defaultValue = "") String useridtoken)
	{
		return "font/Password.jsp";
	}

	/**
	 * 修改密码功能
	 * 
	 * @param password
	 * @return
	 */
	@RequestMapping(params = "method=changePassword")
	public String changePassword(
			@RequestParam(value = "password", required = false) String password,
			@RequestParam(value = "new_password", required = false) String new_password,
			HttpServletRequest request, HttpServletResponse response,
			@CookieValue(value = "useridtoken", required = false) String token)
	{
		String userid = null;
		if (null != token)
		{
			if (null == userid)
			{
				System.out.println(token);
				String[] parts = token.split("\\&");
				System.out.println(parts.length);
				String temp = MD5Util.convertMD5(parts[1]);
				System.out.println(temp);
				userid = temp;
			}
		}

		int flag = 0;
		System.out.println(customerService.getCustomerIdByUserid(userid));
		Customer user = customerService.GetEntityById(Customer.class,
				Integer.valueOf(customerService.getCustomerIdByUserid(userid)));
		System.out.println(user.toString());
		if (!user.getPassword().equals(password))
		{
			flag = 1;
		} 
		else
		{
			System.out.println(new_password);
			user.setPassword(new_password);
			customerService.UpdataBean(user);
		}

		if(flag == 0)
		{
			return "redirect:/font/personal.jsp";
		}
		else 
		{
			return "redirect:/font/Password.jsp?error=1";
		}
	}
}

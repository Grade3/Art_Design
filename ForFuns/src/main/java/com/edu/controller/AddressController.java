package com.edu.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.ServletConfigAware;
import org.springframework.web.context.ServletContextAware;

import com.edu.model.AddressBean;
import com.edu.model.CustomerBean;
import com.edu.model.ProductBean;
import com.edu.model.UserBean;
import com.edu.service.IAddressService;
import com.edu.service.ICustomerService;
import com.edu.table.AddressTable;
import com.edu.table.UserTable;
import com.edu.viewentity.AddressVO;
import com.edu.viewentity.ProductVO;

@Controller
@RequestMapping("/address.do")
public class AddressController implements ServletConfigAware, ServletContextAware
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
    
    @Autowired
    private ICustomerService customerService;
    
    @Autowired
    private IAddressService addressService;
    
	/**
	 * 获取分页列表
	 * 
	 * @param page
	 * @param pageSize
	 * @return
	 */
	@RequestMapping(params = "method=getAddressByPage")
	@ResponseBody
	public Map<String, Object> JsonGetPageProduct(
			@RequestParam(value = "page") int page,
			@RequestParam(value = "rows") int pageSize,
			@RequestParam(value="selectname",defaultValue="id")String selectname,
			@RequestParam(value="value",defaultValue="")String value) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<AddressBean> list = addressService.GetPageBeanFilter(AddressBean.class, page,
				pageSize,selectname,value);
		List<AddressVO> addressVOs = AddressVO.ChangeListAddressToAddressVo(list);
		int total = addressService.GetPageBeanFilterTotal(AddressBean.class, page, pageSize, selectname, value);
		map.put("rows", addressVOs);
		map.put("total", total);
		return map;
	}
	
	/**
	 * 删除用户
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "method=deleteAddress")
	@ResponseBody
	public String JsonDeleteAddress(@RequestParam(value = "ids") String ids) {
		String[] id = ids.split(",");
		int[] temp = new int[id.length];
		for (int i = 0; i < id.length; i++) {
			temp[i] = Integer.parseInt(id[i]);
		}
		try {
			addressService.DeleteBatch(AddressBean.class, temp);
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
	@RequestMapping(params="method=addAddress")
	@ResponseBody
	public int JsonAddAddress(@RequestParam(value="data") String data){
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
			Integer userid = jsonObject.getInt(AddressTable.USERID);
			String address = jsonObject.getString(AddressTable.ADDRESS);
			String name = jsonObject.getString(AddressTable.NAME);
			String telephone = jsonObject.getString(AddressTable.TELEPHONE);
			
			CustomerBean customerBean = customerService.GetEntityById(CustomerBean.class, userid);
			AddressBean addressBean = new AddressBean(address, name, telephone, customerBean);
			addressService.AddBean(addressBean);
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
	 * @throws Exception 
	 */
	@RequestMapping(params="method=updateAddress")
	@ResponseBody
	public String JsonUpdate(@RequestParam(value="data") String data) throws Exception{
		try {
			data = URLDecoder.decode(data,"utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		data = data.substring(1,data.length()-1);
		System.out.println(data);
		JSONObject jsonObject = new JSONObject(data);
		int id = jsonObject.getInt(AddressTable.ID);
		Integer userid = jsonObject.getInt(AddressTable.USERID);
		String address = jsonObject.getString(AddressTable.ADDRESS);
		String name = jsonObject.getString(AddressTable.NAME);
		String telephone = jsonObject.getString(AddressTable.TELEPHONE);
		
		CustomerBean customerBean = customerService.GetEntityById(CustomerBean.class, userid);
		AddressBean addressBean = new AddressBean(id, address, name, telephone, customerBean);
		addressService.UpdataBean(addressBean);
		return "true";
	}
}

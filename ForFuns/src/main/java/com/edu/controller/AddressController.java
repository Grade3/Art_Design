package com.edu.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.ServletConfigAware;
import org.springframework.web.context.ServletContextAware;
import org.w3c.dom.ls.LSException;

import com.edu.model.AddressBean;
import com.edu.model.CustomerAddressBean;
import com.edu.model.CustomerBean;
import com.edu.model.ProductBean;
import com.edu.model.UserBean;
import com.edu.service.IAddressService;
import com.edu.service.ICustomerAddressService;
import com.edu.service.ICustomerService;
import com.edu.table.AddressTable;
import com.edu.table.CustomerTable;
import com.edu.table.UserTable;
import com.edu.util.CheckTokenTool;
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
    
    @Autowired
    private ICustomerAddressService customerAddressService;
    
	/**
	 * 获取分页列表
	 * 
	 * @param page
	 * @param pageSize
	 * @return
	 */
	@RequestMapping(params = "method=getAddressByPage")
	@ResponseBody
	public Map<String, Object> JsonGetPageAddress(
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
	 * 删除地址
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
	 * 添加地址
	 * @param data
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
			String address = jsonObject.getString(AddressTable.ADDRESS);
			String receiver = jsonObject.getString(AddressTable.RECEIVER);
			String telephone = jsonObject.getString(AddressTable.TELEPHONE);
			
			AddressBean addressBean = new AddressBean(address, telephone, receiver);
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
		String address = jsonObject.getString(AddressTable.ADDRESS);
		String receiver = jsonObject.getString(AddressTable.RECEIVER);
		String telephone = jsonObject.getString(AddressTable.TELEPHONE);
		
		AddressBean addressBean = new AddressBean(id, address, telephone, receiver);
		addressService.UpdataBean(addressBean);
		return "true";
	}
	
	/**
	 * 获取树分页列表
	 * 
	 * @param page
	 * @param pageSize
	 * @return
	 */
	@RequestMapping(params = "method=getAddressTree")
	@ResponseBody
	public Map<String, Object> JsonGetAddressTree(
			@RequestParam(value = "page") int page,
			@RequestParam(value = "rows") int pageSize) {
		Map<String, Object> map = addressService.GetAddressTree(page, pageSize);
		return map;
	}
	
	/**
	 * 获取地址
	 * @param customerUserId
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params="method=getAddressByCustomerid")
	public List<AddressVO> JsonGetAddressByCustomerUserid(@RequestParam(value="customerUserid")String customerUserId){
		List<AddressVO> list = new ArrayList<AddressVO>();
		try {
			Set<CustomerAddressBean> customerAddressBeans = customerService.getCustomerByUserId(customerUserId).getCustomerAddressBeans();
			for(CustomerAddressBean customerAddressBean: customerAddressBeans){
				list.add(new AddressVO(customerAddressBean.getAddressBean()));
			}
			if(list.size()!=0){
				Collections.sort(list,new  Comparator<AddressVO>() {
					@Override
					public int compare(AddressVO o1, AddressVO o2) {
						return o1.getId().compareTo(o2.getId());
					}
				});
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	/**
	 * 添加地址
	 * @param useridtoken
	 * @param addressBean
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params="mehtod=addAddress")
	public String CheckLoginAddAddress(@CookieValue(value = "useridtoken", required = false,defaultValue="") String useridtoken,
			AddressBean addressBean){
		try{
			String Userid = CheckTokenTool.GetUserid(useridtoken);
			CustomerBean customerBean = customerService.GetBeanByCondition(CustomerBean.class, CustomerTable.USERID, Userid, null);
			CustomerAddressBean customerAddressBean = new CustomerAddressBean();
			customerAddressBean.setCustomerBean(customerBean);
			customerAddressBean.setAddressBean(addressBean);
			customerAddressService.AddBean(customerAddressBean);
		}catch(Exception e){
			e.printStackTrace();
			return "0";
		}
		return "1";
	}
	
	/**
	 * 通过id删除地址
	 * @param useridtoken
	 * @param addressid
	 * @return
	 */
	@RequestMapping(params="method=deleteAddress")
	public String CheckLogindeleteAddress(@CookieValue(value = "useridtoken", required = false,defaultValue="") String useridtoken,
			@RequestParam(value="addressid")Integer addressid){
		try {
			addressService.DeleteByid(AddressBean.class, addressid);
		} catch (Exception e) {
			e.printStackTrace();
			return "0";
		}
		return "1";
	}
	/**
	 * 修改地址
	 * @param useridtoken
	 * @param addressBean
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params="method=alertAddress")
	public String CheckLoginAlertAddress(@CookieValue(value = "useridtoken", required = false,defaultValue="") String useridtoken,
			AddressBean addressBean){
		try{
			addressService.UpdataBean(addressBean);
		}catch(Exception e){
			e.printStackTrace();
			return "0";
		}
		return "1";
	}
	
}

package com.edu.service;

import java.util.List;
import java.util.Map;

import com.edu.base.IBaseService;
import com.edu.model.AddressBean;

public interface IAddressService extends IBaseService<AddressBean>{
	/**
	 * 获取地址分页
	 * @param page
	 * @param pageSize
	 * @return
	 */
	public Map<String, Object> GetAddressTree(int page, int pageSize);
	
	/**
	 * 通过CusetomerUserId获取地址
	 * @param CusetomerUserId
	 * @return
	 */
	public List<AddressBean> GetAddressByCusetomerUserId(String CusetomerUserId);	
}

package com.edu.serviceimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.base.BaseServiceImpl;
import com.edu.dao.IAddressDao;
import com.edu.model.AddressBean;
import com.edu.service.IAddressService;

@Service("addressService")
public class AddressServiceImpl extends BaseServiceImpl<AddressBean> implements IAddressService
{
	@Autowired
	private IAddressDao addressDao;
}

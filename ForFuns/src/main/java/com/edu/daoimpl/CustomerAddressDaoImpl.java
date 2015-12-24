package com.edu.daoimpl;

import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Repository;

import com.edu.base.BaseDaoImpl;
import com.edu.dao.ICustomerAddressDao;
import com.edu.model.CustomerAddressBean;

@Lazy
@Repository("customerAddressDao")
public class CustomerAddressDaoImpl extends BaseDaoImpl<CustomerAddressBean> implements ICustomerAddressDao{

}

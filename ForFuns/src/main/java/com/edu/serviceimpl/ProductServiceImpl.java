package com.edu.serviceimpl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.edu.base.BaseServiceImpl;
import com.edu.model.CustomerBean;
import com.edu.model.ProductBean;
import com.edu.proxy.ProductProxy;
import com.edu.service.IProductService;
@Transactional
@Service("productService")
public class ProductServiceImpl extends BaseServiceImpl<ProductBean> implements IProductService{


}

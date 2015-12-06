package com.edu.serviceimpl;

import org.springframework.stereotype.Service;

import com.edu.base.BaseServiceImpl;
import com.edu.model.SellMethodBean;
import com.edu.service.ISellMethodService;

@Service("sellMethodService")
public class SellMethodServiceImpl extends BaseServiceImpl<SellMethodBean> implements ISellMethodService{

}

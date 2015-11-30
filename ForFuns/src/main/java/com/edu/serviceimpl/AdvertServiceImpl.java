package com.edu.serviceimpl;

import org.springframework.stereotype.Service;

import com.edu.base.BaseServiceImpl;
import com.edu.model.AdvertBean;
import com.edu.service.IAdvertService;

@Service("advertService")
public class AdvertServiceImpl extends BaseServiceImpl<AdvertBean> implements IAdvertService{

}

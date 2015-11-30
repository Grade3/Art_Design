package com.edu.daoimpl;

import org.springframework.stereotype.Repository;

import com.edu.model.AdvertBean;
import com.edu.base.BaseDaoImpl;
import com.edu.dao.IAdvertDao;

@Repository("advertDao")
public class AdvertDaoImpl extends BaseDaoImpl<AdvertBean> implements IAdvertDao{

}

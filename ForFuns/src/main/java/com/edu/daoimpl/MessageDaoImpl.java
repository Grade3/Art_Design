package com.edu.daoimpl;

import org.springframework.stereotype.Repository;

import com.edu.base.BaseDaoImpl;
import com.edu.dao.IMessageDao;
import com.edu.model.MessageBean;

@Repository("messageDao")
public class MessageDaoImpl extends BaseDaoImpl<MessageBean> implements IMessageDao{
	
}

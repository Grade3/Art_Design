package com.edu.daoimpl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.edu.base.BaseDaoImpl;
import com.edu.dao.IMessageDao;
import com.edu.model.MessageBean;

@Repository("messageDao")
public class MessageDaoImpl extends BaseDaoImpl<MessageBean> implements IMessageDao{

	@Override
	public List<MessageBean> getUnReadMessage(Integer sendid, Integer fromid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean alertUnReadMessage(Integer messageid) {
		// TODO Auto-generated method stub
		return false;
	}
	
}

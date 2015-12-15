package com.edu.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.edu.base.BaseServiceImpl;
import com.edu.dao.IMessageDao;
import com.edu.model.MessageBean;
import com.edu.service.IMessageService;
@Transactional
@Service("messageService")
public class MessageServiceImpl extends BaseServiceImpl<MessageBean> implements IMessageService{

	@Autowired
	private IMessageDao messageDao;
	
	@Override
	public List<MessageBean> getUnReadMessage(Integer sendid, Integer fromid) {
		return null ;
	}

}

package com.edu.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.edu.base.BaseServiceImpl;
import com.edu.dao.ICustomerDao;
import com.edu.dao.IMessageDao;
import com.edu.model.MessageBean;
import com.edu.service.ICustomerService;
import com.edu.service.IMessageService;
@Transactional
@Service("messageService")
public class MessageServiceImpl extends BaseServiceImpl<MessageBean> implements IMessageService{

	@Autowired
	private IMessageDao messageDao;
	
	
	@Override
	public List<MessageBean> getUnReadMessage(Integer sendid, Integer fromid) {
		List<MessageBean> unReadMessage = messageDao.getUnReadMessage(sendid, fromid);
		if(null == unReadMessage ||  unReadMessage.size()==0 )
			return unReadMessage;
		int lastid = unReadMessage.get(unReadMessage.size()-1).getId();
		messageDao.alertUnReadMessage(lastid, sendid, fromid);
		return unReadMessage;
	}

	@Override
	public List<MessageBean> getUserMessage(Integer id,Integer isread) {
		return messageDao.getUserMessage(id,isread);
	}

}

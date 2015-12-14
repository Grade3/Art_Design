package com.edu.serviceimpl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.edu.base.BaseServiceImpl;
import com.edu.model.MessageBean;
import com.edu.service.IMessageService;
@Transactional
@Service("messageService")
public class MessageServiceImpl extends BaseServiceImpl<MessageBean> implements IMessageService{

}

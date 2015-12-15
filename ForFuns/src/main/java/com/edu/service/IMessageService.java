package com.edu.service;

import java.util.List;

import com.edu.base.IBaseService;
import com.edu.model.MessageBean;

public interface IMessageService extends IBaseService<MessageBean>{
	/**
	 * 获取未读信息
	 * @param sendid
	 * @param fromid
	 * @return
	 */
	public List<MessageBean> getUnReadMessage(Integer sendid,Integer fromid);
}

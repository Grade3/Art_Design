package com.edu.service;

import java.util.List;

import com.edu.base.IBaseService;
import com.edu.model.MessageBean;

public interface IMessageService extends IBaseService<MessageBean>{
	/**
	 * 获取特定id未读信息
	 * @param sendid
	 * @param fromid
	 * @return
	 */
	public List<MessageBean> getUnReadMessage(Integer sendid,Integer fromid);
	
	/**
	 * 获取当前用户未读信息
	 * @param sendid
	 * @param fromid
	 * @return
	 */
	public List<MessageBean> getUserMessage(Integer id,Integer isread);
	
}

package com.edu.dao;

import java.util.List;

import com.edu.base.IBaseDao;
import com.edu.model.Message;

public interface IMessageDao extends IBaseDao<Message>{
	/**
	 * 获取未读信息
	 * @return
	 */
	public List<Message> getUnReadMessage(Integer sendid,Integer fromid);
	
	/**
	 * 将该id之前的改为已读
	 * @param messageid
	 * @return
	 */
	public boolean alertUnReadMessage(Integer messageid,Integer sendid, Integer fromid);
	
	/**
	 * 获取当前用户未读信息
	 * @param sendid
	 * @param fromid
	 * @return
	 */
	public List<Message> getUserMessage(Integer id,Integer isread);
	
}

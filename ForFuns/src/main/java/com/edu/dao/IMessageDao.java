package com.edu.dao;

import java.util.List;

import com.edu.base.IBaseDao;
import com.edu.model.MessageBean;

public interface IMessageDao extends IBaseDao<MessageBean>{
	/**
	 * 获取未读信息
	 * @return
	 */
	public List<MessageBean> getUnReadMessage(Integer sendid,Integer fromid);
	
	/**
	 * 将该id之前的改为已读
	 * @param messageid
	 * @return
	 */
	public boolean alertUnReadMessage(Integer messageid,Integer sendid, Integer fromid);
}

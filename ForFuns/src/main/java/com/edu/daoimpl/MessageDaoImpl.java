package com.edu.daoimpl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.edu.base.BaseDaoImpl;
import com.edu.dao.IMessageDao;
import com.edu.model.MessageBean;
import com.edu.table.MessageTable;

@Repository("messageDao")
public class MessageDaoImpl extends BaseDaoImpl<MessageBean> implements IMessageDao{

	@Override
	public List<MessageBean> getUnReadMessage(Integer sendid, Integer fromid) {
		String hql = "from MessageBean where isread=0 and "+ MessageTable.FROMID +"=? and "+MessageTable.TOID +"=? ";
		Query createQuery = getSession().createQuery(hql);
		createQuery.setInteger(0, sendid);
		createQuery.setInteger(1, fromid);
		List<MessageBean> list = createQuery.list();
		if(list.size()==0)
			return null;
		return list;
	}

	@Override
	public boolean alertUnReadMessage(Integer messageid,Integer sendid, Integer fromid) {
		String sql = "update "+MessageTable.TABLENAME+" set "+MessageTable.ISREAD+"=1 where "+MessageTable.FROMID+"="+sendid+" and "+ MessageTable.TOID+"="+fromid+" and "+MessageTable.ID+"<= "+messageid;
		this.sqlWithNone(sql);
		return true;
	}
	
}

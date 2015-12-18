package com.edu.daoimpl;

import java.util.ArrayList;
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

	@Override
	public List<MessageBean> getUserUnReadMessage(Integer id) {
		String sql = "SELECT * from "+MessageTable.TABLENAME+" where id in(select  max(id)  from "+MessageTable.TABLENAME+" where "+MessageTable.TOID+" =? GROUP BY "+MessageTable.FROMID+" )";
		//String sql ="from MessageBean  group by fromid=1";
		Query query = getSession().createSQLQuery(sql);
		query.setInteger(0, id);
		List<Object[]> list = query.list();
		if(list.size()==0)
			return null;
		List<MessageBean> result = new ArrayList<MessageBean>();
		for(int i=0;i<list.size();i++){
			Object[] object = list.get(0);
			MessageBean messageBean = (MessageBean) this.getEntitybyId(MessageBean.class, Integer.parseInt(object[0].toString()));
			result.add(messageBean);
		}
		return result;
	}
	
}

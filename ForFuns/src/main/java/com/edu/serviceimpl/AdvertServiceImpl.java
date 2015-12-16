package com.edu.serviceimpl;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.base.BaseServiceImpl;
import com.edu.dao.IAdvertDao;
import com.edu.model.AdvertBean;
import com.edu.service.IAdvertService;
import com.edu.table.AdvertTable;
import com.edu.viewentity.AdvertVO;

@Service("advertService")
public class AdvertServiceImpl extends BaseServiceImpl<AdvertBean> implements IAdvertService
{
	@Autowired
	private IAdvertDao advertDao;
	
	/**
	 * 通过userid获取咨询分页
	 * @param userid
	 * @param page
	 * @param pageSize
	 * @param param
	 * @return
	 */
	public Map<String, Object>  GetAdvertBeanPageByUserid(String userid, int page,int pageSize, Map<String, String> param)
	{
		String selectname = "";
		String value = "";
		if(null!=param){
			Iterator<Map.Entry<String, String>> enIterators = param.entrySet().iterator();
			while(enIterators.hasNext()){
				Map.Entry<String, String> entry = enIterators.next(); 
				selectname= entry.getKey();
				value= entry.getValue();
			}
		}
		List<AdvertBean> list = advertDao.getPageBeanFilterMore(AdvertBean.class, page, pageSize, selectname, value, AdvertTable.USERID, userid);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total",list.size());
		map.put("rows",AdvertVO.changeToAdvertVOs(list));
		return map;
	}
	
	@Override
	public List<AdvertBean> GetFirstAdvert()
	{
		List<AdvertBean> list = null;
		list = (List<AdvertBean>)advertDao.GetFirstAdvert();
		return list;
	}
	
	@Override
	public List<AdvertBean> GetSecondAdvert()
	{
		List<AdvertBean> list = null;
		list = (List<AdvertBean>)advertDao.GetSecondAdvert();
		return list;
	}
	
	@Override
	public List<AdvertBean> GetThirdAdvert()
	{
		List<AdvertBean> list = null;
		list = (List<AdvertBean>)advertDao.GetThirdAdvert();
		return list;
	}
}

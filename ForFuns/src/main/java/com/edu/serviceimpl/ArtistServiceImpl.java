package com.edu.serviceimpl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.edu.base.BaseServiceImpl;
import com.edu.dao.IArtistDao;
import com.edu.model.ArtistBean;
import com.edu.model.CustomerBean;
import com.edu.model.ExamineArtistBean;
import com.edu.service.IArtistService;
import com.edu.table.CustomerTable;

@Lazy(true)
@Transactional
@Service("artistService")
public class ArtistServiceImpl extends BaseServiceImpl<CustomerBean> implements
		IArtistService
{
	@Resource
	private IArtistDao artistDao;

	@Override
	public boolean isExist(CustomerBean customer)
	{
		return artistDao.isExist(customer);
	}

	@Override
	public void save(CustomerBean customer)
	{
		artistDao.addEntity(customer);
	}

	@SuppressWarnings({ "rawtypes" })
	@Override
	public List<CustomerBean> GetPageBeanFilter(Class clz, int page, int pageSize,
			String selectname, String value) 
	{
		return artistDao.getPageBeanFilter(clz, page, pageSize, selectname, value);
	}
	
	@SuppressWarnings("rawtypes")
	@Override
	public int GetPageBeanFilterTotal(Class clz, int page, int pageSize,
			String selectname, String value) 
	{
		return artistDao.getPageBeanFilter(clz, page, pageSize, selectname, value).size();
	}
	
	@SuppressWarnings("rawtypes")
	public List<CustomerBean> GetAllBean(Class clz)
	{
		return artistDao.getAllEntity(clz);
	}

	@Override
	public int countEa() {
		return artistDao.countEa();
	}


	public int AddBean(ExamineArtistBean examineartist) {
		artistDao.addEntity(examineartist);
		return 1;
	}
	
	@Override
	public CustomerBean getArtistByUserId(String userid) throws Exception {
		return artistDao.GetBeanByCondition(CustomerBean.class, CustomerTable.USERID, userid, null);
	}
}
package com.edu.viewentity;

import java.util.ArrayList;
import java.util.List;

import com.edu.model.AddressBean;
import com.edu.model.ProductBean;

/**
 * 地址显示层
 * @author kh
 *
 */
public class AddressVO
{
	private Integer id;
	private Integer userid;
	private String address;
	private String name;
	private String telephone;
	
	public AddressVO(AddressBean addressBean)
	{
		super();
		id = addressBean.getId();
		userid = addressBean.getCustomerBean().getId();
		address = addressBean.getAddress();
		name = addressBean.getName();
		telephone = addressBean.getTelephone();
	}
	
	/**
	 * 将list中的addressBean实体转变为addressVO
	 * @param list
	 * @return
	 */
	public static List<AddressVO> ChangeListAddressToAddressVo(List<AddressBean> list)
	{
		List<AddressVO> addressVOs = new ArrayList<AddressVO>();
		for(int i=0;i<list.size();i++)
		{
			AddressVO addressVO = new AddressVO(list.get(i));
			addressVOs.add(addressVO);
		}
		return addressVOs;
	}

	public Integer getId()
	{
		return id;
	}

	public void setId(Integer id)
	{
		this.id = id;
	}

	public Integer getUserid()
	{
		return userid;
	}

	public void setUserid(Integer userid)
	{
		this.userid = userid;
	}

	public String getAddress()
	{
		return address;
	}

	public void setAddress(String address)
	{
		this.address = address;
	}
	
	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public String getTelephone()
	{
		return telephone;
	}

	public void setTelephone(String telephone)
	{
		this.telephone = telephone;
	}

	public AddressVO(Integer id, Integer userid, String address, String name,
			String telephone)
	{
		super();
		this.id = id;
		this.userid = userid;
		this.address = address;
		this.name = name;
		this.telephone = telephone;
	}
}

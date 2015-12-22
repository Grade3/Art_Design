/**
 * 
 */
package com.edu.model;

import java.beans.Transient;
import java.util.HashSet;
import java.util.Set;

import javax.management.relation.Role;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;

@Table(name="c_customer")
@Entity
public class CustomerBean
{
	private Integer id;
	private String userid;
	private String username;
	private String password;
	private String personnumber;
	private String telphone;
	private String realname;
	private String avator;
	private Integer isartist;
	
	public CustomerBean()
	{
		super();
	}

	public CustomerBean(Integer id, String userid, String username,
			String password, String personnumber, String telphone,
			String realname, String avator, Integer isartist)
	{
		super();
		this.id = id;
		this.userid = userid;
		this.username = username;
		this.password = password;
		this.personnumber = personnumber;
		this.telphone = telphone;
		this.realname = realname;
		this.avator = avator;
		this.isartist = isartist;
	}
	
	public CustomerBean(String username, String password)
	{
		super();
		this.username = username;
		this.password = password;
	}

	public CustomerBean(int id, String username, String password)
	{
		super();
		this.id = id;
		this.username = username;
		this.password = password;
	}

	public CustomerBean(String userid, String username, String password,
			String personnumber, String telphone, String realname,
			String avator, Integer isartist)
	{
		super();
		this.userid = userid;
		this.username = username;
		this.password = password;
		this.personnumber = personnumber;
		this.telphone = telphone;
		this.realname = realname;
		this.avator = avator;
		this.isartist = isartist;
	}

	@Override
	public String toString()
	{
		return "CustomerBean [id=" + id + ", userid=" + userid + ", username="
				+ username + ", password=" + password + ", personnumber="
				+ personnumber + ", telphone=" + telphone + ", realname="
				+ realname + ", avator=" + avator + ", isartist=" + isartist
				+ "]";
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	public Integer getId()
	{
		return id;
	}

	public void setId(Integer id)
	{
		this.id = id;
	}

	@Column(name = "userid")
	public String getUserid()
	{
		return userid;
	}

	public void setUserid(String userid)
	{
		this.userid = userid;
	}

	@Column(name = "username")
	public String getUsername()
	{
		return username;
	}

	public void setUsername(String username)
	{
		this.username = username;
	}

	@Column(name = "password")
	public String getPassword()
	{
		return password;
	}

	public void setPassword(String password)
	{
		this.password = password;
	}

	@Column(name = "personnumber")
	public String getPersonnumber()
	{
		return personnumber;
	}

	public void setPersonnumber(String personnumber)
	{
		this.personnumber = personnumber;
	}

	@Column(name = "telphone")
	public String getTelphone()
	{
		return telphone;
	}

	public void setTelphone(String telphone)
	{
		this.telphone = telphone;
	}

	@Column(name = "realname")
	public String getRealname()
	{
		return realname;
	}

	public void setRealname(String realname)
	{
		this.realname = realname;
	}

	@Column(name = "avator")
	public String getAvator()
	{
		return avator;
	}

	public void setAvator(String avator)
	{
		this.avator = avator;
	}

	@Column(name = "isartist")
	public Integer getIsartist()
	{
		return isartist;
	}

	public void setIsartist(Integer isartist)
	{
		this.isartist = isartist;
	}
}
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

@Table(name="ea_examineartist")
@Entity
public class ExamineArtistBean
{
	private Integer id;
	private String userid;
	private String personnumber;
	private String telphone;
	private String realname;
	private String paymode;
	private String goodat;

	public ExamineArtistBean()
	{
		super();
	}

	public ExamineArtistBean(Integer id, String userid, String paymode,
			String goodat, String personnumber, String telphone,
			String realname)
	{
		super();
		this.id = id;
		this.userid = userid;
		this.paymode = paymode;
		this.goodat = goodat;
		this.personnumber = personnumber;
		this.telphone = telphone;
		this.realname = realname;
	}
	


	public ExamineArtistBean(String userid, String paymode, String goodat,
			String personnumber, String telphone, String realname)
	{
		super();
		this.userid = userid;
		this.paymode = paymode;
		this.goodat = goodat;
		this.personnumber = personnumber;
		this.telphone = telphone;
		this.realname = realname;
	}

	@Override
	public String toString()
	{
		return "ExamineArtist [id=" + id + ", userid=" + userid + ", paymode="
				+ paymode + ", goodat=" + goodat + ", personnumber="
				+ personnumber + ", telphone=" + telphone + ", realname="
				+ realname
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

	@Column(name = "paymode")
	public String getPaymode()
	{
		return paymode;
	}

	public void setPaymode(String paymode)
	{
		this.paymode = paymode;
	}

	@Column(name = "goodat")
	public String getGoodat()
	{
		return goodat;
	}

	public void setGoodat(String goodat)
	{
		this.goodat = goodat;
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
}
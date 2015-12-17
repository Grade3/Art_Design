/**
 * 
 */
package com.edu.model;

import java.beans.Transient;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

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
public class ExamineArtistBean implements Comparable{
	private Integer id;
	private String userid;
	private String personnumber;
	private String telphone;
	private String realname;
	private String paymode;
	private String goodat;
	private String suggestion ="";

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
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	public Integer getId() {
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
	
	

	@Column(name="suggestion")
	public String getSuggestion() {
		return suggestion;
	}



	public void setSuggestion(String suggestion) {
		this.suggestion = suggestion;
	}
	
	/**
	 * 获取分页信息 
	 * @param page
	 * @param pagesize
	 * @return
	 */
	@Transient
	public Map<String , Object> GetExamineArtistPage(Set<ExamineArtistBean> examineartistSet,int page,int pagesize,
			Map<String, String> param){
		//通过treeset由无序转为有序  
		Iterator<ExamineArtistBean> tempIterator = examineartistSet.iterator();
		Set<ExamineArtistBean> tempSet = new TreeSet<ExamineArtistBean>();
		while(tempIterator.hasNext()){
			tempSet.add(tempIterator.next());
		}
		Map<String, Object> map = new HashMap<String, Object>();
		if(null==param){
			Integer total = tempSet.size();
			int start = (page-1)*pagesize;
			int end = page*pagesize;
			if(end>total)
				end =total ;
			List<ExamineArtistBean> list = new ArrayList<ExamineArtistBean>();
			Iterator<ExamineArtistBean> iterator = tempSet.iterator();
			int count = 0;
			while(iterator.hasNext()){
				if(count>=start&&count<end)
					list.add(iterator.next());
				else{
					iterator.next();
				}
				count++;
			}
			map.put("total",total);
			map.put("rows",list);
			return map;
		}else{
			List<ExamineArtistBean> list = new ArrayList<ExamineArtistBean>();
			Iterator<ExamineArtistBean> iterator = tempSet.iterator();
			int count = 0;
			Set<String> keySet = param.keySet();
			String selectname = keySet.iterator().next();
			String condition = param.get(selectname);
			Class clz = ExamineArtistBean.class;
			Method method  = null;
			try {
			  method = clz.getMethod("get"+selectname.substring(0,1).toUpperCase()+selectname.substring(1,selectname.length()));
			} catch (NoSuchMethodException | SecurityException e) {
				e.printStackTrace();
			}
			while(iterator.hasNext()){
				ExamineArtistBean next = iterator.next();
				try {
					Object invoke = method.invoke(next);
					if(invoke.toString().contains(condition)){
						count++;
						list.add(next);
					}
				} catch (Exception e){
					e.printStackTrace();
				}
			}
			//分页
			int start = (page-1)*pagesize;
			int end = page*pagesize;
			if(list.size()<end)
				end = list.size();
			List<ExamineArtistBean> newslist = new ArrayList<ExamineArtistBean>();
			for(int i=start;i<end;i++){
				newslist.add(list.get(i));
			}
			
			map.put("total",count);
			map.put("rows",newslist);
			return map;
		}
	}

	/**
	 * 排序接口
	 */
	@Transient
	@Override
	public int compareTo(Object o) {
		ExamineArtistBean newsBean = (ExamineArtistBean) o;
		return this.id-newsBean.getId();
	}
}
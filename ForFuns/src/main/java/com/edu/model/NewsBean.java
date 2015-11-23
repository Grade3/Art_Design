package com.edu.model;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.hibernate.annotations.DynamicInsert;



@Entity
@Table(name="n_news")
@DynamicInsert
@JsonIgnoreProperties(value={"userBean"})
public class NewsBean {
	private Integer id;
	private String title;
	private String summary;
	private String author;
	private String imgurl;
	private String content;
	private Integer money;
	private Integer ishot;
	private Date timestart;
	private Date timeout;
	private Integer stuation;
	private String suggestion;
	private Integer isonline;
	private UserBean userBean;
	
	public NewsBean() {
		super();
	}
	
	
	@ManyToOne(cascade=CascadeType.ALL,fetch=FetchType.EAGER)
	@JoinColumn(name="userid")
	public UserBean getUserBean() {
		return userBean;
	}

	public void setUserBean(UserBean userBean) {
		this.userBean = userBean;
	}



	public NewsBean(Integer id, String title, String summary, String author,
			String imgurl, String content, Integer money, Integer ishot,
			Date timestart, Date timeout, Integer stuation,
			String suggestion, Integer isonline) {
		super();
		this.id = id;
		this.title = title;
		this.summary = summary;
		this.author = author;
		this.imgurl = imgurl;
		this.content = content;
		this.money = money;
		this.ishot = ishot;
		this.timestart = timestart;
		this.timeout = timeout;
		this.stuation = stuation;
		this.suggestion = suggestion;
		this.isonline = isonline;
	}



	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	@Column(name="title")
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	@Column(name="summary")
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}


	@Column(name="author")
	public String getAuthor() {
		return author;
	}



	public void setAuthor(String author) {
		this.author = author;
	}


	@Column(name="imgurl")
	public String getImgurl() {
		return imgurl;
	}



	public void setImgurl(String imgurl) {
		this.imgurl = imgurl;
	}


	@Column(name="content")
	public String getContent() {
		return content;
	}



	public void setContent(String content) {
		this.content = content;
	}


	@Column(name="money")
	public Integer getMoney() {
		return money;
	}



	public void setMoney(Integer money) {
		this.money = money;
	}


	@Column(name="ishot")
	public Integer getIshot() {
		return ishot;
	}



	public void setIshot(Integer ishot) {
		this.ishot = ishot;
	}


	@Column(name="timestart")
	public Date getTimestart() {
		return timestart;
	}



	public void setTimestart(Date timestart) {
		this.timestart = timestart;
	}


	@Column(name="timeout")
	public Date getTimeout() {
		return timeout;
	}



	public void setTimeout(Date timeout) {
		this.timeout = timeout;
	}


	@Column(name="stuation",columnDefinition="INT default 0")
	public Integer getStuation() {
		return stuation;
	}



	public void setStuation(Integer stuation) {
		this.stuation = stuation;
	}


	@Column(name="suggestion")
	public String getSuggestion() {
		return suggestion;
	}



	public void setSuggestion(String suggestion) {
		this.suggestion = suggestion;
	}


	@Column(name="isonline",columnDefinition="INT default 0")
	public Integer getIsonline() {
		return isonline;
	}



	public void setIsonline(Integer isonline) {
		this.isonline = isonline;
	}


	public NewsBean(String title, String summary, String author, String imgurl,
			String content, Integer money, Integer ishot, Date timestart,
			Date timeout,UserBean userBean) {
		super();
		this.title = title;
		this.summary = summary;
		this.author = author;
		this.imgurl = imgurl;
		this.content = content;
		this.money = money;
		this.ishot = ishot;
		this.timestart = timestart;
		this.timeout = timeout;
		this.userBean = userBean;
	}
}

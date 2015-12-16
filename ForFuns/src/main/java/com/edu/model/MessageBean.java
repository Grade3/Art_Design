package com.edu.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;
/**
 * 消息表
 * @author Gy
 *
 */
@Table(name="m_message")
@Entity
public class MessageBean {
	private Integer id;
	private String message;
	private Date current;
	private Integer isread;
	private CustomerBean fromCustomerBean;
	private CustomerBean toCustomerBean;
	public MessageBean() {
		super();
	}
	public MessageBean(Integer id, String message, Date current,
			CustomerBean fromCustomerBean, CustomerBean toCustomerBean) {
		super();
		this.id = id;
		this.message = message;
		this.current = current;
		this.fromCustomerBean = fromCustomerBean;
		this.toCustomerBean = toCustomerBean;
	}
	
	public MessageBean(Integer id, String message, Date current,
			Integer isread, CustomerBean fromCustomerBean,
			CustomerBean toCustomerBean) {
		super();
		this.id = id;
		this.message = message;
		this.current = current;
		this.isread = isread;
		this.fromCustomerBean = fromCustomerBean;
		this.toCustomerBean = toCustomerBean;
	}
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	@Column(name="message") 
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	@Column(name="current") 
	public Date getCurrent() {
		return current;
	}
	public void setCurrent(Date current) {
		this.current = current;
	}
	@OneToOne(fetch=FetchType.LAZY)  
    @JoinColumn(name="fromid") 
	public CustomerBean getFromCustomerBean() {
		return fromCustomerBean;
	}
	public void setFromCustomerBean(CustomerBean fromCustomerBean) {
		this.fromCustomerBean = fromCustomerBean;
	}
	@OneToOne(fetch=FetchType.LAZY)  
    @JoinColumn(name="toid") 
	public CustomerBean getToCustomerBean() {
		return toCustomerBean;
	}
	
	public void setToCustomerBean(CustomerBean toCustomerBean) {
		this.toCustomerBean = toCustomerBean;
	}
	@Column(name="isread")
	public Integer getIsread() {
		return isread;
	}
	public void setIsread(Integer isread) {
		this.isread = isread;
	}
	
}

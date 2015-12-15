package com.edu.socket;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.edu.model.MessageBean;

public class MessageVO {
	private Integer id;
	private String content;
	private Date time;
	public MessageVO(Integer id, String content, Date time) {
		super();
		this.id = id;
		this.content = content;
		this.time = time;
	}
	public MessageVO(MessageBean messageBean) {
		this.id = messageBean.getId();
		this.content = messageBean.getMessage();
		this.time = messageBean.getCurrent();
	}
	public MessageVO() {
		super();
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	
	public static List<MessageVO> ChangeToListMessageVO(List<MessageBean> temp){
		List<MessageVO> list =new ArrayList<MessageVO>();
		if(null== temp || temp.size()==0)
			return list;
		for(MessageBean messageBean : temp){
			list.add(new MessageVO(messageBean));
		}
		return list;
	}
}

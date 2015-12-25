package com.edu.viewentity;

import java.util.ArrayList;
import java.util.List;

import com.edu.model.News;

/**
 * 咨询显示层
 * @author Gy
 *
 */
public class NewsVO {
	private Integer id;
	private String title;
	private String imgurl;
	private String summary;
	private Integer isonline;
	public NewsVO() {
		super();
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getImgurl() {
		return imgurl;
	}
	public void setImgurl(String imgurl) {
		this.imgurl = imgurl;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public Integer getIsonline() {
		return isonline;
	}
	public void setIsonline(Integer isonline) {
		this.isonline = isonline;
	}
	public NewsVO(News newsBean) {
		super();
		this.id = newsBean.getId();
		this.title = newsBean.getTitle();
		this.imgurl = newsBean.getImgurl();
		this.summary = newsBean.getSummary();
		this.isonline = newsBean.getIsonline();
	}
	public NewsVO(Integer id, String title, String imgurl, String summary,
			Integer isonline) {
		super();
		this.id = id;
		this.title = title;
		this.imgurl = imgurl;
		this.summary = summary;
		this.isonline = isonline;
	}
	/**
	 * 将newsbean转换成newsbeanvo
	 * @param list
	 * @return
	 */
	public static List<NewsVO> changeToNewsVOs(List<News> list){
		List<NewsVO> results = new ArrayList<NewsVO>();
		for(News newsBean:list){
			results.add(new NewsVO(newsBean));
		}
		return results;
	}
}

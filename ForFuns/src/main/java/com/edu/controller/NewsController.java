package com.edu.controller;

import java.io.File;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.lxh.smart.SmartUpload;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.ServletConfigAware;
import org.springframework.web.context.ServletContextAware;

import com.edu.model.NewsBean;
import com.edu.model.UserBean;
import com.edu.service.INewsService;
import com.edu.service.IUserService;

@Controller
@RequestMapping("/news.do")
public class NewsController implements ServletConfigAware,ServletContextAware{
	
	private ServletContext servletContext;  
    @Override  
    public void setServletContext(ServletContext arg0) {  
        this.servletContext = arg0;  
    }  
    private ServletConfig servletConfig;  
    @Override  
    public void setServletConfig(ServletConfig arg0) {  
        this.servletConfig = arg0;  
    }
	@Resource
	private INewsService newsService;
	@Resource
	private  IUserService userService;
	
	@ResponseBody
	@RequestMapping(params="method=addnews")
	public String JsonAddNews (@RequestParam(value="title")String title,
			@RequestParam(value="content")String content,@RequestParam(value="author")String author,
			@RequestParam(value="timestart")Date timestart,@RequestParam(value="timeout")Date timeout,
			@RequestParam(value="summary")String summary,@RequestParam(value="money")Integer money,
			@RequestParam(value="ishot")Integer ishot,HttpServletRequest request,
			HttpServletResponse response
	){
		String filePath = servletContext.getRealPath("/")+"newsupload/";
		System.out.println(filePath);
		File file = new File(filePath);
		if(!file.exists()){
			file.mkdir();
		}
		try {
			SmartUpload smartUpload = new SmartUpload();
			smartUpload.initialize(servletConfig,request,response);
			smartUpload.setMaxFileSize(1024*1024*10);
			smartUpload.setTotalMaxFileSize(1024*1024*100);
			smartUpload.setAllowedFilesList("jpg,png,gif");
			smartUpload.upload();
			String filename = smartUpload.getFiles().getFile(0).getFileName();
			String ext = smartUpload.getFiles().getFile(0).getFileExt();
			org.lxh.smart.File file2 = smartUpload.getFiles().getFile(0);
			String newfilename = System.currentTimeMillis()+"."+ext;
			file2.saveAs(filePath+newfilename);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		UserBean userBean = userService.GetEntityById(UserBean.class, 1);
		NewsBean newsBean = new NewsBean(title, summary, author, null, content, money, ishot, timestart, timeout,userBean);
		try{
			newsService.AddBean(newsBean);
		}catch(Exception e){
			return "添加资讯失败";
		}
		return "添加资讯成功";
	}
	
}




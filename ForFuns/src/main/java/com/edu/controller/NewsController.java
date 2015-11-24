package com.edu.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.ServletConfigAware;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;

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
	@Resource
	private NewsBean mNewsBean;
	
	/**
	 * 添加资讯
	 * @param title
	 * @param content
	 * @param author
	 * @param timestart
	 * @param timeout
	 * @param summary
	 * @param money
	 * @param ishot
	 * @param request
	 * @param file
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params="method=addnews")
	public String JsonAddNews (@RequestParam(value="title")String title,
			@RequestParam(value="content")String content,@RequestParam(value="author")String author,
			@RequestParam(value="timestart")Date timestart,@RequestParam(value="timeout")Date timeout,
			@RequestParam(value="summary")String summary,@RequestParam(value="money")Integer money,
			@RequestParam(value="ishot")Integer ishot,HttpServletRequest request,
			@RequestParam(value = "file", required = false) MultipartFile file
	){
		String filePath = servletContext.getRealPath("/")+"newsupload/";
		String saveUrl  = request.getContextPath() + "/newsupload/";
		System.out.println(filePath);
		File filedir = new File(filePath);
		if(!filedir.exists()){
			filedir.mkdir();
		}
		String ext =file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".")); ;
		String newfilename = System.currentTimeMillis()+ext;
		String PathAndName = filePath + newfilename;
		saveUrl = saveUrl+newfilename;
		File resultFile = new File(PathAndName);
		try {
			file.transferTo(resultFile);
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		UserBean userBean = userService.GetEntityById(UserBean.class, 1);
		NewsBean newsBean = new NewsBean(title, summary, author, saveUrl, content, money, ishot, timestart, timeout,userBean);
		try{
			newsService.AddBean(newsBean);
		}catch(Exception e){
			return "0";
		}
		return "1";
	}
	
	/**
	 * 获取分页新闻
	 * @param userid
	 * @param page
	 * @param pageSize
	 * @param selectname
	 * @param value
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params="method=getpagenews")
	public Map<String, Object> JsonGetAllNews(@RequestParam(value="userid") String userid,
			@RequestParam(value = "page") int page,
			@RequestParam(value = "rows") int pageSize,
			@RequestParam(value="selectname",defaultValue="")String selectname,
			@RequestParam(value="value",defaultValue="")String value){
		Map<String, String> param = null;
		if(!"".equals(value)){
			param = new HashMap<String, String>();
			param.put(selectname, value);
		}
		UserBean userBean = userService.GetBeanByCondition(UserBean.class, "username", userid,null);
		Map<String, Object> map = mNewsBean.GetNewsPage(userBean.getNewsBeans(), page, pageSize,param);
		return map;
	}
	
	@ResponseBody
	@RequestMapping(params="method=deletenews")
	public String JsonDeleteNews(@RequestParam(value="ids")String ids){
		String[] id = ids.split(",");
		int[] temp = new int[id.length];
		for (int i = 0; i < id.length; i++) {
			temp[i] = Integer.parseInt(id[i]);
		}
		int result = newsService.DeleteBatch(NewsBean.class, temp);
		if (result == 1)
			return "true";
		return "error";
	}
	
	
	/**
	 * 通过id获取资讯
	 */
	@ResponseBody
	@RequestMapping(params="method=getnewsbyid")
	public Map<String,Object> JsonGetNewsById(@RequestParam(value="newsid")Integer newsid){
		NewsBean newsBean = newsService.GetEntityById(NewsBean.class, newsid);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("news", newsBean);
		return map;
	}
	
}




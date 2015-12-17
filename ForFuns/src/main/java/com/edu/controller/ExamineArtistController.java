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

import com.edu.model.CustomerBean;
import com.edu.model.ExamineArtistBean;
import com.edu.model.UserBean;
import com.edu.service.ICustomerService;
import com.edu.service.IExamineArtistService;
import com.edu.service.IUserService;

@Controller
@RequestMapping("/examineartist.do")
public class ExamineArtistController implements ServletConfigAware,ServletContextAware{
	
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
	private IExamineArtistService examineartistService;
	@Resource
	private ICustomerService customerService;
	@Resource
	private  IUserService userService;
	
	
	/**
	 * 获取全部分页资讯
	 * @param userid
	 * @param page
	 * @param pageSize
	 * @param selectname
	 * @param value
	 * @return
	 */
	@RequestMapping(params = "method=getExamineArtistBypage")
	@ResponseBody
	public Map<String, Object> JsonGetPageExamineArtist(
			@RequestParam(value = "page") int page,
			@RequestParam(value = "rows") int pageSize,
			@RequestParam(value="selectname",defaultValue="id")String selectname,
			@RequestParam(value="value",defaultValue="")String value) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<ExamineArtistBean> list = examineartistService.GetPageBeanFilter(ExamineArtistBean.class, page,
				pageSize,selectname,value);
		int total = examineartistService.GetPageBeanFilterTotal(ExamineArtistBean.class, page, pageSize, selectname, value);
		map.put("rows", list);
		map.put("total", total);
		return map;
	}
	
	
	@ResponseBody
	@RequestMapping(params="method=alertsituation")
	public String JsonAlertSituation(
			@RequestParam(value="examineartistid")Integer examineartistid,
			@RequestParam(value="situation")Integer situation,
			@RequestParam(value="suggestion")String suggestion){
		ExamineArtistBean examineartistBean = examineartistService.GetEntityById(ExamineArtistBean.class, examineartistid);
		examineartistBean.setSuggestion(Integer.toString(situation));
		if(situation==1){
			examineartistBean.setSuggestion("1");
			String id=customerService.getCustomerIdByUserid(examineartistBean.getUserid().toString());
			CustomerBean customer = customerService.GetEntityById(CustomerBean.class, Integer.valueOf(id));
			customer.setIsartist(1);
			customerService.UpdataBean(customer);
			}
		else {
			examineartistBean.setSuggestion("2");
			String id=customerService.getCustomerIdByUserid(examineartistBean.getUserid().toString());
			CustomerBean customer = customerService.GetEntityById(CustomerBean.class, Integer.valueOf(id));
			customer.setIsartist(0);
			customerService.UpdataBean(customer);
		}
		try{
			examineartistService.UpdataBean(examineartistBean);
		}catch(Exception e){
			return "0";
		}
		return "1";
	}
	
	
	
}




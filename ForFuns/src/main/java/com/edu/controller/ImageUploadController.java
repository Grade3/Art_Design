package com.edu.controller;

import java.io.File;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.lxh.smart.SmartUpload;
import org.lxh.smart.SmartUploadException;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.ServletConfigAware;
import org.springframework.web.context.ServletContextAware;

import com.alibaba.fastjson.JSONObject;

/**
 * 图片上传管理controller
 * @author Gy
 *
 */
@Controller
@Lazy(true)
@RequestMapping("/imageupload.do")
public class ImageUploadController implements ServletConfigAware,ServletContextAware{
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
    
    
	@ResponseBody
	@RequestMapping(params="method=keuploadimg")
	public String Jsonuploadimage(HttpServletRequest request, HttpServletResponse response){
		String filePath = servletContext.getRealPath("/")+"newsupload/";
		String saveUrl  = request.getContextPath() + "/newsupload/";
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
			//smartUpload.save(filePath+);
			String filename = smartUpload.getFiles().getFile(0).getFileName();
			String ext = smartUpload.getFiles().getFile(0).getFileExt();
			org.lxh.smart.File file2 = smartUpload.getFiles().getFile(0);
			String newfilename = System.currentTimeMillis()+"."+ext;
			file2.saveAs(filePath+newfilename);
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("error", 0);
			jsonObject.put("url", saveUrl+newfilename);
			return (jsonObject.toJSONString());
		} catch (Exception e) {
			e.printStackTrace();
		}
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("error", 1);
		jsonObject.put("message", "上传失败!");
		return (jsonObject.toJSONString());
	}

}

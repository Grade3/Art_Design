package com.edu.controller;

import java.util.Date;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.edu.service.INewsService;

@Controller
@RequestMapping("/news.do")
public class NewsController {
	
	@Resource
	private INewsService newsService;
	
	@ResponseBody
	@RequestMapping(params="method=addnews")
	public String JsonAddNews(@RequestParam(value="title")String title,
			@RequestParam(value="content")String content,@RequestParam(value="author")String author,
			@RequestParam(value="timestart")String timestart,@RequestParam(value="timeout")String timeout,
			@RequestParam(value="summary")String summary,@RequestParam(value="money")Integer money
	){
		
		return "";
	}
	
	/*@ResponseBody
	@RequestMapping(params="method=addnews")
	public String JsonAddNews(
			@RequestParam(value="timestart")String timestart){
		System.out.println(timestart);
		return "";
	}*/
	
}




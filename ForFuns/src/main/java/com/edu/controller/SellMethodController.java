package com.edu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.edu.model.SellMethodBean;
import com.edu.service.ISellMethodService;



@Controller
@RequestMapping("/sellmethod.do")
public class SellMethodController {
	
	@Autowired
	private ISellMethodService sellMethodService;
	
	@ResponseBody
	@RequestMapping(params="method=GetAllSellMethod")
	public List<SellMethodBean> JsonGetAllSellMethod(){
		return sellMethodService.GetAllBean(SellMethodBean.class);
	}
}
package com.edu.controller;

import javax.annotation.Resource;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.ServletConfigAware;
import org.springframework.web.context.ServletContextAware;

import com.edu.service.IAddressService;
import com.edu.service.ICustomerService;

@Controller
@RequestMapping("/address.do")
public class AddressController implements ServletConfigAware, ServletContextAware
{
	private ServletContext servletContext;  
    @Override
    public void setServletContext(ServletContext arg0) 
    {
        this.servletContext = arg0;
    }
    
    private ServletConfig servletConfig;
    @Override
    public void setServletConfig(ServletConfig arg0) 
    {
        this.servletConfig = arg0;  
    }
    
    @Resource
    private ICustomerService customerService;
    
    @Resource
    private IAddressService addressService;
}

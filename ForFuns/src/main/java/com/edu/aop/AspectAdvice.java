package com.edu.aop;

import javax.annotation.Resource;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;

import com.edu.util.CheckTokenTool;


@Component
@Aspect
public class AspectAdvice  {
	@Resource
	protected SessionFactory sessionFactory;
 
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	
	@Pointcut("execution(* com.edu.base.BaseServiceImpl.*(..) ) ")
	public void anymethod(){
		
	}
	
	/**
	 * 为了事务管理，必须在server中打开sessin，而不是在dao中打开，因此运用了aop
	 * @param pjp
	 * @return
	 * @throws Throwable
	 */
	 @Around("anymethod()")
	 public Object around(ProceedingJoinPoint pjp) throws Throwable{
		  System.out.println("------------before---------------");
		  getSession();
	      Object object = pjp.proceed();
	      System.out.println("------------afer---------------");
	      return object;
	 }
	 
	 @Pointcut("execution(* com.edu.serviceimpl.*.*(..) ) ")
		public void anyservicemethod(){
			
		}
	 
	 @Around("anyservicemethod()")
	 public Object aroundService(ProceedingJoinPoint pjp) throws Throwable{
		  System.out.println("------------before---------------");
		  getSession();
	      Object object = pjp.proceed();
	      System.out.println("------------afer---------------");
	      return object;
	 }
	 
	 
	 
	 
	 @Pointcut("execution(* com.edu.controller.*.Aop*(..) ) ")
		public void checklogin(){
			
		}
	 
	 @Around("checklogin()")
	 public Object aroundchecklogin(ProceedingJoinPoint pjp) throws Throwable{
		  System.out.println("------------before check---------------");
		  Object[] args = pjp.getArgs();
		  String useridtoken = args[0].toString();
		  Object object = "redirect:/font/Login.jsp?error=2";
		  if("".equals(useridtoken))//未登陆
			  return "redirect:/font/Login.jsp?error=2";
		  boolean flag = CheckTokenTool.CheckToken(useridtoken);
		  if(!flag)
			  return  "redirect:/font/Login.jsp?error=2";
		  object =  pjp.proceed();
	      System.out.println("------------afer check---------------");
	      return object;
	 }
	 
	/*@Pointcut("execution(* com.edu.base.*.*(..) )")
	public void anymethod(){
		
	}*/
	/*
	@Before("anymethod()")
	public void doBefore(){
		System.out.println("------------do before---------------");
	}
	@After("anymethod()")
	public void doAfter(){
		System.out.println("------------do after---------------");
	}
	
	 @Around("anymethod()")
	 public Object around(ProceedingJoinPoint pjp) throws Throwable{
		  System.out.println("------------before---------------");
	      Object object = pjp.proceed();
	      System.out.println("------------afer---------------");
	      return object;
	 }*/

}

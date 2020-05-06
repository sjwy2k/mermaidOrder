package com.mermaid.spring.common.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

public class LoggerAspect {

	@Autowired
	private Logger logger;
	
	
	public Object logAdvice(ProceedingJoinPoint joinpoint) throws Throwable{
		Signature sig=joinpoint.getSignature();
		String type=sig.getDeclaringTypeName();
		String method=sig.getName();
		
		logger.debug("[before] "+type+" : "+method);
		Object[] params=joinpoint.getArgs();
		for(Object o:params) {
			logger.debug("매개변수 : "+o);
		}
		Object obj=joinpoint.proceed();
		
		logger.debug("[after] "+type+" : "+method);
		
		return obj;
	}
}

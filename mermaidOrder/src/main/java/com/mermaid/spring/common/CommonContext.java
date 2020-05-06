package com.mermaid.spring.common;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

//code상에서 bean등록
@Configuration
public class CommonContext {

	@Bean
	public Logger getLogger() {
		return LoggerFactory.getLogger(CommonContext.class);
	}
}

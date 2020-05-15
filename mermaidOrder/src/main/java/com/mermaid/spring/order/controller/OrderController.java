package com.mermaid.spring.order.controller;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mermaid.spring.order.model.service.OrderService;

@Controller
public class OrderController {

	@Autowired 
	private Logger logger;
	
	@Autowired
	private OrderService service;
	
	@RequestMapping(value="/order", method= {RequestMethod.GET, RequestMethod.POST})
	public String order() {
		return "order/order";
	}
	
}

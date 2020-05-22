package com.mermaid.spring.order.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Order {

	private int orderNo;
	private int productNo;
	private int count;
	private String temp;
	private String customerPhone;
	
}

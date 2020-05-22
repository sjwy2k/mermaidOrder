package com.mermaid.spring.catalog.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Catalog {

	private int productNo;
	private int storeNo;
	private int categoryNo;
	private int price;
	private String productName;
	private String size;
	private String temp;
	private String originalFileName;
	private String renamedFileName;
}

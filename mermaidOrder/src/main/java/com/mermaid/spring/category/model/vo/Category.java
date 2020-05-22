package com.mermaid.spring.category.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Category {

	private int categoryNo;
	private String categoryName;
	private String categoryType;
}

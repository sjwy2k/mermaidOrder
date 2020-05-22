package com.mermaid.spring.store.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Store {
	private int storeNo;
	private int ownerNo;
	private String storeName;
	private String storeType;
}

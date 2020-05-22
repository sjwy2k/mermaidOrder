package com.mermaid.spring.owner.model.vo;

import lombok.Data;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Owner {
	
	private int ownerNo;
	private String id;
	private String password;
}

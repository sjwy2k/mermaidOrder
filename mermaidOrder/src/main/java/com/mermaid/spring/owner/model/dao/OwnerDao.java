package com.mermaid.spring.owner.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.mermaid.spring.owner.model.vo.Owner;

public interface OwnerDao {

	int insertOwner(SqlSessionTemplate session, Owner owner);

	Owner selectOwner(SqlSessionTemplate session, Owner owner);

	int updateOwner(SqlSessionTemplate session, Owner owner);

	int deleteOwner(SqlSessionTemplate session, Owner owner);

	
}

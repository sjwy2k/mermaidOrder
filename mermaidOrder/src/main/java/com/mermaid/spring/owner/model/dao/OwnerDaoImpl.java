package com.mermaid.spring.owner.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mermaid.spring.owner.model.vo.Owner;

@Repository
public class OwnerDaoImpl implements OwnerDao {



	@Override
	public int insertOwner(SqlSessionTemplate session, Owner owner) {
		return session.insert("owner.insertOwner",owner);
	}

	@Override
	public Owner selectOwner(SqlSessionTemplate session, Owner owner) {
		return session.selectOne("owner.selectOwner",owner);
	}
	
	@Override
	public int updateOwner(SqlSessionTemplate session, Owner owner) {
		return session.update("owner.updateOwner",owner);
	}
	
	@Override
	public int deleteOwner(SqlSessionTemplate session, Owner owner) {
		return session.delete("owner.deleteOwner",owner);
	}
}

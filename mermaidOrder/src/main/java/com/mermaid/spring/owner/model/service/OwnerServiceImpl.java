package com.mermaid.spring.owner.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mermaid.spring.owner.model.dao.OwnerDao;
import com.mermaid.spring.owner.model.vo.Owner;

@Service
public class OwnerServiceImpl implements OwnerService{
	


	@Autowired
	private Logger logger;
	
	@Autowired
	private OwnerDao dao;

	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public int insertOwner(Owner owner) {
		int result=dao.insertOwner(session, owner);
		return result;
	}
	
	@Override
	public Owner selectOwner(Owner owner) {
		Owner o=dao.selectOwner(session, owner);
		return o;
	}
	
	@Override
	public int updateOwner(Owner owner) {
		int result=dao.updateOwner(session, owner);
		return result;
	}
	
	@Override
	public int deleteOwner(Owner owner) {
		int result=dao.deleteOwner(session, owner);
		return result;
	}
}
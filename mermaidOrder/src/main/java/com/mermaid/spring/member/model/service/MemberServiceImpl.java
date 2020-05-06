package com.mermaid.spring.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mermaid.spring.member.model.dao.MemberDao;
import com.mermaid.spring.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberDao dao;
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public Member selectMember() {
		Member m=dao.selectMember(session);
		return m;
	}
	
}

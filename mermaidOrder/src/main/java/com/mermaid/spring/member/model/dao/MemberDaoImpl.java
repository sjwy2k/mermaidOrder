package com.mermaid.spring.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mermaid.spring.member.model.vo.Member;

@Repository
public class MemberDaoImpl implements MemberDao{

	@Override
	public Member selectMember(SqlSessionTemplate session) {
		return session.selectOne("member.selectMember");
	}

	
}

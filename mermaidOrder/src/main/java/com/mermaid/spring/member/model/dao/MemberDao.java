package com.mermaid.spring.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.mermaid.spring.member.model.vo.Member;

public interface MemberDao {

	Member selectMember(SqlSessionTemplate session);

}

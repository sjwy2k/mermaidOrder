package com.mermaid.spring.common;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.TypeHandler;

public class StringArrayType implements TypeHandler<String[]>{
	//너 타입으로 만든 클래스야~ 지정해줘야
	//TypeHandler 인터페이스로서 타입으로 사용할 수 있게됨

	@Override
	public void setParameter(PreparedStatement ps, int i, String[] parameter, JdbcType jdbcType) throws SQLException {
		// 무언가 값을 넣는 녀석
		// Pstmt에 넣는 타입을 설정하는 녀석..
		if(parameter!=null) {
			//몇번째 인덱스인지 프로그래머는 알 수 없다
			//인덱스번호는 ibatis가 자동으로 넣어준다 (int i)
			ps.setString(i, String.join(",", parameter));
		}else {
			ps.setString(i,"");
		}
		
	}

	@Override
	public String[] getResult(ResultSet rs, String columnName) throws SQLException {
		return rs.getString(columnName).split(","); //문자 - 컬럼명
	}

	@Override
	public String[] getResult(ResultSet rs, int columnIndex) throws SQLException {
		return rs.getString(columnIndex).split(","); //숫자 - 컬럼인덱스
	}

	@Override
	public String[] getResult(CallableStatement cs, int columnIndex) throws SQLException {
		// 함수나 프로시저 불러올 때 사용 - CallableStatement
		return cs.getString(columnIndex).split(",");
	}

	
	
	
}

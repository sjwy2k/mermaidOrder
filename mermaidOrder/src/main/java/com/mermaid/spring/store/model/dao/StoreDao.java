package com.mermaid.spring.store.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.mermaid.spring.owner.model.vo.Owner;
import com.mermaid.spring.store.model.vo.Store;

public interface StoreDao {

	int insertStore(SqlSessionTemplate session, Store s);

	List<Map<String, String>> selectListStore(SqlSessionTemplate session, int cPage, int numPerPage, Store s);

	int updateStore(SqlSessionTemplate session, Store store);

	int selectStoreCount(SqlSessionTemplate session, Store s);

	int deleteStore(SqlSessionTemplate session, Store store);

	List<Map<String, String>> selectListAllStore(SqlSessionTemplate session, Owner o);

}

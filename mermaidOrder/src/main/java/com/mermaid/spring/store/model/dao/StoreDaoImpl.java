package com.mermaid.spring.store.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mermaid.spring.owner.model.vo.Owner;
import com.mermaid.spring.store.model.vo.Store;

@Repository
public class StoreDaoImpl implements StoreDao {

	@Autowired
	private Logger logger;
	
	
	@Override
	public int insertStore(SqlSessionTemplate session, Store s) {
		logger.debug(""+s);
		return session.insert("store.insertStore", s);
	}
	
	@Override
	public List<Map<String, String>> selectListAllStore(SqlSessionTemplate session, Owner o) {
		return session.selectList("store.selectListAll",o);
	}

	@Override
	public int selectStoreCount(SqlSessionTemplate session, Store s) {
		return session.selectOne("store.selectStoreCount", s);
	}

	@Override
	public List<Map<String, String>> selectListStore(SqlSessionTemplate session, int cPage, int numPerPage, Store s) {
		return session.selectList("store.selectListStore", s, new RowBounds((cPage-1)*numPerPage,numPerPage));
	}

	@Override
	public int updateStore(SqlSessionTemplate session, Store store) {
		return session.update("store.updateStore",store);
	}
		
	@Override
	public int deleteStore(SqlSessionTemplate session, Store store) {
		return session.delete("store.deleteStore",store);
	}

}

package com.mermaid.spring.store.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mermaid.spring.owner.model.vo.Owner;
import com.mermaid.spring.store.model.dao.StoreDao;
import com.mermaid.spring.store.model.vo.Store;

@Service
public class StoreServiceImpl implements StoreService {

	@Autowired
	private StoreDao dao;
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public int insertStore(Store s) {
		int result=dao.insertStore(session, s);
		return result;
	}
	
	
	@Override
	public List<Map<String, String>> selectListStore(int cPage, int numPerPage, Store s) {
		List<Map<String, String>> list=dao.selectListStore(session, cPage, numPerPage, s);
		return list;
	}
	
	@Override
	public int updateStore(Store store) {
		int result=dao.updateStore(session, store);
		return result;
	}
	
	@Override
	public int selectStoreCount(Store s) {
		return dao.selectStoreCount(session, s);
	}
	
	@Override
	public int deleteStore(Store store) {
		return dao.deleteStore(session, store);
	}


	@Override
	public List<Map<String, String>> selectListAllStore(Owner o) {
		return dao.selectListAllStore(session, o);
	}

}

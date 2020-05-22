package com.mermaid.spring.store.model.service;

import java.util.List;
import java.util.Map;

import com.mermaid.spring.owner.model.vo.Owner;
import com.mermaid.spring.store.model.vo.Store;

public interface StoreService {

	int insertStore(Store s);

	List<Map<String, String>> selectListStore(int cPage, int numPerPage, Store s);

	int updateStore(Store store);

	int selectStoreCount(Store s);

	int deleteStore(Store store);
	
	List<Map<String, String>> selectListAllStore(Owner o);

}

package com.mermaid.spring.owner.model.service;

import com.mermaid.spring.owner.model.vo.Owner;

public interface OwnerService {

	int insertOwner(Owner owner);

	Owner selectOwner(Owner owner);

	int updateOwner(Owner owner);

	int deleteOwner(Owner owner);

}

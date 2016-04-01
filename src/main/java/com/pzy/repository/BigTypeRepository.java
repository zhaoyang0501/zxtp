package com.pzy.repository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.pzy.entity.BigType;
import com.pzy.entity.Category;
public interface BigTypeRepository extends PagingAndSortingRepository<BigType, Long>,JpaSpecificationExecutor<BigType>{
    
}


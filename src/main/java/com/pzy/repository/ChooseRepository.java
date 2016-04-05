package com.pzy.repository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.pzy.entity.Choose;
public interface ChooseRepository extends PagingAndSortingRepository<Choose, Long>,JpaSpecificationExecutor<Choose>{
}


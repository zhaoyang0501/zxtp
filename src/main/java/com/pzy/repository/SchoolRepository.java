package com.pzy.repository;
import java.util.List;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.pzy.entity.School;
public interface SchoolRepository extends PagingAndSortingRepository<School, Long>,JpaSpecificationExecutor<School>{
    public List<School> findByName(String key);
}


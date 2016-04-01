package com.pzy.repository;
import java.util.List;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.pzy.entity.HistoryMajor;
import com.pzy.entity.School;
public interface HistoryMajorRepository extends PagingAndSortingRepository<HistoryMajor, Long>,JpaSpecificationExecutor<HistoryMajor>{
    public List<HistoryMajor>	findByType(Integer type);
    public List<HistoryMajor>	findBySchool(School school);
    public List<HistoryMajor>	findBySchoolAndTypeAndYear(School school,Integer type,String year);
    
}


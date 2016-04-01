package com.pzy.repository;
import java.util.List;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.pzy.entity.HistoryScore;
public interface HistoryScoreRepository extends PagingAndSortingRepository<HistoryScore, Long>,JpaSpecificationExecutor<HistoryScore>{
    public List<HistoryScore>	findByType(Integer type);
}


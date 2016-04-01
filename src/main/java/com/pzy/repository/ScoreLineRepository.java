package com.pzy.repository;
import java.util.List;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.pzy.entity.Area;
import com.pzy.entity.ScoreLine;
public interface ScoreLineRepository extends PagingAndSortingRepository<ScoreLine, Long>,JpaSpecificationExecutor<ScoreLine>{
	public List<ScoreLine> findByAreaAndYear(Area area,String year);
}


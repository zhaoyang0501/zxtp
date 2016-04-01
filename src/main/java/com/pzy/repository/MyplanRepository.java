package com.pzy.repository;
import java.util.List;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.pzy.entity.Myplan;
import com.pzy.entity.User;
public interface MyplanRepository extends PagingAndSortingRepository<Myplan, Long>,JpaSpecificationExecutor<Myplan>{
	public List<Myplan> findByUser(User user);
}


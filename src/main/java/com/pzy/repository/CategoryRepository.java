package com.pzy.repository;
import java.util.List;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.pzy.entity.Category;
public interface CategoryRepository extends PagingAndSortingRepository<Category, Long>,JpaSpecificationExecutor<Category>{
    
	@Query(value = "select t1.*,IFNULL(t2.num,0) from "+ 
					"(select id, name from t_item t1 where t1.category_id=?1 ) t1 "+ 
					"left JOIN "+ 
					"(select item,count(1) num from t_choose  where category=?1 group by item ) t2 "+ 
					"on t1.id=t2.item " ,nativeQuery=true)
	public List<Object[]> findVoteResult(Long category);
	
	
}


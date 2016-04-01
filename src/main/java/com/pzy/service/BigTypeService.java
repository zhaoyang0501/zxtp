
package com.pzy.service;

import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import com.pzy.entity.BigType;
import com.pzy.repository.BigTypeRepository;

@Service
public class BigTypeService {
	
    @Autowired
    private BigTypeRepository bigtypeRepository;
    public List<BigType> findAll() {
         return (List<BigType>) bigtypeRepository.findAll();
    }
    public List<BigType> findBigTypeSubs() {
        return (List<BigType>) bigtypeRepository.findAll();
    }
    public List<BigType> findBigTypes() {
        return (List<BigType>) bigtypeRepository.findAll();
    }
    
    public Page<BigType> findAll(final int pageNumber, final int pageSize,final String name){
        PageRequest pageRequest = new PageRequest(pageNumber - 1, pageSize, new Sort(Direction.DESC, "id"));
       
        Specification<BigType> spec = new Specification<BigType>() {
             public Predicate toPredicate(Root<BigType> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
             Predicate predicate = cb.conjunction();
             if (name != null) {
                  predicate.getExpressions().add(cb.like(root.get("name").as(String.class), name+"%"));
             }
             return predicate;
             }
        };
        Page<BigType> result = (Page<BigType>) bigtypeRepository.findAll(spec, pageRequest);
        return result;
    	}
		public void delete(Long id){
			bigtypeRepository.delete(id);
		}
		public BigType findBigType(Long id){
			  return bigtypeRepository.findOne(id);
		}
		public BigType find(Long id){
			  return bigtypeRepository.findOne(id);
		}
		public void save(BigType bigtype){
			bigtypeRepository.save(bigtype);
		}
}
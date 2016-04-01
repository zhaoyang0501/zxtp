
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

import com.pzy.entity.Myplan;
import com.pzy.entity.User;
import com.pzy.repository.MyplanRepository;

@Service
public class MyplanService {
	
    @Autowired
    private MyplanRepository myplanRepository;
    public List<Myplan> findByUser(User user) {
        return (List<Myplan>) myplanRepository.findByUser(user);
   }
    public List<Myplan> findAll() {
         return (List<Myplan>) myplanRepository.findAll();
    }
    public List<Myplan> findMyplanSubs() {
        return (List<Myplan>) myplanRepository.findAll();
    }
    public List<Myplan> findMyplans() {
        return (List<Myplan>) myplanRepository.findAll();
    }
    public List<Myplan> findAll(final String name){
        Specification<Myplan> spec = new Specification<Myplan>() {
             public Predicate toPredicate(Root<Myplan> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
             Predicate predicate = cb.conjunction();
             if (name != null) {
                  predicate.getExpressions().add(cb.like(root.get("name").as(String.class), name+"%"));
             }
             return predicate;
             }
        };
        return myplanRepository.findAll(spec, new Sort(Direction.DESC, "id"));
    	}
    
    public Page<Myplan> findAll(final int pageNumber, final int pageSize,final String name){
        PageRequest pageRequest = new PageRequest(pageNumber - 1, pageSize, new Sort(Direction.DESC, "id"));
       
        Specification<Myplan> spec = new Specification<Myplan>() {
             public Predicate toPredicate(Root<Myplan> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
             Predicate predicate = cb.conjunction();
             if (name != null) {
                  predicate.getExpressions().add(cb.like(root.get("name").as(String.class), name+"%"));
             }
             return predicate;
             }
        };
        Page<Myplan> result = (Page<Myplan>) myplanRepository.findAll(spec, pageRequest);
        return result;
    	}
		public void delete(Long id){
			myplanRepository.delete(id);
		}
		public Myplan findMyplan(Long id){
			  return myplanRepository.findOne(id);
		}
		public Myplan find(Long id){
			  return myplanRepository.findOne(id);
		}
		public void save(Myplan myplan){
			myplanRepository.save(myplan);
		}
}

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

import com.pzy.entity.Plan;
import com.pzy.entity.User;
import com.pzy.repository.PlanRepository;
/***
 * 
 * @author qq:263608237
 *
 */
@Service
public class PlanService {
     @Autowired
     private PlanRepository planRepository;

 	public List<Plan> findTop3() {
 		return planRepository.findAll(
 				new PageRequest(0, 15, new Sort(Direction.DESC, "createDate")))
 				.getContent();
 	}
     public List<Plan> findAll() {
         return (List<Plan>) planRepository.findAll();
     }
     public Page<Plan> findAll(final int pageNumber, final int pageSize,final String name){
         PageRequest pageRequest = new PageRequest(pageNumber - 1, pageSize, new Sort(Direction.DESC, "id"));
         Specification<Plan> spec = new Specification<Plan>() {
              public Predicate toPredicate(Root<Plan> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
              Predicate predicate = cb.conjunction();
              if (name != null) {
                   predicate.getExpressions().add(cb.like(root.get("name").as(String.class), "%"+name+"%"));
              }
              return predicate;
              }
         };
         Page<Plan> result = (Page<Plan>) planRepository.findAll(spec, pageRequest);
         return result;
     	}
     
     public Page<Plan> findAll(final int pageNumber, final int pageSize,final Integer type ){
         PageRequest pageRequest = new PageRequest(pageNumber - 1, pageSize, new Sort(Direction.DESC, "id"));
         Specification<Plan> spec = new Specification<Plan>() {
              public Predicate toPredicate(Root<Plan> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
              Predicate predicate = cb.conjunction();
              if (type != null) {
                  predicate.getExpressions().add(cb.equal(root.get("type").as(Integer.class),type));
               }
              return predicate;
              }
         };
         Page<Plan> result = (Page<Plan>) planRepository.findAll(spec, pageRequest);
         return result;
     	}
		public void delete(Long id){
			planRepository.delete(id);
		}
		public Plan find(Long id){
			  return planRepository.findOne(id);
		}
		public List<Plan> findByUser(User id){
			  return planRepository.findByUser(id);
		}
		public void save(Plan plan){
			planRepository.save(plan);
		}
}
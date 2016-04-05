
package com.pzy.service;

import java.util.Date;
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

import com.pzy.entity.Choose;
import com.pzy.repository.ChooseRepository;
/***
 * 
 * @author qq:263608237
 *
 */
@Service
public class ChooseService {
     @Autowired
     private ChooseRepository chooseRepository;

 	public List<Choose> findTop3() {
 		return chooseRepository.findAll(
 				new PageRequest(0, 15, new Sort(Direction.DESC, "createDate")))
 				.getContent();
 	}
     public List<Choose> findAll() {
         return (List<Choose>) chooseRepository.findAll();
     }
     public Page<Choose> findAll(final int pageNumber, final int pageSize,final String name){
         PageRequest pageRequest = new PageRequest(pageNumber - 1, pageSize, new Sort(Direction.DESC, "id"));
         Specification<Choose> spec = new Specification<Choose>() {
              public Predicate toPredicate(Root<Choose> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
              Predicate predicate = cb.conjunction();
              if (name != null) {
                   predicate.getExpressions().add(cb.like(root.get("title").as(String.class), "%"+name+"%"));
              }
              return predicate;
              }
         };
         Page<Choose> result = (Page<Choose>) chooseRepository.findAll(spec, pageRequest);
         return result;
     	}
     
     public Page<Choose> findAll(final int pageNumber, final int pageSize,final Integer type ){
         PageRequest pageRequest = new PageRequest(pageNumber - 1, pageSize, new Sort(Direction.DESC, "id"));
         Specification<Choose> spec = new Specification<Choose>() {
              public Predicate toPredicate(Root<Choose> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
              Predicate predicate = cb.conjunction();
              if (type != null) {
                  predicate.getExpressions().add(cb.equal(root.get("type").as(Integer.class),type));
               }
              return predicate;
              }
         };
         Page<Choose> result = (Page<Choose>) chooseRepository.findAll(spec, pageRequest);
         return result;
     	}
		public void delete(Long id){
			chooseRepository.delete(id);
		}
		public Choose find(Long id){
			  return chooseRepository.findOne(id);
		}
		public void save(Choose choose){
			chooseRepository.save(choose);
		}
}
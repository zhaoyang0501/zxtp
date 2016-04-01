
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

import com.pzy.entity.School;
import com.pzy.repository.SchoolRepository;
/***
 * 
 * @author qq:263608237
 *
 */
@Service
public class SchoolService {
    @Autowired
    private SchoolRepository schoolRepository;

    public  List<School> findByName(final String name){
    	 Specification<School> spec = new Specification<School>() {
             public Predicate toPredicate(Root<School> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
             Predicate predicate = cb.conjunction();
             if (name != null) {
                  predicate.getExpressions().add(cb.like(root.get("name").as(String.class), "%"+name+"%"));
             }
             return predicate;
             }
        };
        return schoolRepository.findAll(spec);
    }
    
 	public List<School> findTop3() {
 		return schoolRepository.findAll(
 				new PageRequest(0, 15, new Sort(Direction.DESC, "createDate")))
 				.getContent();
 	}
     public List<School> findAll() {
         return (List<School>) schoolRepository.findAll();
     }
     public Page<School> findAll(final int pageNumber, final int pageSize,final String name){
         PageRequest pageRequest = new PageRequest(pageNumber - 1, pageSize, new Sort(Direction.DESC, "id"));
         Specification<School> spec = new Specification<School>() {
              public Predicate toPredicate(Root<School> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
              Predicate predicate = cb.conjunction();
              if (name != null) {
                   predicate.getExpressions().add(cb.like(root.get("name").as(String.class), "%"+name+"%"));
              }
              return predicate;
              }
         };
         Page<School> result = (Page<School>) schoolRepository.findAll(spec, pageRequest);
         return result;
     	}
     
     public Page<School> findAll(final int pageNumber, final int pageSize,final Integer type ){
         PageRequest pageRequest = new PageRequest(pageNumber - 1, pageSize, new Sort(Direction.DESC, "id"));
         Specification<School> spec = new Specification<School>() {
              public Predicate toPredicate(Root<School> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
              Predicate predicate = cb.conjunction();
              if (type != null) {
                  predicate.getExpressions().add(cb.equal(root.get("type").as(Integer.class),type));
               }
              return predicate;
              }
         };
         Page<School> result = (Page<School>) schoolRepository.findAll(spec, pageRequest);
         return result;
     	}
		public void delete(Long id){
			schoolRepository.delete(id);
		}
		public School find(Long id){
			  return schoolRepository.findOne(id);
		}
		public void save(School school){
			schoolRepository.save(school);
		}
}
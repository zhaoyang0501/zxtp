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

import com.pzy.entity.HistoryMajor;
import com.pzy.entity.School;
import com.pzy.repository.HistoryMajorRepository;

/***
 * 
 * @author qq:263608237
 *
 */
@Service
public class HistoryMajorService {
	@Autowired
	private HistoryMajorRepository historyMajorRepository;
	public List<HistoryMajor> findBySchool(School school) {
		return historyMajorRepository.findBySchool(school);
	}
	public List<HistoryMajor> findBySchoolAndType(School school,Integer type,String year) {
		return historyMajorRepository.findBySchoolAndTypeAndYear(school, type,year);
	}
	public List<HistoryMajor> findAll() {
		return (List<HistoryMajor>)historyMajorRepository.findAll();
	}

	public List<HistoryMajor> findAll(final Integer type,final Integer orderbegain,final Integer orderend) {
		Specification<HistoryMajor> spec = new Specification<HistoryMajor>() {
			public Predicate toPredicate(Root<HistoryMajor> root,CriteriaQuery<?> query, CriteriaBuilder cb) {
				Predicate predicate = cb.conjunction();
				if (type != null) {
					predicate.getExpressions().add(cb.equal(root.get("type").as(Integer.class), type));
				}
				predicate.getExpressions().add(cb.greaterThanOrEqualTo(root.get("minOrder").as(Integer.class), orderbegain));
				predicate.getExpressions().add(cb.lessThanOrEqualTo(root.get("minOrder").as(Integer.class), orderend));
				
				return predicate;
			}
		};
		return (List<HistoryMajor>) historyMajorRepository.findAll(spec,new Sort(Direction.DESC, "minOrder"));
	}

	public Page<HistoryMajor> findAll(final int pageNumber, final int pageSize,
			final String year,Integer area,final Long school,final Integer type) {
		PageRequest pageRequest = new PageRequest(pageNumber - 1, pageSize,new Sort(Direction.DESC, "id"));
		Specification<HistoryMajor> spec = new Specification<HistoryMajor>() {
			public Predicate toPredicate(Root<HistoryMajor> root,CriteriaQuery<?> query, CriteriaBuilder cb) {
				Predicate predicate = cb.conjunction();
				if (type != null) {
					predicate.getExpressions().add(cb.equal(root.get("type").as(Integer.class), type));
				}
				if (year != null) {
					predicate.getExpressions().add(cb.equal(root.get("year").as(String.class), year));
				}
				if (school != null) {
					predicate.getExpressions().add(cb.equal(root.get("school").get("id").as(Long.class), school));
				}
				return predicate;
			}
		};
		Page<HistoryMajor> result = (Page<HistoryMajor>) historyMajorRepository.findAll(spec, pageRequest);
		return result;
	}

	public void delete(Long id) {
		historyMajorRepository.delete(id);
	}

	public HistoryMajor find(Long id) {
		return historyMajorRepository.findOne(id);
	}

	public void save(HistoryMajor historyMajor) {
		historyMajorRepository.save(historyMajor);
	}
}
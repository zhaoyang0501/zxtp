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

import com.pzy.entity.HistoryScore;
import com.pzy.repository.HistoryScoreRepository;

/***
 * 
 * @author qq:263608237
 *
 */
@Service
public class HistoryScoreService {
	@Autowired
	private HistoryScoreRepository historyScoreRepository;

	public List<HistoryScore> findTop3() {
		return historyScoreRepository.findAll(
				new PageRequest(0, 15, new Sort(Direction.DESC, "createDate")))
				.getContent();
	}

	public List<HistoryScore> findAll(final Integer type,final Integer orderbegain,final Integer orderend) {
		Specification<HistoryScore> spec = new Specification<HistoryScore>() {
			public Predicate toPredicate(Root<HistoryScore> root,CriteriaQuery<?> query, CriteriaBuilder cb) {
				Predicate predicate = cb.conjunction();
				if (type != null) {
					predicate.getExpressions().add(cb.equal(root.get("type").as(Integer.class), type));
				}
				predicate.getExpressions().add(cb.greaterThan(root.get("minOrder").as(Integer.class), orderbegain));
				//predicate.getExpressions().add(cb.lessThanOrEqualTo(root.get("minOrder").as(Integer.class), orderend));
				predicate.getExpressions().add(cb.equal(root.get("year").as(String.class), "2014"));
				
				return predicate;
			}
		};
		return (List<HistoryScore>) historyScoreRepository.findAll(spec,new Sort(Direction.DESC, "minOrder"));
	}

	public Page<HistoryScore> findAll(final int pageNumber, final int pageSize,
			final String year,Integer area,final Long school,final Integer type) {
		PageRequest pageRequest = new PageRequest(pageNumber - 1, pageSize,new Sort(Direction.DESC, "id"));
		Specification<HistoryScore> spec = new Specification<HistoryScore>() {
			public Predicate toPredicate(Root<HistoryScore> root,CriteriaQuery<?> query, CriteriaBuilder cb) {
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
		Page<HistoryScore> result = (Page<HistoryScore>) historyScoreRepository.findAll(spec, pageRequest);
		return result;
	}

	public void delete(Long id) {
		historyScoreRepository.delete(id);
	}

	public HistoryScore find(Long id) {
		return historyScoreRepository.findOne(id);
	}

	public void save(HistoryScore historyScore) {
		historyScoreRepository.save(historyScore);
	}
}
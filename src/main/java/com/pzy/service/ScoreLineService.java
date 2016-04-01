
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

import com.pzy.entity.Area;
import com.pzy.entity.ScoreLine;
import com.pzy.repository.ScoreLineRepository;

@Service
public class ScoreLineService {
	
    @Autowired
    private ScoreLineRepository scoreLineRepository;
    
    public ScoreLine  findByAreaAndYear(Area area,String year){
    	List<ScoreLine> list= scoreLineRepository.findByAreaAndYear(area, year);
    	return list.size()==0?null:list.get(0);
    }
    
    public List<ScoreLine> findAll() {
         return (List<ScoreLine>) scoreLineRepository.findAll();
    }
    public List<ScoreLine> findScoreLineSubs() {
        return (List<ScoreLine>) scoreLineRepository.findAll();
    }
    public List<ScoreLine> findScoreLines() {
        return (List<ScoreLine>) scoreLineRepository.findAll();
    }
    
    public Page<ScoreLine> findAll(final int pageNumber, final int pageSize,final String year){
        PageRequest pageRequest = new PageRequest(pageNumber - 1, pageSize, new Sort(Direction.DESC, "id"));
       
        Specification<ScoreLine> spec = new Specification<ScoreLine>() {
             public Predicate toPredicate(Root<ScoreLine> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
             Predicate predicate = cb.conjunction();
             if (year != null) {
                  predicate.getExpressions().add(cb.like(root.get("year").as(String.class), year+"%"));
             }
             return predicate;
             }
        };
        Page<ScoreLine> result = (Page<ScoreLine>) scoreLineRepository.findAll(spec, pageRequest);
        return result;
    	}
		public void delete(Long id){
			scoreLineRepository.delete(id);
		}
		public ScoreLine findScoreLine(Long id){
			  return scoreLineRepository.findOne(id);
		}
		public ScoreLine find(Long id){
			  return scoreLineRepository.findOne(id);
		}
		public void save(ScoreLine scoreLine){
			scoreLineRepository.save(scoreLine);
		}
}
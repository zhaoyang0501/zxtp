package com.pzy.entity;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "t_HistoryMajor")
public class HistoryMajor {
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	@ManyToOne(fetch = FetchType.EAGER)	
	private School school; 
	
	@ManyToOne(fetch = FetchType.EAGER)	
	private Category category;
	@ManyToOne(fetch = FetchType.EAGER)	
	private Area area;
	private String year;
	/**本科批次*/
	private Integer type;
	private Integer totalMan;
	private Double maxScore;
	private Double minScore;
	private Double avgScore;
	private Integer maxOrder;
	private Integer minOrder;
	private Integer avgOrder;
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public School getSchool() {
		return school;
	}
	public void setSchool(School school) {
		this.school = school;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public Double getMaxScore() {
		return maxScore;
	}
	public void setMaxScore(Double maxScore) {
		this.maxScore = maxScore;
	}
	public Double getMinScore() {
		return minScore;
	}
	public void setMinScore(Double minScore) {
		this.minScore = minScore;
	}
	public Double getAvgScore() {
		return avgScore;
	}
	public void setAvgScore(Double avgScore) {
		this.avgScore = avgScore;
	}
	public Integer getTotalMan() {
		return totalMan;
	}
	public void setTotalMan(Integer totalMan) {
		this.totalMan = totalMan;
	}
	public Integer getMaxOrder() {
		return maxOrder;
	}
	public void setMaxOrder(Integer maxOrder) {
		this.maxOrder = maxOrder;
	}
	public Integer getMinOrder() {
		return minOrder;
	}
	public void setMinOrder(Integer minOrder) {
		this.minOrder = minOrder;
	}
	public Integer getAvgOrder() {
		return avgOrder;
	}
	public void setAvgOrder(Integer avgOrder) {
		this.avgOrder = avgOrder;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	public Area getArea() {
		return area;
	}
	public void setArea(Area area) {
		this.area = area;
	}
}

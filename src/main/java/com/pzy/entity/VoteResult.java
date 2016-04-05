package com.pzy.entity;

public class VoteResult {
	private Long id;
	private String name;
	private Integer num;
	
	public VoteResult() {
		super();
	}
	public VoteResult(Object id, Object name, Object num) {
		super();
		this.id = ((java.math.BigInteger)id).longValue();
		this.name =(String) name;
		this.num = ((java.math.BigInteger)num).intValue();
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
	}
}

package com.pzy.entity;

import java.util.Date;

import java.util.List;

import javax.persistence.CascadeType;
/***
 * 投票主题
 *
 */
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
@Entity
@Table(name = "t_category")
public class Category {
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	private String name;
	
	private String remark;
	
	private String state;
	
	private String type;
	
	@OneToMany(fetch = FetchType.EAGER,cascade=CascadeType.ALL, mappedBy = "category") 
	private List<Item> items;
	
	public List<Item> getItems() {
		return items;
	}
	public void setItems(List<Item> items) {
		this.items = items;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	private Date createDate;
	
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
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	 public void removeItem(Item item) {
	        if (this.items.contains(item)) {
	            item.setCategory(null);
	            this.items.remove(item);
	        }
	    }
	
}

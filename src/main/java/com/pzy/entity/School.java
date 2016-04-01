package com.pzy.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "t_school")
public class School {
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
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
	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getSite() {
		return site;
	}
	public void setSite(String site) {
		this.site = site;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	private String name;
	@Column(columnDefinition="TEXT") 
	private String context;
	@Column(columnDefinition="TEXT") 
	private String zsjh;
	
	@Column(columnDefinition="TEXT") 
	private String zszc;
	
	/**大学实力*/
	@Column(columnDefinition="TEXT") 
	private String dxsl;
	/**收费标准*/
	@Column(columnDefinition="TEXT") 
	private String sfbz;
	public String getSfbz() {
		return sfbz;
	}
	public void setSfbz(String sfbz) {
		this.sfbz = sfbz;
	}
	public String getZsjh() {
		return zsjh;
	}
	public void setZsjh(String zsjh) {
		this.zsjh = zsjh;
	}
	public String getZszc() {
		return zszc;
	}
	public void setZszc(String zszc) {
		this.zszc = zszc;
	}
	public String getDxsl() {
		return dxsl;
	}
	public void setDxsl(String dxsl) {
		this.dxsl = dxsl;
	}
	private String type;
	private String email;
	private String addr;
	private String site;
	private String tel;
	
}

package com.pzy.action.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.json.annotations.JSON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;

import com.opensymphony.xwork2.ActionSupport;
import com.pzy.entity.Area;
import com.pzy.entity.Category;
import com.pzy.entity.HistoryMajor;
import com.pzy.entity.School;
import com.pzy.service.AreaService;
import com.pzy.service.CategoryService;
import com.pzy.service.HistoryMajorService;
import com.pzy.service.SchoolService;

/***
 *@author 263608237@qq.com
 *
 */
@Namespace("/admin/historymajor")
@ParentPackage("json-default")
public class HistoryMajorAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer sEcho = 1;
	private Integer iDisplayStart = 0;
	private Integer iDisplayLength = 10;
	private Map<String, Object> resultMap = new HashMap<String, Object>();

	private Long schoolid;
	private Integer areaid;
	private Integer type;
	private String year;
	private Long id;
	private HistoryMajor historymajor;
	private List<HistoryMajor> historymajors;
	private List<School> schools;
	private List<Area> areas;
	private List<Category> categorys;
	@Autowired
	private SchoolService schoolService;
	@Autowired
	private AreaService areaService;
	@Autowired
	private CategoryService cateogryService;
	@Autowired
	private HistoryMajorService historymajorService;

	@Action(value = "index", results = { @Result(name = "success", location = "/WEB-INF/views/admin/historymajor/index.jsp") })
	public String index() {
		categorys=this.cateogryService.findAll();
		schools=schoolService.findAll();
		areas=areaService.findAll();
		return SUCCESS;
	}

	@Action(value = "list", results = { @Result(name = "success", type = "json") }, params = {
			"contentType", "text/html" })
	public String list() {
		int pageNumber = (int) (iDisplayStart / iDisplayLength) + 1;
		int pageSize = iDisplayLength;
		Page<HistoryMajor> list = historymajorService.findAll(pageNumber, pageSize,
				year,areaid,schoolid,type);
		resultMap.put("aaData", list.getContent());
		resultMap.put("iTotalRecords", list.getTotalElements());
		resultMap.put("iTotalDisplayRecords", list.getTotalElements());
		resultMap.put("sEcho", sEcho);
		return SUCCESS;
	}

	@Action(value = "delete", results = { @Result(name = "success", type = "json") }, params = {
			"contentType", "text/html" })
	public String delete() {
		try {
			historymajorService.delete(id);
			resultMap.put("state", "success");
			resultMap.put("msg", "删除成功");
		} catch (Exception e) {
			resultMap.put("state", "error");
			resultMap.put("msg", "删除失败，外键约束");
		}

		return SUCCESS;
	}

	@Action(value = "get", results = { @Result(name = "success", type = "json") }, params = {
			"contentType", "text/html" })
	public String get() {
		resultMap.put("historymajor", historymajorService.find(id));
		resultMap.put("state", "success");
		resultMap.put("msg", "删除成功");
		return SUCCESS;
	}

	
	@Action(value = "save", results = { @Result(name = "success", type = "json") }, params = {
			"contentType", "text/html" })
	public String save() {
		historymajorService.save(historymajor);
		resultMap.put("state", "success");
		resultMap.put("msg", "保存成功");
		return SUCCESS;
	}

	
	
	
	
	
	public HistoryMajor getHistorymajor() {
		return historymajor;
	}

	public void setHistorymajor(HistoryMajor historymajor) {
		this.historymajor = historymajor;
	}

	/* ~~~~~~~~get and setter~~~~~~~~~ */
	@JSON
	public Map<String, Object> getResultMap() {
		return resultMap;
	}

	public List<School> getSchools() {
		return schools;
	}

	public void setSchools(List<School> schools) {
		this.schools = schools;
	}

	public List<Area> getAreas() {
		return areas;
	}

	public void setAreas(List<Area> areas) {
		this.areas = areas;
	}

	public void setResultMap(Map<String, Object> resultMap) {
		this.resultMap = resultMap;
	}

	public Integer getSEcho() {
		return sEcho;
	}

	public void setSEcho(Integer sEcho) {
		this.sEcho = sEcho;
	}

	public Integer getIDisplayStart() {
		return iDisplayStart;
	}

	public void setIDisplayStart(Integer idisplayStart) {
		this.iDisplayStart = idisplayStart;
	}

	public Integer getIDisplayLength() {
		return iDisplayLength;
	}

	public void setIDisplayLength(Integer iDisplayLength) {
		this.iDisplayLength = iDisplayLength;
	}

	
	public Long getSchoolid() {
		return schoolid;
	}

	public void setSchoolid(Long schoolid) {
		this.schoolid = schoolid;
	}

	public Integer getAreaid() {
		return areaid;
	}

	public void setAreaid(Integer areaid) {
		this.areaid = areaid;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public HistoryMajor getHistoryscore() {
		return historymajor;
	}

	public void setHistoryscore(HistoryMajor historymajor) {
		this.historymajor = historymajor;
	}

	public List<HistoryMajor> getHistoryscores() {
		return historymajors;
	}

	public void setHistoryscores(List<HistoryMajor> historymajors) {
		this.historymajors = historymajors;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public List<Category> getCategorys() {
		return categorys;
	}

	public void setCategorys(List<Category> categorys) {
		this.categorys = categorys;
	}

}

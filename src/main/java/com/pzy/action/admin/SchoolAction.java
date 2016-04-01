package com.pzy.action.admin;
/***
 * @author 263608237@qq.com
 */
import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;

import com.pzy.action.PageAction;
import com.pzy.entity.School;
import com.pzy.service.SchoolService;

@Namespace("/admin/school")
@ParentPackage("json-default") 
public class SchoolAction extends PageAction {
	private String name;
	private Long id;
	private School school;
	private String tip;

	private List<School> schools;
	@Autowired
	private SchoolService schoolService;
	@Action(value = "index", results = { @Result(name = "success", location = "/WEB-INF/views/admin/school/index.jsp") })
	public String index() {
		return SUCCESS;
	}

	@Action(value = "list", results = { @Result(name = "success", type = "json",params={"ignoreHierarchy","false"}) })  
	public String list() {
		int pageNumber = (int) (this.getIDisplayStart() / this.getIDisplayLength()) + 1;
		int pageSize =  this.getIDisplayLength();
		Page<School> list = schoolService.findAll(pageNumber, pageSize,name);
		this.getResultMap().put("aaData", list.getContent());
		this.getResultMap().put("iTotalRecords", list.getTotalElements());
		this.getResultMap().put("iTotalDisplayRecords", list.getTotalElements());
		this.getResultMap().put("sEcho", getSEcho());
		return SUCCESS;
	}

	@Action(value = "delete", results = { @Result(name = "success", type = "json",params={"ignoreHierarchy","false"}) })  
	public String delete() {
		schoolService.delete(id);
		getResultMap().put("state", "success");
		getResultMap().put("msg", "删除成功");
		return SUCCESS;
	}

	@Action(value = "get", results = { @Result(name = "success", type = "json",params={"ignoreHierarchy","false"}) })  
	public String get() {
		getResultMap().put("object", schoolService.find(id));
		getResultMap().put("state", "success");
		getResultMap().put("msg", "删除成功");
		return SUCCESS;
	}

	@Action(value = "update", results = { @Result(name = "success",  type = "json",params={"ignoreHierarchy","false"}) })  
	public String update() {
		School bean = schoolService.find(school.getId());
		school.setAddr(bean.getAddr());
		school.setContext(bean.getContext());
		school.setEmail(bean.getEmail());
		school.setName(bean.getName());
		school.setSite(bean.getSite());
		school.setTel(bean.getType());
		school.setType(bean.getType());
		schoolService.save(school);
		getResultMap().put("state", "success");
		getResultMap().put("msg", "修改成功");
		return SUCCESS;
	}
	@Action(value = "save",  results = { @Result(name = "success", location = "/WEB-INF/views/admin/school/create.jsp") })
	public String saveit() {
		schoolService.save(school);
		tip="发布成功！";
		return SUCCESS;
	}
	
	public School getSchool() {
		return school;
	}

	public void setSchool(School school) {
		this.school = school;
	}

	public List<School> getSchools() {
		return schools;
	}

	public void setSchools(List<School> schools) {
		this.schools = schools;
	}


	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	public String getTip() {
		return tip;
	}

	public void setTip(String tip) {
		this.tip = tip;
	}
}

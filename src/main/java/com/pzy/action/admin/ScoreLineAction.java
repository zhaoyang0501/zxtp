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
import com.pzy.entity.ScoreLine;
import com.pzy.service.AreaService;
import com.pzy.service.ScoreLineService;

/***
 * @author 263608237@qq.com
 *
 */
@Namespace("/admin/scoreline")
@ParentPackage("json-default")
public class ScoreLineAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer sEcho = 1;
	private Integer iDisplayStart = 0;
	private Integer iDisplayLength = 10;
	private Map<String, Object> resultMap = new HashMap<String, Object>();

	private String name;
	private Long id;
	private ScoreLine scoreLine;
	private List<ScoreLine> scoreLines;
	
	private List<Area> areas;
	@Autowired
	private ScoreLineService scoreLineService;
	@Autowired
	private AreaService areaService;

	@Action(value = "index", results = { @Result(name = "success", location = "/WEB-INF/views/admin/scoreline/index.jsp") })
	public String index() {
		areas=areaService.findAll();
		return SUCCESS;
	}

	@Action(value = "list", results = { @Result(name = "success", type = "json") }, params = {
			"contentType", "text/html" })
	public String list() {
		int pageNumber = (int) (iDisplayStart / iDisplayLength) + 1;
		int pageSize = iDisplayLength;
		Page<ScoreLine> list = scoreLineService.findAll(pageNumber, pageSize,
				name);
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
			scoreLineService.delete(id);
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
		resultMap.put("scoreLine", scoreLineService.find(id));
		resultMap.put("state", "success");
		resultMap.put("msg", "删除成功");
		return SUCCESS;
	}

	@Action(value = "update", results = { @Result(name = "success", type = "json") }, params = {
			"contentType", "text/html" })
	public String update() {
		ScoreLine bean = scoreLineService.find(scoreLine.getId());
		bean.setArea(scoreLine.getArea());
		bean.setYear(scoreLine.getYear());
		bean.setScore1(scoreLine.getScore1());
		bean.setScore2(scoreLine.getScore2());
		bean.setScore3(scoreLine.getScore3());
		bean.setScore4(scoreLine.getScore4());
		bean.setNum1(scoreLine.getNum1());
		bean.setNum2(scoreLine.getNum2());
		bean.setNum3(scoreLine.getNum3());
		bean.setNum4(scoreLine.getNum4());
		scoreLineService.save(bean);
		resultMap.put("state", "success");
		resultMap.put("msg", "修改成功");
		return SUCCESS;
	}

	@Action(value = "save", results = { @Result(name = "success", type = "json") }, params = {
			"contentType", "text/html" })
	public String save() {
		//scoreLine.setArea(areaService.find(scoreLine.getArea().ge));
		scoreLineService.save(scoreLine);
		resultMap.put("state", "success");
		resultMap.put("msg", "保存成功");
		return SUCCESS;
	}

	/* ~~~~~~~~get and setter~~~~~~~~~ */
	@JSON
	public Map<String, Object> getResultMap() {
		return resultMap;
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

	public ScoreLine getScoreLine() {
		return scoreLine;
	}

	public void setScoreLine(ScoreLine scoreLine) {
		this.scoreLine = scoreLine;
	}

	public List<ScoreLine> getScoreLines() {
		return scoreLines;
	}

	public void setScoreLines(List<ScoreLine> scoreLines) {
		this.scoreLines = scoreLines;
	}
	public List<Area> getAreas() {
		return areas;
	}

	public void setAreas(List<Area> areas) {
		this.areas = areas;
	}
}

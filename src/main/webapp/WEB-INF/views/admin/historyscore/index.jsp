<!DOCTYPE html>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="ch">
<%@ include file="../common/meta.jsp"%>
<head>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/ace/admin.historyscore.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/falgun/bootbox.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/falgun/bootstrap-datetimepicker.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/falgun/bootstrap-datetimepicker.zh-CN.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$(".date").datetimepicker({
			language:  'zh-CN',
	        weekStart: 1,
	        todayBtn:  1,
	        format:'yyyy-mm-dd',
			autoclose: 1,
			todayHighlight: 1,
			startView: 2,
			minView: 2,
			forceParse: 0
	    });
	});
</script>
</head>
<body>
	<div class="layout">
		<!-- top -->
		<%@ include file="../top.jsp"%>
		<!-- 导航 -->
		<%@ include file="../menu.jsp"%>
		
		<input type="hidden" id="hf_id" />

		<div class="main-wrapper">
			<div class="container-fluid">
				<div class="row-fluid ">
					<div class="span12">
						<div class="content-widgets light-gray">
							<div class="widget-head  bondi-blue" >
								<h3>招生信息管理</h3>
							</div>
							<div class="box well form-inline">
								<span>大学名称：</span>
								<select id='_school'>
										<c:forEach items="${schools}" var="bean">
											<option value="${bean.id}">${bean.name }</option>
										</c:forEach>
								</select>
								<span>年份：</span>
									<select id='year'>
											<option value="2014">2014</option>
											<option value="2015">2015</option>
									</select>
									<%-- <span>地区：</span>
									<select id='_area'>
											<c:forEach items="${areas}" var="bean">
											<option value="${bean.code}">${bean.name }</option>
										</c:forEach>
									</select>
									<span>招生批次：</span>
									<select id='_type'>
											<option value="10">本科一批</option>
											<option value="20">本科二批</option>
											<option value="30">本科三批</option>
											<option value="30">专科</option>
									</select> --%>
								<a onclick="$.adminHistoryscore.initSearchDataTable()"
									class="btn btn-info" data-loading-text="正在加载..."><i class="icon-search"></i>查询</a>
							</div>
							<div class="widget-container">
								
									<a class="btn btn-success" style="float: right; margin: 5px;" onclick="$.adminHistoryscore.showaddModal()"><i class="icon-plus"></i> 新增</a>
								<table class="responsive table table-striped table-bordered"
									id="dt_historyscore_view">
									<thead>
										<tr>
											<th >学校名称</th>
											<th >年份</th>
											<th >地区</th>
											<th >批次</th>
											<th >总招生人数</th>
											<th >最高分</th>
											<th >最低分</th>
											<th >平均分</th>
											<th >最高分排名</th>
											<th >最低分排名</th>
											<th >平均分排名</th>
												<th >操作</th>
										</tr>
									</thead>
									<tbody>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%@ include file="../foot.jsp"%>
	</div>

	<!-- 编辑新增弹出框 -->
	<div class="modal hide fade" id="historyscore_modal">
		<div class="modal-header blue">
			<button type="button" class="close" data-dismiss="modal">×</button>
			<label id="historyscore_modal_header_label"></label>
		</div>
		<div class="modal-body" style="min-height: 200px;">
			<div class="row-fluid">
				<div class="span12">
					<div class="form-container grid-form form-background left-align form-horizontal">
						<form action="" method="get" id=''>
							<input type="hidden" id="historyscoreId" value="">
							<div class="control-group">
								<label for="name" class="control-label">学校：</label>
								<div class="controls">
									<select id='schoolid'>
										<c:forEach items="${schools}" var="bean">
											<option value="${bean.id}">${bean.name }</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="control-group">
								<label for="name" class="control-label">招生地区：</label>
								<div class="controls">
									<select id='areaid'>
										<c:forEach items="${areas}" var="bean">
											<option value="${bean.code}">${bean.name }</option>
										</c:forEach>
									</select>
								</div>
							</div>
							
							<div class="control-group">
								<label for="name" class="control-label">年份：</label>
								<div class="controls">
									<select id='year'>
											<option value="2014">2014</option>
											<option value="2015">2015</option>
									</select>
								</div>
							</div>
							<div class="control-group">
								<label for="name" class="control-label">批次：</label>
								<div class="controls">
									<select id='type'>
											<option value="1">本科一批</option>
											<option value="2">本科二批</option>
											<option value="3">本科三批</option>
											<option value="4">专科</option>
									</select>
								</div>
							</div>
							<div class="control-group" id='control_project'>
								<label for="remark" class="control-label">总招生人数：</label>
								<div class="controls">
									<input id='totalMan' value="" type="text"/>
								</div>
							</div>
							<div class="control-group" id='control_project'>
								<label for="remark" class="control-label">最高分：</label>
								<div class="controls">
									<input id='maxScore' value="" type="text"/>
								</div>
							</div>
							
							<div class="control-group" id='control_project'>
								<label for="remark" class="control-label">最高分在本地区排名：</label>
								<div class="controls">
									<input id='maxOrder' value="" type="text"/>
								</div>
							</div>
							
							
							<div class="control-group" id='control_project'>
								<label for="remark" class="control-label">最低分：</label>
								<div class="controls">
									<input id='minScore' value="" type="text"/>
								</div>
							</div>
							
							<div class="control-group" id='control_project'>
								<label for="remark" class="control-label">最低分在本地区排名：</label>
								<div class="controls">
									<input id='minOrder' value="" type="text"/>
								</div>
							</div>
							
							
							<div class="control-group" id='control_project'>
								<label for="remark" class="control-label">平均分：</label>
								<div class="controls">
									<input id='avgScore' value="" type="text"/>
								</div>
							</div>
							
							<div class="control-group" id='control_project'>
								<label for="remark" class="control-label">平均在本地区排名：</label>
								<div class="controls">
									<input id='avgOrder' value="" type="text"/>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		
		<div class="modal-footer center" id="div_footer">
			<a class="btn btn-primary" onclick="$.adminHistoryscore.save()">保存</a>
			<a href="#" class="btn" data-dismiss="modal" id="closeViewModal">关闭</a>
		</div>
	</div>
</body>
</html>
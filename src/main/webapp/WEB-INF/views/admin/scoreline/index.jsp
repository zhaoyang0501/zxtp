<!DOCTYPE html>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="ch">
<%@ include file="../common/meta.jsp"%>
<head>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/ace/admin.scoreline.js"></script>
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
								<h3>分数线管理</h3>
							</div>
							<div class="box well form-inline">
								<span>年份：</span>
									<select id='_name'>
											<option value="2014">2014</option>
											<option value="2015">2015</option>
									</select>
								<a onclick="$.adminScoreline.initSearchDataTable()"
									class="btn btn-info" data-loading-text="正在加载..."><i class="icon-search"></i>查询</a>
							</div>
							<div class="widget-container">
								
									<a class="btn btn-success" style="float: right; margin: 5px;" onclick="$.adminScoreline.showaddModal()"><i class="icon-plus"></i> 新增</a>
								<table class="responsive table table-striped table-bordered"
									id="dt_scoreline_view">
									<thead>
										<tr>
											<th >id</th>
											<th >年份</th>
											<th >地区</th>
											<th >本科第一批</th>
											<th >本科第二批</th>
											<th >本科第三批</th>
											<th >专科</th>
											<th >本科第一批最低排名</th>
											<th >本科第二批最低排名</th>
											<th >本科第三批最低排名</th>
											<th >专科最低排名</th>
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
	<div class="modal hide fade" id="scoreline_modal">
		<div class="modal-header blue">
			<button type="button" class="close" data-dismiss="modal">×</button>
			<label id="scoreline_modal_header_label"></label>
		</div>
		<div class="modal-body" style="min-height: 200px;">
			<div class="row-fluid">
				<div class="span12">
					<div class="form-container grid-form form-background left-align form-horizontal">
						<form action="" method="get" id=''>
							<input type="hidden" id="scorelineId" value="">
							<div class="control-group">
								<label for="name" class="control-label">招生地区：</label>
								<div class="controls">
									<select id='area'>
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
							<div class="control-group" id='control_project'>
								<label for="remark" class="control-label">本科一批分数线：</label>
								<div class="controls">
									<input type="text" id="score1" placeholder="">
								</div>
							</div>
							<div class="control-group" id='control_project'>
								<label for="remark" class="control-label">本科二批分数线：</label>
								<div class="controls">
									<input type="text" id="score2" placeholder="">
								</div>
							</div>
							<div class="control-group" id='control_project'>
								<label for="remark" class="control-label">本科三批分数线：</label>
								<div class="controls">
									<input type="text" id="score3" placeholder="">
								</div>
							</div>
							<div class="control-group" id='control_project'>
								<label for="remark" class="control-label">本科专批分数线：</label>
								<div class="controls">
									<input type="text" id="score4" placeholder="">
								</div>
							</div>
							<div class="control-group" id='control_project'>
								<label for="remark" class="control-label">本科一批分数线最低排名：</label>
								<div class="controls">
									<input type="text" id="num1" placeholder="">
								</div>
							</div>
							<div class="control-group" id='control_project'>
								<label for="remark" class="control-label">本科二批分数线最低排名：</label>
								<div class="controls">
									<input type="text" id="num2" placeholder="">
								</div>
							</div>
							<div class="control-group" id='control_project'>
								<label for="remark" class="control-label">本科三批分数线最低排名：</label>
								<div class="controls">
									<input type="text" id="num3" placeholder="">
								</div>
							</div>
							<div class="control-group" id='control_project'>
								<label for="remark" class="control-label">本科专批分数线排名：</label>
								<div class="controls">
									<input type="text" id="num4" placeholder="">
								</div>
							</div>
							
						</form>
					</div>
				</div>
			</div>
		</div>
		
		<div class="modal-footer center" id="div_footer">
			<a class="btn btn-primary" onclick="$.adminScoreline.save()">保存</a>
			<a href="#" class="btn" data-dismiss="modal" id="closeViewModal">关闭</a>
		</div>
	</div>
</body>
</html>
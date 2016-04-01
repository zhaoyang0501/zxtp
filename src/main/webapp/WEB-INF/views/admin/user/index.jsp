<!DOCTYPE html>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="ch">
<%@ include file="../common/meta.jsp"%>
<head>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/ace/admin.user.js"></script>
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
						<div class="content-widgets ">
							<div class="widget-head  bondi-blue" >
								<h3>用户信息列表</h3>
							</div>
							<div class="box well form-inline">
								<span>姓名：</span>
								<input type="text" id="_userName" >
								<a onclick="$.adminUser.initSearchDataTable()"
									class="btn btn-info" data-loading-text="正在加载..."><i class="icon-search"></i>查询</a>
							</div>
								<table class="responsive table table-striped table-bordered"
									id="dt_user_view">
									<thead>
										<tr>
											<th >id</th>
											<th >用户名</th>
											<th >密码</th>
											<th >昵称</th>
											<th>性别</th>
											<th >email</th>
											<th>地址</th>
											<th>省/直辖市</th>
											<th>城市</th>
											<th>学校</th>
											<th>操作</th>
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
		<%@ include file="../foot.jsp"%>
	</div>

	<!-- 编辑新增弹出框 -->
	<div class="modal hide fade" id="user_edit_modal">
		<div class="modal-header blue">
			<button type="button" class="close" data-dismiss="modal">×</button>
			<label id="user_modal_header_label"></label>
		</div>
		<div class="modal-body" style="min-height: 500px;">
			<div class="row-fluid">
				<div class="span12">
					<div class="form-container grid-form form-background left-align form-horizontal">
						<form action="" method="get" id=''>
							<input type="hidden" id="userid" value="">
							<div class="control-group">
								<label for="name" class="control-label">用户名：</label>
								<div class="controls">
									<input type="text" id="name" placeholder="">
								</div>
							</div>
							<div class="control-group" id='control_project'>
								<label for="password" class="control-label">密码：</label>
								<div class="controls">
									<input type="password" id='password' placeholder="">
								</div>
							</div>
							<div class="control-group" id='control_projectStep'>
								<label for="nickname" class="control-label">昵称：</label>
								<div class="controls">
									<input type="text" id="nickname" placeholder="">
								</div>
							</div>
							
							<div class="control-group" id='control_projectStep'>
								<label for="sex" class="control-label">性别：</label>
								<div class="controls">
									<select id='sex'>
										  <option value="男">男</option>
										  <option  value="女">女</option>
									</select>
								</div>
							</div>
							<div class="control-group" id='control_projectStep'>
								<label for="email" class="control-label">电子邮件：</label>
								<div class="controls">
									<input type="email" id="email" placeholder="">
								</div>
							</div>
							
							<div class="control-group" id='control_projectStep'>
								<label for="address" class="control-label">地址：</label>
								<div class="controls">
									<input type="text" id="address" placeholder="">
								</div>
							</div>
							
							<div class="control-group" id='control_projectStep'>
								<label for="job" class="control-label">职业：</label>
								<div class="controls">
									<select id="area" name="area" class="sel_style sel_w1">
										<option selected="selected" value="北京">北京</option>
										<option value="天津">天津</option>
										<option value="上海">上海</option>
										<option value="重庆">重庆</option>
										<option value="河北">河北</option>
										<option value="河南">河南</option>
										<option value="山东">山东</option>
										<option value="山西">山西</option>
										<option value="安徽">安徽</option>
										<option value="江西">江西</option>
										<option value="江苏">江苏</option>
										<option value="浙江">浙江</option>
										<option value="湖北">湖北</option>
										<option value="湖南">湖南</option>
										<option value="广东">广东</option>
										<option value="广西">广西</option>
										<option value="云南">云南</option>
										<option value="贵州">贵州</option>
										<option value="四川">四川</option>
										<option value="陕西">陕西</option>
										<option value="青海">青海</option>
										<option value="宁夏">宁夏</option>
										<option value="黑龙江">黑龙江</option>
										<option value="吉林">吉林</option>
										<option value="辽宁">辽宁</option>
										<option value="西藏">西藏</option>
										<option value="新疆">新疆</option>
									</select>
								</div>
							</div>
							
							<div class="control-group" id='control_projectStep'>
								<label for="address" class="control-label">城市：</label>
								<div class="controls">
									<input type="text" id="city" placeholder="">
								</div>
							</div>
							<div class="control-group" id='control_projectStep'>
								<label for="address" class="control-label">身份证号码：</label>
								<div class="controls">
									<input type="text" id="cardid" placeholder="">
								</div>
							</div>
							<div class="control-group" id='control_projectStep'>
								<label for="address" class="control-label">毕业学校：</label>
								<div class="controls">
									<input type="text" id="school" placeholder="">
								</div>
							</div>
							<div class="control-group" id='control_projectStep'>
								<label for="address" class="control-label">高考成绩：</label>
								<div class="controls">
									<input type="text" id="score" placeholder="">
								</div>
							</div>
							<div class="control-group" id='control_projectStep'>
								<label for="address" class="control-label">所属科类：</label>
								<div class="controls">
									<select id="type" name="type" class="sel_style sel_w1">
									<option value="文科">文科</option>
									<option value="理科">理科</option>
									<option value="艺术类"> 艺术类</option>
									<option value="体育类 ">体育类 </option>
									</select>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		
		<div class="modal-footer center" id="div_footer">
			<a class="btn btn-primary" onclick="$.adminUser.saveUser()">保存</a>
			<a href="#" class="btn" data-dismiss="modal" id="closeViewModal">关闭</a>
		</div>
	</div>
</body>
</html>
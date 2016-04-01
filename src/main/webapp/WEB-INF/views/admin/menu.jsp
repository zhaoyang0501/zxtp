<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="leftbar leftbar-close clearfix">
	<div class="admin-info clearfix">
		<div class="admin-thumb">
			<i class="icon-user"></i>
		</div>
		<div class="admin-meta">
			<ul>
				<li class="admin-username" style="margin-top: 10px;">欢迎你 ${sessionScope.adminuser.name}</li>
				<li><a href="${pageContext.request.contextPath}/admin/loginout">
				<i class="icon-lock"></i> 退出</a></li>
			</ul>
		</div>
	</div>

	<div class="left-nav clearfix">
		<div class="left-primary-nav">
			<ul id="myTab">
				<li  class="active"><a href="#dailyreport" class="icon-calendar" data-original-title="日报"></a></li>
			</ul>
		</div>
		<div class="responsive-leftbar">
			<i class="icon-list"></i>
		</div>
		<div class="left-secondary-nav tab-content" >
			<div class="tab-pane active dailyreport" id="dailyreport">
				<ul id="nav" class="accordion-nav" >
					<li><a href="${pageContext.request.contextPath}/admin/user/index"><i class="icon-pencil"></i>注册用户管理</a></li>
					<li><a href="${pageContext.request.contextPath}/admin/category/index"><i class="icon-pencil"></i>投票管理</a></li>
					<li><a href="${pageContext.request.contextPath}/admin/user1/index"><i class="icon-pencil"></i>投票选项设置</a></li>
					<li><a href="${pageContext.request.contextPath}/admin/user3/index"><i class="icon-pencil"></i>投票结果统计</a></li>
				
					<li><a href="${pageContext.request.contextPath}/admin/news/index"><i class="icon-pencil"></i>新闻管理</a></li>
					<li><a href="${pageContext.request.contextPath}/admin/news/create"><i class="icon-pencil"></i>新闻发布</a></li>
					<!-- 
						<li><a href="${pageContext.request.contextPath}/admin/user/index"><i class="icon-pencil"></i>个人信息管理</a></li>
						<li><a href="${pageContext.request.contextPath}/admin/category/index"><i class="icon-pencil"></i>专业管理</a></li>
						
						<li><a href="${pageContext.request.contextPath}/admin/school/index"><i class="icon-pencil"></i>高校指南信息管理</a></li>
					<li><a href="${pageContext.request.contextPath}/admin/school/create"><i class="icon-pencil"></i>添加高校信息</a></li>
					<li><a href="${pageContext.request.contextPath}/admin/historyscore/index"><i class="icon-pencil"></i>高校历史招生信息管理</a></li>
					<li><a href="${pageContext.request.contextPath}/admin/historymajor/index"><i class="icon-pencil"></i>高校招生专业管理</a></li>
					<li><a href="${pageContext.request.contextPath}/admin/scoreline/index"><i class="icon-pencil"></i>分数线设置</a></li>
					<li><a href="${pageContext.request.contextPath}/admin/news/index"><i class="icon-pencil"></i>高考周报管理</a></li>
					<li><a href="${pageContext.request.contextPath}/admin/news/create"><i class="icon-pencil"></i>高考周报创建</a></li>
				- -->
				</ul>
			</div>
		</div>
	</div>
</div>
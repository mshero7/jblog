<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JBlog</title>
<Link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/jblog.css">
</head>
<body>
	<div id="container">

		<c:import url="/WEB-INF/views/includes/blog-header.jsp"></c:import>
		<div id="wrapper">
			<div id="content">
				<div class="blog-content">
					<h4>${select_post.title }</h4>
						<p> ${select_post.contents } <p>
				</div>
				
				<ul class="blog-list">
					<c:forEach items="${category_post }" var="category_post">
						<li><a href="${pageContext.servletContext.contextPath}/${blogVo.blog_id }/${category_post.category_no}/${category_post.no}">${category_post.title }</a> <span>${category_post.write_date }</span></li>
					</c:forEach>
				</ul>
			</div>
		</div>

		<div id="extra">
			<div class="blog-logo">
				<img src="${pageContext.servletContext.contextPath }${blogVo.logo }"/>
			</div>
		</div>

		<div id="navigation">
			<h2>카테고리</h2>
			<ul>	
				<c:forEach items="${categoryList }" var="category">
					<li><a href="${pageContext.servletContext.contextPath}/${blogVo.blog_id }/${category.no}">${category.name }</a></li>
				</c:forEach>
			</ul>
		</div>
		
		<div id="footer">
			<p>
				<strong>Spring 이야기</strong> is powered by JBlog (c)2016
			</p>
		</div>
	</div>
</body>
</html>
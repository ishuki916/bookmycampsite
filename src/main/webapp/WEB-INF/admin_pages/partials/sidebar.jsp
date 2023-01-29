<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<nav class="sidebar sidebar-offcanvas" id="sidebar">
	<ul class="nav">
		<li class="nav-item sidebar-category">
			<p>Navigation</p> <span></span>
		</li>

		<li class="nav-item"><a class="nav-link"
			href="${contextRoot}/index"> <i
				class="mdi mdi-view-quilt menu-icon"></i> <span class="menu-title">Home</span>
				<div class="badge badge-info badge-pill">0</div>
		</a></li>

		<li class="nav-item sidebar-category">
			<p>Settings</p> <span></span>
		</li>
		<li class="nav-item"><a class="nav-link" data-toggle="collapse"
			href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
				<i class="mdi mdi-palette menu-icon"></i> <span class="menu-title">
					Campsite</span> <i class="menu-arrow"></i>
		</a>
			<div class="collapse" id="ui-basic">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item"><a class="nav-link"
						href="${contextRoot}/admin/cCamp">Create New Page</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${contextRoot}/admin/showCamp">Edit Page</a></li>
				</ul>
			</div></li>
		

		
	</ul>
</nav>
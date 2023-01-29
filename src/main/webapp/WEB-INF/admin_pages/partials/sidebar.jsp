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
		<li class="nav-item"><a class="nav-link" data-toggle="collapse"
			href="#ui-basic1" aria-expanded="false" aria-controls="ui-basic">
				<i class="mdi mdi-account menu-icon"></i> <span class="menu-title">
					Users</span> <i class="menu-arrow"></i>
		</a>
			<div class="collapse" id="ui-basic1">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item"><a class="nav-link"
						href="${contextRoot}/admin/users">User List</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${contextRoot}/admin/createUser">Create New User</a></li>
				</ul>
			</div></li>
		<li class="nav-item"><a class="nav-link" data-toggle="collapse"
			href="#rent" aria-expanded="false" aria-controls="rent"> <i
				class="mdi mdi-file-outline menu-icon"></i> <span class="menu-title">
					Rent</span> <i class="menu-arrow"></i>
		</a>
			<div class="collapse" id="rent">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item"><a class="nav-link"
						href="${contextRoot}/admin/van">Campervan</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${contextRoot}/admin/tent">Tent</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${contextRoot}/admin/equip">Equipment</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${contextRoot}/admin/equipbook">Rent Order</a></li>
				</ul>
			</div></li>

		<li class="nav-item"><a class="nav-link" data-toggle="collapse"
			href="#pair" aria-expanded="false" aria-controls="rent"> <i
				class="mdi mdi-file-outline menu-icon"></i> <span class="menu-title">
					Pair</span> <i class="menu-arrow"></i>
		</a>
			<div class="collapse" id="pair">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item"><a class="nav-link"
						href="${contextRoot}/rearEnd">Create Itinerary</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${contextRoot}/paidOrder">Paid Order</a></li>
				</ul>
			</div></li>
		
		<li class="nav-item"><a class="nav-link" data-toggle="collapse"
			href="#purchaseMore" aria-expanded="false"
			aria-controls="purchaseMore"> <i
				class="mdi mdi-file-outline menu-icon"></i> <span class="menu-title">
					Purchase More</span> <i class="menu-arrow"></i>
		</a>
			<div class="collapse" id="purchaseMore">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item"><a class="nav-link"
						href="${contextRoot}/admin/adminSupplier">Supplier Management</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${contextRoot}/admin/adminProduct">Product Management</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Order
							Management</a></li>
				</ul>
			</div></li>

		<li class="nav-item sidebar-category">
			<p>Apps</p> <span></span>
		</li>
		<li class="nav-item"><a class="nav-link" href=""> <i
				class="mdi mdi-file-document-box-outline menu-icon"></i> <span
				class="menu-title">Social Media</span>
		</a></li>
		<li class="nav-item"><a class="nav-link" href="">
				<button class="btn bg-danger btn-sm menu-title">Upgrade to
					pro</button>
		</a></li>
	</ul>
</nav>
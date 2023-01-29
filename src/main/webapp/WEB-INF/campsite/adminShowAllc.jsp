<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Lets Camping Admin</title>
<!-- base:css -->
<link rel="stylesheet"
	href="${contextRoot}/spica/vendors/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet"
	href="${contextRoot}/spica/vendors/css/vendor.bundle.base.css">
<!-- endinject -->
<!-- inject:css -->
<link rel="stylesheet" href="${contextRoot}/spica/css/style.css">
<!-- endinject -->
<link rel="shortcut icon" href="${contextRoot}/spica/images/favicon.png" />
<style>



.myAttention1 {
	color: red;
	font-size: 10px;
}


</style>
</head>

<body>
	<div class="container-scroller d-flex">
		<!-- partial:../../partials/_sidebar.html -->
		<jsp:include page="../admin_pages/partials/sidebar.jsp" />
		<!-- partial -->
		<div class="container-fluid page-body-wrapper">
			<!-- partial:../../partials/_navbar.html -->
			<jsp:include page="../admin_pages/partials/navbar.jsp" />
			<!-- partial -->
			<div class="main-panel">
				<div class="content-wrapper">
					<div class="row">

						<div class="col-lg-12 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">Edit</h4>
									<p class="card-description">Edit Campsite Pages</p>
									<div class="table-responsive">

										<table class="table table-striped">
											<thead>
												<tr>
													<th></th>
													<th></th>
													<th>Name 名稱</th>
													<th>Link 連結</th>
													<th>Update 更新</th>
													<th>Delete 刪除</th>
													<th>Photo 管理圖片</th>
												</tr>
											</thead>
											<tbody>

												<c:forEach items="${cslist}" var="cs">
													<form>
														<tr>
															<td class="py-1"><img
																src="${contextRoot}/myImage/camp${cs.id}.png"
																alt="image" class="myImage" onerror= /></td>
															<td>${cs.id}<input type="text" name="id"
																value="${cs.id}" style="display: none"></td>
															<td>${cs.campsiteName} </td>
															<td><a href="${contextRoot}/showSingle/${cs.id}"><span class="badge badge-pill badge-secondary">點擊前往前台頁面</span></a></td>
															<td>
																<button type="submit"
																	class="btn btn-warning btn-rounded btn-fw"
																	formmethod="get"
																	formaction="${contextRoot}/admin/uCamp/${cs.id}">Update</button>
															</td>
															<td>
																<button type="submit"
																	class="btn btn-danger btn-rounded btn-fw"
																	formmethod="post" formaction="${contextRoot}/dCamp">Delete</button>
															</td>
															<td>
																<!-- Button trigger modal -->
																<button type="button"
																	class="btn btn-info btn-rounded btn-fw"
																	data-toggle="modal"
																	data-target="#exampleModalLong${cs.id}">Photo</button>
																<!-- end of trigger modal -->
															</td>

														</tr>
													</form>




													<!-- Modal -->
													<%-- <div class="modal fade" id="exampleModalLong${cs.id}"
														tabindex="-1" role="dialog"
														aria-labelledby="exampleModalLongTitle" aria-hidden="true">
														<div class="modal-dialog" role="document">
															<div class="modal-content">
																<div class="modal-header">
																	<h5 class="modal-title" id="exampleModalLongTitle">Update
																		Photo 管理圖片</h5>
																	<button type="button" class="close"
																		data-dismiss="modal" aria-label="Close">
																		<span aria-hidden="true">&times;</span>
																	</button>
																</div>
																<div class="modal-body">

																	<!-- 彈出視窗內容的開始 -->
																	<div class="row">
																		<div class="col-12 grid-margin stretch-card">
																			<div class="card">
																				<div class="card-body">
																				<h4 class="card-title">更新主要圖片</h4>
																				
																				<div class="d-flex flex-row" id="showImgFile"></div>

																					</div>
																			</div>
																		</div>
																	</div>
																	<!-- 		彈出視窗內容的結尾 -->


																</div>
																<div class="modal-footer">
																	<div id="message"></div>
																	<button type="button"
																		class="btn btn-info btn-rounded btn-fw" id="postBTN2">Save
																		changes</button>


																</div>
															</div>
														</div>
													</div> --%>

													<!-- end of Modal -->









												</c:forEach>

											</tbody>
										</table>

									</div>
								</div>
							</div>
						</div>

					</div>
				</div>
				<!-- content-wrapper ends -->
				<!-- partial:../../partials/_footer.html -->
				<jsp:include page="../admin_pages/partials/footer.jsp" />
				<!-- partial -->
			</div>
			<!-- main-panel ends -->
		</div>
		<!-- page-body-wrapper ends -->
	</div>
	<!-- container-scroller -->
	<!-- base:js -->
	<script src="${contextRoot}/spica/vendors/js/vendor.bundle.base.js"></script>
	<!-- endinject -->
	<!-- Plugin js for this page-->
	<!-- End plugin js for this page-->
	<!-- inject:js -->
	<script src="${contextRoot}/spica/js/off-canvas.js"></script>
	<script src="${contextRoot}/spica/js/hoverable-collapse.js"></script>
	<script src=".${contextRoot}/spica/js/template.js"></script>
	<!-- endinject -->
	<!-- End custom js for this page-->
</body>

</html>

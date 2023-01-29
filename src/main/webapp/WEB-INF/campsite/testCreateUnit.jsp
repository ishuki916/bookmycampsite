<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
.invisible {
	display: none;
}

#tentContent {
	color: #4B0091;
}

#campervanContent {
	color: #009100;
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

						<div class="col-12 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">Update the Campsite 修改露營地資料</h4>
									<p class="card-description">update the page for customers
										to book your campsite</p>
									
																			
									<form:form method="post" action="${contextRoot}/cUnit"
										modelAttribute="cUnit" cssClass="forms-sample">
						
										<div class="form-group">
											<form:label path="unitId" cssStyle="display:none"></form:label>
											<form:input path="unitId" cssStyle="display:none"></form:input>
											
											<form:label path="unitType">unitType</form:label>
											<form:input path="unitType" cssClass="form-control"
												required="required"></form:input>
										</div>

										<div class="form-group">
											<form:label path="unitName">unitName</form:label>
											<form:input path="unitName" cssClass="form-control"
												required="required"></form:input>
										</div>

										<div class="form-group">
											<form:label path="campsiteId">campsiteId</form:label>
											<form:input path="campsiteId" cssClass="form-control"
												required="required"></form:input>
										</div>


										<button type="submit" class="btn btn-primary mr-2">Update</button>
									

									</form:form>
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
	<!-- inject:js -->
	<script src="${contextRoot}/spica/js/off-canvas.js"></script>
	<script src="${contextRoot}/spica/js/hoverable-collapse.js"></script>
	<script src="${contextRoot}/spica/js/template.js"></script>
	<!-- endinject -->
	<!-- plugin js for this page -->
	<!-- End plugin js for this page -->
	<!-- Custom js for this page-->
	<script src="${contextRoot}/spica/js/file-upload.js"></script>
	<!-- End custom js for this page-->
	<script>
		if (!document.getElementById("tent").checked) {
			document.getElementById("tentContent").classList.add("invisible");
		}
		document.getElementById("tent").addEventListener(
				"change",
				function() {
					document.getElementById("tentContent").classList
							.toggle("invisible");

				})
		if (!document.getElementById("campervan").checked) {
			document.getElementById("campervanContent").classList
					.add("invisible");
		}
		document.getElementById("campervan").addEventListener(
				"change",
				function() {
					document.getElementById("campervanContent").classList
							.toggle("invisible");
				})
	</script>
</body>

</html>
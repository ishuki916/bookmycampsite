<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>login page</title>
<!-- base:css -->
<link rel="stylesheet"
	href="${contextRoot}/spica/vendors/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet"
	href="${contextRoot}/spica/vendors/css/vendor.bundle.base.css">
<!-- endinject -->
<!-- plugin css for this page -->
<!-- End plugin css for this page -->
<!-- inject:css -->
<link rel="stylesheet" href="${contextRoot}/spica/css/style.css">
<!-- endinject -->
<link rel="shortcut icon" href="${contextRoot}/spica/images/favicon.png" />
<style>
input[type=checkbox] {
	border: 2px solid red;
	border-radius: 4px;
	color: red;
}
</style>
</head>

<body>
	<div class="container-scroller d-flex">
		<div
			class="container-fluid page-body-wrapper full-page-wrapper d-flex">
			<div class="content-wrapper d-flex align-items-center auth px-0">
				<div class="row w-100 mx-0">
					<div class="col-lg-4 mx-auto">
						<div class="auth-form-light text-left py-5 px-4 px-sm-5">
							<div class="brand-logo">
								<img src="${contextRoot}/images/img2.jpg" style="width:510px" alt="logo">
							</div>
							<h4>Hello! let's get started</h4>
							<h6 class="font-weight-light">Sign in to continue.</h6>
							<form class="pt-3"
								action="${pageContext.request.contextPath}/loginToBookPost" method="post">
								<div class="form-group">
									<input type="email" class="form-control form-control-lg"
										id="exampleInputEmail1" placeholder="Email" name="email">
								</div>
								<div class="form-group">
									<input type="password" class="form-control form-control-lg"
										id="exampleInputPassword1" placeholder="Password" name="pwd">
								</div>
								<div class="mt-3">
									<button type="submit"
										class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn">SIGN
										IN</button>
								</div>
								<c:if test="${userError != null}">

									<div
										class="my-2 d-flex justify-content-between align-items-center">
										<div class="form-check">
											<label class="form-check-label text-muted"> <input
												type="checkbox" class="form-check-input" id="uError">
												${userError}
											</label>
										</div>
										<a href="#" class="auth-link text-black">Forgot password?</a>
									</div>
								</c:if>
								<c:if test="${userError == null}">

									<div
										class="my-2 d-flex justify-content-between align-items-center">
										<div class="form-check">
											<label class="form-check-label text-muted"> <input
												type="checkbox" class="form-check-input">

											</label>
										</div>
										<a href="#" class="auth-link text-black">Forgot password?</a>
									</div>
								</c:if>
								<p>
								<div class="mb-2">
									<a type="button"
										class="btn btn-block btn-facebook auth-form-btn" href="https://accounts.google.com/o/oauth2/auth?scope=profile%20openid%20email&redirect_uri=http://localhost:8080/mycampsite/users/google&response_type=code
		   &client_id=37935886184-o5dk2fehl2kgfvcaiqeevmm10087slog.apps.googleusercontent.com
&approval_prompt=force">
										<i class="mdi mdi-google mr-2"></i>Connect using google
									</a>
								</div>
								<div class="text-center mt-4 font-weight-light">
									Don't have an account? <a
										href="${pageContext.request.contextPath}/registerPage"
										class="text-primary">Create</a>
										
										<input type="text" name="id" value="${id}" style="display:none">
										<input type="text" name="unitType" value="${unitType}" style="display:none">
								</div>
							</form>
							<button class="btn btn-sm btn-primary" id="cacheA">a</button>
								<button class="btn btn-sm btn-primary" id="cacheB">b</button>
								<button class="btn btn-sm btn-primary" id="cacheC">c</button>
						</div>
					</div>
				</div>
			</div>
			<!-- content-wrapper ends -->
		</div>
		<!-- page-body-wrapper ends -->
	</div>
	<!-- container-scroller -->
	<!-- base:js -->
	<script src="${contextRoot}/vendors/js/vendor.bundle.base.js"></script>
	<!-- endinject -->
	<!-- inject:js -->
	<script src="${contextRoot}/spica/js/off-canvas.js"></script>
	<script src="${contextRoot}/spica/js/hoverable-collapse.js"></script>
	<script src="${contextRoot}/spica/js/template.js"></script>
	<script src="${contextRoot}/js/jquery-3.6.1.min.js"></script>
	
	<script type="text/javascript">
	//let ue = document.getElementById("uError");
	//if (ue != null) {
	//	window.alert("account has not been verified, please check your email");
	//}
	
	if ('${userError}' != '') {
		window.alert('${userError}');
	}
	

	document
	.getElementById("cacheA")
	.addEventListener(
			"click",
			function() {
				document.getElementById("exampleInputEmail1").value = "aaa@aaa.aa";
				document.getElementById("exampleInputPassword1").value = "aaaa";
				
			})
	
		document
	.getElementById("cacheB")
	.addEventListener(
			"click",
			function() {
				document.getElementById("exampleInputEmail1").value = "bbb@bbb.bb";
				document.getElementById("exampleInputPassword1").value = "bbbb";
				
			})
	
		document
	.getElementById("cacheC")
	.addEventListener(
			"click",
			function() {
				document.getElementById("exampleInputEmail1").value = "ccc@ccc.cc";
				document.getElementById("exampleInputPassword1").value = "cccc";
				
			})
	
	</script>
	<!-- endinject -->
</body>

</html>

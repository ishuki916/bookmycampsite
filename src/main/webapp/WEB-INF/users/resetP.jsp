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
<title>register</title>
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
							<h6 class="font-weight-light">reset your password</h6>
							<form class="pt-3"
								action="${pageContext.request.contextPath}/reset"
								method="post">

								<div class="form-group">
									<label for="exampleInputName3">password</label> <input
										type="password" class="form-control form-control-lg" id="pwd"
										placeholder="Password" name="pwd" required>
								</div>
								<div class="form-group">
									<label for="exampleInputName3">password comfirm</label> <input
										type="password" class="form-control form-control-lg" id="pwd1"
										placeholder="Password Comfirm" required onkeyup="validate()">
									<span id="tishi" style="text-align: right"></span>
								</div>

								<div class="mt-3">
									<button type="submit"
										class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn">reset</button>

								</div>

							</form>
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
	<script src="${contextRoot}/spica/vendors/js/vendor.bundle.base.js"></script>
	<!-- endinject -->
	<!-- inject:js -->
	<script src="${contextRoot}/spica/js/off-canvas.js"></script>
	<script src="${contextRoot}/spica/js/hoverable-collapse.js"></script>
	<script src="${contextRoot}/spica/js/template.js"></script>
				<script src="${contextRoot}/spica/js/file-upload.js"></script>
	<!-- endinject -->
	<script>

			
			
			function validate() {

    var pwd1 = document.getElementById("pwd").value;

    var pwd2 = document.getElementById("pwd1").value;

 

<!-- 对比两次输入的密码 -->

    if(pwd1 == pwd2)

     {

        document.getElementById("tishi").innerHTML="<font color='green'>correct</font>";

        document.getElementById("button").disabled = false;

     }

else {

        document.getElementById("tishi").innerHTML="<font color='red'>wrong</font>";

        document.getElementById("button").disabled = true;

     }

}
  </script>
</body>

</html>

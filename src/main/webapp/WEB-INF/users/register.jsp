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
							<h4>New here?</h4>
							<h6 class="font-weight-light">Signing up is easy. It only
								takes a few steps</h6>
							<form class="pt-3"
								action="${pageContext.request.contextPath}/register"
								method="post">
								<div class="form-group">
									<label for="exampleInputName4">username</label> <input
										type="text" class="form-control form-control-lg"
										id="exampleInputUsername1" placeholder="Username"
										name="username" required>

								</div>
								<div class="form-group">
									<label for="exampleInputName2">email</label> <input
										type="email" class="form-control form-control-lg"
										id="exampleInputEmail1" placeholder="Email" name="email"
										required> <span class="badge badge-warning">${duplicated}</span>
								</div>

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

								<div class="form-group">
									<label for="exampleInputName5">phone</label> <input type="text"
										class="form-control form-control-lg"
										id="exampleInputUsername1" placeholder="Phone" name="phone"
										required>
								</div>
								<div class="form-group">
									<label for="exampleInputName5">birth</label> <input type="date"
										class="form-control form-control-lg"
										id="exampleInputUsername1" placeholder="birth" name="birth"
										required>
								</div>
								<div class="form-group">
									<label for="exampleInputName5">gender</label> <select
										class="form-control form-control-lg"
										id="exampleFormControlSelect2" name="gender" required>
										<option>male</option>
										<option>female</option>
									</select>
								</div>



<!-- 									<div class="row"> -->
<!-- 										<div class="col-md"> -->
<!-- 											<div class="form-group"> -->
<!-- 								<label>照片</label> -->
<!-- 								<div> -->
<!-- 													<input type="file" class="file-upload-default" id="file"> -->
<!-- 													<div class="input-group col-xs-12"> -->
<!-- 														<input type="text" class="form-control file-upload-info" -->
<!-- 															disabled placeholder="Upload Image"> <span -->
<!-- 															class="input-group-append"> -->
<!-- 															<button class="file-upload-browse btn btn-primary" -->
<!-- 																type="button">Upload</button> -->
<!-- 														</span> -->
<!-- 													</div> -->

<!-- 												</div> -->
<!-- 												</div></div></div> -->
<!-- 								<textarea name="image" id="photo" style="display: none"></textarea> -->
<!-- 								<div class="row"> -->
<!-- 									<div class="col-md-6"> -->
<!-- 										<div class="form-group"> -->
<!-- 											<label id="new"></label> -->
<!-- 											<div> -->
<!-- 												<img id="demo" style="width: 600px" /> -->
<!-- 											</div> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 								</div> -->
								<div class="mt-3">
									<button type="submit"
										class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn">SIGN
										UP</button>

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

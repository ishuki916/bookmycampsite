<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
		<!DOCTYPE html>
		<html lang="en">

		<head>
			<!-- Required meta tags -->
			<meta charset="utf-8">
			<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
			<title>create user</title>
			<!-- base:css -->
			<link rel="stylesheet" href="${contextRoot}/spica/vendors/mdi/css/materialdesignicons.min.css">
			<link rel="stylesheet" href="${contextRoot}/spica/vendors/css/vendor.bundle.base.css">
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
											<h4 class="card-title">創建新用戶</h4>
											
											<br>
											<br>
											<form action="${contextRoot}/admin/users/create" method="post" class="forms-sample">
												<div class="form-group">
													<label for="exampleInputName1">id</label> <input type="text" value="${user.id}"
														class="form-control" id="exampleInputName1" name="id" readonly="readonly"
														required>
												</div>
												<div class="form-group">
													<label for="exampleInputName2">email</label> <input value="${user.email}"
														type="text" class="form-control" id="exampleInputName2"
														name="email" required>
												</div>
												<div class="form-group">
													<label for="exampleInputName3">password</label> <input value="${user.pwd}"
														type="text" class="form-control" id="exampleInputName3"
														name="pwd" required>
												</div>
												<div class="form-group">
													<label for="exampleInputName4">username</label>
													<input value="${user.username}"
														type="text" class="form-control" id="exampleInputName4" 
														name="username" required>
												</div>
												<div class="form-group">
													<label for="exampleInputName5">auth</label>
												<!-- 	<input value="${user.auth}"
														type="text" class="form-control" id="exampleInputName5" 
														name="auth" required>  -->
													<select name="auth" class="form-control"
																	id="exampleFormControlSelect1">
																	<option value="true" selected>true</option>
																	<option value="false">false</option>

																</select>														
												</div>
												
												
												
												<div class="form-group">
													<label for="exampleInputName6">phone</label>
													<input value="${user.phone}"
														type="text" class="form-control" id="exampleInputName6" 
														name="phone" required>
												</div>
												
												<div class="form-group">
													<label for="exampleInputName7">gender</label>
														<select name="gender" class="form-control"
																	id="exampleFormControlSelect2">
																	<option value="male" selected>male</option>
																	<option value="female">female</option>

																</select>	
												</div>
												
												<div class="form-group">
													<label for="exampleInputName5">birth</label>
													<input value=""
														type="date" class="form-control" id="exampleInputName10" 
														name="birth" required>
												</div>
												
												<div class="form-group">
													<label for="exampleInputName5">level</label>
														<select name="lv" class="form-control"
																	id="exampleFormControlSelect3">
																	<option value="member" selected>member</option>
																	<option value="admin">admin</option>

																</select>	
												</div>
												
												<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label>原圖</label>
												<div>
													<img src="${user.image}" style="width: 600px" />
												</div>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label id="new"></label>
												<div>
													<img id="demo" style="width: 600px" />
												</div>
											</div>
										</div>
									</div>
										<div class="row">
										<div class="col-md">
											<div class="form-group">
												<label>照片</label>
												<div>
													<input type="file" class="file-upload-default" id="file">
													<div class="input-group col-xs-12">
														<input type="text" class="form-control file-upload-info"
															disabled placeholder="Upload Image" > <span
															class="input-group-append">
															<button class="file-upload-browse btn btn-primary"
																type="button">Upload</button> 
														</span>
													</div>
										
												</div>
															</div>
										</div>
									</div>
												<textarea name="image" id="photo" style="display:none"></textarea>
												
												<button type="submit" class="btn btn-primary mr-2">建立</button>

												<a class="btn btn-light" href="${contextRoot}/admin/users">Cancel</a>

											</form>
											<br>
													<button class="btn btn-sm btn-primary" id="cacheA">ac</button>
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
			
			const dateInput = document.getElementById('exampleInputName10');

			// ✅ Using the visitor's timezone
			console.log('${user.birth}');

			dateInput.value = formatDate('${user.birth}')[0];

			console.log(formatDate('${user.birth}')[0]);

			function padTo2Digits(num) {
			  return num.toString().padStart(2, '0');
			}

			function formatDate(date) {
			  return [
				date.replace(" 00:00:00.0", "")
				  ]
			}

			// ✅ Using UTC (universal coordinated time)
			// dateInput.value = new Date().toISOString().split('T')[0];

			// console.log(new Date().toISOString().split('T')[0]);
				$('#file').change(function() {
				var file = $('#file')[0].files[0];
				var reader = new FileReader;
				reader.onload = function(e) {
					var string = e.target.result
					$('#new').prepend('新圖')
					$('#photo').empty().prepend(string)
					$('#demo').attr('src', string);

				}
				reader.readAsDataURL(file);
			})
			
				document
	.getElementById("cacheA")
	.addEventListener(
			"click",
			function() {
				document.getElementById("exampleInputName2").value = "createUser@aaa.aa";
				document.getElementById("exampleInputName3").value = "cccc";
				document.getElementById("exampleInputName4").value = "newUser";
				document.getElementById("exampleFormControlSelect1").value = "true";
				document.getElementById("exampleInputName6").value = "0912345678";
				document.getElementById("exampleFormControlSelect2").value = "male";
				document.getElementById("exampleInputName10").value = "2000-01-01";
				document.getElementById("exampleFormControlSelect3").value = "member";
			})
	
			</script>
		</body>

		</html>
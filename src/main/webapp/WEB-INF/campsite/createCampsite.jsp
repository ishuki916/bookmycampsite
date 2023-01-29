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

									<h4 class="card-title">Create New Campsite 建立新露營地</h4>
									<p class="card-description">create a new page for customers
										to book your campsite</p>
									

								</div>
							</div>
						</div>



						<div class="col-12 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">

									<button type="button" class="btn btn-warning" id="myinput1">快速輸入</button>
									<br> <br>

									<form action="${contextRoot}/iCamp" method="post"
										class="forms-sample">
										<div class="form-group">
											<label for="exampleInputName1">Name 名稱</label> <input
												type="text" class="form-control" id="exampleInputName1"
												name="campsiteName" required>
										</div>
										<div class="form-group">
											<label for="exampleInputName2">Destination 縣市</label> <input
												type="text" class="form-control" id="exampleInputName2"
												name="destination" required>
										</div>
										<div class="form-group">
											<label for="exampleInputName3">Address 詳細地址</label> <input
												type="text" class="form-control" id="exampleInputName3"
												name="campsiteAddress" required>
										</div>
										<div class="form-group">
											<label for="exampleInputName4">Traffic 交通方式</label>
											<textarea class="form-control" id="exampleInputName4"
												rows="4" name="traffic" required></textarea>
										</div>
										<div class="form-group">
											<label for="exampleInputName5">Intro 介紹</label>
											<textarea class="form-control" id="exampleInputName5"
												rows="4" name="introduction" required></textarea>
										</div>




										<div class="form-check form-check-primary">
											<label class="form-check-label"> <input
												type="checkbox" class="form-check-input" id="tent">
												Tent 帳篷露營地
											</label>
										</div>
										<div id="tentContent">
											<button type="button" class="btn btn-warning" id="myinput2">快速輸入</button>
											<br> <br>

											<div class="form-group">
												<label for="exampleInputName6">Intro 介紹與說明</label>
												<textarea class="form-control" id="exampleInputName6"
													rows="4" name="taIntro"></textarea>
											</div>
											<div class="form-group">
												<label for="exampleInputName7">Price 一晚價格</label> <input
													type="text" class="form-control" id="exampleInputName7"
													name="pricePerNightsTA" placeholder="2000">
											</div>
											<div class="form-group">
												<label for="exampleInputName8">Amount 可租借數量</label> <input
													type="text" class="form-control" id="exampleInputName8"
													name="tentAreaAmount" placeholder="20">
											</div>

										</div>
										<div class="form-check form-check-success">
											<label class="form-check-label"> <input
												type="checkbox" class="form-check-input" id="campervan">
												Campervan 露營車營地
											</label>
										</div>
										<div id="campervanContent">

											<button type="button" class="btn btn-warning" id="myinput3">快速輸入</button>
											<br> <br>
											<div class="form-group">
												<label for="exampleInputName9">Intro 介紹與說明 </label>
												<textarea class="form-control" id="exampleInputName9"
													rows="4" name="caIntro"></textarea>
											</div>
											<div class="form-group">
												<label for="exampleInputName10">Price 一晚價格</label> <input
													type="text" class="form-control" id="exampleInputName10"
													name="pricePerNightsCA" placeholder="2000">
											</div>
											<div class="form-group">
												<label for="exampleInputName11">Amount 可租借數量</label> <input
													type="text" class="form-control" id="exampleInputName11"
													name="campervanAreaAmount" placeholder="20">
											</div>
										</div>
										<br> <br> <br>
										<div class="row">

											<div class="col-md-6">
												<div class="form-group">
													<div class="form-group">
														<label for="exampleFormControlSelect1">Toilet 廁所 </label>
														<select name="toilet" class="form-control"
															id="exampleFormControlSelect1">
															<option value="Y" selected>Yes</option>
															<option value="N">No</option>

														</select>
													</div>

													<div class="form-group">
														<label for="exampleFormControlSelect2">Shower Room
															淋浴間 </label> <select name="showerRoom" class="form-control"
															id="exampleFormControlSelect2">
															<option value="Y" selected>Yes</option>
															<option value="N">No</option>

														</select>
													</div>

													<div class="form-group">
														<label for="exampleFormControlSelect3">Garbage Can
															垃圾集中處 </label> <select name="garbage" class="form-control"
															id="exampleFormControlSelect3">
															<option value="Y" selected>Yes</option>
															<option value="N">No</option>

														</select>
													</div>

													<div class="form-group">
														<label for="exampleFormControlSelect4"> Wifi 網路 供電
														</label> <select name="wifi" class="form-control"
															id="exampleFormControlSelect4">
															<option value="Y" selected>Yes</option>
															<option value="N">No</option>

														</select>
													</div>

													<div class="form-group">
														<label for="exampleFormControlSelect5">24hr
															Manager 全日管理員 </label> <select name="Manager"
															class="form-control" id="exampleFormControlSelect5">
															<option value="Y" selected>Yes</option>
															<option value="N">No</option>

														</select>
													</div>


													<div class="form-group">
														<label for="exampleFormControlSelect6">Power
															Chargers 供電 </label> <select name="charge" class="form-control"
															id="exampleFormControlSelect6">
															<option value="Y" selected>Yes</option>
															<option value="N">No</option>

														</select>
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label for="exampleFormControlSelect7">Refrigerator
														冰箱 </label> <select name="refrigerator" class="form-control"
														id="exampleFormControlSelect7">
														<option value="Y" selected>Yes</option>
														<option value="N">No</option>

													</select>
												</div>

												<div class="form-group">
													<label for="exampleFormControlSelect8">KitchenSink
														水槽 </label> <select name="kitchenSink" class="form-control"
														id="exampleFormControlSelect8">
														<option value="Y" selected>Yes</option>
														<option value="N">No</option>

													</select>
												</div>

												<div class="form-group">
													<label for="exampleFormControlSelect9">Rent Bike
														腳踏車租借 </label> <select name="rentBike" class="form-control"
														id="exampleFormControlSelect9">
														<option value="Y" selected>Yes</option>
														<option value="N">No</option>

													</select>
												</div>

												<div class="form-group">
													<label for="exampleFormControlSelect10">Washer 洗衣機
													</label> <select name="washer" class="form-control"
														id="exampleFormControlSelect10">
														<option value="Y" selected>Yes</option>
														<option value="N">No</option>

													</select>
												</div>

												<div class="form-group">
													<label for="exampleFormControlSelect11">Cafe & Bar
														咖啡餐飲</label> <select name="cafeBar" class="form-control"
														id="exampleFormControlSelect11">
														<option value="Y" selected>Yes</option>
														<option value="N">No</option>

													</select>
												</div>

												<div class="form-group">
													<label for="exampleFormControlSelect12">With Pets
														可攜寵物</label> <select name="withPets" class="form-control"
														id="exampleFormControlSelect12">
														<option value="Y" selected>Yes</option>
														<option value="N">No</option>

													</select>
												</div>

											</div>
										</div>




										<button type="submit" class="btn btn-primary mr-2"
											>Next</button>
										

									</form>
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
		document.getElementById("tentContent").classList.add("invisible");
		document.getElementById("tent").addEventListener(
				"change",
				function() {
					document.getElementById("tentContent").classList
							.toggle("invisible");

				})
		document.getElementById("campervanContent").classList.add("invisible");
		document.getElementById("campervan").addEventListener(
				"change",
				function() {
					document.getElementById("campervanContent").classList
							.toggle("invisible");
				})
		document
				.getElementById("myinput1")
				.addEventListener(
						"click",
						function() {
							document.getElementById("exampleInputName1").value = "拿哥的秘密基地浪漫露營區";
							document.getElementById("exampleInputName2").value = "南投縣";
							document.getElementById("exampleInputName3").value = "南投縣信義鄉和平巷85~3號";
							document.getElementById("exampleInputName4").value = "日月潭德化社往秘密基地約10~15分鐘的車程可達";
							document.getElementById("exampleInputName5").value = "拿哥的秘密基地是浪漫露營區，露營小木屋，位於南投信義鄉，提供民宿、露營小木屋區，是最適合公司行號，朋友聚會，親子，三代同堂一起出遊的最佳選擇。";

						})
		document
				.getElementById("myinput2")
				.addEventListener(
						"click",
						function() {
							document.getElementById("exampleInputName6").value = "長270，寬250，營區內電源插座禁用高功率之電器產品,如電磁爐.電暖爐.烤箱.電毯.氣炸鍋等等(可使用電鍋)預防跳電。";
							document.getElementById("exampleInputName7").value = "2000";
							document.getElementById("exampleInputName8").value = "8";
						})

		document
				.getElementById("myinput3")
				.addEventListener(
						"click",
						function() {
							document.getElementById("exampleInputName9").value = "長400，寬350，營區內電源插座禁用高功率之電器產品,如電磁爐.電暖爐.烤箱.電毯.氣炸鍋等等(可使用電鍋)預防跳電。";
							document.getElementById("exampleInputName10").value = "2500";
							document.getElementById("exampleInputName11").value = "8";
						})
						
						


	</script>
</body>

</html>
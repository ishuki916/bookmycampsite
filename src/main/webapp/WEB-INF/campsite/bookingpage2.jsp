<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
		<!DOCTYPE html>
		<html lang="en">

		<head>
			<title>Lets Camping</title>
			<meta charset="utf-8">
			<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

			<!-- 勿動 -->
			<jsp:include page="../layout/include_linkhref.jsp" />
			<link href="${contextRoot}/muwei/booking.css" rel="stylesheet">

			<style>
				.mycard1,
				mycard2 {
					height: 400px;
				}
			</style>
		</head>

		<body>
			<!-- 勿動 -->
			<jsp:include page="../layout/include_nav.jsp" />

			<%-- <div class="hero-wrap js-fullheight"
				style="background-image: url('${contextRoot}/myImage/bookingbanner.png');">
				<div class="overlay"></div>
				<div class="container">
					<div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center"
						data-scrollax-parent="true">
						<div class="col-md-9 ftco-animate text-center"
							data-scrollax=" properties: { translateY: '70%' }">
							<p class="breadcrumbs" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">
								<span class="mr-2"><a href="">Home</a></span> <span class="mr-2"></span>
								<span>Campsite Single</span>
							</p>
							<h1 class="mb-3 bread" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">
								Campsites
								Details</h1>
						</div>
					</div>
				</div>
				</div> --%>

				<section class="ftco-section ftco-degree-bg">
					<div class="container">
						<div class="row">
							

							<!-- another version - flat style with animated hover
							 effect -->
							<div class="breadcrumb flat" style="display: block">
								<a href="#"> Select Date 確認日期</a> <a href="#" class="active">Select
									Area 選位</a> <a href="#">Shopping Cart 購物車</a> 
							</div>
							<div class="row">
								<form action="${contextRoot}/booking3" method="post">
								<input type="text" name="campsiteId" id="campsiteId" value="${cs.id}" style="display: none">
									<div class="col-sm-12" style="margin-bottom: 10px">
										<div class="card border-success  bg-transparent ">
											<div class="card-body">
												<h5 class="card-title">您所預定的露營地為：${cs.campsiteName}</h5>
												<p class="card-text"></p>

											</div>
										</div>
									</div>


									<div class="row">
										<div class="col-sm-8 ">
											<div class="card-deck border-success bg-transparent ">
												<div class="card-body">

													<img src="${contextRoot}/myImage/areamap.png" style="width: 750px">
												</div>
											</div>
										</div>
										<div class="col-sm-4 ">
											<div class="card  border-success ">
												<div class="card-body">
													<h5 class="card-title">選擇結果</h5>

													<div class="input-group mb-3 ">

													</div>

													<div class="input-group mb-3 ">
														<label for="basic-url"></label>
														<div class="input-group mb-3">
															<div class="input-group-prepend">
																<span class="input-group-text"
																	id="basic-addon3">日期</span>
															</div>
															<input type="text" class="form-control" id="basic-url"
																aria-describedby="basic-addon3" value="${date}"
																name="mydate" readonly>
														</div>
														<div class="input-group mb-3">
															<div class="input-group-prepend">
																<span class="input-group-text"
																	id="basic-addon3">區域類型</span>
															</div>
															<input type="text" class="form-control" id="unitType"
																aria-describedby="basic-addon3" name="unitType"
																value="${unitType}" readonly>
														</div>
														<div class="input-group mb-3">
															<div class="input-group-prepend">
																<span class="input-group-text">單價 $</span>
															</div>
															<input type="text" class="form-control"
																aria-label="Amount (to the nearest dollar)" value=""
																id="pricePerNights" name="pricePerNights" readonly>
															<div class="input-group-append">
																<span class="input-group-text">.00</span>
															</div>
														</div>

														<div class="input-group mb-3 ">
															<div class="input-group-prepend">
																<label class="input-group-text"
																	for="inputGroupSelect01">區塊</label>
															</div>
															<select class="custom-select" id="myoption"
																name="unitIdList" multiple="multiple">
																<c:forEach items="${culist}" var="cu">
																	<option value="${cu.unitId}">${cu.unitName}
																	</option>
																</c:forEach>

															</select>
														</div>


														<br>
														<br> <label for="basic-url"></label>
														<div class="input-group mb-3">
															<div class="input-group-prepend">
																<span class="input-group-text"
																	id="basic-addon3">選取數量</span>
															</div>
															<input type="text" class="form-control" id="selectedAmount"
																aria-describedby="basic-addon3" readonly>
														</div>



														<div class="input-group mb-3">
															<div class="input-group-prepend">
																<span class="input-group-text">總價 $</span>
															</div>
															<input type="text" class="form-control"
																aria-label="Amount (to the nearest dollar)" id="mysum"
																readonly>
															<div class="input-group-append">
																<span class="input-group-text">.00</span>
															</div>
														</div>
													</div>


												</div>
											</div>

										</div>
									</div>
									<div class="col-sm-12" style="margin-top: 10px" id='nextbtndiv'>

										<button type="button" class="btn btn-lg btn-block">
											下一步<i class="far fa-arrow-alt-circle-right"></i>
										</button>

									</div>
								</form>

							</div>


							<!-- .col-md-8 -->
						</div>
					</div>
				</section>
				<!-- .section -->

				<!-- 勿動 -->
				<jsp:include page="../layout/include_footer.jsp" />
				<!-- 勿動 -->
				<jsp:include page="../layout/include_scriptSrc.jsp" />

				<script>
					var myoption = document.getElementById("myoption");
					var selectedAmount = document.getElementById("selectedAmount");
					var mysum = document.getElementById("mysum");
					var pricePerNights = document.getElementById("pricePerNights");
					var nextbtndiv = document.getElementById("nextbtndiv");
					function load() {
						var unitType = document.getElementById("unitType");

						if (unitType.value.indexOf("TA") != -1) {
							unitType.value += "帳篷露營地";
							pricePerNights.value = "${cs.pricePerNightsTA}";
						}
						if (unitType.value.indexOf("CA") != -1) {
							unitType.value += "露營車露營地";
							pricePerNights.value = "${cs.pricePerNightsCA}";
						}


					}

					load();
					myoption.addEventListener("change", function (e) {
						selectedAmount.value = e.target.selectedOptions.length;

						mysum.value = selectedAmount.value * pricePerNights.value;
						nextbtndiv.innerHTML = "<button type='submit' class='btn btn-lg btn-success btn-block' id='nextbtn'>下一步<i class='far fa-arrow-alt-circle-right'></i></button>";

					})




				</script>


		</body>

		</html>
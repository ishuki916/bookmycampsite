<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<title>Lets Camping</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- 勿動 -->
<jsp:include page="../layout/include_linkhref.jsp" />


<style>
.myCampsite {
	height: 450px;
}

.mycheckbox {
	margin-left: 5px;
}
</style>
</head>
<body>
	<!-- 勿動 -->
	<jsp:include page="../layout/include_nav.jsp" />

	<div class="hero-wrap js-fullheight"
		style="background-image: url('myImage/camp5_1.jpeg');">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text js-fullheight align-items-center justify-content-center"
				data-scrollax-parent="true">
				<div class="col-md-9 ftco-animate text-center"
					data-scrollax=" properties: { translateY: '70%' }">
					<p class="breadcrumbs"
						data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">
						<span class="mr-2"><a href="">Home</a></span> <span>Campsite</span>
					</p>
					<h1 class="mb-3 bread"
						data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">Campsite</h1>
					<c:if test="${not empty dchecked || not empty cpcheckedshort}">
						<p>你搜尋的關鍵字有...</p>

						<span class="badge badge-pill badge-primary">${dchecked}</span>

						<c:forEach items="${cpcheckedshort}" var="cps">
							<span class="badge badge-pill badge-warning">${cps}</span>
						</c:forEach>

					</c:if>
				</div>
			</div>


		</div>
	</div>


	<section class="ftco-section ftco-degree-bg">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 sidebar">
					<form action="selectByCheck" method="post">
						<div class="sidebar-wrap bg-light ftco-animate">
							<h3 class="heading mb-4">Find your favorite</h3>



							<div class="fields">
								
								<div class="form-group">
									<div class="select-wrap one-third">
										<div class="icon">
											<span class="ion-ios-arrow-down"></span>
										</div>
										<select name="destination" id="" class="form-control"
											placeholder="Keyword search">
											<option value="">All destination</option>
											<c:forEach items="${destinationList}" var="ds">
												<c:choose>
													<c:when test="${dchecked == ds}">
														<option value="${dchecked}" selected>${dchecked}</option>
													</c:when>
													<c:otherwise>
														<option value="${ds}">${ds}</option>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</select>
									</div>
								</div>


								<!-- 	<div class="form-group">
									<div class="range-slider">
										<span> <input type="number" value="25000" min="0"
											max="120000" /> - <input type="number" value="50000" min="0"
											max="120000" />
										</span> <input value="1000" min="0" max="120000" step="500"
											type="range" /> <input value="50000" min="0" max="120000"
											step="500" type="range" />
										</svg>
									</div>
								</div> -->
								<div class="star-rating">
									<div class="form-check">

										<input type="checkbox" name="campsitePro" value="tentarea"
											class="form-check-input" id="exampleCheck0" checked
											style="display: none"> <label
											class="form-check-label" for="exampleCheck0">
											<p class="rate">
												<i class="fas fa-campground"></i><span class="mycheckbox">Tent
													露營地</span>
											</p>
										</label>
									</div>
									<div class="form-check">
										<c:choose>
											<c:when test="${cpchecked[0] ge 'campervan'}">
												<input type="checkbox" name="campsitePro" value="campervan"
													class="form-check-input" id="exampleCheck1" checked>
											</c:when>
											<c:otherwise>
												<input type="checkbox" name="campsitePro" value="campervan"
													class="form-check-input" id="exampleCheck1">
											</c:otherwise>
										</c:choose>
										<label class="form-check-label" for="exampleCheck1">
											<p class="rate">
												<i class="fas fa-truck"></i><span class="mycheckbox">Camper
													van 露營車營地</span>
											</p>
										</label>
									</div>
									<div class="form-check">
										<c:choose>
											<c:when test="${cpchecked[1] ge 'toilet'}">
												<input type="checkbox" name="campsitePro" value="toilet"
													class="form-check-input" id="exampleCheck2" checked>
											</c:when>
											<c:otherwise>
												<input type="checkbox" name="campsitePro" value="toilet"
													class="form-check-input" id="exampleCheck2">
											</c:otherwise>
										</c:choose>
										<label class="form-check-label" for="exampleCheck2">
											<p class="rate">
												<i class="fas fa-toilet-paper"></i><span class="mycheckbox">Toilet
													廁所</span>
											</p>
										</label>

									</div>
									<div class="form-check">
										<c:choose>
											<c:when test="${cpchecked[2] ge 'showerRoom'}">
												<input type="checkbox" name="campsitePro" value="showerRoom"
													class="form-check-input" id="exampleCheck3" checked>
											</c:when>
											<c:otherwise>
												<input type="checkbox" name="campsitePro" value="showerRoom"
													class="form-check-input" id="exampleCheck3">
											</c:otherwise>
										</c:choose>
										<label class="form-check-label" for="exampleCheck3">
											<p class="rate">
												<i class="fas fa-shower"></i><span class="mycheckbox">Shower
													Room 淋浴間 </span>
											</p>
										</label>

									</div>
									<div class="form-check">
										<c:choose>
											<c:when test="${cpchecked[3] ge 'garbage'}">
												<input type="checkbox" name="campsitePro" value="garbage"
													class="form-check-input" id="exampleCheck4" checked>
											</c:when>
											<c:otherwise>
												<input type="checkbox" name="campsitePro" value="garbage"
													class="form-check-input" id="exampleCheck4">
											</c:otherwise>
										</c:choose>
										<label class="form-check-label" for="exampleCheck4">
											<p class="rate">
												<i class="fas fa-trash-alt"></i><span class="mycheckbox">Garbage
													Can 垃圾集中處 </span>
											</p>
										</label>

									</div>
									<div class="form-check">
										<c:choose>
											<c:when test="${cpchecked[4] ge 'wifi'}">
												<input type="checkbox" name="campsitePro" value="wifi"
													class="form-check-input" id="exampleCheck5" checked>
											</c:when>
											<c:otherwise>
												<input type="checkbox" name="campsitePro" value="wifi"
													class="form-check-input" id="exampleCheck5">
											</c:otherwise>
										</c:choose>
										<label class="form-check-label" for="exampleCheck5">
											<p class="rate">
												<i class="fas fa-wifi"></i><span class="mycheckbox">Wifi
													網路 </span>
											</p>
										</label>

									</div>
									<div class="form-check">
										<c:choose>
											<c:when test="${cpchecked[5] ge 'Manager'}">
												<input type="checkbox" name="campsitePro" value="Manager"
													class="form-check-input" id="exampleCheck6" checked>
											</c:when>
											<c:otherwise>
												<input type="checkbox" name="campsitePro" value="Manager"
													class="form-check-input" id="exampleCheck6">
											</c:otherwise>
										</c:choose>
										<label class="form-check-label" for="exampleCheck6">
											<p class="rate">
												<i class="fas fa-user-tie"></i><span class="mycheckbox">24hr
													Manager 全日管理員</span>
											</p>
										</label>

									</div>
									<div class="form-check">
										<c:choose>
											<c:when test="${cpchecked[6] ge 'charge'}">
												<input type="checkbox" name="campsitePro" value="charge"
													class="form-check-input" id="exampleCheck7" checked>
											</c:when>
											<c:otherwise>
												<input type="checkbox" name="campsitePro" value="charge"
													class="form-check-input" id="exampleCheck7">
											</c:otherwise>
										</c:choose>
										<label class="form-check-label" for="exampleCheck7">
											<p class="rate">
												<i class="fas fa-plug"></i><span class="mycheckbox">Power
													Chargers 供電</span>
											</p>
										</label>

									</div>
									<div class="form-check">
										<c:choose>
											<c:when test="${cpchecked[7] ge 'refrigerator'}">
												<input type="checkbox" name="campsitePro"
													value="refrigerator" class="form-check-input"
													id="exampleCheck8" checked>
											</c:when>
											<c:otherwise>
												<input type="checkbox" name="campsitePro"
													value="refrigerator" class="form-check-input"
													id="exampleCheck8">
											</c:otherwise>
										</c:choose>
										<label class="form-check-label" for="exampleCheck8">
											<p class="rate">
												<i class="fas fa-icicles"></i><span class="mycheckbox">Refrigerator
													冰箱</span>
											</p>
										</label>
									</div>
									<div class="form-check">
										<c:choose>
											<c:when test="${cpchecked[8] ge 'kitchenSink'}">
												<input type="checkbox" name="campsitePro"
													value="kitchenSink" class="form-check-input"
													id="exampleCheck9" checked>
											</c:when>
											<c:otherwise>
												<input type="checkbox" name="campsitePro"
													value="kitchenSink" class="form-check-input"
													id="exampleCheck9">
											</c:otherwise>
										</c:choose>
										<label class="form-check-label" for="exampleCheck9">
											<p class="rate">
												<i class="fas fa-tint"></i><span class="mycheckbox">KitchenSink
													水槽 </span>
											</p>
										</label>
									</div>
									<div class="form-check">
										<c:choose>
											<c:when test="${cpchecked[9] ge 'rentBike'}">
												<input type="checkbox" name="campsitePro" value="rentBike"
													class="form-check-input" id="exampleCheck10" checked>
											</c:when>
											<c:otherwise>
												<input type="checkbox" name="campsitePro" value="rentBike"
													class="form-check-input" id="exampleCheck10">
											</c:otherwise>
										</c:choose>
										<label class="form-check-label" for="exampleCheck10">
											<p class="rate">
												<i class="fas fa-bicycle"></i><span class="mycheckbox">Rent
													Bike 腳踏車租借</span>
											</p>
										</label>
									</div>
									<div class="form-check">
										<c:choose>
											<c:when test="${cpchecked[10] ge 'washer'}">
												<input type="checkbox" name="campsitePro" value="washer"
													class="form-check-input" id="exampleCheck11" checked>
											</c:when>
											<c:otherwise>
												<input type="checkbox" name="campsitePro" value="washer"
													class="form-check-input" id="exampleCheck11">
											</c:otherwise>
										</c:choose>
										<label class="form-check-label" for="exampleCheck11">
											<p class="rate">
												<i class="fas fa-tshirt"></i><span class="mycheckbox">Washer
													洗衣機</span>
											</p>
										</label>
									</div>
									<div class="form-check">
										<c:choose>
											<c:when test="${cpchecked[11] ge 'cafeBar'}">
												<input type="checkbox" name="campsitePro" value="cafeBar"
													class="form-check-input" id="exampleCheck12" checked>
											</c:when>
											<c:otherwise>
												<input type="checkbox" name="campsitePro" value="cafeBar"
													class="form-check-input" id="exampleCheck12">
											</c:otherwise>
										</c:choose>
										<label class="form-check-label" for="exampleCheck12">
											<p class="rate">
												<i class="fas fa-coffee"></i><span class="mycheckbox">Cafe
													& Bar 咖啡餐飲 </span>
											</p>
										</label>
									</div>
									<div class="form-check">
										<c:choose>
											<c:when test="${cpchecked[12] ge 'withPets'}">
												<input type="checkbox" name="campsitePro" value="withPets"
													class="form-check-input" id="exampleCheck13" checked>
											</c:when>
											<c:otherwise>
												<input type="checkbox" name="campsitePro" value="withPets"
													class="form-check-input" id="exampleCheck13">
											</c:otherwise>
										</c:choose>
										<label class="form-check-label" for="exampleCheck13">
											<p class="rate">
												<i class="fas fa-dog"></i><span class="mycheckbox">With
													Pets 可攜寵物 </span>
											</p>
										</label> <input type="submit" value="Search"
											class="btn btn-primary py-3 px-5">
									</div>
								</div>
							</div>

						</div>



					</form>
				</div>



				<div class="col-lg-9">
					<div class="row">
						<c:forEach items="${cslist}" var="cs">
							<div class="col-md-4 ftco-animate">

								<div class="destination">

									<a href="${contextRoot}/showSingle/${cs.id}"
										class="img img-2 d-flex justify-content-center align-items-center"
										style="background-image: url(myImage/camp${cs.id}.png);">
										<div
											class="icon d-flex justify-content-center align-items-center">
											<span class="icon-search2"></span>
										</div>
									</a>
									<div class="myCampsite text p-3">
										<div class="d-flex">
											<div class="one">

												<h3>
													<a href="${contextRoot}/showSingle/${cs.id}">${cs.campsiteName}</a>
												</h3>
												<p class="rate">
													<c:choose>
														<c:when test="${cs.campervanAreaAmount ne 0}">
															<span><i class="fas fa-truck"></i>Camper van AVL </span>
														</c:when>
														<c:otherwise>
															<span><i class="fas fa-campground"></i>Tent only</span>
														</c:otherwise>
													</c:choose>
												</p>
											</div>
											<div class="two">
												<span class="price per-price"> <i
													class="fas fa-binoculars"></i></span>
											</div>
										</div>
										<p>${cs.introduction}</p>
										<hr>
										<p class="bottom-area d-flex">
											<span><i class="icon-map-o"></i> ${cs.destination}</span> <span
												class="ml-auto"><a href="${contextRoot}/bookingCampsite?id=${cs.id}&unitType=TA">Book Now</a></span>
										</p>
									</div>

								</div>

							</div>

						</c:forEach>

						<!-- 		<div class="row mt-5">
							<div class="col text-center">
								<div class="block-27">
									<ul>
										<li><a href="#">&lt;</a></li>
										<li class="active"><span>1</span></li>
										<li><a href="#">2</a></li>
										<li><a href="#">3</a></li>
										<li><a href="#">4</a></li>
										<li><a href="#">5</a></li>
										<li><a href="#">&gt;</a></li>
									</ul>
								</div>
							</div>
						</div> -->
					</div>
					<!-- .col-md-8 -->
				</div>
			</div>
		</div>
	</section>
	<!-- .section -->

	<!-- 勿動 -->
	<jsp:include page="../layout/include_footer.jsp" />
	<!-- 勿動 -->
	<jsp:include page="../layout/include_scriptSrc.jsp" />


</body>
</html>
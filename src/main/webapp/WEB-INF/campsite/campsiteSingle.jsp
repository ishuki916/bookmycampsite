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
			<style>
	
			</style>
		</head>

		<body>
			<!-- 勿動 -->
			<jsp:include page="../layout/include_nav.jsp" />

			<div class="hero-wrap js-fullheight"
				style="background-image: url('${contextRoot}/myImage/camp${csingle.id}.png');">
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
			</div>


			<section class="ftco-section ftco-degree-bg">
				<div class="container">
					<div class="row">

						<div class="col-lg-12">
							<div class="row">
								<div class="col-md-12 ftco-animate">
									<div class="single-slider owl-carousel">
										<div class="item">
											<div class="hotel-img"
												style="background-image: url(${contextRoot}/myImage/camp${csingle.id}_1.png);">
											</div>
										</div>
										<div class="item">
											<div class="hotel-img"
												style="background-image: url(${contextRoot}/myImage/camp${csingle.id}_2.png);">
											</div>
										</div>
										<div class="item">
											<div class="hotel-img"
												style="background-image: url(${contextRoot}/myImage/camp${csingle.id}_3.png);">
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-12 hotel-single mt-4 mb-5 ftco-animate">
									<span class="badge badge-warning">${csingle.destination}</span>
									<h2>${csingle.campsiteName}</h2>
									<p class="rate mb-5">
										<span class="loc"><i class="icon-map"></i>
											${csingle.campsiteAddress}</span> <span class="star">
											<c:if test="${csingle.toilet=='Y'}">
												<span class="badge badge-danger myit1"> <i
														class="fas fa-toilet-paper"></i>
												</span>
											</c:if>
											<c:if test="${csingle.showerRoom=='Y'}">
												<span class="badge badge-danger myit2"><i
														class="fas fa-shower"></i></span>
											</c:if>
											<c:if test="${csingle.garbage=='Y'}">
												<span class="badge badge-danger myit3"><i
														class="fas fa-trash-alt"></i></span>
											</c:if>
											<c:if test="${csingle.wifi=='Y'}">
												<span class="badge badge-danger myit4"><i
														class="fas fa-wifi"></i></span>
											</c:if>
											<c:if test="${csingle.manager=='Y'}">
												<span class="badge badge-danger myit5"><i
														class="fas fa-user-tie"></i></span>
											</c:if>
											<c:if test="${csingle.charge=='Y'}">
												<span class="badge badge-danger myit6"><i
														class="fas fa-plug"></i></span>
											</c:if>
											<c:if test="${csingle.refrigerator=='Y'}">
												<span class="badge badge-danger myit7"><i
														class="fas fa-icicles"></i></span>
											</c:if>
											<c:if test="${csingle.kitchenSink=='Y'}">
												<span class="badge badge-danger myit8"><i
														class="fas fa-tint"></i></span>
											</c:if>
											<c:if test="${csingle.rentBike=='Y'}">
												<span class="badge badge-danger myit9"><i
														class="fas fa-bicycle"></i></span>
											</c:if>
											<c:if test="${csingle.washer=='Y'}">
												<span class="badge badge-danger myit10"><i
														class="fas fa-tshirt"></i></span>
											</c:if>
											<c:if test="${csingle.cafeBar=='Y'}">
												<span class="badge badge-danger myit11"><i
														class="fas fa-coffee"></i></span>
											</c:if>
											<c:if test="${csingle.withPets=='Y'}">
												<span class="badge badge-danger myit12"><i
														class="fas fa-dog"></i></span>
											</c:if>

										</span>
									</p>
									<p>${csingle.introduction}</p>
									<span class="badge badge-warning">交通方式</span>
									<p>${csingle.traffic}</p>
									<!-- <p>
										<iframe
											src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3186.8268536384203!2d138.71689421441852!3d36.990065964690125!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x5ff5fea5b4ccaa95%3A0x5ad13e00791a0658!2z5bex77yR77yX77yU77ySIFNlaWRheWFtYSwgVG9rYW1hY2hpLCBOaWlnYXRhIDk0OS04NDQ05pel5pys!5e0!3m2!1szh-TW!2stw!4v1671170465263!5m2!1szh-TW!2stw"
											width="600" height="450" style="border: 0;" allowfullscreen=""
											loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>

									</p> -->
									<div class="d-md-flex mt-5 mb-5">
										<c:if test="${csingle.tentAreaAmount>0}">
											<ul>
												<li><span class="badge badge-success"><i
															class="fas fa-campground"></i>Tent 露營地</span></li>
												<li>可供租借數量：${csingle.tentAreaAmount}</li>
												<li>${csingle.taIntro}</li>
												<li><i class="fas fa-dollar-sign"></i>
													新台幣${csingle.pricePerNightsTA}</li>
												<li><button type="button" class="btn btn-warning"><a href="${contextRoot}/bookingCampsite?id=${csingle.id}&unitType=TA">Book
														Now</a></button></li>
											</ul>
										</c:if>
										<c:if test="${csingle.campervanAreaAmount>0}">
											<ul class="ml-md-5">
												<li><span class="badge badge-success"><i class="fas fa-truck"></i>Camper
														van 露營車營地</span></li>
												<li>可供租借數量：${csingle.campervanAreaAmount}</li>
												<li>${csingle.caIntro}</li>
												<li><i class="fas fa-dollar-sign"></i>新台幣${csingle.pricePerNightsCA}
												</li>
												<li><button type="button" class="btn btn-warning"><a href="${contextRoot}/bookingCampsite?id=${csingle.id}&unitType=CA">Book
														Now</a></button></li>
											</ul>
										</c:if>
									</div>


								</div>
					






							</div>
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

		</body>

		</html>
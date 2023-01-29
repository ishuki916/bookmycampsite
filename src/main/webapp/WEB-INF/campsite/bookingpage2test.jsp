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
									<input type="text" name="campsiteId" id="campsiteId" value="${cs.id}"
										style="display: none">
									<input type="text" name="" id="xyPosTest" style="display: none">
									<div class="col-sm-12" style="margin-bottom: 10px">
										<div class="card border-success  bg-transparent ">
											<div class="card-body">
												<h5 class="card-title">您所預定的露營地為：${cs.campsiteName}</h5>
												<p class="card-text"></p>

											</div>
										</div>
									</div>


									<div class="row">
										<div class="col-sm-9 ">
											<div class="card-deck border-success bg-transparent ">
												<div class="card-body">
													<canvas id="myCanvas" width="920" height="600"></canvas>
												</div>
											</div>
										</div>


										<div class="col-sm-3" style="margin-top:20px;">
											<div class="card  border-success ">
												<div class="card-body">
													<h5 class="card-title">選擇結果</h5>

													<div class="input-group mb-3 ">

													</div>

													<div class="input-group mb-3 ">
														<label for="mydate"></label>
														<div class="input-group mb-3">
															<div class="input-group-prepend">
																<span class="input-group-text"
																	id="basic-addon3">日期</span>
															</div>
															<input type="text" class="form-control" id="mydate"
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
					//這是fetch要用的資料
					var campsiteId = document.getElementById("campsiteId");
					var mydate = document.getElementById("mydate");
					var unitTypeForFetch;




					//開始畫Canvas 
					var myCanvas = document.getElementById('myCanvas');
					var context = myCanvas.getContext("2d");
					var mapSprite = new Image();
					mapSprite.src = "${contextRoot}/myImage/camp" + campsiteId.value + "_4.png";


					var Marker = function () {
						this.Sprite = new Image();
						this.Sprite.src = "${contextRoot}/myImage/tentblue.png";
						this.Width = 40;
						this.Height = 32;
						this.XPos = 0;
						this.YPos = 0;
					}

					var avlMarkers = new Array();
					var bookedMarkers = new Array();



					function drawAvlMarker(x, y) {
						var marker = new Marker();
						//下判斷式，判斷是帳篷還是車子來改src
						if (unitTypeForFetch.indexOf('TA') != -1) {

							//是帳篷的話
							marker.Sprite.src = "${contextRoot}/myImage/tentblue.png";
						}

						if (unitTypeForFetch.indexOf('CA') != -1) {

							//是車子的話
							marker.Sprite.src = "${contextRoot}/myImage/bluecv.png";
						}
						marker.XPos = x;
						marker.YPos = y;
						avlMarkers.push(marker);
					}

					function drawbookedMarker(x, y) {
						var marker = new Marker();
						//下判斷式，判斷是帳篷還是車子來改src
						if (unitTypeForFetch.indexOf('TA') != -1) {

							//是帳篷的話
							marker.Sprite.src = "${contextRoot}/myImage/tentgrey.png";
						}
						if (unitTypeForFetch.indexOf('CA') != -1) {

							//是車子的話
							marker.Sprite.src = "${contextRoot}/myImage/greycv.png";
						}
						marker.XPos = x;
						marker.YPos = y;
						bookedMarkers.push(marker);
					}



					//Canvas一半 


					function load() {
						var unitType = document.getElementById("unitType");

						if (unitType.value.indexOf("TA") != -1) {
							unitTypeForFetch = unitType.value;
							unitType.value += "帳篷露營地";
							pricePerNights.value = "${cs.pricePerNightsTA}";
						}
						if (unitType.value.indexOf("CA") != -1) {
							unitTypeForFetch = unitType.value;
							unitType.value += "露營車露營地";
							pricePerNights.value = "${cs.pricePerNightsCA}";
						}


					}


					load();

					//塞可以訂位的座標值和文字，讓mouseover事件可以使用
					var testXarr = new Array();
					var testYarr = new Array();
					var testTextarr = new Array();

					function addToxyPosArr(text, x, y) {
						testTextarr.push(text)
						testXarr.push(x);
						testYarr.push(y);
					}



					function load2() {
						const formData = new FormData();
						formData.append('id', campsiteId.value);

						formData.append('tripstart', mydate.value);
						formData.append('myarea', unitTypeForFetch);

						fetch("${contextRoot}/showBookedUnitForBook2", { method: 'POST', body: formData }).then(result => result.text()).then(status => {

							if (status.indexOf(',') != -1) {
								var bookedItem = status.split(',');
								//這邊可以直接在canvas上畫好灰色Marker，不用再丟值給全域變數
								for (let i = 0; i < bookedItem.length; i = i + 3) {

									drawbookedMarker(bookedItem[i + 1], bookedItem[i + 2]);

								}
							}

						});


						fetch("${contextRoot}/showUnitAVLForBook2", { method: 'POST', body: formData }).then(result => result.text()).then(status => {

							if (status.indexOf(',') != -1) {
								var avlItem = status.split(',');

								for (let i = 0; i < avlItem.length; i = i + 3) {
									drawAvlMarker(avlItem[i + 1], avlItem[i + 2]);

									addToxyPosArr(avlItem[i], avlItem[i + 1], avlItem[i + 2]);
								}

							}

						});
					}

					load2();





					myoption.addEventListener("change", function (e) {
						selectedAmount.value = e.target.selectedOptions.length;
						for (let i = 0; i < avlMarkers.length; i++) {
							if (unitTypeForFetch == 'TA') {
								avlMarkers[i].Sprite.src = "${contextRoot}/myImage/tentblue.png";
							}
							if (unitTypeForFetch == 'CA') {
								avlMarkers[i].Sprite.src = "${contextRoot}/myImage/bluecv.png";
							}
						}

						Array.from(e.target.selectedOptions, function (x) {
							for (let i = 0; i < testTextarr.length; i++) {
								if (x.innerText == testTextarr[i] && unitTypeForFetch == 'TA') {
									//帳篷

									avlMarkers[i].Sprite.src = "${contextRoot}/myImage/tentred.png";

								}
								if (x.innerText == testTextarr[i] && unitTypeForFetch == 'CA') {
									//露營車
									avlMarkers[i].Sprite.src = "${contextRoot}/myImage/redcv.png";

								}

							}
							//avlMarkers



						});

						mysum.value = selectedAmount.value * pricePerNights.value;
						nextbtndiv.innerHTML = "<button type='submit' class='btn btn-lg btn-success btn-block' id='nextbtn'>下一步<i class='far fa-arrow-alt-circle-right'></i></button>";

					})








					var firstLoad = function () {
						context.font = "15px Georgia";
						context.textAlign = "center";
					}

					firstLoad();

					var main = function () {
						draw();
					};


					var draw = function () {

						context.fillStyle = "#000";
						context.fillRect(0, 0, myCanvas.width, myCanvas.height);
						context.drawImage(mapSprite, 0, 0, 920, 600);


						// Draw markers

						for (let i = 0; i < bookedMarkers.length; i++) {
							var tempMarker = bookedMarkers[i];
							// Draw marker
							context.drawImage(tempMarker.Sprite, tempMarker.XPos, tempMarker.YPos, tempMarker.Width, tempMarker.Height);




							//可以設定畫到幾個點
							if (i == bookedMarkers.length - 1) {
								break;
							}


						}

						for (let i = 0; i < avlMarkers.length; i++) {
							var tempMarker = avlMarkers[i];
							// Draw marker
							context.drawImage(tempMarker.Sprite, tempMarker.XPos, tempMarker.YPos, tempMarker.Width, tempMarker.Height);



							// Calculate postion text
							var markerText = testTextarr[i];
							//"Postion (X:" + tempMarker.XPos + ", Y:" + tempMarker.YPos;



							// Draw a simple box so you can see the position
							var textMeasurements = context.measureText(markerText);
							context.fillStyle = "#796400";
							context.globalAlpha = 0.7;
							context.fillRect(tempMarker.XPos - (textMeasurements.width / 2), tempMarker.YPos - 15, textMeasurements.width, 20);
							context.globalAlpha = 1;

							context.fillStyle = "#FFDC35";
							//(座標的文字內容,座標文字開始列印的起始值x,y)
							context.fillText(markerText, tempMarker.XPos, tempMarker.YPos);


							//可以設定畫到幾個點
							if (i == avlMarkers.length - 1) {
								break;
							}


						}
					};

					setInterval(main, (1000 / 60)); // Refresh 60 times a second

					// canvas.addEventListener('click', (e) => {
					// 	console.log(e.x);
					// 	const rect = canvas.getBoundingClientRect();
					// 	const x = e.x - rect.left;
					// 	const y = e.y - rect.top;
					// 	console.log('x=' + x);
					// 	console.log('y=' + y);

					// 	//testXarr
					// 	for (let i = 0; i < 4; i++) {
					// 		if (x >= testXarr[i] && x <= testXarr[i] + 30 && y >= testYarr[i] && y <= testYarr[i] + 55) {

					// 			//x要加30 y要加55
					// 			Markers[i].Sprite.src = 'http://www.clker.com/cliparts/4/6/2/c/1206567007842245931qubodup_Cartoon_tipi_tent_with_red_flag.svg.med.png';
					// 		}
					// 	}

					// })

					// theanswer.addEventListener("click", function () {

					// 	for (let i = 0; i < Markers.length; i++) {
					// 		if (Markers[i].Sprite.src == 'http://www.clker.com/cliparts/4/6/2/c/1206567007842245931qubodup_Cartoon_tipi_tent_with_red_flag.svg.med.png') {
					// 			if (i == Markers.length - 1) {
					// 				theareaarr.innerHTML += 'CA' + (i + 1);
					// 				break;
					// 			}
					// 			theareaarr.innerHTML += 'CA' + (i + 1) + ',';

					// 		}
					// 	}

					// })




				</script>


		</body>

		</html>
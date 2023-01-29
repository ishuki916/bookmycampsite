<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
		<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
			<!DOCTYPE html>
			<html lang="en">

			<head>
				<!-- Required meta tags -->
				<meta charset="utf-8">
				<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
				<title>Lets Camping Admin</title>
				<!-- base:css -->
				<link rel="stylesheet" href="${contextRoot}/spica/vendors/mdi/css/materialdesignicons.min.css">
				<link rel="stylesheet" href="${contextRoot}/spica/vendors/css/vendor.bundle.base.css">
				<!-- endinject -->
				<!-- inject:css -->
				<link rel="stylesheet" href="${contextRoot}/spica/css/style.css">
				<!-- endinject -->
				<link rel="shortcut icon" href="${contextRoot}/spica/images/favicon.png" />
				<style>
					#campmaptext {
						text-align: center;
						width: 50%;
						margin: auto;
						color: darkblue;
						border-radius: 20px;
						background-color: white;
					}

					#myowncontainer {
						margin: 50px
					}

					#startBTN1,
					#startBTN2 {
						margin: 5px;
					}

					#twoBTN {
						display: flex;
						margin: auto;
						width: 80%
					}

					.activemyhidden {
						visibility: hidden
					}
				</style>

			</head>

			<body>
				<div class="container-scroller d-flex">
					<jsp:include page="../admin_pages/partials/sidebar.jsp" />
					<div class="container-fluid page-body-wrapper">
						<!-- partial:../../partials/_navbar.html -->
						<jsp:include page="../admin_pages/partials/navbar.jsp" />
						<div id="myowncontainer">
							<div id="campmaptext">
								<input type="text" id="campsiteId" value="${cs.id}" style="display:none">
								<input type="text" id="caAmount" value="${cs.campervanAreaAmount}" style="display:none">
								<input type="text" id="taAmount" value="${cs.tentAreaAmount}" style="display:none">
								<h4>Draw Map 設定區塊</h4>
								<p>用點擊的方式在畫面中指定區塊，讓使用者能夠辨識自己預定的露營地</p>
								<p>請先點擊下方紫色或綠色按鈕，開始設定露營地區塊！</p>
								<div id="twoBTN">
									<p></p>
									<button type="button" class="btn btn-primary" id="startBTN1">繪製帳篷露營地
										Tent</button>
									<p></p>
									<button type="button" class="btn btn-success" id="startBTN2">繪製露營車營地
										Campervan</button>
								</div>
							</div>
							<br>

							<!-- Large modal -->

							<canvas id="myCanvas" width="900" height="620"></canvas>

						</div>



						<jsp:include page="../admin_pages/partials/footer.jsp" />


					</div>
				</div>



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
				<script src="${contextRoot}/js/jquery.min.js"></script>

				<script type="text/javascript">


					var myCanvas = document.getElementById('myCanvas');
					var context = myCanvas.getContext("2d");
					var startBTN1 = document.getElementById('startBTN1');
					var startBTN2 = document.getElementById('startBTN2');
					var twoBTN = document.getElementById('twoBTN');
					var campsiteId = document.getElementById('campsiteId');
					var taAmounObj = document.getElementById('taAmount');
					var caAmountObj = document.getElementById('caAmount');

					var taAmount = taAmounObj.value;
					var caAmount = caAmountObj.value;
					var taXpos = new Array();
					var taYpos = new Array();
					var caXpos = new Array();
					var caYpos = new Array();

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


					var taMarkers = new Array();
					var caMarkers = new Array();





					// 方法
					var mouseClicked = function (mouse) {



						var rect = myCanvas.getBoundingClientRect();
						var mouseXPos = (mouse.x - rect.left)
						var mouseYPos = (mouse.y - rect.top);
						var marker = new Marker();

						marker.XPos = mouseXPos - (marker.Width / 2);
						marker.YPos = mouseYPos - marker.Height;

						if (startBTN2.innerHTML == '繪製中' || $('#startBTN1').hasClass('activemyhidden')) {
							marker.Sprite.src = "${contextRoot}/myImage/bluecv.png";
							caMarkers.push(marker);
							caXpos.push(marker.XPos);
							caYpos.push(marker.YPos);
						}

						if (startBTN1.innerHTML == '繪製中' || $('#startBTN2').hasClass('activemyhidden')) {
							marker.Sprite.src = "${contextRoot}/myImage/tentblue.png";
							taMarkers.push(marker);
							taXpos.push(marker.XPos);
							taYpos.push(marker.YPos);
						}
						if (taMarkers.length > taAmount) {
							if (confirm("帳篷地營地區塊設定完成，確定送出") == true) {

								const taformData = new FormData();
								taformData.append('id', campsiteId.value);
								taformData.append('taXpos', taXpos);
								taformData.append('taYpos', taYpos);

								fetch("${contextRoot}/insertTaXYPos", { method: 'POST', body: taformData });
								while (taMarkers.length > 0) {
									taMarkers.pop();

								}

								if ($('#startBTN2').hasClass('activemyhidden')) {
									window.location.replace("${contextRoot}/admin/showCamp");
								} else {

									$('#startBTN1').addClass('activemyhidden');
									startBTN1.innerHTML = '';
									startBTN2.innerHTML = '繪製中';

								}
							}
							else {
								while (taMarkers.length > 0) {
									taMarkers.pop();
									taXpos.pop();
									taYpos.pop();
								}

							}

						}
						if (caMarkers.length > caAmount) {
							if (confirm("露營車營地區塊設定完成，確定送出") == true) {

								//這裡放fetch
								const caformData = new FormData();
								caformData.append('id', campsiteId.value);
								caformData.append('caXpos', caXpos);
								caformData.append('caYpos', caYpos);

								fetch("${contextRoot}/insertCaXYPos", { method: 'POST', body: caformData });

								while (caMarkers.length > 0) {
									caMarkers.pop();
								}

								if ($('#startBTN1').hasClass('activemyhidden')) {
									window.location.replace("${contextRoot}/admin/showCamp");
								} else {

									$('#startBTN2').addClass('activemyhidden');
									startBTN2.innerHTML = '';
									startBTN1.innerHTML = '繪製中';


								}

							}
							else {
								while (caMarkers.length > 0) {
									caMarkers.pop();
									caXpos.pop();
									caYpos.pop();
								}

							}

						}




					}


					myCanvas.addEventListener("click", function () {
						if (startBTN1.innerHTML != '繪製中' && startBTN2.innerHTML != '繪製中') {
							alert('請先點選紫色或綠色按鈕');
						}

					})






					startBTN1.addEventListener("click", function () {

						if (startBTN2.innerHTML == '繪製中') {
							alert('您正在繪製露營車露營地，要完成後才能切換');
						} else {
							startBTN1.innerHTML = '繪製中'
							myCanvas.addEventListener("mousedown", mouseClicked, false);
						}

					})

					startBTN2.addEventListener("click", function () {

						if (startBTN1.innerHTML == '繪製中') {
							alert('您正在繪製帳篷露營地，要完成後才能切換');
						} else {
							startBTN2.innerHTML = '繪製中'
							myCanvas.addEventListener("mousedown", mouseClicked, false);
						}
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
						context.drawImage(mapSprite, 0, 0, 900, 620);


						// Draw markers

						for (let i = 0; i < taMarkers.length; i++) {
							var tempMarker = taMarkers[i];
							// Draw marker
							context.drawImage(tempMarker.Sprite, tempMarker.XPos, tempMarker.YPos, tempMarker.Width, tempMarker.Height);

							var markerText = 'TA' + (i + 1);

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
							if (i == (taMarkers.length - 1)) {
								break;
							}
						}


						for (let i = 0; i < caMarkers.length; i++) {
							var tempMarker = caMarkers[i];
							// Draw marker
							context.drawImage(tempMarker.Sprite, tempMarker.XPos, tempMarker.YPos, tempMarker.Width, tempMarker.Height);

							// Calculate postion text
							var markerText = 'CA' + (i + 1);

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
							if (i == (caMarkers.length - 1)) {
								break;
							}
						}


					};


					setInterval(main, (1000 / 60)); // Refresh 60 times a second

				</script>
			</body>

			</html>
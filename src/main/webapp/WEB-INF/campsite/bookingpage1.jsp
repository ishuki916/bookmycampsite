<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<link href="${contextRoot}/muwei/booking.css" rel="stylesheet">



<style>
.mycard1, mycard2 {
	height: 400px;
}

.myform {
	text-align: left;
	background-color: white;
	width: 80%;
	margin: auto;
	padding: 10px;
	border-radius: 10px;
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


				<!-- another version - flat style with animated hover effect -->
				<div class="breadcrumb flat" style="display: block">
					<a href="#" class="active"> Select Date 確認日期</a> <a href="#">Select
						Area 選位</a> <a href="#">Shopping Cart 購物車</a>
				</div>








				<!-- 		<div class="row">
					<div class="col-sm-12" style="margin-bottom: 10px">
						<div class="card border-success  bg-transparent ">
							<div class="card-body">
								<h5 class="card-title">預定露營地名稱</h5>
								<p class="card-text">地址============================</p>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio"
										name="inlineRadioOptions" id="inlineRadio1" value="option1"
										checked> <label class="form-check-label"
										for="inlineRadio1">Tent 帳篷露營地</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio"
										name="inlineRadioOptions" id="inlineRadio2" value="option2">
									<label class="form-check-label" for="inlineRadio2">Campervan露營車露營地</label>
								</div>
							</div>
						</div>
					</div>



					<div class="col-sm-6 ">
						<div class="card-deck border-success bg-transparent ">
							<div class="card-body">
								<h5 class="card-title">Select Date 確認日期</h5>

								<div class="input-group mb-3 bg-transparent ">
									<div class="input-group-prepend">
										<label class="input-group-text" for="inputGroupSelect01">天數</label>
									</div>
									<select class="custom-select" id="inputGroupSelect01">

										<option value="1" selected>1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
										<option value="6">6</option>
										<option value="7">7</option>
									</select>
								</div>
								<div class="form-group bg-transparent">

									<input type="text" id="checkin_date" class="form-control"
										placeholder="開始日期">
								</div>
								<div class="form-group">

									<input type="text" id="checkin_date" class="form-control"
										placeholder="結束日期">
								</div>


								<button type="button" class="btn btn-warning btn-rounded btn-fw">想要看看這個時間其他露營地的訂位狀況嗎？</button>
							</div>
						</div>
					</div>
					<div class="col-sm-6 ">
						<div class="card border-success">
							<div class="card-body">
								<h5 class="card-title">訂位須知</h5>
								<p class="card-text">

									<i class="fas fa-exclamation-circle"></i>假如您想要一次預約7天以上，請私訊客服人員，將有意想不到的優惠<i
										class="fas fa-heart"></i> <br> <i
										class="fas fa-exclamation-circle"></i>除了這個露營地以外，還想要預約其他區域的露營地，必須完成此次預約的前三道步驟，才能前往其他露營地選位喔！
									<br> <i class="fas fa-exclamation-circle"></i>需要加購食材的客人們，請完成前三道步驟後，再進行加購。
									<br> <i class="fas fa-exclamation-circle"></i>需要規劃行程的客人們，請完成前三道步驟後，再進行加購。加購完成後可以一併結帳。
									<br> <i class="fas fa-exclamation-circle"></i>需要租用露營器材的客人們，請完成前三道步驟後，再進行加購。加購完成後可以一併結帳。
									<br> <i class="fas fa-exclamation-circle"></i>假如沒有完成前三道步驟，一旦離開頁面，系統將不會保存紀錄。
									<br>
								</p>

							</div>
						</div>
					</div>
					<div class="col-sm-12" style="margin-top: 10px">

						<button type="button" class="btn btn-success btn-lg btn-block">
							下一步<i class="far fa-arrow-alt-circle-right"></i>
						</button>

					</div>

				</div> -->


				<!-- .col-md-8 -->
			</div>
		</div>

		<form action="${contextRoot}/booking2" method="post">
			<div class="myform">


				<div class="form-group">

					<input type="text" name="id" id="campsiteId" value="${cs.id}"
						style="display: none">

					<h2 class="heading">預定露營地</h2>

					<h4 class="heading" id="mycampsiteName">${cs.campsiteName}</h4>
				</div>
				<!-- 
							<div class="form-group">
								<label for="myday">How many days:</label> <select id="myday" name="myday">
									<option value="1" selected>1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="4">5</option>
								</select>

							</div> -->

				<div class="form-group" id="mystartend">
					<label for="mystart">Select date:</label> <input type="date"
						id="mystart" name="tripstart" value="" min="" max="">


				</div>



				<div class="form-group">
					<label for="myarea">Camping Type:</label> <select id="myarea"
						name="myarea">
						<c:if test="${unitType=='TA'}">
							<option value="TA" selected><i class="fas fa-campground"></i><span>Tent
									露營地</span></option>
							<option value="CA"><i class="fas fa-truck"></i><span>Camper
									van 露營車營地</span></option>
						</c:if>

						<c:if test="${unitType=='CA'}">
							<option value="TA"><i class="fas fa-campground"></i><span>Tent
									露營地</span></option>
							<option value="CA" selected><i class="fas fa-truck"></i><span>Camper
									van 露營車營地</span></option>

						</c:if>
					</select>

				</div>

				<!-- 		<div class="form-radio">
								<form id="formradio">

									<input type="radio" class="form-radio-input" id="TAradio" name="myradio" value="TA"
										checked>

									<label class="form-check-label" for="TAradio"> <i
											class="fas fa-campground"></i><span>Tent 露營地</span>
									</label>



									<input type="radio" class="form-radio-input" id="CAradio" name="myradio" value="CA">

									<label class="form-check-label" for="CAradio"> <i
											class="fas fa-truck"></i><span>Camper
											van 露營車營地</span>
									</label>

								</form>
							</div> -->

				<button type="button" id="checkspace" class="btn btn-success"
					style="margin: 20px">確認是否有空位</button>

				<div class="form-group" id="mycontent"></div>



				<div class="col-sm-12" style="margin-top: 10px" id="nextbtndiv">

					<button type="button" class="btn btn-lg btn-block" id="nextbtn">
						下一步<i class="far fa-arrow-alt-circle-right"></i>
					</button>

				</div>


			</div>


		</form>










	</section>
	<!-- .section -->

	<!-- 勿動 -->
	<jsp:include page="../layout/include_footer.jsp" />
	<!-- 勿動 -->
	<jsp:include page="../layout/include_scriptSrc.jsp" />
	<script>

					//拿取現在時間&只能預定一年內的
					let objectDate = new Date();
					let day = objectDate.getDate();
					if(day<10){
						day='0'+day; 
					}
					let month = objectDate.getMonth() + 1;
					if(month<10){
						month='0'+month; 
					}
					let year = objectDate.getFullYear();
					let format1 =  "2023-01-31";
					let format2 = year + 1 + "-" + month + "-" + day;
					document.getElementById("mystart").min = format1;
					//下面這項 之後會帶value進來，以後可以刪掉
					var mystart = document.getElementById("mystart");
					
					mystart.value = format1;
					mystart.max = format2;
					
				//	var howmanydays = document.getElementById("myday");

					//要判斷「所選日期」+「所選天數」 >>>結束日期是哪一天？
					//要知道「所選日期」那個月的最後一天是幾號
					//假如「所選日期」是12月，那要換到隔年一月

					var checkspace = document.getElementById("checkspace");
					var mycontent = document.getElementById("mycontent");
					var myarea = document.getElementById("myarea");
					var campsiteId = document.getElementById("campsiteId");

					var nextbtndiv = document.getElementById("nextbtndiv");
					//parseInt(howmanydays.value, 10)
					checkspace.addEventListener("click", function () {
						mycontent.innerHTML = "";
						const formData = new FormData();

						formData.append("startday", mystart.value);
						//	formData.append("dayNum", howmanydays.value);

						formData.append("unitType", myarea.value);
						formData.append("campsiteId", parseInt(campsiteId.value, 10));
						fetch("${contextRoot}/checkspace2", { method: 'POST', body: formData }).then(result => result.text()).then(oblist => {

							mycontent.innerHTML = oblist;
							if (oblist.indexOf("沒有空位囉") != -1 || oblist.indexOf("沒有提供這類型露營地喔！") != -1) {
								nextbtndiv.innerHTML = "<button type='button' class='btn btn-lg btn-block' id='nextbtn'>下一步<i class='far fa-arrow-alt-circle-right'></i></button>";

							} else {
								nextbtndiv.innerHTML = "<button type='submit' class='btn btn-lg btn-success btn-block' id='nextbtn'>下一步<i class='far fa-arrow-alt-circle-right'></i></button>";
							}
						})


					})


					mystart.addEventListener("change", function () {
						nextbtndiv.innerHTML = "<button type='button' class='btn btn-lg btn-block' id='nextbtn'>下一步<i class='far fa-arrow-alt-circle-right'></i></button>";
						mycontent.innerHTML = "";

					})
					myarea.addEventListener("change", function () {

						nextbtndiv.innerHTML = "<button type='button' class='btn btn-lg btn-block' id='nextbtn'>下一步<i class='far fa-arrow-alt-circle-right'></i></button>";
						mycontent.innerHTML = "";
					})

				</script>

</body>

</html>
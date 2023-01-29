<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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

<!-- font awesome 5.10.0 -->
<script src="https://kit.fontawesome.com/4c8363e591.js"
	crossorigin="anonymous"></script>

<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />
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

.myAttention1 {
	color: red;
	font-size: 10px;
}

#showImgMain {
	width: 500px;
	display: block;
}

#showImgUnit {
	width: 500px;
	display: block;
}

#showImgFile img {
	width: 300px;
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
									<br>
									<form method="post" action="${contextRoot}/updatePhotoPost"
										enctype="multipart/form-data">
										<input type="text" name="id" value="${id}"
											style="display: none" />
										<h4 class="card-title">Upload Photo 上傳主要圖片</h4>
										<label for="imgFile" class="myAttention1">格式必須是png檔</label> <label
											for="imgMain"></label> <input type="file"
											class="form-control" id="imgMain" accept="image/png"
											name="fFile1">
										<div>
											<img id="showImgMain">
										</div>

										<br>

										<h4 class="card-title">Upload Unit Information 上傳露營地區塊圖</h4>
										<label for="imgUnit" class="myAttention1">格式必須是png檔</label> <label
											for="imgUnit"></label> <input type="file"
											class="form-control" id="imgUnit" accept="image/png"
											name="fFile3">
										<div>
											<img id="showImgUnit">
										</div>


										<br>
										<h4 class="card-title">Upload Photos 內容圖片</h4>

										<label for="imgFile" class="myAttention1">僅能上傳3張圖片，格式必須是png檔</label>
										<input type="file" class="form-control" id="imgFile"
											accept="image/png" multiple="multiple" name="fFile2">

										<div class="d-flex flex-row" id="showImgFile"></div>
										<br>
										<div id="message" class="myAttention1"></div>
										<br>
										<button type="submit" class="btn btn-primary mr-2"
											id="imgBTN1">Upload</button>
									</form>
								</div>
							</div>
						</div>


						<!-- 	<div class="col-12 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
						
								
									<h4 class="card-title">Show Photo 顯示圖片</h4>
									<p class="card-description">let customers view the best
										part of your campsite</p>




									<label for="getimg1">輸入圖片ID</label><input type="text"
										id="getimg1">



									<button type="button" class="btn btn-primary mr-2"
										id="showphotobtn">顯示圖片</button>


									<img class="theImg" id="theImg"></img>
								</div>




							</div>
						</div> -->
					</div>
					<!-- <div class="row">
					<div class="col-12 grid-margin stretch-card">
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">Upload or Update Photo 上傳圖片</h4>
								<p class="card-description">let customers view the best part
									of your campsite</p>
								<label for="imgFile1">選擇檔案</label> <input type="file"
									class="form-control" id="imgFile1" accept="image/png">
								<div>
									<img id="theImg1">
								</div>

								<button type="button" id="postBTN1" class="btn btn-primary mr-2">上傳</button>


								<div id="message"></div>



								<label for="imgFile2">選擇檔案</label> <input type="file"
									class="form-control" id="imgFile2" accept="image/png"
									multiple="multiple">

								<div id="theImg2"></div>

								<button type="button" id="postBTN2" class="btn btn-primary mr-2">上傳</button>

								<div id="message2"></div>

							</div>


						</div>

					</div>
					
					</div> -->


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
	<script type="text/javascript">
		//這是一個巨大的分隔線-------------------------------單張圖片顯示在畫面，按下按鈕後上傳到本機

		const imgMain = document.getElementById("imgMain");
		const showImgMain = document.getElementById("showImgMain");

		const imgUnit = document.getElementById("imgUnit");
		const showImgUnit = document.getElementById("showImgUnit");

		const message = document.getElementById("message");
		const imgFile = document.getElementById("imgFile");
		const showImgFile = document.getElementById("showImgFile");

		imgMain.addEventListener("change", function() {
			showImgMain.src = URL.createObjectURL(this.files[0]);
		})
		imgUnit.addEventListener("change", function() {
			showImgUnit.src = URL.createObjectURL(this.files[0]);
		})

		imgFile
				.addEventListener(
						"change",
						function() {
							if (this.files.length <= 3) {
								message.innerHTML = "";
								for (let i = 0; i < 3; i++) {
									showImgFile.innerHTML += "<img src ='"
											+ URL
													.createObjectURL(this.files[i])
											+ "'/>";
								}

							}
							if (this.files.length > 3) {
								showImgFile.innerHTML = "";
								message.innerHTML = "<i class='fas fa-exclamation-triangle'></i>不可多於3張圖";
							}
						})

		/* imgBTN1.addEventListener("click", function () {
			const formData = new FormData();
			formData.append('fName', "camp"+ thisId +".png");
			formData.append('fFile', imgFile1.files[0]);

			fetch("${contextRoot}/uploadImg", { method: 'POST', body: formData }).then(result => result.text()).then(status => {
				
			});
		})  */

		/* 	//這是一個巨大的分隔線-------------------------------輸入id值向後端要byte資料再把圖片顯示在jsp
		 const showphotobtn = document.getElementById("showphotobtn");
		 const getimg1 = document.getElementById("getimg1");
		 const theImg = document.getElementById("theImg");

		 showphotobtn.addEventListener("click", function() {

		 const formData = new FormData();
		 formData.append("id", getimg1.value)
		 fetch("${contextRoot}/GetImg", {
		 method : "POST",
		 body : formData
		 }).then(function(result) {
		 console.log("2step");
		 return result.blob();
		 }).then(function(imgBlob) {
		 console.log("3step");
		 let tempURL = URL.createObjectURL(imgBlob);
		 theImg.src = tempURL;
		 })

		 })
		
		 //這是一個巨大的分隔線-------------------------------單張圖片顯示在畫面，按下按鈕後上傳到本機

		 const imgFile1 = document.getElementById("imgFile1");
		 const theImg1 = document.getElementById("theImg1");
		 const postBTN1 = document.getElementById("postBTN1");
		 const message = document.getElementById("message");

		 imgFile1.addEventListener("change", function () {

		 let fPath = this.value;
		 let fName = fPath.substring(fPath.lastIndexOf("\\") + 1);
		

		 let previewSRC = URL.createObjectURL(this.files[0]);
		 theImg1.src = previewSRC;

		 })

		 postBTN1.addEventListener("click", function () {
		 const formData = new FormData();
		 formData.append('fName', "camp7.png");
		 formData.append('fFile', imgFile1.files[0]);

		 fetch("${contextRoot}/PostImg", { method: 'POST', body: formData }).then(result => result.text()).then(status => {
		 message.innerHTML = "請檢查 C:\\temp";
		 });
		 })
		 //這是一個巨大的分隔線-------------------------------多張圖片顯示在畫面，按下按鈕後上傳到本機
		 const imgFile2 = document.getElementById("imgFile2");
		 const theImg2 = document.getElementById("theImg2");
		 const postBTN2 = document.getElementById("postBTN2");
		 const message2 = document.getElementById("message2");

		 imgFile2.addEventListener("change", function () {

		
		
		 for(var i=0;i<this.files.length;i++){
		 theImg2.innerHTML += "<img src ='"+ URL.createObjectURL(this.files[i])+"'/>"
		
		 }

		 })

		 postBTN2.addEventListener("click", function () {
		 const formData = new FormData();
		 const name1 ="camp7_1.png,camp7_2.png,camp7_3.png";
		
		 formData.append('name1', name1);
		 formData.append('fFile1', imgFile2.files);
		

		 fetch("${contextRoot}/PostImg2", { method: 'POST', body: formData }).then(result => result.text()).then(status => {
		 message2.innerHTML = "請檢查 C:\\temp";
		 });
		 })  */
	</script>
</body>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>user list</title>
<!-- base:css -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css"
	rel="stylesheet">

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
.container img {
	display: block;
	max-width: 100%;
	max-height: 100%;
	position: absolute;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
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
			<!--<button id="submitB" class="btn btn-light">用戶名單</button>-->
			<div class="content-wrapper">
				<div class="main-panel">
					<div class="table-responsive">

						<table class="table" id="list_table_json">

							<thead>
								<tr>
									<th scope="col">id</th>
									<th scope="col">email</th>
									<th scope="col">pwd</th>
									<th scope="col">username</th>
									<th scope="col">auth</th>
									<th scope="col">phone</th>
									<th scope="col">gender</th>
									<th scope="col">birth</th>
									<th scope="col">lv</th>
									<th scope="col">image</th>
									<th scope="col">action</th>
								</tr>
							</thead>

							<tbody>


							</tbody>

						</table>

					</div>
			</div>
				<p>
				<p>
			<div id="divpage" style="text-align:center"></div>
								<p>
				<p>
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
	<!-- Plugin js for this page-->
	<!-- End plugin js for this page-->
	<!-- inject:js -->
	<script src="${contextRoot}/spica/js/off-canvas.js"></script>
	<script src="${contextRoot}/spica/js/hoverable-collapse.js"></script>
	<script src="${contextRoot}/spica/js/template.js"></script>
	<script src="${contextRoot}/js/jquery-3.6.1.min.js"></script>
	<script>
		$(document)
				.ready(
						function() {
							//	$('#submitB').click(function(e) { 
							//function(e) { 
							//	console.log("sb");
							//	e.preventDefault(); // 取消原本的送出按鈕功能

							$
									.ajax({
										url : '${contextRoot}/users/api/get/1',
										method : 'get',
										contentType : 'application/json', // 送過去的格式
										dataType : 'json', // 傳回來的格式
										data : "",
										success : function(result) {
											console.log(result);

											/*	<form id="msgForm">
												<input type="text" id="msg">
												<button id="submitU">送出</button>
												</form>*/

											msg_data = '<tbody>';
											$
													.each(
															result.content,
															function(index,
																	value) {
																/*		msg_data += '<form id="msgForm' + value.id + '">' 
																		msg_data += '<tr>'

																		msg_data += '<td><input type="text" id="msg1" readonly="readonly" value="' + value.id + '"></td>'
																		msg_data += '<td><input type="text" id="msg2" value="' + value.email + '"></td>'
																		msg_data += '<td><input type="text" id="msg3" value="' + value.pwd + '"></td>'
																		msg_data += '<td><input type="text" id="msg4" value="' + value.username + '"></td>'
																		msg_data += '<td><input type="text" id="msg5" value="' + value.auth + '"></td>'
																		msg_data += '<td><input type="text" id="msg6" value="' + value.phone + '"></td>'
																		msg_data += '<td><input type="text" id="msg7" value="' + value.gender + '"></td>'
																		msg_data += '<td><input type="date" id="msg8" value="' + value.birth + '"></td>'
																		msg_data += '<td><input type="text" id="msg9" value="' + value.lv + '"></td>'
																		msg_data += '</tr>'
																		msg_data += '<button id="submitU">修改</button>'
																		msg_data +=	'</form>' */

																msg_data += '<tr>'
																msg_data += '<td>'
																		+ value.id
																		+ '</td>'
																msg_data += '<td>'
																		+ value.email
																		+ '</td>'
																msg_data += '<td>'
																		+ value.pwd
																		+ '</td>'
																msg_data += '<td>'
																		+ value.username
																		+ '</td>'
																msg_data += '<td>'
																		+ value.auth
																		+ '</td>'
																msg_data += '<td>'
																		+ value.phone
																		+ '</td>'
																msg_data += '<td>'
																		+ value.gender
																		+ '</td>'
																msg_data += '<td>'
																		+ value.birth
																		+ '</td>'
																msg_data += '<td>'
																		+ value.lv
																		+ '</td>'
																msg_data += '<td><img src=' + value.image + ' style="width: 40px" /></td>'
																msg_data += '<td><a href="${contextRoot}/users/getUpdate/' + value.id + '">修改</a></td>'

																msg_data += '</tr>'
															})
											msg_data += '</tbody>';

											msg_data += '</p>'

											var myTable = document
													.getElementById('list_table_json');
											myTable
													.getElementsByTagName('tbody')[0].innerHTML = msg_data;
											
											msg_data1 = '<div class="container">';
												for (var i = 1; i <= result.totalPages; i++) {

													msg_data1 += '<button class="btn-primary btn btn-rounded btn-sm" data-pageid="' + i +'">'
															+ i;
													msg_data1 += '</button>';
													msg_data1 += '&nbsp';
												}
											msg_data1 += '</div>'		
											document.getElementById("divpage").innerHTML = msg_data1;
											
											$('.btn-primary')
													.click(
															function() {
																var pageID = $(
																		this)
																		.data(
																				'pageid');
																loadThatPage(pageID);
															});

										},
										error : function(error) {
											console.log(error)
										}
									})

						})

		function loadThatPage(thatPage) {
			$
					.ajax({
						url : '${contextRoot}/users/api/get/' + thatPage,
						dataType : 'json', // 傳回來的格式
						method : 'get',
						success : function(result) {

							console.log(result)

							// $('#list_table_json tbody tr td').remove();

							msg_data = '<tbody>';
							$
									.each(
											result.content,
											function(index, value) {
												console.log(value.text)

												msg_data += '<tr>'
												msg_data += '<td>' + value.id
														+ '</td>'
												msg_data += '<td>'
														+ value.email + '</td>'
												msg_data += '<td>' + value.pwd
														+ '</td>'
												msg_data += '<td>'
														+ value.username
														+ '</td>'
												msg_data += '<td>' + value.auth
														+ '</td>'
												msg_data += '<td>'
														+ value.phone + '</td>'
												msg_data += '<td>'
														+ value.gender
														+ '</td>'
												msg_data += '<td>'
														+ value.birth + '</td>'
												msg_data += '<td>' + value.lv
														+ '</td>'
												msg_data += '<td><img src=' + value.image + ' style="width: 40px" /></td>'
												msg_data += '<td><a href="${contextRoot}/users/getUpdate/' + value.id + '">修改</a></td>'

												msg_data += '</tr>'
											})
							msg_data += '</tbody>';
							msg_data += '</p>'
							// 總頁數
							let totalPages = result.totalPages; // 總頁數
							console.log('總頁數: ', totalPages)

							var myTable = document
									.getElementById("list_table_json"); // Get the table

							myTable.getElementsByTagName("tbody")[0].innerHTML = msg_data;
							
							msg_data1 = '<div class="container">'
								for (var i = 1; i <= totalPages; i++) {

									msg_data1 += '<button class="btn-primary btn btn-rounded btn-sm" data-pageid="' + i +'">'
											+ i;
									msg_data1 += '</button>';

								}
							msg_data1 += '</div>'		
							document.getElementById("divpage").innerHTML = msg_date1;
							$('.btn-primary').click(function() {
								var pageID = $(this).data('pageid');
								loadThatPage(pageID);
							});

						},
						error : function(err) {
							console.log(err)
						}
					})
		}

		/*		$('#submitU').click(function(e) {
				
				e.preventDefault(); // 取消原本的送出按鈕功能
				var inputText1 = this.getElementById('msg1').value
				var inputText2 = this.getElementById('msg2').value
				var inputText3 = this.getElementById('msg3').value
				var inputText4 = this.getElementById('msg4').value
				var inputText5 = this.getElementById('msg5').value
				var inputText6 = this.getElementById('msg6').value
				var inputText7 = this.getElementById('msg7').value
				var inputText8 = this.getElementById('msg8').value
				var inputText9 = this.getElementById('msg9').value
				var dtoObject = {
					"id" : inputText1,
					"email": inputText2,
					"pwd": inputText3,
					"username": inputText4,
					"auth": inputText5,
					"phone": inputText6,
					"gender": inputText7,
					"birth": inputText8,
					"lv": inputText9
				}
				var dtoJsonString = JSON.stringify(dtoObject);
				
				var cc = document.getElementById("c1");
				
				$.ajax({
					url : '${contextRoot}/users/api/update',
					method : 'post',
					contentType : 'application/json', // 送過去的格式
					dataType : 'json', // 傳回來的格式
					data : dtoJsonString,
					success : function(result) {
						console.log(result);
						
						msg_data = '<tbody>';
						$.each(result.content,function(index, value){
							msg_data += '<form id="msgForm' + value.id + '">'
							msg_data += '<tr>'

							msg_data += '<td><input type="text" id="msg1" readonly="readonly" value="' + value.id + '"></td>'
							msg_data += '<td><input type="text" id="msg2" value="' + value.email + '"></td>'
							msg_data += '<td><input type="text" id="msg3" value="' + value.pwd + '"></td>'
							msg_data += '<td><input type="text" id="msg4" value="' + value.username + '"></td>'
							msg_data += '<td><input type="text" id="msg5" value="' + value.auth + '"></td>'
							msg_data += '<td><input type="text" id="msg6" value="' + value.phone + '"></td>'
							msg_data += '<td><input type="text" id="msg7" value="' + value.gender + '"></td>'
							msg_data += '<td><input type="date" id="msg8" value="' + value.birth + '"></td>'
							msg_data += '<td><input type="text" id="msg9" value="' + value.lv + '"></td>'
							msg_data += '</tr>'
							msg_data += '<button id="submitU">修改</button></form>'
							
							
							
							
						})
						msg_data += '</tbody>';
						msg_data += '</p>'
							for(var i = 1; i<=result.totalPages; i++) {
									msg_data += '<button class="newPage" data-pageid="' + i +'">' +i + '</button>'
								}
						
						
						
						var myTable = document.getElementById('list_table_json');
				        myTable.getElementsByTagName('tbody')[0].innerHTML = msg_data;
				          
				        $('.newPage').click(function () {
				            var pageID = $(this).data('pageid');
				            loadThatPage(pageID);
				           });

					},
					error : function(error) {
						console.log(error)
					}
				})

			}) */
		//	}
		//)
	</script>

	<!-- endinject -->
	<!-- End custom js for this page-->
</body>

</html>

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
									<h4 class="card-title">Update the Campsite 修改露營地資料</h4>
									<p class="card-description">update the page for customers
										to book your campsite</p>
									
																			
									<form:form method="post" action="${contextRoot}/uCamp"
										modelAttribute="cs" cssClass="forms-sample">
						
										<div class="form-group">
											<form:label path="id" cssStyle="display:none"></form:label>
											<form:input path="id" cssStyle="display:none"></form:input>
											<form:label path="campsiteName">Name 名稱</form:label>
											<form:input path="campsiteName" cssClass="form-control"
												required="required"></form:input>
										</div>

										<div class="form-group">
											<form:label path="destination">Destination 縣市</form:label>
											<form:input path="destination" cssClass="form-control"
												required="required"></form:input>
										</div>

										<div class="form-group">
											<form:label path="campsiteAddress">Address 詳細地址</form:label>
											<form:input path="campsiteAddress" cssClass="form-control"
												required="required"></form:input>
										</div>

										<div class="form-group">
											<form:label path="traffic">Traffic 交通方式</form:label>
											<form:textarea path="traffic" cssClass="form-control"
												rows="4" required="required"></form:textarea>
										</div>

										<div class="form-group">
											<form:label path="introduction">Intro 介紹</form:label>
											<form:textarea path="introduction" cssClass="form-control"
												rows="4" required="required"></form:textarea>
										</div>




										<div class="form-check form-check-primary">
											<c:choose>
												<c:when test="${cs.tentAreaAmount>0}">
													<label class="form-check-label"> <input
														type="checkbox" class="form-check-input" id="tent" checked>
														Tent 帳篷露營地
													</label>
												</c:when>
												<c:otherwise>
													<label class="form-check-label"> <input
														type="checkbox" class="form-check-input" id="tent">
														Tent 帳篷露營地
													</label>

												</c:otherwise>

											</c:choose>
										</div>

										<div id="tentContent">

											<div class="form-group">
												<form:label path="taIntro">Intro 介紹與說明</form:label>
												<form:textarea path="taIntro" cssClass="form-control"
													rows="4"></form:textarea>
											</div>

											<div class="form-group">
												<form:label path="pricePerNightsTA">Price 一晚價格</form:label>
												<form:input path="pricePerNightsTA" cssClass="form-control"></form:input>
											</div>

											<div class="form-group">
												<form:label path="tentAreaAmount">Amount 可租借數量</form:label>
												<form:input path="tentAreaAmount" cssClass="form-control"></form:input>
											</div>


										</div>
										<div class="form-check form-check-success">
											<c:choose>
												<c:when test="${cs.campervanAreaAmount>0}">
													<label class="form-check-label"> <input
														type="checkbox" class="form-check-input" id="campervan"
														checked> Campervan 露營車營地
													</label>
												</c:when>
												<c:otherwise>
													<label class="form-check-label"> <input
														type="checkbox" class="form-check-input" id="campervan">
														Campervan 露營車營地
													</label>
												</c:otherwise>
											</c:choose>


										</div>
										<div id="campervanContent">
											<div class="form-group">

												<form:label path="caIntro">Intro 介紹與說明</form:label>
												<form:textarea path="caIntro" cssClass="form-control"
													rows="4"></form:textarea>
											</div>

											<div class="form-group">
												<form:label path="pricePerNightsCA">Price 一晚價格</form:label>
												<form:input path="pricePerNightsCA" cssClass="form-control"></form:input>
											</div>

											<div class="form-group">
												<form:label path="campervanAreaAmount">Amount 可租借數量</form:label>
												<form:input path="campervanAreaAmount"
													cssClass="form-control"></form:input>
											</div>


										</div>
										<br>
										<br>

										<br>
										<div class="row">

											<div class="col-md-6">
												<div class="form-group">
													<div class="form-group">
														<form:label path="toilet">Toilet 廁所</form:label>
														<form:select path="toilet" cssClass="form-control">
															<form:option value="Y"> Yes</form:option>
															<form:option value="N"> No</form:option>

														</form:select>
													</div>
													<div class="form-group">
														<form:label path="showerRoom">Shower Room
															淋浴間</form:label>
														<form:select path="showerRoom" cssClass="form-control">
															<form:option value="Y"> Yes</form:option>
															<form:option value="N"> No</form:option>

														</form:select>
													</div>

													<div class="form-group">
														<form:label path="garbage">Garbage Can
															垃圾集中處</form:label>
														<form:select path="garbage" cssClass="form-control">
															<form:option value="Y"> Yes</form:option>
															<form:option value="N"> No</form:option>

														</form:select>
													</div>
													<div class="form-group">
														<form:label path="wifi">Wifi 網路</form:label>
														<form:select path="wifi" cssClass="form-control">
															<form:option value="Y"> Yes</form:option>
															<form:option value="N"> No</form:option>

														</form:select>
													</div>
													<div class="form-group">
														<form:label path="Manager">24hr
															Manager 全日管理員 </form:label>
														<form:select path="Manager" cssClass="form-control">
															<form:option value="Y"> Yes</form:option>
															<form:option value="N"> No</form:option>

														</form:select>
													</div>

													<div class="form-group">
														<form:label path="charge">Power
															Chargers 供電  </form:label>
														<form:select path="charge" cssClass="form-control">
															<form:option value="Y"> Yes</form:option>
															<form:option value="N"> No</form:option>

														</form:select>
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<form:label path="refrigerator">Refrigerator
														冰箱  </form:label>
													<form:select path="refrigerator" cssClass="form-control">
														<form:option value="Y"> Yes</form:option>
														<form:option value="N"> No</form:option>

													</form:select>
												</div>
												<div class="form-group">
													<form:label path="kitchenSink">KitchenSink
														水槽   </form:label>
													<form:select path="kitchenSink" cssClass="form-control">
														<form:option value="Y"> Yes</form:option>
														<form:option value="N"> No</form:option>

													</form:select>
												</div>
												<div class="form-group">
													<form:label path="rentBike">Rent Bike
														腳踏車租借 </form:label>
													<form:select path="rentBike" cssClass="form-control">
														<form:option value="Y"> Yes</form:option>
														<form:option value="N"> No</form:option>

													</form:select>
												</div>

												<div class="form-group">
													<form:label path="washer">Washer 洗衣機 </form:label>
													<form:select path="washer" cssClass="form-control">
														<form:option value="Y"> Yes</form:option>
														<form:option value="N"> No</form:option>

													</form:select>
												</div>

												<div class="form-group">
													<form:label path="cafeBar">Cafe & Bar
														咖啡餐飲 </form:label>
													<form:select path="cafeBar" cssClass="form-control">
														<form:option value="Y"> Yes</form:option>
														<form:option value="N"> No</form:option>

													</form:select>
												</div>

												<div class="form-group">
													<form:label path="withPets">With Pets
														可攜寵物 </form:label>
													<form:select path="withPets" cssClass="form-control">
														<form:option value="Y"> Yes</form:option>
														<form:option value="N"> No</form:option>

													</form:select>
												</div>

											</div>
										</div>




										<button type="submit" class="btn btn-primary mr-2">Update</button>
								<button type="button"  id="myCancel"
											class="btn btn-light" >Cancel</button>
									</form:form>
										
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
		if (!document.getElementById("tent").checked) {
			document.getElementById("tentContent").classList.add("invisible");
		}
		document.getElementById("tent").addEventListener(
				"change",
				function() {
					document.getElementById("tentContent").classList
							.toggle("invisible");

				})
		if (!document.getElementById("campervan").checked) {
			document.getElementById("campervanContent").classList
					.add("invisible");
		}
		document.getElementById("campervan").addEventListener(
				"change",
				function() {
					document.getElementById("campervanContent").classList
							.toggle("invisible");
				})
				
				
					document.getElementById("myCancel").addEventListener(
				"click",
				function() {
					history.go(-1);　
				})

							
						
		
	</script>
</body>

</html>
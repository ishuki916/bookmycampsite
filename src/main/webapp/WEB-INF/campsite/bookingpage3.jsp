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
<link href="${contextRoot}/muwei/booking3.css" rel="stylesheet">
<style>
.mycard1, mycard2 {
	height: 400px;
}

.jusCard1, .jusCard2, .jusCard3 {
	border-radius: 50px;
	/*	opacity: 0.5;*/
	border: 1px solid grey;
}

.jusCustom img {
	object-fit: contain;
	border-radius: 50px;
	padding: 10px;
}

.mycheckoutWarning {
	background-color: #f6f3ef;
	margin-top: 20px;
	padding: 10px;
	border-radius: 50px;
	text-align: center;
	width: 50%;
	border: 1px solid grey;
}

#paypalimg{
width:80px;
border-radius:20px;
margin:10px

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
            <div class="col-md-9 ftco-animate text-center" data-scrollax=" properties: { translateY: '70%' }">
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
					<a href="#"> Select Date 確認日期</a> <a href="#">Select Area 選位</a> <a
						href="#" class="active">Shopping Cart 購物車</a>
				</div>



				<div class="basket" style="background-color: white">
					<!--    <div class="basket-module">
        <label for="promo-code">Enter a promotional code</label>
        <input id="promo-code" type="text" name="promo-code" maxlength="5" class="promo-code-field">
        <button class="promo-code-cta">Apply</button>
      </div> -->
					<div class="basket-labels">
						<ul>
							<li class="item item-heading">Item</li>
							<li class="price">Price</li>
							<li class="quantity">Quantity</li>
							<li class="subtotal">Subtotal</li>
						</ul>
					</div>


					<c:forEach items="${newbclist}" var="bc">
						<div class="basket-product">
							<div class="item">
								<div class="product-image">
									<img src="${contextRoot}/myImage/camp${bc.campsiteId}.png"
										alt="Placholder Image 2" class="product-frame">
								</div>
								<div class="product-details">
									<h1>
										<strong><span class="item-quantity">露營地名稱：
												${bc.campsiteName}</span> </strong>
									</h1>
									<p>${bc.arrivalDate}</p>

									<p>露營地：${bc.unitType} / ${bc.unitName}</p>




									<!--       <p>放入購物車時間 ${bc.bookingDate}</p>-->
								</div>
							</div>
							<c:choose>
								<c:when test="${bc.unitType=='TA'}">
									<div class="price">${bc.pricePerNightsTA}</div>
								</c:when>
								<c:otherwise>
									<div class="price">${bc.pricePerNightsCA}</div>
								</c:otherwise>
							</c:choose>
							<div class="quantity">
								<input type="number" value="1" min="1" class="quantity-field"
									readonly>
							</div>

							<c:choose>
								<c:when test="${bc.unitType=='TA'}">
									<div class="subtotal" id="subtotal">${bc.pricePerNightsTA}</div>
								</c:when>
								<c:otherwise>
									<div class="subtotal" id="subtotal">${bc.pricePerNightsCA}</div>
								</c:otherwise>
							</c:choose>

							<div class="remove">
								<button id="removeBTN">Remove</button>
								<p style="display: none">${bc.orderId}</p>
							</div>

						</div>
					</c:forEach>
				</div>


				<aside style="z-index: 10">
					<div class="summary">
						<div class="summary-total-items">
							<span class="total-items"></span> Items in your Bag
						</div>
						<!--    <div class="summary-subtotal">
                    <div class="subtotal-title">Subtotal</div>
                    <div class="subtotal-value final-value" id="basket-subtotal">130.00</div>
                    <div class="summary-promo hide">
                      <div class="promo-title">Promotion</div>
                      <div class="promo-value final-value" id="basket-promo"></div>
                    </div>
                  </div>
                  <div class="summary-delivery">
                    <select name="delivery-collection" class="summary-delivery-selection">
                      <option value="0" selected="selected">Select Collection or Delivery</option>
                      <option value="collection">Collection</option>
                      <option value="first-class">Royal Mail 1st Class</option>
                      <option value="second-class">Royal Mail 2nd Class</option>
                      <option value="signed-for">Royal Mail Special Delivery</option>
                    </select>
                  </div> -->
						<div class="summary-total">
							<div class="total-title">Total</div>
							<div class="total-value final-value" id="basket-total"></div>

						</div>
						<!--   <div class="summary-checkout">
          <button class="checkout-cta">Go to Secure Checkout</button>
        </div>  -->


					</div>
				</aside>


				<!-- .col-md-8 -->

			</div>

			<div class="col-sm-12 mycheckoutWarning">
				<span class="badge  badge-pill badge-warning"
					style="font-size: 15px; margin: 10px;">訂位後需在20分鐘內付款完畢!</span>
				<p>您可在20分鐘內繼續前往其他地方挑選所需要的商品</p>
				<p>即使20分鐘後訂位取消</p>
				<p>系統也會為您保留加購商品的品項喔</p>

				<span class="badge  badge-pill badge-warning"
					style="font-size: 30px; margin: 10px">您是否想要加購以下商品呢? </span>
			</div>
			<br>

			<!-- 去其他三個區塊的連結card -->

			<div class="card-deck">
			
				<div class="card jusCustom jusCard1">
					<a href="${contextRoot}/productMag/purchaseMorePage">
					<img class="card-img-top"
						src="${contextRoot}/myImage/foodforcheckout.jpg"
						alt="Card image cap">
						</a>
					<div class="card-body">
						<a href="${contextRoot}/productMag/purchaseMorePage"><h5 class="card-title">加購食品</h5></a>

						<p class="card-text">
							<small class="text-muted">Buy more for preparing the
								meals</small>
						</p>
					</div>
					
				</div>
				
				<div class="card jusCustom jusCard2">
					<img class="card-img-top"
						src="${contextRoot}/myImage/cvforcheckout.jpg"
						alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title">租借露營車/帳篷</h5>

						<p class="card-text">
							<small class="text-muted">Rent campervan or tent</small>
						</p>
					</div>
				</div>
				<div class="card jusCustom jusCard3">
					<img class="card-img-top"
						src="${contextRoot}/myImage/pairforcheckout.jpg"
						alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title">參與行程</h5>

						<p class="card-text">
							<small class="text-muted">Let's plan for a brand new type
								of camping</small>
						</p>
					</div>
				</div>
			</div>

			<br> <br>

			<div class="col-sm-12" style="margin-top: 10px">
				<form action="${contextRoot}/payByPaypal" method="post">
					<input type="text" name="totalforPaypal" id="totalforPaypal"
						value="0" style="display: none">
					<div class="col-sm-12" id="paypalBtn" style="margin: 10px">

						<button type="submit" class="btn btn-success btn-lg btn-block">
							<img alt="" src="${contextRoot}/myImage/paypallogo.jpg"
								id="paypalimg">Checkout 結帳 <i
								class="far fa-arrow-alt-circle-right"></i>
						</button>

					</div>
				</form>
				<br>
			<br>
			</div>



		</div>
	</section>
	<!-- .section -->

	<!-- 勿動 -->
	<jsp:include page="../layout/include_footer.jsp" />
	<!-- 勿動 -->
	<jsp:include page="../layout/include_scriptSrc.jsp" />
	<script>

          //計算total
          function getTotal() {
            var baskettotal = document.getElementById("basket-total");
            var subtotals = document.querySelectorAll("#subtotal");
            var totalitems = document.querySelector(".total-items");
            var totalforPaypal = document.getElementById("totalforPaypal");
            var total = 0;
            var itemNum = 0;
            var paypalBtn = document.getElementById("paypalBtn");

            subtotals.forEach(function (element) {
              //消費總額
              total += parseInt(element.innerHTML, 10);
              //有幾項商品要結帳
              itemNum++;

            }
            )
            baskettotal.innerHTML = total;
            totalitems.innerHTML = itemNum;
            totalforPaypal.value = total;
 if(total==0){
            	
            	paypalBtn.innerHTML = "	<button type='button' class='btn btn-lg btn-block'><img alt='' src='${contextRoot}/myImage/paypallogo.jpg' id='paypalimg'>Checkout 結帳 <i class='far fa-arrow-alt-circle-right'></i></button>";
            	
            	
            }
            
          }
         //一進入畫面就觸發total方法
          getTotal();
          var fadeTime = 300;

          //方法：Remove那一欄、重新計算Total
          function removeItem(removeButton) {
            /* Remove row from DOM and recalc cart total */
            var productRow = $(removeButton).parent().parent();
            productRow.slideUp(fadeTime, function () {
              productRow.remove();
              getTotal();
            });
          }
          
          
          //按下Remove按鈕時，觸發ajax，以及消除前端的那一欄
          $('.remove button').click(function () {
            var orderId = $(this).next().html();   
            ajaxtest(orderId);
            removeItem(this);
           
          
      
          });
          
          //用ajax的post方法，刪除訂單中的某一筆
          function ajaxtest(orderId){
        	  var formData = new FormData();
        	  formData.append("orderId",orderId);
          fetch("${contextRoot}/deleteOneBookingById", { method: 'POST', body: formData }).then(result => result.text()).then(status => {
        	  //這是要讓nav購物車裡的數量改變
        	  cartItemCaculate();
  		});
          
          }
          
        </script>
</body>

</html>
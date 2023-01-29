<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<nav
	class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
	id="ftco-navbar">
	<div class="container">
		<a class="navbar-brand" href="${contextRoot}/index">Lets Camping</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#ftco-nav" aria-controls="ftco-nav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="oi oi-menu"></span> Menu
		</button>

		<div class="collapse navbar-collapse" id="ftco-nav">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item active"><a href="${contextRoot}/index"
					class="nav-link">Home</a></li>
				<li class="nav-item"><a href="${contextRoot}/selectAll"
					class="nav-link">Campsite</a></li>
				<li class="nav-item active"><a href=""
					class="nav-link">Rent</a>
					</li>

				<li class="nav-item active"><a href=""
					class="nav-link">Pair</a>
					</li>
					
                <li class="nav-item active"><a href=""
					class="nav-link">Forum</a>
				
				</li>
					
				<c:if test="${loginUser == null}">
					<li class="nav-item cta"><a href="${contextRoot}/loginPage"
						class="nav-link"><span>login</span></a></li>
				</c:if>
				<c:if test="${loginUser != null}">

					<!-- 購物車標示 -->
					<li class="nav-item"><a href="${contextRoot}/showBrandNewCart" id="cart" class="nav-link"
						><i
							class="fa fa-shopping-cart"></i> Cart <span class="badge"
							id="cartNum"
							style="background-color: #ee5758; border-radius: 10px; color: white; display: inline-block; font-size: 12px; line-height: 1; padding: 3px 7px; text-align: center; vertical-align: middle; white-space: nowrap;">0</span></a></li>
					
					<div class="dropdown">
					<img src='${loginUser.image}' class="rounded-circle" style="width: 50px" alt="logo" 
						onerror="this.src='data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAIIAAACCCAMAAAC93eDPAAAAPFBMVEWoqan///+lpqaio6P4+Pj8/Pzs7OyfoKC8vb3e3t6wsbG0tbWrrKzv7+/y8vLFxsbR0tLm5ubLzMzX2NjSaS4JAAAEGklEQVR4nO2b25qrIAxGaVBBUfHw/u+60c44godCErpv/C/mojNfuxpCjo4Qjx49evTo0aNH2QUAUrof/+vDQTR6moZhsrqBL3OAVGaaq+K1U19bUF+ikLKxY/k606i/YAqAZvK/va8qNwRIO15//A9Ek5FBtvO5/QPNuQwhTR3z+Yt6IzMAQFtHWeCt0vIzqCkBYNHEzCDNzR24UK0YAQCGZABeBmgrDMFyMZgIpEn0gj8NPP4gLRbAieVeyIlA8CobOgFQbOBUkc0AmkbgwgPRJQHvib8qWiIC8jbuRbsVcqYTvAqSDRoGApo3wMfiJEodPk7Tb8OP8EaQPEZwIRJ9EoaJAJ+tcAn6TCMWQXVcCAUWoT0Exi4aKvhLJMHhPpRGShEVLXvXbol+9wIyRkOYpJfUD20EQWlgyS67VwwSIfTGNfPL/vVR/Xr0alfvapwzQJgfWjwCMjBA2DkNKjZrLF/acyUsQmiF0rpoFWEEdwnd2Tf7vgOLcIxMRRTAot5vfJC58nAjCMIicOVJPIJoyGXjJmyqVOmNLDcCS+H4FjI0cToDMkC7VBl9B31VVgfZDN1KyGNkqHSrP4CVVgEoP7RiCZzCt+8EuGR566Zju567V2wQOolDmlhb9buYVWy+v69ZKnwjAWEB+/ZseTn6q8X2YXtTUYYtKijj53d7qEJ3e2s0W8+iPDcitVPBvfwdWAC009jvj7vs5mabuELro5PmwWE3M25dspSt0dpOwzDPw6SN+OufwfqhvaQN3kJvmPdvB6uClYwUYRNW0wYthyhdy1urwsloChueN4X5stLXECD1sdXoqQQnUWA0p0so9+LpTaHPHtVJQC5q2yil4L0QWx1CKTOfhu6SOGsSJ/Hp9627erBWa2OWmzFftlkcA9iTbLUncbr7Pbql9UQau+HHGx7CIWPGi2sfgB8CE3JkIGwZ2bd8izqcO5SMBI4BUUfyncKPkruKmhnA1QCJdsiwp0wbB9cix7ZWSBt5GGXdZAEQy2FM3WeKcsi5uBdSfR7JrgO3fLpKm57INcq9okLUnMsTRHyzTa9SLhW2NpdmyHcU0SvDbATxSTubN8Sew5KlMyHIWAKG9uVcKcOnkfMhkh1CQu1EWtHeIKQsq/KcRNL6eMiBcN/ShKpyOENiCZsDIXEsnoEgtZ/J4I8qsZWgPsNyouPy9l78aSK5r6zZrZD8MMPITSBUIgF/OxdVt3rqmQkSQ+Mi9kSV3t3z58rkjSE3QrorsCMgJj3sCOmPOLH7QvqchxsB8dgjMwJmccscmjCzz443QKfHRvYccb2ZvBb6wbYLBMRjh8wIqUXbIuaSBfPQH3PhhrECNwLCF5g7OsyNYC7iMY9Z8Syl/hAQAZq9m0rPlNwIiJKFfxKdvJSJ/veQf/01LAxOXm1YAAAAAElFTkSuQmCC'"
						/>
						<button class="btn btn-secondary dropdown-toggle" type="button"
							id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false">${loginUser.username}</button>
						<div class="dropdown-menu" aria-labelledby="dropdownMenu2">
							
							<c:if test="${loginUser.lv == 'admin'}">
							<a class="dropdown-item" type="button"
								href="${contextRoot}/admin/top">admin</a>
								 </c:if>
								 <a
								class="dropdown-item" type="button" href="${contextRoot}/logout">logout</a>
						</div>
					</div>

					<!-- <li class="nav-item cta"><a href="#" class="nav-link"><span>${loginUser.username}</span></a></li> -->
				</c:if>

			</ul>
		</div>
	</div>
</nav>

<script>


//要算整合四大訂單的筆數，加總之後放入cart圖示旁邊
//目前的數字只有bookingCampsite
var cartNum = document.getElementById("cartNum");

function cartItemCaculate(){

	fetch("${contextRoot}/getCartNum").then(result => result.text()).then(status => {
		cartNum.innerHTML = status;

		});
	
	
}

cartItemCaculate();





</script>

<!-- END nav -->
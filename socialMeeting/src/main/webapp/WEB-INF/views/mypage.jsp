<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Mypage</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
	<meta name="keywords" content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
	<meta name="author" content="FREEHTML5.CO" />

  	<!-- Facebook and Twitter integration -->
	<meta property="og:title" content=""/>
	<meta property="og:image" content=""/>
	<meta property="og:url" content=""/>
	<meta property="og:site_name" content=""/>
	<meta property="og:description" content=""/>
	<meta name="twitter:title" content="" />
	<meta name="twitter:image" content="" />
	<meta name="twitter:url" content="" />
	<meta name="twitter:card" content="" />

	<link href='https://fonts.googleapis.com/css?family=Work+Sans:400,300,600,400italic,700' rel='stylesheet' type='text/css'>
	<link href="https://fonts.googleapis.com/css?family=Sacramento" rel="stylesheet">
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	<!-- Animate.css -->
	<link rel="stylesheet" href="css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="css/icomoon.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="css/bootstrap.css">

	<!-- Magnific Popup -->
	<link rel="stylesheet" href="css/magnific-popup.css">

	<!-- Owl Carousel  -->
	<link rel="stylesheet" href="css/owl.carousel.min.css">
	<link rel="stylesheet" href="css/owl.theme.default.min.css">

	<!-- Theme style  -->
	<link rel="stylesheet" href="css/style.css">

	<!-- Modernizr JS -->
	<script src="js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->

	</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp" %>

<div id="fh5co-started" class="fh5co-bg" style="background-image:url(images/img_bg_5.jpg);">
		<div class="container" align="center">
			<div id="tt" style="margin-right: 50%;">
				<div class="col-md-6 col-md-push-6" style="width: 100%; margin-top: 10%; color: #9fc2f9;">
					<h3>${sessionScope.loginUser.user_name}님의 Information</h3>
						<input type="hidden" id="notice" value="${notice}">
						<div class="row form-group">
							<div class="col-md-6">
								<label for="id">ID</label>
								<input type="text" id="id" name="user_id" class="form-control" value="${sessionScope.loginUser.user_id}" readonly>
							</div>
							<div class="col-md-6">
								<label for="name">Name</label>
								<input type="text" id="name" name="user_name" class="form-control" value="${sessionScope.loginUser.user_name}"readonly>
							</div>
						</div>
						<div class="row form-group">
							<div class="col-md-12" >
								<label for="email">관심분야</label><br>
									<div style="color: white;">
										<c:if test="${interests==null}">
										<input type="text" class="form-control" value="선택하신 흥미분야가 없습니다." readonly>
										</c:if>
									 <c:forEach var="ints" items="${interests}">
									 	<div class="col-md-12">
									 	<input type="text" class="form-control" value="${ints}" readonly>
									 	</div>
									 </c:forEach>
									</div>
								</div>
						</div>
						<c:if test="${sessionScope.loginUser.roomName!=''}">
						<div class="row form-group">
							<div class="col-md-12">
								<label for="meeting">개설 모임명</label>
								<input type="text" id="metting" class="form-control" value="${sessionScope.loginUser.roomName}" readonly>
							</div>
						</div>
						</c:if>
						<div class="row form-group">
							<div class="col-md-12">
								<label for="email">주소</label>
								<input type="text" id="addr1" name="addr1" class="form-control" value="${sessionScope.loginUser.addr1}" readonly>
							</div>
						</div>

						<div class="row form-group">
							<div class="col-md-12">	
								<label for="subject">상세주소</label>
								<input type="text" id="addr2" name="addr2" class="form-control" value="${sessionScope.loginUser.addr2}" readonly>
							</div>
						</div>

						<div class="row form-group">
							<div class="col-md-12">
								<label for="message">Introduction</label>
								<textarea style="text-align:left;" name="introduce" id="message" cols="30" rows="10" class="form-control" readonly>
								${sessionScope.loginUser.introduce}</textarea>
							</div>
						</div>
						<div class="form-group">
							<a href="goUpdateMyp" class="btn btn-default btn-sm" id="stbtn">수정하기</a>
						</div>
				</div>
			<!-- </div> -->
		</div>
	</div>
</div>


<%@ include file="/WEB-INF/views/footer.jsp" %>
	<script src="js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="js/jquery.waypoints.min.js"></script>
	<!-- Carousel -->
	<script src="js/owl.carousel.min.js"></script>
	<!-- countTo -->
	<script src="js/jquery.countTo.js"></script>
	<!-- Stellar -->
	<script src="js/jquery.stellar.min.js"></script>
	<!-- Magnific Popup -->
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/magnific-popup-options.js"></script>

	<script src="js/simplyCountdown.js"></script>
	<!-- Main -->
	<script src="js/main.js"></script>
	<script>
		$(function() {
			var notice =$('#notice').val();
			if(notice!=""){
				alert(notice);
			}
		});
	
	</script>
</body>
</html>
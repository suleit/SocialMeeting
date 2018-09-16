<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>INFO</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
	<meta name="keywords" content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
	<meta name="author" content="FREEHTML5.CO" />

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
	<![endif]--></head>
<body>

<%@ include file="/WEB-INF/views/header.jsp" %>

	<div id="fh5co-started" class="fh5co-bg" style="background-image:url(images/img_bg_6.jpg);">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2 text-center fh5co-heading animate-box">
					<span>새로운 인연과 만남을 당신의 일상 속으로 초대해보세요!</span>
					<h2>Introduction</h2>
					<p style="font-size: 13px;">FlashMeeting은 위치기반의 모임공지 채팅 웹 사이트입니다.<br>
					 근처의 가까운 모임들에 참여하거나 새로운 모임 채팅방을 개설하여 사람들을 만나보세요!</p>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 col-md-offset-0">
					<ul class="timeline animate-box">
						<li class="animate-box">
							<div class="timeline-badge" style="background-image:url(images/img_bg_5.jpg);"></div>
							<div class="timeline-panel">
								<div class="timeline-heading">
									<h3 class="timeline-title">모임 개설하기</h3>
									<span class="date" style="color: white;">채팅방/모임 개설</span>
								</div>
								<div class="timeline-body" style="color: white;">
									<p>1인당 하나의 모임이 개설가능하며, 중복으로 여러개의 모임을 동시에 개설하는 것은 불가능합니다.
									스포츠 모임, 맛집 투어, 소셜 다이닝, 재능 기부 소모임, 등 다양한 모임을 개설함과 동시에 모임명의 채팅방도 함께 개설됩니다.
									상시 운영되는 챗방은 모임 참여자가 아니라도 누구나 입장 가능하며, 채팅을 통하여 모임에 대한 안내와 참여논의가 가능합니다.
									Create Chat페이지에서 모임 개설을 원하는 지도 위치를 클릭하여 모임 생성이 가능합니다.</p>
								</div>
							</div>
						</li>
						<li class="timeline-inverted animate-box">
							<div class="timeline-badge" style="background-image:url(images/img_bg_5.jpg);"></div>
							<div class="timeline-panel">
								<div class="timeline-heading">
									<h3 class="timeline-title">모임 참여</h3>
									<span class="date" style="color: white;">참여하기</span>
								</div>
								<div class="timeline-body" style="color: white;">
									<p>모임명이나 모임이 열릴 주소, 모임에 대한 상세설명을 통해 모임목록을 검색할 수 있습니다. Meeting List 페이지에서 모임명을 클릭하여 
									모임에 대한 상세정보를 확인한 후 모임참여 신청을 할 수 있습니다.</p>
								</div>
							</div>
						</li>
						<li class="animate-box">
							<div class="timeline-badge" style="background-image:url(images/img_bg_5.jpg);"></div>
							<div class="timeline-panel">
								<div class="timeline-heading">
									<h3 class="timeline-title">채팅방 이용하기 </h3>
									<span class="date" style="color: #92a0b7;">채팅방입장하기</span>
								</div>
								<div class="timeline-body">
									<p style="color: #92a0b7;">모임 리스트에서 입장하고 싶은 리스트를 클릭하면 모임이 개최될 장소를 지도에서 확인하실 수 있습니다. 그와 동시에 지도상의 채팅방 입장 버튼을 눌러 채팅방 입장이 가능합니다.</p>
								</div>
							</div>
						</li>
			    	</ul>
				</div>
			</div>
		</div>
	</div>

<%@ include file="/WEB-INF/views/footer.jsp" %>
	
	<!-- jQuery -->
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

	<!-- // <script src="https://cdnjs.cloudflare.com/ajax/libs/prism/0.0.1/prism.min.js"></script> -->
	<script src="js/simplyCountdown.js"></script>
	<!-- Main -->
	<script src="js/main.js"></script>

</body>
</html>
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
<title>HOME</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
<meta name="keywords"
	content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
<meta name="author" content="FREEHTML5.CO" />

<link
	href='https://fonts.googleapis.com/css?family=Work+Sans:400,300,600,400italic,700'
	rel='stylesheet' type='text/css'>
<link href="https://fonts.googleapis.com/css?family=Sacramento"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
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
<style type="text/css">
.circle2 {
	width: 100px;
	height: 100px;
	border-radius: 50px;
	-moz-border-radius: 50px;
	-webkit-border-radius: 50px;
	-ms-border-radius: 50px;
	-khtml-border-radius: 50px;
	-o-border-radius: 50px;
	background: #F14E95;
	font: bold 20px/100px "Sacramento", Arial, serif;
	color: white;
	text-align: center;
	display: inline-block;
}

.circle3 {
	width: 95px;
	height: 95px;
	border-radius: 50px;
	-moz-border-radius: 50px;
	-webkit-border-radius: 50px;
	-ms-border-radius: 50px;
	-khtml-border-radius: 50px;
	-o-border-radius: 50px;
	background: #F14E95;
	font: bold 20px/100px "Sacramento", Arial, serif;
	color: white;
	text-align: center;
	display: inline-block;
}
</style>
</head>
<body>

	<%@ include file="/WEB-INF/views/header.jsp"%>
	<header id="fh5co-header" class="fh5co-cover" role="banner"
		style="background-image:url(images/img_bg_2.jpg);"
		data-stellar-background-ratio="0.5">
	<div class="overlay"></div>
	<div class="container">
		<div class="row">
			<div class="col-md-8 col-md-offset-2 text-center">
				<div class="display-t">
					<div class="display-tc animate-box" data-animate-effect="fadeIn">
						<h1>
							Social Dining <br>&amp; Busking
						</h1>
						<br>
						<c:if test="${sessionScope.loginUser!=null}">
							<h2>${sessionScope.loginUser.user_id}님환영합니다!</h2>
						</c:if>
						<h2>새로운 만남과 함께 당신의 일상을 특별하게 만들어보세요!</h2>
						<p id="joinNotice"></p>
						<div class="simply-countdown simply-countdown-one"></div>
						<p>
							<a href="gotoinfo" class="btn btn-default btn-sm" id="stbtn">FlashMeeting.
								시작하기</a>
						</p>
						<input type="hidden" value="${result}" id="joinResult">

						<div align="center">
							<div id="md" class="circle2"></div>
							<div id="dd" class="circle2"></div>
							<div id="mm" class="circle2"></div>
							<div id="ss" class="circle2"></div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
	</header>
	<%@ include file="/WEB-INF/views/footer.jsp"%>

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

	<!-- Main -->
	<script src="js/main.js"></script>

	<script>
		$(function() {
			var result = $('#joinResult').val();
			if (result == "true") {
				$('#joinNotice').append('회원 가입을 축하드립니다. 로그인 해주세요! :)');
			}
		});

		setInterval(function() {
			
			var d = new Date();
			var y = d.getFullYear();
			var m = d.getMonth();
			var dd = d.getDate();
			var h = d.getHours();
			var mm = d.getMinutes();
			var s = d.getSeconds();

			$('#md').html(y);
			$('#dd').html(m + ". " + dd);
			$('#mm').html(h+" : "+mm);
			$('#ss').html(s);
			
			var array=[];
			if ($('#md').hasClass('circle2') === true) {
					array = $('div.circle2');
				$.each(array, function(index, item) {
					$(this).attr('class', 'circle3');
				});
			} else {
				array = $('div.circle3');
				$.each(array, function(index, item) {
					$(this).attr('class', 'circle2');
			});
			}
		}, 1000);
	</script>

</body>
</html>
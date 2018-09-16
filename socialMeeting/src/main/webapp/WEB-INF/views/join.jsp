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
	<title>JOIN</title>
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
	<script src="js/jquery.min.js"></script>
	<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script>
	$(function(){
		$('#send').on('click',function(){
			var name = $('#name').val();
			var id =$('#id').val();
			var pw1=$('#pw1').val();
			var pw2 =$('#pw2').val();
			var addr1=$('#addr1').val();
			var addr2=$('#addr2').val();
			
			if(name==""||id==""||pw1==""||pw2==""||addr1==""||addr2==""){
				alert("입력되지 않은 칸이 있습니다. 필수입력칸을 입력해주세요");
				return;
			}
			if(pw1!=pw2){
				alert("패스워드가 동일하게 입력되지 않았습니다.");
				return; 
			}
			if(id.length<4||id.length>10){
				alert("id는 4자~ 10자 사이로 작성해주세요");
				return;
			}
			
			var $form= $('#form1');
			
			$form.submit();
			console.log($form);
		});
	});

	</script>
		</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp" %>


<div id="fh5co-started" class="fh5co-bg" style="background-image:url(images/img_bg_5.jpg);">
		<div class="container" align="center">
			<div id="tt" style="margin-right: 50%;">
				<div class="col-md-6 col-md-push-6" style="width: 100%; margin-top: 10%; color: #9fc2f9;">
					<h3>User Information Register</h3>
					
					<form id="form1" 
					action="join" method="post" >
						<div class="row form-group">
							<div class="col-md-6">
								<label for="fname">ID</label>
								<input type="text" id="id" name="user_id" class="form-control" placeholder="id check를 눌러주세요" readonly>
							</div>

							<div class="col-md-6">
								<label for="idcheck">ID CHECK</label><br>
								<input type="button" id="idcheck" class="btn btn-primary" value="Id check">
							</div>
							
							<div class="col-md-12">
								<label for="lname">Name</label>
								<input type="text" id="name" name="user_name" class="form-control" placeholder="Your name">
							</div>
							<div class="col-md-6">
								<label for="fname">Password</label>
								<input type="password" id="pw1" name="user_pwd" class="form-control" placeholder="Your password">
							</div>
							<div class="col-md-6">
								<label for="lname">Password Check</label>
								<input type="password" id="pw2" class="form-control" placeholder="check for password">
							</div>							
						</div>
						<div class="row form-group">
							<div class="col-md-12" >
								<label for="email">관심분야</label><br>
									<div style="color: white;">
									<input type="checkbox" name="interests" value="busking">버스킹  &nbsp;&nbsp;
									<input type="checkbox" name="interests" value="SocialDining">소셜다이닝&nbsp;&nbsp;
									<input type="checkbox" name="interests" value="sports">농구/축구/등 운동모임
									</div>
								</div>
						</div>
						<div class="row form-group">
							<div class="col-md-12">
								<label for="email">Address</label>
								<input type="text" id="addr1" name="addr1" class="form-control" placeholder="예) 서울시 강남구 (구까지만 적어주세요)">
							</div>
						</div>

						<div class="row form-group">
							<div class="col-md-12">	
								<label for="subject">Address 2</label>
								<input type="text" id="addr2" name="addr2" class="form-control" placeholder="상세주소 작성">
							</div>
						</div>

						<div class="row form-group">
							<div class="col-md-12">
								<label for="message">Introduction</label>
								<textarea name="introduce" id="message" cols="30" rows="10" class="form-control" placeholder="Write about yourself"></textarea>
							</div>
						</div>
						<div class="form-group">
							<input type="button" id="send" value="Register" class="btn btn-primary">
						</div>
					</form>		
				</div>
			<!-- </div> -->
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/footer.jsp" %>
	
	<!-- jQuery -->

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

<script>
	$(function() {
		$('#idcheck').on('click',function(){
			window.open("goidCheck","newidwindow","top=150,left=150,width=500,height=400");
		});
	});
</script>
</body>
</html>
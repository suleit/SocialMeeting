<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
					<h3>${sessionScope.loginUser.user_id}님, 원하시는 항목을 수정해주세요</h3>
					<p>수정 확인을 위하여 비밀번호란을 정확하게 입력해 주시기 바랍니다. </p>
					<form id="form1" 
					action="updateInfo" method="post" >
						<div class="row form-group">
							<input type="hidden"  id="id" name="user_id" value="${sessionScope.loginUser.user_id}">
							<div class="col-md-12">
								<label for="name">Name</label>
								<input type="text" id="name" name="user_name" class="form-control" value="${sessionScope.loginUser.user_name}">
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
								<label>관심분야</label><br>
									<div style="color: white;">
									<input type="checkbox" name="interests" id="busking" value="busking">버스킹  &nbsp;&nbsp;
									<input type="checkbox" name="interests" id="SocialDining" value="SocialDining">소셜다이닝&nbsp;&nbsp;
									<input type="checkbox" name="interests" id="sports" value="sports">농구/축구/등 운동모임
									</div>
								</div>
								
								</div>
						<div class="row form-group">
							<div class="col-md-12">
								<label for="email">Address</label>
								<input type="text" id="addr1" name="addr1" class="form-control" value="${sessionScope.loginUser.addr1}" >
							</div>
						</div>

						<div class="row form-group">
							<div class="col-md-12">	
								<label for="subject">Address 2</label>
								<input type="text" id="addr2" name="addr2" class="form-control" value="${sessionScope.loginUser.addr2}" >
							</div>
						</div>

						<div class="row form-group">
							<div class="col-md-12">
								<label for="message">Introduction</label>
								<textarea style="text-align:left;" name="introduce" id="message" cols="30" rows="10" class="form-control" >
								${sessionScope.loginUser.introduce}</textarea>
							</div>
						</div>
						<div class="form-group">
							<input type="button" id="send" value="제출" class="btn btn-primary">
						</div>
					</form>	
					</div>	
				</div>
			<!-- </div> -->
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
		$(function(){	
			$('#send').on('click',function(){
			var id = $('#id').val();
			var pw1 =$('#pw1').val();
			var pw2 =$('#pw2').val();
			console.log(pw1+pw2);
				if(pw1!=pw2){
					alert("입력한 pw값이 서로 다릅니다. 같은 pw를 똑같이 입력해주세요.")
					return;
				}
				$.ajax({
					url:"pwcheck",
					type:"post",
					data:{"user_pwd":pw1, "user_id":id},
					success:function(data){
						if(data==true){ //폼 전송하기 
							$('#form1').submit();
						}else{
							alert("pw값이 불일치합니다. 다시 입력해주세요.");
						}
					},
					error:function(data){
						alert("통신에러");
					}
					
				});
			});
		});
			
		$(function() {	
			var array = new Array();
			<c:forEach var="item" items="${sessionScope.interests}">
			array.push("${item}");
			</c:forEach>
			console.log(array.length);
			
			if(array.length==3){
				//alert("3개다");
				$('input:checkbox').prop('checked',true);
			}else{
				for ( var i in array) {
					if(array[i]=="버스킹"){
						$('input:checkbox[id="busking"]').prop('checked',true);
						continue;
					}
					if(array[i]=="소셜다이닝"){
						$('input:checkbox[id="SocialDining"]').prop('checked',true);
						continue;
					}
					if(array[i]=="농구/축구/등 운동모임"){
						$('input:checkbox[id="sports"]').prop('checked',true);
					}
				}
			}
			
			
		});
	</script>
</body>
</html>
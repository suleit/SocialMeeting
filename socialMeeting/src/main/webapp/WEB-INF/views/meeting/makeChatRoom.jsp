<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>모임 개설&채팅방 만들기</title>
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
			var $form= $('#form1');
			var meetingname= $('#meetingName').val();
			
			if(meetingname.length<5||meetingname.length>20){
				alert("모임명은 5자 이상 20자 이내로 작성해주세요");
				return;
			}
			
			var purpose= $('#purpose').val();//입력값
				if(purpose!=""){
			   $('#otherpur').val(purpose);
				}
			 
			
			$form.submit();
			console.log($form);
		});
	});
	
	$(function(){
		$('#meetingName').keyup(function() {
			var input= $('#meetingName').val().length;
			var remain = 21-input;
			var meetname =$('#meetingName').val();
			console.log(meetname);
			var content = "<p style='color:red;'>"+remain + "자 더 입력 가능합니다.</p>";
				$('#output').html(content);
				//alert(input);
			if(input>4){
				$.ajax({ //모임명 중복체크 
					url: 'checkmeetingname',
					type: 'POST',
					data: {'roomname':meetname},
					success:function(resp){
						if(resp=='true'){
							content="<p style='color:red;'>이미 있는 모임명입니다. 다른 이름을 입력해주세요</p>";
						}else{
							content="<p style='color:red;'>해당 모임명은 사용 가능합니다.</p>";
						}
						$('#output').html(content);
						//alert(input);
					}
				});
			}
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
					<h3>모임개설 및 채팅방 만들기</h3>
					
					<form id="form1" 
					action="insertcnm" method="post" >
						<input type="hidden" value="${lat}" name="location_lat">
						<input type="hidden" value="${lng}" name="location_lng">
						<input type="hidden" value="${sessionScope.loginUser.user_id}" name="creator">
						<div class="row form-group">
							<div class="col-md-6">
								<label for="fname">채팅방(모임명) 이름</label>
								<input type="text" id="meetingName" name="meetingname" class="form-control" placeholder="21자 이내로 작성">
							</div>
							
							<div class="col-md-6" id="output"></div>
				
							<div class="col-md-12">
								<label for="lname">모임 인원수</label>
								<input type="number" id="pnum" name="peoplenum" class="form-control" placeholder="2~100명 범위로 지정가능" value="2">
							</div>
							<div class="col-md-6">
								<label for="fname">모임일시</label>
								<input type="datetime-local" id="pw1" name="dday" class="form-control" placeholder="모임 예정 일시를 적어주세요">
							</div>
							<div class="col-md-6">
								<label for="lname">모집 마감일시</label>
								<input type="datetime-local" id="pw2" name="enddate" class="form-control" placeholder="check for password">
							</div>							
						</div>
						<div class="row form-group">
							<div class="col-md-12" >
								<label for="purpose">모임 분류</label><br>
									<div style="color: white;">
									<input type="radio" name="purpose" value="버스킹">버스킹  &nbsp;&nbsp;
									<input type="radio" name="purpose" value="소셜다이닝">소셜다이닝&nbsp;&nbsp;
									<input type="radio" name="purpose" value="스포츠 모임">스포츠 모임
									<input type="radio" id="otherpur" name="purpose" value="">&nbsp;
									<input type="text" id="purpose" placeholder="기타 모임 목적 입력" style="color: black;">
									</div>
								</div>
						</div>
						<div class="row form-group">
							<div class="col-md-12">
								<label for="email">Address</label>
								<input type="text" id="addr1" name="addr" class="form-control" value="${addr}">
							</div>
						</div>

						<div class="row form-group">
							<div class="col-md-12">	
								<label for="subject">Address 2</label>
								<input type="text" id="addr2" name="addr" class="form-control" placeholder="상세주소 작성">
							</div>
						</div>

						<div class="row form-group">
							<div class="col-md-12">
								<label for="message">모임 안내/소개글</label>
								<textarea name="info" id="message" cols="30" rows="10" class="form-control" placeholder="모임에 대한 설명을 상세하게 적어주세요"></textarea>
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
</script>
</body>
</html>
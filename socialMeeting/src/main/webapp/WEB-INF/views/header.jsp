<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
	<title></title>
	
<script src="js/jquery.min.js"></script>
<!-- <script type="text/javascript">

$(function(){
	$("li").on('click',function(){
		//$except= $(this);
		//$except.removeClass('active');
		//alert($except); 

		$(this).addClass('active');
		// 포기잼... 
	});
});
</script>	 -->
</head>
<body>
<div class="fh5co-loader"></div>	
	<nav class="fh5co-nav" role="navigation">
		<div class="container">
			<div class="row">
				<div class="col-xs-2">
					<div id="fh5co-logo"><a href="gotohome">FlashMeeting<strong>.</strong></a></div>
				</div>
				<div class="col-xs-10 text-right menu-1">
					<ul>
						<li><a href="gotohome">Home</a></li>
						<li><a href="gotoinfo">INFO</a></li>
						<li class="has-dropdown">
							<a href="#">Meetings</a>
							<ul class="dropdown">
								<li><a href="meetinglist">Meeting Lists</a></li>
								<li><a href="gotoCreate">Create Chat</a></li>
							</ul>
						</li>
					<c:choose>
						<c:when test="${sessionScope.loginUser==null}">
						<li><a href="gotologin">LOGIN</a></li>
						<li><a href="gotojoin">JOIN</a></li>
						</c:when>
						<c:otherwise>
						<li><a href="logout">LOGOUT</a></li>
						<li><a href="gotoMypage">MYPAGE</a></li>						
						</c:otherwise>
					</c:choose>
					</ul>
				</div>
			</div>
		</div>		
	</nav>
	
</body>
</html>
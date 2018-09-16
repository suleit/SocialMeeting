<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>채팅리스트 보기</title>
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
<style>
body {
	color: #3f6084;
}
#maintitle{
font-family: "Sacramento", Arial, serif;
color: #fff;
font-size: 30px;
font-style: bold;
}
th{
color: #fff;
}

</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/header.jsp"%>

	<div id="fh5co-services" class="fh5co-section-gray"
		style="background-image: url(images/img_bg_6.jpg);">
		<div class="container">

			<div class="row animate-box" align="center">
				<div class="col-md-8 col-md-offset-2 text-center"
					style="margin-top: 10px;">
					<div id="maintitle">Chatting List</div>
					<p>리스트의 모임 목록을 클릭하여 지도로 모임 위치 확인 후 맵 상의 마커를 클릭하여 채팅방에 입장하세요</p>
				</div>
			</div>

			<div class="row">
				<div class="col-md-9">
					<div class="feature-left animate-box"
						data-animate-effect="fadeInLeft">
						<div class="table-responsive-vertical shadow-z-1">
							<!-- Table starts here -->
							<table id="table" class="table table-hover table-mc-light-blue">
								<thead>
									<tr>
										<th>모임명</th>
										<th>분류</th>
										<th>장소</th>
										<th>모임일시</th>
										<th>모집인원수</th>
										<th>현재인원수</th>
									</tr>
								</thead>
								<tbody>
							<c:choose>
								<c:when test="${meetlist!=null}">	
							<c:forEach var="meeting" items="${meetlist}">
									<tr>
								<td data-title="Link"><a
									href="javascript:void(window.open('meetingdetail?meetingname=${meeting.meetingname}','newidwindow','width=800,height=600'))">
										${meeting.meetingname}</a></td>
									<td data-title="purpose">${meeting.purpose}</td>
									<td data-title="addr">${meeting.addr}</td>
									<td data-title="dday">${meeting.dday}</td>
									<td data-title="peoplenum">${meeting.peoplenum}</td>
									<td data-title="joinnum">${meeting.joinnum}</td>
									<td data-title="lat" style="display:none;">${meeting.location_lat}</td>
									<td data-title="lng" style="display:none;">${meeting.location_lng}</td>
									</tr>
									
							</c:forEach>   
							</c:when>
								<c:otherwise>
									<td colspan="6">아직 작성된 모임이 없습니다.</td>
								</c:otherwise>
								</c:choose>
 								</tbody>
							</table>
						</div>
						<div style="text-align: center;">
						<p>
							<a href="meetinglist?page=1&search=${search}&searchWord=${searchWord}">◁ ◁</a>
							<a href="meetinglist?page=${navi.currentPage-1}&search=${search}&searchWord=${searchWord}">◀</a>
							<c:forEach var="page" begin="${navi.startPageGroup}" end="${navi.endPageGroup}">
							&nbsp; <a href="meetinglist?page=${page}&search=${search}&searchWord=${searchWord}">${page}</a> &nbsp;
							</c:forEach>
							<a href="meetinglist?page=${navi.currentPage+1}&search=${search}&searchWord=${searchWord}">▶</a>
							<a href="meetinglist?page=${navi.totalPageCount}&search=${search}&searchWord=${searchWord}">▷ ▷</a>
						</p>
					</div>
					<div>
						<p>모임 검색하기</p>
						<form action="meetinglist" method="post">
							<select name="search" style="height: 30px;">
								<option value="meetingname" ${searchItem=='meetingname'?'selected':''}>모임명</option>
								<option value="addr" ${searchItem=='addr'?'selected':''}>주소위치</option>
								<option value="info" ${searchItem=='info'?'selected':''}>모임설명</option>
							</select> <input type="text" name="searchWord" value="${searchWord}" style="width: 60%;" required>
							<input type="submit" value="검색">
						</form>
					</div>	
					</div>
				</div>
				<div class="col-md-3">
					<div class="fh5co-video fh5co-bg" id="map">
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="/WEB-INF/views/footer.jsp"%>
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
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d1cf41e73cf098a68bb49d38269f80dd&libraries=services">
		
	</script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d1cf41e73cf098a68bb49d38269f80dd"></script>
		

	<script type="text/javascript">
		
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center : new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
		level : 4
	// 지도의 확대 레벨
	};
	var map = new daum.maps.Map(mapContainer, mapOption); //지도생성

	var marker;
	var infowindow;
	$(function() {
		$('#table tr').click(function() {
			if(marker!=null){
			marker.setMap(null); // 이전 마커 지워줌 
			infowindow.close();
			}
			
			var latstr="";
			var lngstr="";
			var td =$(this).children();
			latstr = td.eq(6).text();
			lngstr =td.eq(7).text();
			var name = td.eq(0).text().trim();
			
			var lat= Number(latstr);
			var lng= Number(lngstr);
			//console.log(lat);
			//console.log(lng);
			
			var markerposition =  new daum.maps.LatLng(lat, lng);
			
			marker = new daum.maps.Marker({
				  position: markerposition,
				});
			marker.setMap(map); // 마커 지도에 표시 
			
			map.panTo(markerposition); // 마커포지션으로 맵 이동시켜준다. 
			
			
		var iwContent = '<div align="center">';// 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
			iwContent += '<a class="btn btn-primary" href="javascript:void(window.open(';
			iwContent += "'gotochatting?roomname="+name+"'";
			iwContent += ",'newchatwindow"+name+"'";
			iwContent += ",'width=700,height=800'))";
			iwContent += '">채팅방 입장하기</a></div>';
		//console.log(iwContent);

		// 인포윈도우를 생성합니다
		infowindow  = new daum.maps.InfoWindow({
		    position: markerposition,
		    content: iwContent
		});
		
		infowindow.open(map, marker); 
			
		});
	});

	</script>
	
</body>
</html>
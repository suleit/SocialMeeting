<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html >

<html>
<head>
<meta charset="UTF-8">
<title>모임상세</title>
<link
	href='https://fonts.googleapis.com/css?family=Work+Sans:400,300,600,400italic,700'
	rel='stylesheet' type='text/css'>
<link href="https://fonts.googleapis.com/css?family=Sacramento"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/style.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<style type="text/css">
body {
	background-image: url(images/img_bg_5.jpg);
}

.container {
	margin-top: 10%;
}

input, textarea {
	border: none;
	background: transparent;
}

#maintitle {
	font-family: "Sacramento", Arial, serif;
	color: #3f6084;
	font-size: 30px;
	font-style: bold;
	align-content: center;
}

.buttons {
	text-align: center;
	align-content: center;
}

th {
	color: #3f6084;
}
</style>
</head>

<div class="row">
	<div class="col-md-12">
		<br> <br>
		<div id="maintitle">Meeting Infomation</div>
	</div>
	<div class="col-md-12">
		<div class="feature-left animate-box" data-animate-effect="fadeInLeft">
			<div class="table-responsive-vertical shadow-z-1">
				<!-- Table starts here -->
				<table id="table" class="table table-hover table-mc-light-blue">
					<tr>
						<th>모임명</th>
						<td data-title="title" colspan="2"><input type="text"
							name="meetingname" value="${meeting.meetingname}" readonly></td>
						<th>모임개설자</th>
						<td data-title="creator" colspan="2"><input type="text"
							name="user_id" value="${meeting.creator}" readonly></td>
					</tr>
					<tr>
						<th>위치정보</th>
						<td data-title="addr" colspan="5">${meeting.addr}</td>
					</tr>
					<tr>
						<th>모임일시</th>
						<td data-title="dday" colspan="2">${meeting.dday}</td>
						<th>모집마감</th>
						<td data-title="enddate" colspan="2">${meeting.enddate}</td>
					</tr>
					<tr>
						<th>모임분류</th>
						<td data-title="purpose">${meeting.purpose}</td>
						<th>모집인원수</th>
						<td data-title="peoplenum">${meeting.peoplenum}</td>
						<th>현재인원수</th>
						<td data-title="joinnum">${meeting.joinnum}</td>
					</tr>
					<tr>
						<th colspan="6">모임상세설명</th>
					</tr>
					<tr>
						<td data-title="info" colspan="6"><textarea
								style="width: 99%; height: 100%;" readonly>${meeting.info}</textarea></td>
					</tr>
				</table>
				<input type="hidden" name="userid"
					value="${sessionScope.loginUser.user_id}">
			</div>
			<div class="buttons">
				<c:if test="${sessionScope.loginUser.user_id==meeting.creator}">
					<a href="deletemeeting?meetingname=${meeting.meetingname}"
						id="deletem" class="btn btn-primary">삭제</a>
				</c:if>
				<button id="updatem" class="btn btn-primary">참여신청</button>
				<button id="unjoin" class="btn btn-primary">참여취소</button>
			</div>
		</div>
	</div>
</div>
<script>
var meetingname="";
var userid="";

	$(function() {
		meetingname = $('input[name="meetingname"]').val();
		userid = $('input[name="userid"]').val(); //로그인유저
		var creator = $('input[name="user_id"]').val();
		console.log(meetingname+" "+userid+" "+creator);
		if(userid == creator){
			console.log("여기들어오냐?");
			$('#updatem').attr('disabled',true);
			$('#unjoin').attr('disabled',true);
		}
		
		$.ajax({
			method : 'post',
			url : 'callingMemberlist',
			data : {'meetingname' : meetingname},
			dataType:'json',
			success : function(resp) {
				console.log(resp);
				var object =resp;
				$.each(object,function(index, item){
						console.log(item.user_id+":"+userid);
					if(item.user_id == userid){
						console.log("여기들어오냐?");
						$('#updatem').attr('disabled',true);
					}
				});
			}
			
		});
		
		
		$('#updatem').on('click', insertparticipate);
		$('#unjoin').on('click', deleteparticipate);
	});

	function insertparticipate() {
		meetingname = $('input[name="meetingname"]').val();
		userid = $('input[name="userid"]').val();
		console.log(meetingname + userid);

		$.ajax({
			method : 'post',
			url : 'joinmeeting',
			data : {
				'meetingname' : meetingname,
				'user_id' : userid
			},
			success : function(resp) {
				alert(resp);
				console.log(resp);
				location.reload();
			}
		});
	}

	function deleteparticipate() {
		meetingname = $('input[name="meetingname"]').val();
		console.log(meetingname + userid);
		$.ajax({
			method : 'post',
			url : 'unjoinmeeting',
			data : {
				'meetingname' : meetingname,
				'user_id' : userid
			},
			success : function(resp) {
				alert(resp);
				console.log(resp);
				location.reload();
			}
		});
	}
</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Chatting</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
<style>
/* Set height of the grid so .sidenav can be 100% (adjust if needed) */
.*{
margin: 0 px;
padding: 0 px;
}
html,body{
height: 100%;
}
.container-fluid{
	height: 90%;
}
.row.content {
	height: 100%;
}

/* Set gray background color and 100% height */
.sidenav {
	background-color: #f1f1f1;
	height: 100%;
}

/* Set black background color, white text and some padding */
footer {
	width:100%;
	position:absolute; 
	bottom:0px;
	margin-left:0;
	height: 10%;
	background-color: #555;
}

/* On small screens, set height to 'auto' for sidenav and grid */
@media screen and (max-width: 767px) {
	.sidenav {
		height: auto;
		padding: 15px;
	}
	.row.content {
		height: auto;
	}
}
hr.userlist{
border: thin solid white;
color: white;
}
input.chatinginput{
width: 77%;
margin: 0 auto;
color: black;
height: 80%;
}
input.chatbtn {
width: 10%;
margin: 0 auto;
color: black;
height: 80%;
}
div.footerdiv{
height: 100%;
}
label.idlabel{
width: 10%;
margin: 0 auto;
}
div.msgView{
overflow:auto;
height: 100%;
width: 100%;

}

</style>
<script>

function appendMessage(msg) {

	// 메세지 입력창에 msg를 하고 줄바꿈 처리
	$("#chatMessageArea").append(msg + "<br>");
	// 채팅창의 heigth를 할당
	var chatAreaHeight = $("#chatArea").height();
	// 쌓인 메세지의 height에서 채팅창의 height를 뺀다
	// 이를 이용해서 바로 밑에서 스크롤바의 상단여백을 설정한다
	var maxScroll = $("#chatMessageArea").height() - chatAreaHeight;

	/* .scrollTop(int) : Set the current vertical position of the scroll bar
	                     for each of the set of matched elements.*/
	// .scrollTop(int) : 파라미터로 들어간 px 만큼 top에 공백을 둔 채
	//                   스크롤바를 위치시킨다
	$("#chatArea").scrollTop(maxScroll);
}

function send() {
        var nickname = $("#nickname").val();
        var msg = $("#message").val();
        //console.log(msg);
        sock.send("msg:"+nickname+":" + msg);
        $("#message").val("");
    }

//evt 파라미터는 websocket이 보내준 데이터다.
function onMessage(evt) { //변수 안에 function자체를 넣음.
	var data = evt.data;
	var massage= "";
	 if (data.substring(0, 4) == "msg:") {
            appendMessage(data.substring(4));
            massage = data.substring(4);
        }
	 
	 if (data.substring(0, 4) == "유저목록") {
         massage = data;
     }
	 
	 if(massage.includes("유저목록::")){
		 var array=massage.split('::');
		 var userlist="";
		 for (var i = 1; i < array.length; i++) {
			userlist = userlist +array[i]+"<br>";
			console.log(userlist);
		}
		 console.log(userlist);
		 $('#users').html(userlist);
	 }

	 if(massage.includes("님이  퇴장하였습니다.")){
		 var n =massage.indexOf("님");
		alert(massage.substring(0,n));
	 }
	 
	 
	/* sock.close(); */
}
var id= "";

function onClose(evt) {
	alert("채팅이 종료되었습니다.")
	window.close();
}

function onOpen(evt) {
	id= $("#nickname").val();
	sock.send("ROOMNAME::::"+$("#roomname").val()+"::::"+$('#nickname').val());
	sock.send("msg:"+id+"님이  입장하였습니다.");
}

var sock;

$(document).ready(function() {
	//websocket을 지정한 URL로 연결 , 웹소켓 생성...생성자로 
	sock = new SockJS("<c:url value="/echo"/>");
	sock.onopen = onOpen;
	//websocket 서버에서 메시지를 보내면 자동으로 실행된다.
	sock.onmessage = onMessage;
	//websocket 과 연결을 끊고 싶을때 실행하는 메소드
	sock.onclose = onClose;
	
	
	
	$('#message').keypress(function(event){
		var keycode = (event.keyCode ? event.keyCode : event.which);
		 if(keycode == '13'){ // 엔터 키보드가 13
                send(); 
            }
		 event.stopPropagation(); /// 이벤트 발생 범위 한정하는 코드 
    });
    $('#sendBtn').click(function() { send(); });
    
});
    
    $(window).bind("beforeunload", function (e){
       	if(confirm("채팅을 종료하시겠습니까?")==true){
       		sock.send("msg:"+id+"님이  퇴장하였습니다.");
           	sock.close();
       	}else{
       		return;
       	}
    });


</script>
</head>
<body onbeforeunload="closewindow()">

	<div class="container-fluid">
		<div class="row content">
			<div class="col-sm-3 sidenav">
				<h4>Chatting User List</h4>
				<hr class="userlist">
				<div id="users">
				</div>
			</div>

			<div class="col-sm-9" id="chatArea">
				<h4>
					<small>채팅창 메인</small>
				</h4>
				<hr>
				<div class="msgView" id="chatMessageArea">
				
				</div>
			</div>
		</div>
	</div>
	<footer>
		<div class="footerdiv">
		<label class="idlabel">ID:${sessionScope.loginUser.user_id} </label>
		 <input type="text" id="message" class="chatinginput"> 
		 <input type="button" id="sendBtn" class="chatbtn" value="SEND">
		 <input type="hidden" id="roomname" value="${roomname}">
		 <input type="hidden" id="nickname" value="${sessionScope.loginUser.user_id}">
		 
		</div>
	</footer>
<script src="https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>

</body>
</html>

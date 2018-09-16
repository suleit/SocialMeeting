<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html >

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='https://fonts.googleapis.com/css?family=Work+Sans:400,300,600,400italic,700' rel='stylesheet' type='text/css'>
<link href="https://fonts.googleapis.com/css?family=Sacramento" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/style.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">

	function idSelect() {
		//opener에서 열기 때문에
		opener.document.getElementById("id").value=$('#userid').val();
		//현재 창 닫기
		this.close();
	}
	
	$(function() {
		
		var id="";
		$('#idch').on('click',function(){
			id=$('#userid').val();
			console.log("id"+id);
			if(userid.value.length<4 || userid.value.length>10){
				alert("4~10자리 사이의 아이디를 입력해주세요.");
				return;
			}
		$.ajax({
				url: "idCheck",
				type: "get",
				data: {"userid":id},
				success: function(data){
					//alert(data);
					var content="";
						$('#idtrue').empty();
						$('#idfalse').empty();
						if(data==true){
							//alert(data+"사용불가능");
							content= id+"는 이미 사용되고 있는 id라 사용이 불가능합니다.";
							$('#idtrue').append(content);
						}else{
							//alert(data+"사용 가능합니다.");
							content= id+'는 사용 가능합니다.<br>'+ '<input type="button" value="사용하기" id="selectid" onclick="idSelect()" class="btn btn-primary">';
							$('#idfalse').append(content);
						}
					},
				error:function(data){
					alert("통신에러");
				}
			});
		});		
	});
	
</script>
<style type="text/css">
body{
background-image:url(images/img_bg_5.jpg);
}
.container{
margin-top: 10%;
}
</style>
</head>
<body>
<div align="center" class="container" style="color: white;">
	
		<h2>[ID 중복확인]</h2>

	<div class="col-md-4 col-sm-4">
		<input type="text" id="userid" class="form-control" placeholder="ID는 4~10자리" /> 
		<br>
		<input type="button" id="idch" value="확인" class="btn btn-primary">
		<br>
	</div>
	<hr>
	<div id="idtrue">
	</div>
	<div id="idfalse">
	</div>
	
</div>
<br/> <br/>
<!-- 아이디 사용여부 체크 -->
<!-- request.getmethod -->


</body>
</html>
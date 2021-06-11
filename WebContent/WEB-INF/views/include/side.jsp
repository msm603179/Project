
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>

<script>
	$(document).ready(function() {
		$(".slideBtn").click(function() {
			if ($("#sidenav").width() == 0) {
				document.getElementById("sidenav").style.width = "250px";
				document.getElementById('sidenav').style.boxShadow = "rgba(0,0,0,0.5) 0 0 0 9999px";
				document.getElementById("slidebtn").style.paddingRight = "250px";
				document.getElementById("sidenav").style.zIndex = "1";
			} else {
				document.getElementById("sidenav").style.width = "0";
				document.getElementById('sidenav').style.boxShadow = "rgba(0,0,0,0.0) 0 0 0 9999px";
				document.getElementById("slidebtn").style.paddingRight = "0";
				document.getElementById("sidenav").style.zIndex = "0";
			}
		});
	});
	$(function() {
		$('#slideover').on('mouseover', function() {
			$('#slideover').css('opacity', '1');
		});
		$('#slideover').on('mouseout', function() {
			$('#slideover').css('opacity', '0.5');
		});
	});
</script>
<style>
body {
	margin: 0;
	padding: 0;
}

.sidenav {
	height: 100%;
	width: 0;
	position: fixed;
	z-index: 1;
	top: 0;
	right: 0;
	background-color: white;
	overflow-x: hidden;
	transition: 0.5s;
	padding-top: 60px;
}

.sidenav a {
	padding: 8px 8px 8px 32px;
	text-decoration: none;
	font-size: 25px;
	color: #818181;
	display: block;
	transition: 0.3s;
}

.slideBtn {
	transition: .5s;
	position: fixed;
	right: 0;
	font-size: 30px;
	cursor: pointer;
	top: calc(48%);
}

#main {
	transition: .5s;
}

.pc_name {
	text-align: center;
	margin-top: 20px;
}

li {
	display: inline-block;
	margin: 0px 110px;
	cursor: pointer;
}

.dropdown {
	display: inline-block;
}

#drop-content {
	position: absolute;
}

#drop-content a {
	display: block;
	background-color: #dfdfdf;
	color: black;
	text-decoration: none;
	margin: 2px 0px 0px 0px;
}
</style>
<c:set var="root" value="${pageContext.request.contextPath }/" />

</head>
<body>
    <div id="sidenav" class="sidenav" itemid="main">
        <div id="slidebtn" class="slideBtn"><img src="/filepath/${side }" style="width: 30px; opacity: 0.5;" id="slideover" class="aa" ></div>  
        <h2 style="margin-left: 20px;">내정보</h2>
            <a href="${root}logout">로그아웃</a>
            <a href="${root }${upd }?${idt }=${id }">정보수정</a>
            <a href="${root }${qa}">고객센터</a>
             <a href="#" onclick="window.open('${pageContext.request.contextPath }/user/1on1write','1on1', 'width=500, height=600 scrollbars=yes');">1대1 문의</a>
      </div>
      
</body>
</html>
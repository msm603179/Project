<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<script>
	function idfind() {
		window.open("m_id_find", "a",
				"width=520, height=350, left=500, top=150");
	}

	function pwfind() {
		window.open("m_pw_find", "b",
				"width=520, height=350, left=500, top=150");
	}
	window.onload = function() {

		function onClick() {
			document.querySelector('.modal_wrap').style.display = 'block';
			document.querySelector('.black_bg').style.display = 'block';
		}

		function offClick() {
			document.querySelector('.modal_wrap').style.display = 'none';
			document.querySelector('.black_bg').style.display = 'none';
		}

		document.getElementById('modal_btn').addEventListener('click', onClick);
		document.querySelector('.modal_close').addEventListener('click',
				offClick);
 
	};
</script>
<style>
.login_form {
	text-align: center;
}

.login_id {
	width: 450px;
	height: 55px;
	margin-bottom: 10px;
}

.login_pw {
	width: 450px;
	height: 55px;
	margin-bottom: 10px;
}

.login_button {
	width: 450px;
	height: 48px;
	margin-bottom: 10px;
	background-color: #900020;
	cursor: pointer;
	color: white;
}

.create {
	cursor: pointer;
}

input[type=button] {
	cursor: pointer;
}

.find {
	cursor: pointer;
	color: white;
}

span.find:hover {
	text-decoration: underline;
}
</style>
</head>
<body>
	<img src="https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Zilean_5.jpg" style="width: 100%;">
	<div class="login_form" style="width: 500px; height: 670px; margin-left: 500px; margin-top: 10px; position: absolute; top: 0px; right: 1000px;">
		<header style="text-align: center; margin-top: 60px; margin-bottom: 50px;">
			<img src="/filepath/${logimg }" height="250px">
		</header>
		<form:form modelAttribute="pc_maneger" action="m_log" method="post">
			<form:input path="m_id" placeholder="아이디" class="login_id"
				style="background-color: lightgray;" />
			<br>
			<form:password path="m_pw" showPassword="true" placeholder="비밀번호"
				class="login_pw" style="background-color: lightgray;" />
			<br>
			<form:button class="login_button">로그인</form:button>
			<br>
			<input type="button" class="login_button" value="회원가입"
				onclick="location.href='/Spring_project/maneger/inmaneger'">
		</form:form>
		<span onclick="idfind()" class="find" style="margin-left: 10px;">아이디
			찾기</span> <span onclick="pwfind()" class="find">비밀번호찾기</span><br>
		<div class="black_bg"></div>
	</div>
</body>
</html>
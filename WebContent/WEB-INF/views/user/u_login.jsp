<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- 시작 로그인 화면-->
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<script>
	function idfind() {
		window.open("u_id_find", "a",
				"width=520, height=350, left=500, top=150");
	}

	function pwfind() {
		window.open("u_pw_find", "b",
				"width=520, height=350, left=500, top=150");
	}
</script>
<style>
.login_form {
	text-align: center;
}

.login_id {
	width: 450px;
	height: 50px;
	margin-bottom: 10px;
}

.login_pw {
	width: 450px;
	height: 50px;
	margin-bottom: 10px;
}

.login_button {
	width: 460px;
	height: 50px;
	margin-bottom: 10px;
	background-color: skyblue;
	cursor: pointer;
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
<title>Document</title>
</head>
<body style="margin: 0%; padding: 0;">
	<img
		src="https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Ryze_11.jpg"
		style="width: 100%;">
	<div class="login_form"
		style="position: absolute; top: 40px; right: 1000px;">
		<header
			style="text-align: center; margin-top: 60px; margin-bottom: 50px;">
			<img src="/filepath/${logimg }" height="250px">
		</header>
		<form:form modelAttribute="pc_user" action="u_log" method="post">
			<form:input path="u_id" placeholder="아이디" class="login_id" />
			<br>
			<form:password path="u_pw" showPassword="true" placeholder="비밀번호"
				class="login_pw" />
			<br>
			<form:button class="login_button">로그인</form:button>
			<br>
			<input type="button" class="login_button" value="회원가입"
				onclick="location.href='/Spring_project/user/inuser'">
		</form:form>
		<span onclick="idfind()" class="find" style="margin-left: 10px;">아이디
			찾기</span> <span onclick="pwfind()" class="find">비밀번호찾기</span><br>
		<div class="black_bg"></div>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

body{
background-image: url("C:/Users/User/Desktop/concrete_wall_traces-wallpaper-2560x1440.jpg") ;
background-repeat: no-repeat;
background-size:cover;
}
</style>




</head>
<body>
	<div class="p-3 mb-2 bg-light text-dark">
	<div class="contatiner">

		<div class="card shadow mx-auto mt-3 mb-3" style="width: 30rem;">
			<div class="card-body">
				<h5 class="card-title text-center">답변쓰기</h5>
				<form:form method="post" modelAttribute="qabean"
					action="qacommentsucces">
					<form:label path="subject">제목</form:label>
					<form:input path="subject" class="form-control" />
					<form:label path="content">내용</form:label>
					<br>
					<form:textarea path="content" class="form-control" rows="10"
						style="resize:none" />
					<form:errors path="content" />
					<form:hidden path="u_id" />
					<form:hidden path="ref" />
					<form:hidden path="step" />
					<form:hidden path="bolevel" />
					<form:hidden path="readcount" />
					<br>

					<div class="form-group text-right">
						<form:button class="btn btn-primary">등록</form:button>
					</div>
				</form:form>
			</div>
		</div></div>
</body>
</html>
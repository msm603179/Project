<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />
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
</head>
<body>

	<div class="contatiner">


		<div class="card shadow mx-auto mt-5" style="width: 30rem;">
			<div class="card-body">
				<h5 class="card-title text-center">1:1 문의</h5>
				<form action="1on1send" method="post">
					<label>제목</label> 
					<input type="text" class="form-control" name="subject"/> <br>

					<label>내용</label>
					<textarea class="form-control" cols="10" rows="10" name="text"></textarea>

					<br>

					<div class="form-group text-right">
						<input type="submit" value="문의하기" class="btn btn-primary" /> 
						<input type="reset" value="다시쓰기" class="btn btn-warning" />
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
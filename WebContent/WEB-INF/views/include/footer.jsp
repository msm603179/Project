<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

</head>
<footer>


	<div class="bg-dark text-secondary px-4 py-5 text-center">
		<div class="py-5">
			<h1 class="display-5 fw-bold text-white">Legacy</h1>
			<div class="col-lg-6 mx-auto">
				<p class="fs-5 mb-4">
					서울특별시 용산구<br> 독서당로 111<br> 전화번호 : 02-2199-3114 <br>
					이메일 : <a href="mailto:#">support@legacy.com</a>
				<div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
					<button type="button" onclick="window.open('${pageContext.request.contextPath }/board/qaboardwrite','qaboardwrite', 'width=500, height=600 scrollbars=yes');"
						class="btn btn-outline-info btn-lg px-4 me-sm-3 fw-bold">제휴문의</button>
					<button type="button" onclick="location.href='${pageContext.request.contextPath }/board/qaboardlist'" class="btn btn-outline-info btn-lg px-4 me-sm-3 fw-bold">
					고객센터</button>  
				</div>
				<div class="py-5">
					<a class="px-3 link-secondary text-decoration-non" href="#">개인정보처리방침</a>
					<a class="px-3 link-secondary text-decoration-non" href="#">서비스
						이용약관</a>
				</div>
			</div>
		</div>
	</div>
</footer>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" 	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
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
body{
background-image: url("/filepath/${boardbackimg}");
background-repeat: no-repeat;
background-size:cover;
}

.img-fluid{
	margin-right: -1rem;
	margin-left: -1rem;
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

</head>
<body>

 <div id="sidenav" class="sidenav" itemid="main">
        <div id="slidebtn" class="slideBtn"><img src="/filepath/${side }" style="width: 30px; opacity: 0.5;" id="slideover" class="aa" ></div>  
        <h2 style="margin-left: 20px;">내정보</h2>
            <a href="${root}logout">로그아웃</a>
            <a href="${root }${upd }?${idt }=${id }">정보수정</a>
            <a href="${root }${qa}">고객센터</a>
            <a href="${root }${rev}">리뷰 게시판</a>
            <a href="${root }${enrol}">피시방 등록</a>
             <a href="${root }${mail}">1대1 문의</a>
      </div>
      
      
      
      
	<div class="contatiner">
		
			<div class="container bg-light p-0 mt-3 text-center">
					<img src="/filepath/${noticebanner }" class="img-fluid" alt="...">
				</div>

		<div class="card shadow mx-auto mt-5" style="width: 70rem;">
			<div class="card-body">

				<table class="table">
					<tr>
						<th width="100">제목</th>
						<td width="500">${notice.notice_subject }</td>
					</tr>
					<tr>
						<th width="100">작성일</th>
						<td width="700">${notice.writedate }</td>
					</tr>
					<tr>
						<th width="100">내용</th>
						<td width="700">${notice.notice_content }</td>
					</tr>
				</table>

				<div class="form-group text-right">
					<a href="qaboardlist" class="btn btn-outline-primary">목록</a> 
				</div>

			</div>
		</div>
	</div>
	
	
<footer>
	<div class="bg-dark text-secondary px-4 py-5 text-center mt-5">
		<div class="py-5">
			<h1 class="display-5 fw-bold text-white">Legacy</h1>
			<div class="col-lg-6 mx-auto">
				<p class="fs-5 mb-4">
					서울특별시 용산구<br> 독서당로 111<br> 전화번호 : 02-2199-3114 <br>
					이메일 : <a href="mailto:#">support@legacy.com</a>
				<div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
					<button type="button" onclick="window.open('${pageContext.request.contextPath }/board/revboardlist','revboardlist', 'width=550, height=700 scrollbars=yes');"
						class="btn btn-outline-info btn-lg px-4 me-sm-3 fw-bold">제휴문의</button>
					<button type="button" onclick="location.href='${pageContext.request.contextPath }/board/qaboardlist'" class="btn btn-outline-info btn-lg px-4 me-sm-3 fw-bold ml-3">
					고객센터</button>  
				</div>
				<div class="py-3">
					<a class="px-3 link-secondary text-decoration-non" href="#">개인정보처리방침</a>
					<a class="px-3 link-secondary text-decoration-non" href="#">서비스
						이용약관</a>
				</div>
			</div>
		</div>
	</div>
</footer>
	
	
	
	
</body>
</html>
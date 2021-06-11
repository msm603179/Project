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

<!-- 기존 탭 유지 -->
<script>

$(document).ready(function() {
	$('a[data-toggle="tab"]').on('show.bs.tab', function(e) {
		localStorage.setItem('activeTab', $(e.target).attr('href'));
	});
	var activeTab = localStorage.getItem('activeTab');
	if (activeTab) {
		$('#rowTab a[href="' + activeTab + '"]').tab('show');
	}
});

function noticeselChange() {
	var sel = document.getElementById('noticepagesize').value;
	location.href = "${root }board/qaboardlist?pagenum=${noticepage.pagenum}&pagesize="
			+ sel;
}

function faqselChange() {
	var sel = document.getElementById('faqpagesize').value;
	location.href = "${root }board/qaboardlist?pagenum=${noticepage.pagenum}&pagesize="
			+ sel;
}

function qaselChange() {
	var sel = document.getElementById('qapagesize').value;
	location.href = "${root }board/qaboardlist?pagenum=${noticepage.pagenum}&pagesize="
			+ sel;
}
<!--/ 기존 탭 유지 -->

<!-- 사이드메뉴 -->

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
	
<!-- /사이드메뉴 -->	
</script>

<style>
body {
	background-image: url("/filepath/${boardbackimg}");
	background-repeat: no-repeat;
	background-size: cover;
}

.img-fluid {
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
            <a href="#" onclick="window.open('${pageContext.request.contextPath }/user/1on1write','1on1', 'width=500, height=600 scrollbars=yes');">1대1 문의</a>
      </div>
  
 
	<!-- 0 게시판 탑 -->
		<div class="row bg-white">
		
			<div class="col">
				<ul class="nav nav-tabs" id="rowTab">
					<li class="nav-item"><a
						class="nav-link active mt-3 mb-3 mr-auto" data-toggle="tab"
						href="#notice" style="font-size: 20px;">공지사항</a></li>
					<li class="nav-item"><a class="nav-link mt-3 mb-3"
						data-toggle="tab" href="#pqa" style="font-size: 20px;">자주하는 질문</a></li>
					<li class="nav-item"><a class="nav-link mt-3 mb-3"
						data-toggle="tab" href="#qa" style="font-size: 20px"; >이용문의</a></li>
				</ul>
			</div>
		</div>

		<div class="container">
			<div class="tab-content mt-3 text-center">
				<div class="tab-pane fade show active" id="notice">
					<!-- 공지사항 배너 -->
					<div class="container bg-light p-0">
						<img src="/filepath/${noticebanner }" class="img-fluid" alt="...">
					</div>

					<!-- 1. 공지사항 -->

					<div id="outter" class="text-right mt-4">
						<div>
							<select style="height: 40px; font-size: 15px;"
								id="noticepagesize" name="sel" onchange="noticeselChange()">
								<option value="5"
									<c:if test="${noticepage.pagesize == 5}">selected</c:if>>5줄
									보기</option>
								<option value="10"
									<c:if test="${noticepage.pagesize == 10}">selected</c:if>>10줄
									보기</option>
								<option value="15"
									<c:if test="${noticepage.pagesize == 15}">selected</c:if>>15줄
									보기</option>
								<option value="20"
									<c:if test="${noticepage.pagesize == 20}">selected</c:if>>20줄
									보기</option>
							</select>
						</div>
					</div>

					<%
					//게시글 번호 내림차순으로 정렬할 변수
					int noticenumber = (int) request.getAttribute("noticenumber");
					%>


					<div class="container my-4">

						<div class="row">

							<table class="table table-hover bg-white"
								style="border: 1px solid">
								<colgroup>
									<col width="120" />
									<col width="400" />
									<col width="120" />
									<col width="150" />
									<col width="120" />
								</colgroup>

								<thead>

									<tr class="bg-dark">
										<th class="bg-dark text-light" scope="col"
											style="text-align: center; font-size: 18px;">번호</th>
										<th class="bg-dark text-light" scope="col"
											style="text-align: center; font-size: 18px">제목</th>
										<th class="bg-dark text-light" scope="col"
											style="text-align: center; font-size: 18px">작성일</th>
										<th class="bg-dark text-light" scope="col"
											style="text-align: center; font-size: 18px">조회수</th>
									</tr>
									<c:forEach var="allNoticeBoard" items="${allNoticeBoard }">
										<tr>
											<td style="text-align: center; font-size: 14px;"><%=noticenumber%></td>
											<td><a
												href="noticeboardread?num=${allNoticeBoard.notice_num }"
												style="font-size: 14px; text-decoration: none; color: black;">${allNoticeBoard.notice_subject }</a></td>
											<td style="font-size: 14px; text-align: center;">${allNoticeBoard.writedate }
											<td style="font-size: 14px; text-align: center;">${allNoticeBoard.readcount }</td>
											<%
											noticenumber--;
											%>
										</tr>
									</c:forEach>
							</table>
						</div>
					</div>

					<!-- 1.1 Pagination -->
					<div class="container">
						<nav aria-label="pagination">
							<div class="d-none d-md-block">
								<ul class="pagination justify-content-center">

									<!-- 1.2 Previous -->
									<c:choose>
										<c:when test="${noticepage.prevPage <=0 }">
											<li class="page-item disabled"><a class="page-link"
												href="#"> Previous</a></li>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a
												href="${root}board/qaboardlist?pagenum=${noticepage.prevPage}&pagesize=${noticepage.pagesize}"
												class="page-link">Previous</a></li>
										</c:otherwise>
									</c:choose>


									<!-- 1.3 Current -->

									<c:forEach var="num" begin="${noticepage.min}"
										end="${noticepage.max}">
										<li class="page-item"><a class="page-link"
											href="${root }board/qaboardlist?pagenum=${num }&pagesize=${noticepage.pagesize}">${num}</a>
										</li>
									</c:forEach>

									<!-- 1.4 Next -->

									<c:choose>
										<c:when test="${noticepage.prevPage > noticepage.numberring}">
											<li class="page-item disabled"><a class="page-link"
												href="#"> Next</a></li>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a
												href="${root}board/qaboardlist?pagenum=${noticepage.nextPage}&pagesize=${noticepage.pagesize}"
												class="page-link">Next</a></li>
										</c:otherwise>
									</c:choose>
								</ul>
							</div>
						</nav>
					</div>


				</div>


				<!-- 1. 공지사항 끝-->


				<!-- 2. FAQ 게시판 -->

				<div class="tab-pane fade" id="pqa">
					<div class="container bg-light p-0">
						<img src="/filepath/${faqbanner }" class="img-fluid mx-0 px-0"
							alt="...">
					</div>
					<div id="outter" class="text-right mt-4">
						<div>
							<select id="faqpagesize" name="sel" onchange="faqselChange()">
								<option value="5"
									<c:if test="${faqpage.pagesize == 5}">selected</c:if>>5줄
									보기</option>
								<option value="10"
									<c:if test="${faqpage.pagesize == 10}">selected</c:if>>10줄
									보기</option>
								<option value="15"
									<c:if test="${faqpage.pagesize == 15}">selected</c:if>>15줄
									보기</option>
								<option value="20"
									<c:if test="${faqpage.pagesize == 20}">selected</c:if>>20줄
									보기</option>
							</select>
						</div>
					</div>


					<%
					//게시글 번호 내림차순으로 정렬할 변수
					int faqnumber = (int) request.getAttribute("faqnumber");
					%>

					<div class="container my-4">

						<div class="row">

							<table class="table table-hover bg-white"
								style="border: 1px solid">
								<colgroup>
									<col width="120" />
									<col width="*" />
									<col width="120" />
									<col width="150" />
									<col width="120" />
								</colgroup>

								<thead>

									<tr class="bg-dark">
										<th class="bg-dark text-light" scope="col"
											style="font-size: 18px; text-align: center;">번호</th>
										<th class="bg-dark text-light" scope="col"
											style="font-size: 18px; text-align: center;">제목</th>
									</tr>
									<c:forEach var="allfaqBoard" items="${allfaqBoard }">
										<tr>
											<td style="font-size: 14px; text-align: center;"><%=faqnumber%></td>
											<td style="font-size: 14px;">
											<a href="faqboardread?num=${allfaqBoard.faq_num }"
												style="text-decoration: none; color: black;">${allfaqBoard.faq_subject }</a></td>
											<%
											faqnumber--;
											%>
										</tr>
									</c:forEach>
								</thead>
							</table>
						</div>

						<!-- 2.1 Pagination -->
						<div class="container">
							<nav aria-label="pagination">
								<div class="d-none d-md-block">
									<ul class="pagination justify-content-center">

										<!-- 2.2 Previous -->
										<c:choose>
											<c:when test="${faqpage.prevPage <=0 }">
												<li class="page-item disabled"><a class="page-link"
													href="#"> Previous</a></li>
											</c:when>
											<c:otherwise>
												<li class="page-item"><a
													href="${root}board/qaboardlist?pagenum=${faqpage.prevPage}&pagesize=${faqpage.pagesize}"
													class="page-link">Previous</a></li>
											</c:otherwise>
										</c:choose>

										<!-- 3.3 Current -->

										<c:forEach var="num" begin="${faqpage.min}"
											end="${faqpage.max}">
											<li class="page-item"><a class="page-link"
												href="${root }board/qaboardlist?pagenum=${num }&pagesize=${faqpage.pagesize}">${num}</a>
											</li>
										</c:forEach>

										<!-- 3.4 Next -->

										<c:choose>
											<c:when test="${faqpage.prevPage > qaboardpage.numberring}">
												<li class="page-item disabled"><a class="page-link"
													href="#"> Next</a></li>
											</c:when>
											<c:otherwise>
												<li class="page-item"><a
													href="${root}board/qaboardlist?pagenum=${faqpage.nextPage}&pagesize=${faqpage.pagesize}"
													class="page-link">Next</a></li>
											</c:otherwise>
										</c:choose>
									</ul>
								</div>
							</nav>
						</div>
					</div>
				</div>
				<!-- 2. FAQ 게시판 끝 -->




				<!-- 3. QA 게시판 -->


				<div class="tab-pane fade" id="qa">
					<div class="container bg-light p-0">
						<img src="/filepath/${qabanner }" class="img-fluid" alt="...">
					</div>
					

					
					<div id="outter" class="text-right mt-4">
						<div>
							<select id="qapagesize" name="sel" onchange="qaselChange()">
								<option value="5"
									<c:if test="${qaboardpage.pagesize == 5}">selected</c:if>>5줄
									보기</option>
								<option value="10"
									<c:if test="${qaboardpage.pagesize == 10}">selected</c:if>>10줄
									보기</option>
								<option value="15"
									<c:if test="${qaboardpage.pagesize == 15}">selected</c:if>>15줄
									보기</option>
								<option value="20"
									<c:if test="${qaboardpage.pagesize == 20}">selected</c:if>>20줄
									보기</option>
							</select>
						</div>
					</div>
					<%
					//게시글 번호 내림차순으로 정렬할 변수
					int qanumber = (int) request.getAttribute("qanumber");
					%>

					<div class="container my-4">

						<div class="row">

							<table class="table table-hover bg-white"
								style="border: 1px solid">
								<colgroup>
									<col width="120" />
									<col width="*" />
									<col width="120" />
									<col width="150" />
									<col width="120" />
								</colgroup>

								<thead>

									<tr class="bg-dark">
										<th class="bg-dark text-light" scope="col"
											style="font-size: 18px; text-align: center;">번호</th>
										<th class="bg-dark text-light" scope="col"
											style="font-size: 18px; text-align: center;">제목</th>
										<th class="bg-dark text-light" scope="col"
											style="font-size: 18px; text-align: center;">작성자</th>
										<th class="bg-dark text-light" scope="col"
											style="font-size: 18px; text-align: center;">작성일</th>
										<th class="bg-dark text-light" scope="col"
											style="font-size: 18px; text-align: center;">조회수</th>
									</tr>
									<c:forEach var="allQABoard" items="${allQABoard }">
										<tr>
											<td style="font-size: 14px; text-align: center;"><%=qanumber%></td>
											<td><a href="qaboardread?num=${allQABoard.num }"
												style="text-decoration: none; color: black;">${allQABoard.subject }</a></td>
											<td style="font-size: 14px; text-align: center;">${allQABoard.u_id }</td>
											<td style="font-size: 14px; text-align: center;">${allQABoard.writedate }
											<td style="font-size: 14px; text-align: center;">${allQABoard.readcount }</td>
											<%
											qanumber--;
											%>
										</tr>
									</c:forEach>
								</thead>
							</table>
						</div>

						<!-- 3.1 Pagination -->
						<div class="container">
							<nav aria-label="pagination">
								<div class="d-none d-md-block">
									<ul class="pagination justify-content-center">

										<!-- 3.2 Previous -->
										<c:choose>
											<c:when test="${qaboardpage.prevPage <=0 }">
												<li class="page-item disabled"><a class="page-link"
													href="#"> Previous</a></li>
											</c:when>
											<c:otherwise>
												<li class="page-item"><a
													href="${root}board/qaboardlist?pagenum=${qaboardpage.prevPage}&pagesize=${qaboardpage.pagesize}"
													class="page-link">Previous</a></li>
											</c:otherwise>
										</c:choose>


										<!-- 2.3 Current -->
										<!-- 이 부분 때문에 네모박스가 깨지는 거 같아요;;; -->
										<c:forEach var="num" begin="${qaboardpage.min}"
											end="${qaboardpage.max}">
											<li class="page-item"><a class="page-link"
												href="${root }board/qaboardlist?pagenum=${num }&pagesize=${qaboardpage.pagesize}">${num}</a>
											</li>
										</c:forEach>

										<!-- 2.4 Next -->

										<c:choose>
											<c:when
												test="${qaboardpage.prevPage > qaboardpage.numberring}">
												<li class="page-item disabled"><a class="page-link"
													href="#"> Next</a></li>
											</c:when>
											<c:otherwise>
												<li class="page-item"><a
													href="${root}board/qaboardlist?pagenum=${qaboardpage.nextPage}&pagesize=${qaboardpage.pagesize}"
													class="page-link">Next</a></li>
											</c:otherwise>
										</c:choose>
									</ul>
								</div>
							</nav>
						</div>

						<!-- 3.5 글쓰기 버튼 -->

						<div class="text-right">
							<button type="button"
								onclick="location.href='${pageContext.request.contextPath }/board/qaboardwrite'"
								class="btn btn-danger btn-lg">글쓰기</button>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
	
	
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
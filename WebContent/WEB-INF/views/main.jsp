<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <c:set var='root' value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html>
<head>
   <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
   <link rel="stylesheet" href="<c:url value='/libs/bootstrap-4.4.1-dist/css/bootstrap.min.css'/>">
</head>
<style>
   .move{
      z-index: 1;
      position: absolute; 
      top: 310px; 
      left: 510px; 	
       padding: 20px 20px 20px 20px;
       opacity: 0;
       
   }
   
   .move_img{
      width: 225px; height: 210px;
   }
   
   .move_img1{
      width: 235px; height: 225px;
   }
   
   @keyframes fadein {
      from{
         opacity: 0;
      }
      to{
         opacity: 0.8;
      }
   }
        
   @keyframes fadeout{
      from{
         opacity: 0.8;
      }
      to{
         opacity: 0;
      }
   }
   
   .move:hover{
      animation: fadein 3s;
      opacity: 0.8;
   }
   

</style>
<body>

<!-- <a href="imgup/imgpage">img</a><br>
<a href="pc_enrol/pc_enrol2">음식사진등록</a><br>
<a href="pc_enrol/pc_enrol1">피시방등록1</a><br>
<a href="board/revboardwrite">리뷰게시판글쓰기</a><br>
<a href="board/revboardlist">리뷰게시판목록</a><br>
<a href="credit">카카오</a><br>
<a href="credit2">이니시스</a><br>
<a href="pcmain/pc_main1?pc_name=가">pc방 메인</a><br>
<a href="pc_enrol/pc_enrol3">시간등록</a><br>
<a href="pc_enrol4">pc4</a> -->
<!-- <a href="maneger/salesdata?month=1">salesdata</a> -->


<div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active" data-bs-interval="10000">
      <img src="https://bnetcmsus-a.akamaihd.net/cms/page_media/FJ33FWWYEFOG1617395273716.gif" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h1 class="text-danger" style="text-align:left">Legacy</h1>
        <h1 class="text-info" style="text-align:left">6월 2일 GRAND OPEN</h1>
        <h3 class="text-white" style="text-align:left">당신의 모험을 지원해줄 든든한 PC방 혜택을 누리세요!!</h3>
      </div>
    </div>
    <div class="carousel-item" data-bs-interval="2000">
      <img src="https://bnetcmsus-a.akamaihd.net/cms/gallery/zp/ZPKG02FT8KPV1513733749744.gif" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h1 class="text-info" style="text-align:left">이달의 이벤트</h1>
        <h1 class="text-white" style="text-align:left">공지사항을 참고하세요!!</h1>

      </div>
    </div>
    <div class="carousel-item">
      <img src="https://bnetcmsus-a.akamaihd.net/cms/page_media/AU4SR6HVBB881617395257793.gif" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h1 class="text-info" style="text-align:left">리그오브레전드</h1>
        <h3 class="text-white" style="text-align:left">토너먼트 키트를 신청하세요~!!</h3>
      </div>
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>


<c:import url="/WEB-INF/views/include/footer.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8" crossorigin="anonymous"></script>
<div class="move">
<img src="/filepath/${logimg }" class="move_img" onclick="location.href='/Spring_project/user/u_login'" style = " cursor : pointer">
<img src="/filepath/${logimg2 }" class="move_img1" onclick="location.href='/Spring_project/maneger/m_login'" style = " cursor : pointer">
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fo" uri="http://www.springframework.org/tags/form" %>

   <c:set var='root' value="${pageContext.request.contextPath }/"/>
   <c:set var="pc_name" value="${pc_name }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.pc_name{
text-align: center;
padding-top: 20px;
 color:white; 
 font-size:35px;
 font-weight: bold;
}

li {
   display: inline-block;
   margin: 0px 110px;
   cursor: pointer;
}
a{
text-decoration: none;
font-size: large;
}
a:link{
color:#7e2411;
}
a:visited{
color:#7e2411;
}
</style>

</head>
<body style="maring:0%">
<div class="pc_name" style="height:60px; margin:0; background-color:rgb(93, 87, 90);">
      <div><span>${pc_name } PC방</span></div>
   </div>
   <hr style="margin:0;">
   <div style="text-align: center;">
      <ul style="border-bottm: 1px solid black; font-size:18px; font-weight: bold;">
     	 <li><a href="${root }board/revboardlist?pc_name=${pc_name}">홈</a></li>
         <li><a href="${root }pcmain/pc_main1?pc_name=${pc_name }">좌석</a></li>
         <li><a href="${root }pcmain/pc_maincategory?category=cafe&pc_name=${pc_name }">음식</a></li>
         <li><a href="${root }pc_enrol4?pc_name=${pc_name}">충전하기</a></li>

		 <c:choose>
         	<c:when test="${check == 2}">
         		<li><a href="${root }user/u_main">뒤로가기</a></li>
         	</c:when>
         	<c:when test="${check == 1 }">
         		<li><a href="${root }maneger/salesdata?month=1월">매출확인</a></li>
         	</c:when>
         </c:choose>
      </ul>
   </div>
</body>
</html>
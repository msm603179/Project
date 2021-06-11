<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- 회원 로그인 시 뜨는 창 ok -->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        .member_logo{
            cursor: pointer;
            margin-left: 720px;
            margin-top: 60px;
        }
    </style>
    
   
</head>
<body>
<H1>점주</H1>
        <div class="member_logo" >로고 or 사진</div>
    <hr style="margin-top: 60px;">
<div style="text-align: center; font-size: x-large;">
    pc방 검색 <input type="text" style="margin-top: 60px; width: 150px; height: 20px;">
</div>
<c:import url="/WEB-INF/views/include/side.jsp"/>
</body>
</html>
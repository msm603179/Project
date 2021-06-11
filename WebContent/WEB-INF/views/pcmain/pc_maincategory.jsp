<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<c:set var='root' value="${pageContext.request.contextPath }/"/>
	<c:set var="pc_name" value="${pc_name }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.tb_size{
            height: 200px;
            width: 190px;
            background-color : white;
            margin-top: 20px;
        }
        body{
    background-image: url("/filepath/${categoryimg}");
    background-repeat: no-repeat;
    background-size:cover;	
    }
    .un{
 	   text-decoration: none;
 	   color : white;
 	   font-size: 15px;
    }
    .un:hover {
    	text-decoration: none;
    	color : white;
    	
    }
    .mainback{
    min-height: 800px;
    }
</style>

</head>
<body style="margin: 0%">
<c:import url="/WEB-INF/views/include/pc_main_top.jsp"/>
<div class="mainback">
<div style="border: 1px solid; border-radius: 50px; margin-bottom: 20px; text-align: center; background-color:rgb(111 125 155 / 60%);">
    <table style="width: 1500px; table-layout: fixed;">
      <tr style="height: 35px;">
        <td><a href="${root }pcmain/pc_maincategory?category=cafe&pc_name=${pc_name }" class="un" style="color:white;">카페</a></td>
        <td><a href="${root }pcmain/pc_maincategory?category=drink&pc_name=${pc_name }" class="un" style="color:white;">음료</a></td>
        <td><a href="${root }pcmain/pc_maincategory?category=siksa&pc_name=${pc_name }" class="un" style="color:white;">식사류</a></td>
        <td><a href="${root }pcmain/pc_maincategory?category=lamen&pc_name=${pc_name }" class="un" style="color:white;">라면</a></td>
        <td><a href="${root }pcmain/pc_maincategory?category=gansik&pc_name=${pc_name }" class="un" style="color:white;">간식</a></td>   
      </tr>
    </table>
  </div>
  <table border="1" style="margin-left: 20px; width: 1480px; text-align: center;" id='food_enrol' border="1">
    <tr>
      <td style="background-color:rgb(111 125 155 / 60%);"><label for='di'> <img src="/filepath/${food0 }" onerror="this.src='/filepath/${de }'" class='tb_size'></label><br>
      <div style="font-size: large; color : white;">${foodn0 }</div><div style="font-size: large; color : white;">${foodp0 }</div><br> </td>
      <td style="background-color:rgb(111 125 155 / 60%);"><label for='di'><img src="/filepath/${food1 }" onerror="this.src='/filepath/${de }'" class='tb_size'></label><br>
      <div style="font-size: large; color : white;">${foodn1 }</div><div style="font-size: large; color : white;">${foodp1 }</div><br></td>
      <td style="background-color:rgb(111 125 155 / 60%);"><label for='di'><img src="/filepath/${food2 }" onerror="this.src='/filepath/${de }'" class='tb_size'></label><br>
      <div style="font-size: large; color : white;">${foodn2 }</div><div style="font-size: large; color : white;">${foodp2 }</div><br></td>
      <td style="background-color:rgb(111 125 155 / 60%);"><label for='di'><img src="/filepath/${food3 }" onerror="this.src='/filepath/${de }'" class='tb_size'></label><br>
      <div style="font-size: large; color : white;">${foodn3 }</div><div style="font-size: large; color : white;">${foodp3 }</div><br></td>
      <td style="background-color:rgb(111 125 155 / 60%);"><label for='di'><img src="/filepath/${food4 }" onerror="this.src='/filepath/${de }'" class='tb_size'></label><br>
      <div style="font-size: large; color : white;">${foodn4 }</div><div style="font-size: large; color : white;">${foodp4 }</div><br></td>
      <td style="background-color:rgb(111 125 155 / 60%);"><label for='di'><img src="/filepath/${food5 }" onerror="this.src='/filepath/${de }'" class='tb_size'></label><br>
      <div style="font-size: large; color : white;">${foodn5 }</div><div style="font-size: large; color : white;">${foodp5 }</div><br></td>
    </tr>
    <tbody id="tblShow"></tbody>
  </table>
</div>
<c:import url="/WEB-INF/views/include/side.jsp"/>

</body>
</html>
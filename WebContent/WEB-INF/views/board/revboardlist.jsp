<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fo" uri="http://www.springframework.org/tags/form" %>
        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.li{
width: 700px
}
body {
   background-image: url("/filepath/${img}");
   background-repeat: no-repeat;
   background-size: cover;
}

        li{
            display: inline-block;
            margin: 0px 110px;
            cursor: pointer;
        }
        .tb_size{
            height: 250px;
            width: 320px;
            
        }
</style>
</head>
<body style="margin: 0%">
<c:import url="/WEB-INF/views/include/pc_main_top.jsp" />
<div style="height: 570px; width: 700px; position: relative; display:inline-block; background-color: #f1eff2; margin-left: 425px;">
        <table class="home_tb" style="border-spacing: 18px; border-collapse: separate;" >
            <tr>
                <td class="home_td"><label for='di'><img src="/filepath/${pc1 }" id="di" class="tb_size"></label></td>
                <td class="home_td"><label for='di'><img src="/filepath/${pc2 }" id="di" class="tb_size"></label></td>
            </tr>
            <tr>
                <td class="home_td"><label for='di'><img src="/filepath/${pc3 }" id="di" class="tb_size"></label></td>
                <td class="home_td"><label for='di'><img src="/filepath/${pc4 }" id="di" class="tb_size"></label></td>
            </tr>
        </table>
    </div>
    <div style="margin-left: 399px ; border-bottom: lightgray solid; width: 749px; height: 130px;">
<fo:form action="revwrite?pc_name=${pc_name }" modelAttribute="review_board">
<fo:input path="id" readonly="true"  style="border: 0px; margin-left: 20px; margin-bottom: 10px; background-color:transparent; color: white;  font-size:large"/><br>

<fo:textarea path="content" style="border-color:lightgray; width: 656px; height : 48px; margin-left: 20px; resize: none;background-color:transparent; font-size:large; color:white;"/>
<fo:errors path="content"></fo:errors>

<fo:hidden path="ref"/><br>
<div style="text-align: right;">

<fo:button style="height : 40px; width: 70px; background-color:skyblue;">전송</fo:button>
</div>
</fo:form>
</div>
<c:forEach items="${lre }" var="lre">
<div style="margin-left: 400px">
<div style="font-size: large; padding-top: 25px;  padding-left:25px;padding-right:25px; color:white;" class="li">${lre.id }</div>
<div style="font-weight: lighter;  padding-left:25px;padding-right:25px; color:white;" class="li">${lre.content }</div>
<div style="border-bottom: 1px solid lightgray; font-size: small; color: gray; padding-bottom: 25px;  padding-left:25px;padding-right:25px;" class="li">${lre.rdate }</div>
</div>
</c:forEach>
<c:import url="/WEB-INF/views/include/side.jsp" />
</body>
</html>
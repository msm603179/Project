<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <c:set var='timet' value="${timet }"/>
    <c:set var='timeb' value="${time }"/>
    <c:set var='timepc' value="${timep }"/>
    <c:set var='name' value="${name}"/>
    <c:set var='root' value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>

function credit()  {
	const uri=encodeURI('${root}credit?timet=${timet}&time=${time}&timep=${timep}&name=${name}');

    location.href = uri
} 

function credit2()  {
	const uri=encodeURI('${root}credit2?timet=${timet}&time=${time}&timep=${timep}&name=${name}');

    location.href = uri
} 



</script>
</head>
<body>

<input style="cursor:pointer;" type="image" src="/filepath/${cacao }" onclick="credit()" value="카카오페이">
<input style="cursor:pointer;" type="image" src="/filepath/${ini }" onclick="credit2()" value="카드결재">

</body>
</html>
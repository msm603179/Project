<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:set var="root" value="${pageContext.request.contextPath }/"/>
	<script type="text/javascript">
		alert("시간 충전 후 이용해 주세요");
		location.href="${root}/pc_main/pc_main3";
	</script>
</body>
</html>
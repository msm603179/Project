<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="root" value="${pageContext.request.contextPath }/"/>
</head>
<body>
<script type="text/javascript">
alert("로그인 성공!! PC방 등록화면으로 이동합니다.")
location.href = '${root}pc_enrol/pc_enrol1?pc_name=${pc_name}';
</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="root" value="${pageContext.request.contextPath }/"/> <!-- 최상위 경로 -->
</head>
<body>
<body>
<script type="text/javascript">
alert("가입 완료!!")
location.href = '${root}user/u_login'
</script>
</body>
</html>
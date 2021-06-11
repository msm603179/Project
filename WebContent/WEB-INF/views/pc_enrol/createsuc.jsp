<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
   <c:set var='root' value="${pageContext.request.contextPath }/"/>
   <c:set var='pc_name' value="${pc_name}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
		alert("PC방 등록이 완료되었습니다.");
		location.href="${root}pcmain/pc_main1?pc_name=${pc_name}";
	</script>

</body>
</html>
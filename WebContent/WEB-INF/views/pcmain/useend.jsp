<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<script type="text/javascript">
	
		var pc_name = "${pc_name}";
		var tableid = "${tableid}";
		window.onload = function con(){
            if(confirm("사용을 종료하시겠습니까??")){
                location.href = "${root}/pcmain/end?pc_name="+pc_name+"&tableid="+tableid;
            } else {
                history.go(-1);
            }
        }
	</script>
	
</body>
</html>
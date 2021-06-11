<%@page import="java.util.ArrayList"%>
<%@page import="co.springbreakers.beans.Zip"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script type="text/javascript">
function addrGet(text){
    
	opener.document.getElementById("pc_address").value = text;
	
    window.close()
}


</script>
</head>
<body>
<table border="1">
	<c:forEach items="${addrli }" var="zip">
		<tr height="50">
		<td onclick="addrGet('${zip}')"><a href="#"> ${zip}</a> </td>
	
	</tr>
	</c:forEach>
</table>
</body>
</html>
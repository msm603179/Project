<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html lang="en">
<head>
<!-- 회원이 검색한 pc방 화면 ok-->
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Document</title>

<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

<style>

li {
   display: inline-block;
   margin: 0px 110px;
   cursor: pointer;
}

body {
   background-image: url("/filepath/${pcmain1}");
   background-repeat: no-repeat;
   background-size: cover;
}

td {
   width: 100px;
   height: 100px;
}

</style>

<script type="text/javascript">
	$(document).on('click', 'td', function (e) {
		var tableid = $(e.target).attr("id");
		if(tableid == null){
		} else {
			var data = document.getElementById(tableid).innerHTML;
        	location.href="${root}pcmain/selectuse?pc_name=${pc_name }&tableid="+tableid+"&data="+data;
		}
	});

	
	var tableid = new Array();
	var id = new Array();
	var time = new Array();
	
	
	function set(){
		var j = 0;
		var tdtag = document.getElementsByTagName("td");
		
		for(var i = 0 ; i < tdtag.length; i++){
			if(j == tableid.length){
				break;
			} else {
				var idcheck = $(tdtag[i]).attr("id");
			
				if (idcheck == tableid[j]){
					
					var second = time[j] % 60;
					var minute = Math.floor(time[j] / 60);
					var hour = Math.floor(minute / 60);
					minute = minute % 60;
					
					tdtag[i].innerHTML = id[j] + "<br>" + hour + ":" + minute + ":" + second;
					time[j]--;
					j++;
					
				}
			}
		}
	}
	
	window.addEventListener("load", function sss() { 
		var json = JSON.parse('${jsonList}');
		
		for (var i = 0; i < json.length; i++) {
			
			if (json[i].u_id == " ") {
				
			} else {
				tableid.push(json[i].tableid);
				id.push(json[i].u_id);
				time.push(parseInt(json[i].usertime));
			}
			
		}
	});

	
	window.onload = function TimerStart() {
		tid = setInterval('set()', 1000);
	}; 
	
</script>
</head>

<body style="margin: 0%;">
	<c:import url="/WEB-INF/views/include/pc_main_top.jsp" />

	<div>
		<table>
			<c:forEach var="i" begin="1" end="${numcol}" step="1">
				<tr>
					<c:forEach var="j" begin="1" end="${numrow}" step="1">
						<c:set var="s" value="t${i}_${j}" />
						<c:set var="doneLoop" value="true" />
						<c:forEach var="c" items="${checktable}" varStatus="index">
							<c:if test="${doneLoop }">
								<c:choose>
									<c:when test="${s eq c}">
										<td style="background-color:rgb(113 118 139 / 90%); color:white;" id="${s }"></td>
										<c:set var="doneLoop" value="false" />
									</c:when>
									<c:when test="${s ne c && index.last}">
										<td></td>
									</c:when>
								</c:choose>
							</c:if>
						</c:forEach>
					</c:forEach>
				</tr>
			</c:forEach>
		</table>
	</div>
<c:import url="/WEB-INF/views/include/side.jsp" />
	
</body>
</html>
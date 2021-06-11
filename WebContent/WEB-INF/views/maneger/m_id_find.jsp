<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fo" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
  <style>

        h1{
            text-align: center;
        }
        .find_id, #m_birthday{
            height: 30px;
            width: 280px;
        }
        .find_year{
            height: 30px;
            width: 105px;
        }
        .find_month{
            height: 36px;
            width: 54px;
        }
        .find_day{
            height: 30px;
            width: 105px;
        }
        table{
            margin-left: auto; margin-right: auto;
        }
        div{
            text-align: center;

        }
        input[type=button]{
            cursor: pointer;
        }
    </style>
    
    <script type="text/javascript">
	function birth() {
        var birth1=document.getElementById("birth1").value
        var birth2=document.getElementById("birth2").value
        var birth3=document.getElementById("birth3").value
        var birthday=birth1+birth2+birth3

        var m_birth=document.getElementById("m_birthday")

        
        m_birth.value=birthday

		
	}
    </script>
</head>
<body>
    <h1>아이디 찾기</h1>
    <fo:form action="m_id_findrun" modelAttribute="pc_maneger" method="post" >
    <table>
    <tr>
        <td><span>이름</span></td>
        <td colspan="3"><fo:input type="text" class="find_id" path="m_name"/></td>
         <td><fo:errors path="m_name" cssClass="errorText" /></td>
    </tr>
    <tr>
        <td><span>생년월일</span></td>
        
        <td><fo:input type="text" path="m_birthday" id="m_birthday" /></td>
         <td><fo:errors path="m_birthday" cssClass="errorText" /></td>
    </tr>
    </table>
    <br>
    <div>
        <fo:button >아이디 찾기</fo:button>
        <input type="button" value="닫기" onclick="window.close()">
    </div>
     </fo:form>
    </body>
</html>
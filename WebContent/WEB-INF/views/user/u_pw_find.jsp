<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="fo" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
        h1{
            text-align: center;
        }
        .find_id, #u_birthday{
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

        var u_birth=document.getElementById("u_birthday")

        
        u_birth.value=birthday

		
	}
    </script>
    </head>
    
    <h1>비밀번호찾기</h1>
    <fo:form action="u_pw_findrun" modelAttribute="pc_user" method="post" >
    <table>
    <tr>
        <td><span>이름</span></td>
        <td colspan="3"><fo:input type="text" class="find_id" path="u_name"/></td>
       
    </tr>
    <tr>
        <td><span>아이디</span></td>
        <td colspan="3"><fo:input type="text" class="find_id" path="u_id"/></td>
       
    </tr>
    <tr>
        <td><span>생년월일</span></td>
        
        <td><fo:input type="text" path="u_birthday" id="u_birthday" /></td>
         <td><fo:errors path="u_birthday" cssClass="errorText" /></td>
    </tr>
    </table>
    <br>
    <div>
        <fo:button>비밀번호 찾기</fo:button>
        <input type="button" value="닫기" onclick="window.close()">
    </div>
        </fo:form>

    
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fo" uri="http://www.springframework.org/tags/form" %>
	<c:set var="pc_name" value="${pc_name }"/>
   <c:set var='root' value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- 충전 -->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <script>
    $(document).on('click', 'input', function (e) {
        
        var i = $(e.target).attr("id");
        
      var timet = document.getElementsByName("timet")[i].value;
      var time = document.getElementsByName("time")[i].value;
      var timep = document.getElementsByName("timep")[i].value;   
      var name = document.getElementsByName("name")[i].value;
      
      const uri=encodeURI('${root}creditsel?timet='+timet+'&time='+time+'&timep='+timep+'&name='+name);
      
      var _width = '560';
      var _height = '630';
      
      var _left = Math.ceil(( window.screen.width - _width )/2);
      var _top = Math.ceil(( window.screen.height - _height )/2); 

      
      
      window.open(uri, '',  'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top );


        
        
     });
    
    
    </script>
    <style>
    input[type=text]{
       cursor:pointer;
    }
    
    body {
    background-image: url("/filepath/${chrimg}");
    background-repeat: no-repeat;
    background-size: cover;
	}
	
	input:focus {outline:none;
	}
    </style>
    
</head>

<body style="margin: 0%">

<c:import url="/WEB-INF/views/include/pc_main_top.jsp" />
   <div style="display:inline-block;">
      <table style="width: 550px; height: 590px; border-spacing: 15px; border-collapse: separate bord; margin-left: 180px; background-color:rgb(255 255 255 / 60%); border-color: rgb(255 255 255 / 60%); border-radius: 10px;">
          
          
          <fo:form name="pc_timefo" action="pc_timein">

          <tr style="text-align: center ;padding-left: 10px;  background-color: #f1eff2;">
              <td style="border: 1px solid black">
                <input type="text" style="margin-left: -500px; margin-right: -500px; font-size: 100; text-align: center; background-color:#f1eff2; border:0px;" readonly="readonly"  value="${requestScope.timet[0]}" name="timet"  id="0"/><br>
                <input type="text" style="margin-left: -500px; margin-right: -500px; font-size: 10px; text-align: center; background-color:#f1eff2; border:0px; color:#d94242;"  readonly="readonly"  value="${requestScope.time[0]}" name="time" id="0" /><br>
                <input type="text" style="margin-left: -500px; margin-right: -500px; font-weight: bold; width: 157px; height: 30px; font-size: 20px; text-align: center; background-color:#f1eff2; border:0px;" readonly="readonly" id="0"   value="${requestScope.timep[0]}" name="timep" />
             <input type="hidden" value="${name }" name="name">   
              </td>
              
              <td style="border: 1px solid black">
                <input type="text" style="margin-left: -500px; margin-right: -500px; font-size: 100; text-align: center; background-color:#f1eff2; border:0px;" readonly="readonly" value="${requestScope.timet[1]}" name="timet" id="1"  /><br>
                <input type="text" style="margin-left: -500px; margin-right: -500px; font-size: 10px; text-align: center; background-color:#f1eff2; border:0px; color:#d94242;" readonly="readonly" value="${requestScope.time[1]}" name="time" id="1"   /><br>
                <input type="text" style="margin-left: -500px; margin-right: -500px; font-weight: bold; width: 157px; height: 30px; font-size: 20px; text-align: center; background-color:#f1eff2; border:0px;" readonly="readonly" id="1" value="${requestScope.timep[1]}" name="timep"   />
              <input type="hidden" value="${name }" name="name"> 
              </td>
          </tr>
          
                    <tr style="text-align: center ;padding-left: 10px; background-color: #f1eff2;">
              <td style="border: 1px solid black">
                <input type="text" style="margin-left: -500px; margin-right: -500px; font-size: 100; text-align: center; background-color:#f1eff2; border:0px;" readonly="readonly"  value="${requestScope.timet[2]}" name="timet" id="2"/><br>
                <input type="text" style="margin-left: -500px; margin-right: -500px; font-size: 10px; text-align: center; background-color:#f1eff2; border:0px; color:#d94242;" readonly="readonly"   value="${requestScope.time[2]}"  name="time"  id="2"/><br>
                <input type="text" style="margin-left: -500px; margin-right: -500px; font-weight: bold; width: 157px; height: 30px; font-size: 20px; text-align: center; background-color:#f1eff2; border:0px;" readonly="readonly"  id="2"   value="${requestScope.timep[2]}" name="timep" />
             <input type="hidden" value="${name }" name="name">  
              </td>
              
              <td style="border: 1px solid black">
                <input type="text" style="margin-left: -500px; margin-right: -500px; font-size: 100; text-align: center; background-color:#f1eff2; border:0px;" readonly="readonly" value="${requestScope.timet[3]}" name="timet"  id="3" /><br>
                <input type="text" style="margin-left: -500px; margin-right: -500px; font-size: 10px; text-align: center; background-color:#f1eff2; border:0px; color:#d94242;" readonly="readonly" value="${requestScope.time[3]}" name="time"  id="3" /><br>
                <input type="text" style="margin-left: -500px; margin-right: -500px; font-weight: bold; width: 157px; height: 30px; font-size: 20px; text-align: center; background-color:#f1eff2; border:0px;" readonly="readonly"  id="3" value="${requestScope.timep[3]}" name="timep" />
            <input type="hidden" value="${name }" name="name"> 
              </td>
          </tr> 
          
                    <tr style="text-align: center ;padding-left: 10px; background-color: #f1eff2;">
              <td style="border: 1px solid black">
                <input type="text" style="margin-left: -500px; margin-right: -500px; font-size: 100; text-align: center; background-color:#f1eff2; border:0px;" readonly="readonly"  value="${requestScope.timet[4]}" name="timet"  id="4" onclick="credit()" /><br>
                <input type="text" style="margin-left: -500px; margin-right: -500px; font-size: 10px; text-align: center; background-color:#f1eff2; border:0px; color:#d94242;" readonly="readonly"   value="${requestScope.time[4]}" name="time"  id="4"/><br>
                <input type="text" style="margin-left: -500px; margin-right: -500px; font-weight: bold; width: 157px; height: 30px; font-size: 20px; text-align: center; background-color:#f1eff2; border:0px;" readonly="readonly"  id="4"   value="${requestScope.timep[4]}" name="timep" />
             <input type="hidden" value="${name }" name="name"> 
              </td>
              
              <td style="border: 1px solid black">
                <input type="text" style="margin-left: -500px; margin-right: -500px; font-size: 100; text-align: center; background-color:#f1eff2; border:0px;" readonly="readonly" value="${requestScope.timet[5]}" name="timet"  id="5"  /><br>
                <input type="text" style="margin-left: -500px; margin-right: -500px; font-size: 10px; text-align: center; background-color:#f1eff2; border:0px; color:#d94242;" readonly="readonly" value="${requestScope.time[5]}" name="time"  id="5" /><br>
                <input type="text" style="margin-left: -500px; margin-right: -500px; font-weight: bold; width: 157px; height: 30px; font-size: 20px; text-align: center; background-color:#f1eff2; border:0px;" readonly="readonly"  id="5" value="${requestScope.timep[5]}" name="timep"  />
             <input type="hidden" value="${name }" name="name"> 
              </td>
          </tr> 
          
                    <tr style="text-align: center ;padding-left: 10px; background-color: #f1eff2;">
              <td style="border: 1px solid black">
                <input type="text" style="margin-left: -500px; margin-right: -500px; font-size: 100; text-align: center; background-color:#f1eff2; border:0px;" readonly="readonly"  value="${requestScope.timet[6]}"  name="timet"  id="6"/><br>
                <input type="text" style="margin-left: -500px; margin-right: -500px; font-size: 10px; text-align: center; background-color:#f1eff2; border:0px; color:#d94242;" readonly="readonly"   value="${requestScope.time[6]}" name="time"  id="6"/><br>
                <input type="text" style="margin-left: -500px; margin-right: -500px; font-weight: bold; width: 157px; height: 30px; font-size: 20px; text-align: center; background-color:#f1eff2; border:0px;"  readonly="readonly"  id="6"  value="${requestScope.timep[6]}" name="timep" />
             <input type="hidden" value="${name }" name="name">   
              </td>
              
              <td style="border: 1px solid black">
                <input type="text" style="margin-left: -500px; margin-right: -500px; font-size: 100; text-align: center; background-color:#f1eff2; border:0px;" readonly="readonly" value="${requestScope.timet[7]}" name="timet"  id="7" /><br>
                <input type="text" style="margin-left: -500px; margin-right: -500px; font-size: 10px; text-align: center; background-color:#f1eff2; border:0px; color:#d94242;" readonly="readonly" value="${requestScope.time[7]}" name="time"  id="7" /><br>
                <input type="text" style="margin-left: -500px; margin-right: -500px; font-weight: bold; width: 157px; height: 30px; font-size: 20px; text-align: center; background-color:#f1eff2; border:0px;" readonly="readonly"  id="7" value="${requestScope.timep[7]}" name="timep" />
             <input type="hidden" value="${name }" name="name">   
              </td>
          </tr> 
          
                    <tr style="text-align: center ;padding-left: 10px; background-color: #f1eff2;">
              <td style="border: 1px solid black">
                <input type="text" style="margin-left: -500px; margin-right: -500px; font-size: 100; text-align: center; background-color:#f1eff2; border:0px;" readonly="readonly"  value="${requestScope.timet[8]}" name="timet"  id="8" /><br>
                <input type="text" style="margin-left: -500px; margin-right: -500px; font-size: 10px; text-align: center; background-color:#f1eff2; border:0px; color:#d94242;" readonly="readonly"  value="${requestScope.time[8]}"  name="time"  id="8"/><br>
                <input type="text" style="margin-left: -500px; margin-right: -500px; font-weight: bold; width: 157px; height: 30px; font-size: 20px; text-align: center; background-color:#f1eff2; border:0px;" readonly="readonly"  id="8"   value="${requestScope.timep[8]}" name="timep" />
            <input type="hidden" value="${name }" name="name">   
              </td>
              
              <td style="border: 1px solid black">
                <input type="text" style="margin-left: -500px; margin-right: -500px; font-size: 100; text-align: center; background-color:#f1eff2; border:0px;" readonly="readonly" value="${requestScope.timet[9]}" name="timet"  id="9"/><br>
                <input type="text" style="margin-left: -500px; margin-right: -500px; font-size: 10px; text-align: center; background-color:#f1eff2; border:0px; color:#d94242;" readonly="readonly" value="${requestScope.time[9]}" name="time"  id="9"/><br>
                <input type="text" style="margin-left: -500px; margin-right: -500px; font-weight: bold; width: 157px; height: 30px; font-size: 20px; text-align: center; background-color:#f1eff2; border:0px;" readonly="readonly"  id="9" value="${requestScope.timep[9]}" name="timep" />
            <input type="hidden" value="${name }" name="name"> 
              </td>
          </tr> 

           </fo:form>
      </table>
      </div>
       <div style=" width: 550px; text-align: center; background-color: rgb(255 255 255 / 60%); display: inline-block; margin-left : 50px; border-color:rgb(255 255 255 / 60%); border-radius: 10px">
    <table style="height: 590px; width: 550px; border-spacing: 30px; border-collapse: separate bord;">
        <tr>
            <td style="font-size: xxx-large; font-weight: bold;">내정보</td> 
        </tr>
        <tr>
            <td style="border: 1px black solid; font-size: xx-large; font-weight: bold; background-color: white; background-color: #f1eff2;">${uname }</td>
        </tr>
        <tr>
            <td style="border: 1px black solid; font-size: xx-large; font-weight: bold; background-color: white; background-color: #f1eff2;">${uid }</td>
        </tr>
        <tr>
            <td style="border: 1px black solid; font-size: xx-large; font-weight: bold; background-color: white; background-color: #f1eff2;">${utime }</td>
        </tr>
    </table>
    </div>
      <c:import url="/WEB-INF/views/include/side.jsp" />
</body>
</html>
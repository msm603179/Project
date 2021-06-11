<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
   <c:set var='root' value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>chart.js</title>
<head>
   <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
   <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <script>
        $(document).on("change", "select", function(e){
           var month = e.target.value;
           location.href="${root}maneger/salesdata?month="+month;
        });
        
        $(document).ready(function(){

        	  $("#month option").each(function(){

        	    if($(this).val()=="${month}"){

        	      $(this).attr("selected","selected"); 

        	    }

        	  });

        	});
        
    </script>
</head>
<body style="background-color: #343a40;">
    
    <!--왼쪽-->
    <div style="border: 1px solid lightgray; height: 550px; width: 650px; margin-left: 60px; float: left;">
   <canvas id="myChart" style="height:550px; width:650px;"></canvas>
    </div>
    <!--오른쪽-->
    <div style="border: 1px solid lightgray; height: 550px; width: 650px; float: left; margin-left: 60px;">
        <div style="border: 1px solid red;height: 100px; width: 550px; margin-left: 45px; margin-top: 25px; 
        text-align: center; font-weight: bold; font-size: xx-large; color:white;">${pc_name }pc방</div>
    <div style="text-align: right; margin-right: 52px;">
        <select id="month" style="width: 300px; height: 50px; margin-top: 18px; font-size: large;">
            <option>1월</option>
            <option>2월</option>
            <option>3월</option>
            <option>4월</option>
            <option>5월</option>
            <option>6월</option>
            <option>7월</option>
            <option>8월</option>
            <option>9월</option>
            <option>10월</option>
            <option>11월</option>
            <option>12월</option>
        </select>
    </div>
    <div style="border: 1px solid lightgray; height: 314px; width: 550px; margin-left: 45px; margin-top: 18px; overflow: auto; color:white; font-size:18px;">
        
      <c:forEach var="salessearch" items="${salessearch }">
      
            ${salessearch.paydate }일 : ${salessearch.price }원<br>
            
      </c:forEach>

    </div>
    </div>

   <script>
   

   
   
   var jsonlist = JSON.parse('${jsonlist}');
   var price = new Array();
   for(var i = 0; i < jsonlist.length; i++){
      price.push(parseInt(jsonlist[i]));
   }
   
    var ctx = document.getElementById('myChart');
    var myChart = new Chart(ctx, {
       type: 'bar',
       data: {
         labels: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
         datasets: [{
            label: '매출액',
            data: [price[0],price[1],price[2],price[3],price[4],price[5],price[6],price[7],price[8],price[9],price[10],price[11]],
            backgroundColor: [
                        'rgba(255, 99, 132, 0.2)', 
                        'rgba(54, 162, 235, 0.2)', 
                        'rgba(255, 206, 86, 0.2)', 
                        'rgba(75, 192, 192, 0.2)', 
                        'rgba(153, 102, 255, 0.2)', 
                        'rgba(255, 159, 64, 0.2)',
                        'rgba(255, 99, 132, 0.2)', 
                        'rgba(54, 162, 235, 0.2)', 
                        'rgba(255, 206, 86, 0.2)', 
                        'rgba(75, 192, 192, 0.2)', 
                        'rgba(153, 102, 255, 0.2)', 
                        'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [ 
                'rgba(255, 99, 132, 1)', 
                'rgba(54, 162, 235, 1)', 
                'rgba(255, 206, 86, 1)', 
                'rgba(75, 192, 192, 1)', 
                'rgba(153, 102, 255, 1)', 
                'rgba(255, 159, 64, 1)',
                'rgba(255, 99, 132, 1)', 
                'rgba(54, 162, 235, 1)', 
                'rgba(255, 206, 86, 1)', 
                'rgba(75, 192, 192, 1)', 
                'rgba(153, 102, 255, 1)', 
                'rgba(255, 159, 64, 1)' 
                ], 

            borderWidth: 1
         }]
      },
      options: {
         responsive: false,
         scales: {
            yAxes: [{
               ticks: {
                        min: 0,
                  max: 150000,
                  fontSize : 14,
               }
            }]
         }
      }
   });
   </script>
   <div style="position:absolute; right:80px; bottom:70px;">
   <input type="button" onclick="location.href='${root}pcmain/pc_main1?pc_name=${pc_name}'" value="뒤로가기" 
   style="background-color:#343a40; border:2px solid white; width:100px; height:50px; color:white; cursor:pointer;">
   </div>
</body>
</html>
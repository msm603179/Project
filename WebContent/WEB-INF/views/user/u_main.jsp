<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

   <c:set var='root' value="${pageContext.request.contextPath }/"/>

<c:set var="addr0" value="${addr0 }"/>
<c:set var="addr1" value="${addr1 }"/>
<c:set var="addr2" value="${addr2 }"/>
<c:set var="addr3" value="${addr3 }"/>
<c:set var="addr4" value="${addr4 }"/>

<c:set var="name0" value="${name0 }"/>
<c:set var="name1" value="${name1 }"/>
<c:set var="name2" value="${name2 }"/>
<c:set var="name3" value="${name3 }"/>
<c:set var="name4" value="${name4 }"/>

<c:set var="num0" value="${num0 }"/>
<c:set var="num1" value="${num1 }"/>
<c:set var="num2" value="${num2 }"/>
<c:set var="num3" value="${num3 }"/>
<c:set var="num4" value="${num4 }"/>
<!DOCTYPE html>
<html lang="en">

<head>
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<!-- 회원 로그인 시 뜨는 창 ok -->
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<style>

body {
   background-image: url("/filepath/${mainbackimg}");
   background-repeat: no-repeat;
   background-size: cover;
}
</style>
</head>

<body>
	
   <div>
      <img src="/filepath/${logo }" style="cursor: pointer; width: 300px; height: 100px; margin-left: 620px">
   </div>
   
   <div style="margin-left : 570px;">
      <input type="text" id="find" style="margin-top: 60px;" size="50" placeholder="검색">
      <button onclick="setCenter()">검색</button>  
   </div><br>
   <div id="map" style="width:1280px;height:600px; margin-left : 120px; margin-bottom:50px;"></div>
   
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e144e5e8e1d019f6c95d012ae4823c7d&libraries=services,clusterer,drawing"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.5335681,126.9959924), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

function setCenter() {

	   var find=document.getElementById('find').value;
	   console.log(find);
	   
	      if(find=='${name0}'){      
	         var callback = function(result, status) {
	             if (status === kakao.maps.services.Status.OK) {
	                 var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	                    
	                    // 지도 중심을 이동 시킵니다
	                    map.setCenter(coords);
	             }
	         };

	         geocoder.addressSearch('${addr0}', callback);
	         
	      }else if(find=='${name1}'){      
	         var callback = function(result, status) {
	             if (status === kakao.maps.services.Status.OK) {
	                 var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	                    
	                    // 지도 중심을 이동 시킵니다
	                    map.setCenter(coords);
	             }
	         };

	         geocoder.addressSearch('${addr1}', callback);   
	         
	      }else if(find=='${name2}'){      
	         var callback = function(result, status) {
	             if (status === kakao.maps.services.Status.OK) {
	                 var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	                    
	                    // 지도 중심을 이동 시킵니다
	                    map.setCenter(coords);
	             }
	         };

	         geocoder.addressSearch('${addr2}', callback);   
	         
	      }else if(find=='${name3}'){      
	         var callback = function(result, status) {
	             if (status === kakao.maps.services.Status.OK) {
	                 var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	                        
	                    // 지도 중심을 이동 시킵니다
	                    map.setCenter(coords);
	             }
	         };

	         geocoder.addressSearch('${addr3}', callback);   
	         
	      }else if(find=='${name4}'){      
	         var callback = function(result, status) {
	             if (status === kakao.maps.services.Status.OK) {
	                 var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	                    
	                    // 지도 중심을 이동 시킵니다
	                    map.setCenter(coords);
	             }
	         };

	         geocoder.addressSearch('${addr4}', callback);   
	         
	      }
	      
	   

	}

// 주소로 좌표를 검색합니다
geocoder.addressSearch('${addr0}', function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">${name0}</div>'
        });
        
        infowindow.open(map, marker);

        kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
        kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
        kakao.maps.event.addListener(marker, 'click', function() {
                const uri=encodeURI('${root}pcmain/pc_main1?num=${num0}&pc_name=${name0}');
           location.href=uri
        });
    } 
});

geocoder.addressSearch('${addr1}', function(result, status) {


    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">${name1}</div>'
        });
        
        infowindow.open(map, marker);

        kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
        kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
        kakao.maps.event.addListener(marker, 'click', function() {
                const uri=encodeURI('${root}pc_enrol4?num=${num1}&pc_name=${name1}');
                
                location.href=uri
        });
        
    } 
});

geocoder.addressSearch('${addr2}', function(result, status) {


    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">인영이 옆집</div>'
        });
        infowindow.open(map, marker);

        kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
        kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
        kakao.maps.event.addListener(marker, 'click', function() {
            const uri=encodeURI('${root}pc_enrol4?num=${num2}&pc_name=${name2}');
           location.href=uri
        });
        
    } 
});

geocoder.addressSearch('${addr3}', function(result, status) {


    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">인영이 옆집</div>'
        });
        infowindow.open(map, marker);

        kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
        kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
        kakao.maps.event.addListener(marker, 'click', function() {
           const uri=encodeURI('${root}pc_enrol4?num=${num3}&pc_name=${name3}');
           location.href=uri
        });
        
    } 
});

geocoder.addressSearch('${addr4}', function(result, status) {


    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">인영이 옆집</div>'
        });
        infowindow.open(map, marker);

        kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
        kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
        kakao.maps.event.addListener(marker, 'click', function() {

               const uri=encodeURI('${root}pc_enrol4?num=${num4}&pc_name=${name4}');
           location.href=uri
        });
        
    } 
});

function makeOverListener(map, marker, infowindow) {
    return function() {
        infowindow.open(map, marker);
    };
}

// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
function makeOutListener(infowindow) {
    return function() {
        infowindow.close();
    };
}
</script>
   <c:import url="/WEB-INF/views/include/side.jsp" />
   <c:import url="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>
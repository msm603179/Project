<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var='root' value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html lang="en">

<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<script>

$(document).ready(function() {
	$(".slideBtn").click(function() {
		if ($("#sidenav").width() == 0) {
			document.getElementById("sidenav").style.width = "250px";
			document.getElementById('sidenav').style.boxShadow = "rgba(0,0,0,0.5) 0 0 0 9999px";
			document.getElementById("slidebtn").style.paddingRight = "250px";
			document.getElementById("sidenav").style.zIndex = "1";
		} else {
			document.getElementById("sidenav").style.width = "0";
			document.getElementById('sidenav').style.boxShadow = "rgba(0,0,0,0.0) 0 0 0 9999px";
			document.getElementById("slidebtn").style.paddingRight = "0";
			document.getElementById("sidenav").style.zIndex = "0";
		}
	});
});
$(function() {
	$('#slideover').on('mouseover', function() {
		$('#slideover').css('opacity', '1');
	});
	$('#slideover').on('mouseout', function() {
		$('#slideover').css('opacity', '0.5');
	});
});
	
	
</script>
<style>
.tablemain{
background-image: url("/filepath/${pc_enrol1_backgroundimg}");
background-repeat: no-repeat;
background-size:cover;
min-height: 800px;
}

.tabletop{
        height:130px;
    }

form{
    margin: 0;
    padding:0;

}
hr{
    margin:0;
    padding:0;
}

.img-fluid{
	margin-right: -1rem;
	margin-left: -1rem;
}


.sidenav {
	height: 100%;
	width: 0;
	position: fixed;
	z-index: 1;
	top: 0;
	right: 0;
	background-color: white;
	overflow-x: hidden;
	transition: 0.5s;
	padding-top: 60px;
}

.sidenav a {
	padding: 8px 8px 8px 32px;
	text-decoration: none;
	font-size: 25px;
	color: #818181;
	display: block;
	transition: 0.3s;
}

.slideBtn {
	transition: .5s;
	position: fixed;
	right: 0;
	font-size: 30px;
	cursor: pointer;
	top: calc(48%);
}

#main {
	transition: .5s;
}

.pc_name {
	text-align: center;
	margin-top: 20px;
}


.dropdown {
	display: inline-block;
}

#drop-content {
	position: absolute;
}

#drop-content a {
	display: block;
	background-color: #dfdfdf;
	color: black;
	text-decoration: none;
	margin: 2px 0px 0px 0px;
}

</style>

    <script>
        function table(x, y) {
            var tb = "<table border='0' style='width: 100%; text-align: center;'>";
            var row = parseInt(x);
            var col = parseInt(y);

            if (isNaN(row * col)) {
                total.innerHTML = 0;
            } else {
                total.innerHTML = row * col;
            }


            for (i = 1; i <= col; i++) {
                tb += "<tr>";
                for (j = 1; j <= row; j++) {
                    var ran = Math.random() * 10000;
                    if(row >= 17){
                        tb +=
                        "<td><label style='border: 1px solid rgb(93, 87, 90); width:50px; height:50px; background-color:white;'><input id='n" +
                        ran + "' type='hidden' value='t" + i + "_" + j + "'></label></td>";
                    } else if(row >= 10){
                        tb +=
                        "<td><label style='border: 1px solid rgb(93, 87, 90); width:90px; height:90px; background-color:white;'><input id='n" +
                        ran + "' type='hidden' value='t" + i + "_" + j + "'></label></td>";
                    } else {
                        tb +=
                        "<td><label style='border: 1px solid rgb(93, 87, 90); width:150px; height:150px; background-color:white;'><input id='n" +
                        ran + "' type='hidden' value='t" + i + "_" + j + "'></label></td>";
                    }
                    
                }
                tb += "</tr>";
            }



            tb += "</table>";
            showtb.innerHTML = tb;
        }


        $(document).on('click', 'label', function (e) {

            var colorcheck = e.target.style.backgroundColor;

            if (colorcheck == "white") {
                e.target.style.backgroundColor = "rgb(93, 87, 90)";

            } else {
                e.target.style.backgroundColor = "white";
            }
        });


        function check() {
            var orangelabel = document.getElementsByTagName("label");

            var orangelabelvalue = "";

            for (var i = 0; i < orangelabel.length; i++) {
                var colorcheck = orangelabel[i].style.backgroundColor;
                
                if (colorcheck == "rgb(93, 87, 90)") {
                    var childtag = orangelabel[i].children;
                    var hiddenid = $(childtag).attr("id");
                    var hiddenvalue = document.getElementById(hiddenid).value;

                    if (i == orangelabel.length - 1) {
                        orangelabelvalue += hiddenvalue;
                    } else {
                        orangelabelvalue += hiddenvalue + "-";
                    }
                }
            }
            document.getElementById("checkval").value = orangelabelvalue;
        }
    </script>
</head>

<body>


   <form action="createenrol1" method="post">
        <input type="hidden" id="checkval" name="checkval">
       
        <div class="bg-dark text-white">
        <div class="container">
            <div class="tabletop row">

                <div class="col-md-4 text-center my-auto center-block;">
                    <img src="/filepath/${logo }" style="width:200px; height:auto">
                </div>
                <div class="col-md-4 my-auto text-center bg-secondary;">
                    <h1 class="display-5 fw-bold text-black">
                        <button type="button" class="btn btn-outline-danger" disabled>이전</button>
                        1/3
                        <button type="submit" class="btn btn-outline-danger" onClick="check()">다음</button></h1>
                </div>

                <div class="col-md-4 my-auto text-center text-white">
                    <h5><span class="badge bg-dark">PC 좌석 수</span></h5>
                        가로 <input type="number" min="1" max="9999" id="row" name="numrow" class="ml-2"
                            onchange="table(row.value, col.value)" value="1"> <br>
                        세로 <input type="number" min="1" max="9999" id="col" name="numcol" class="ml-2"
                            onchange="table(row.value, col.value)" value="1"> <br>
                    </p>
                </div>
            </div></div>
 </div>
        <hr>
        <div class="tablemain">
   
          <div class="row text-center">
           <div class="text-center mx-auto mt-5">

            <button type="button" class="btn btn-info" disabled>  좌석배치도 : 총 <span id=total>0</span>석 </button>
                </div></div>
            <div class="row">
            <div id="showtb" class="mx-auto mt-3"></div>
			</div>     
  		</div>
    </form>


    <footer>
        <div class="bg-dark text-secondary px-4 py-5 text-center">
            <div class="py-5">
                <h1 class="display-5 fw-bold text-white">Legacy</h1>
                <div class="col-lg-6 mx-auto">
                    <p class="fs-5 mb-4">
                        서울특별시 용산구<br> 독서당로 111<br> 전화번호 : 02-2199-3114 <br>
                        이메일 : <a href="mailto:#">support@legacy.com</a>
                    <div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
                        <button type="button" onclick="window.open('${pageContext.request.contextPath }/board/revboardlist','revboardlist', 'width=550, height=700 scrollbars=yes');"
                            class="btn btn-outline-info btn-lg px-4 me-sm-3 fw-bold">제휴문의</button>
                        <button type="button" onclick="location.href='${pageContext.request.contextPath }/board/qaboardlist'" class="btn btn-outline-info btn-lg px-4 me-sm-3 fw-bold ml-3">
                        고객센터</button>  
                    </div>
                    <div class="py-3">
                        <a class="px-3 link-secondary text-decoration-non" href="#">개인정보처리방침</a>
                        <a class="px-3 link-secondary text-decoration-non" href="#">서비스
                            이용약관</a>
                    </div>
                </div>
            </div>
        </div>
    </footer>



</body>

</html>
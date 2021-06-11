<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
    function addRow() {
        const table = document.getElementById('food_enrol');

        const newRow = table.insertRow();

        for (let i = 0; i < 6; i++) {

            const newCell = newRow.insertCell(i);

            newCell.innerHTML =
                "<div style='width:200px'>"+
                "<div style='height: 200px; width:200px;'><img src='' style='height: 200px; width: 190px;'></div>" +
                "<input type='file' name='file' style='width: 200px;'><select class='category' name='pc_food_category' style='width: 185px;'>" +
                "<option>카페</option><option>음료</option><option>식사류</option><option>라면</option><option>간식류</option>" +
                "<option>프린트</option></select><br><input type='text' name='pc_food_name' placeholder='상품명' required>" +
                "<input type='text' name='pc_food_price' placeholder='금액' required>"+"</div>";

        }
    }

    function deleteRow(rownum) {
        const table = document.getElementById('food_enrol');
        const newRow = table.deleteRow(rownum);
    }

    $(document).on('change', 'input[type=file]', function (e) {

        var imgchange = e.target.previousSibling.children;

        if (this.files && this.files[0]) {
            var reader = new FileReader;
            reader.onload = function (data) {

                $(imgchange).attr("src", event.target.result);
            }
            reader.readAsDataURL(this.files[0]);
        }
    });

</script>
</head>
<body>


<form action="foodimgenrol" method="post" enctype="multipart/form-data">

 
    <div class="bg-dark text-white" >
        <div class="container">
            <div class="tabletop row">

                <div class="col-md-4 text-center my-auto center-block;">
                    <img src="/filepath/${logo }" style="width:200px; height:auto">
                </div>
                <div class="col-md-4 my-auto text-center bg-secondary;">
                    <h1 class="display-5 fw-bold text-black">
                        <button type="button" class="btn btn-outline-danger"  onclick="location.href='pc_enrol1'">이전</button>
                        2/3
                        <button type="submit" class="btn btn-outline-danger" onClick="check()">다음</button></h1>
                </div>

                <div class="col-md-4 my-auto text-center text-white">
                 
                    <input type="button" class="btn btn-primary" onclick="addRow()" value="메뉴 추가">
                    <input type="button" class="btn btn-warning" onclick="deleteRow()" value="메뉴 삭제">
                  
                </div>
            </div></div>
 </div>
        <hr>    

        <div class="tablemain">

          <div class="row text-center">
           <div class="text-center mx-auto mt-5">
            <table class="bg-light my-5 mx-auto" id='food_enrol'>
                <tbody id="tblshow" class="mx-auto mt-3"></tbody></table>
           </div></div>
         
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
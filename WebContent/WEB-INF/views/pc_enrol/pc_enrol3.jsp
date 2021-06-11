<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var='root' value="${pageContext.request.contextPath }/" />
<%@ taglib prefix="fo" uri="http://www.springframework.org/tags/form" %>
<c:set var="pc_name" value="${pc_name }"/>

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
    .tb_size{
            height: 250px;
            width: 320px;
            background-color : white;
        }

        .home_td{
        border: 1px solid black;
        }


    </style>
    <script>
   function enrol2()  {
        location.href = "pc_enrol2"
    } 
    function master_pc()  {
        var form=document.pc_timefo;
        
        form.submit();
    }
    
    $(document).on('change', 'input[type=file]', function (e) {

        var imgchange = e.target.previousSibling;

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

<form action="pc_enrolin" method="post" enctype="multipart/form-data">

    <div class="bg-dark text-white" >
        <div class="container">
            <div class="tabletop row">

                <div class="col-md-4 text-center my-auto center-block;">
                    <img src="/filepath/${logo }" style="width:200px; height:auto">
                </div>
                <div class="col-md-4 my-auto mx-auto text-center bg-secondary;">
                    <h1 class="display-5 fw-bold text-black">
                        <button type="button" class="btn btn-outline-danger" onclick="enrol2()">이전</button>
                        3/3
                        <button type="submit" class="btn btn-outline-danger" onclick="master_pc()">완료</button></h1>
                </div>
                <div class="col-md-4 my-auto text-center text-white">
                    <img src="/filepath/${manegerlogo }" style="width:100px; height:auto">   
                
                </div>
            </div></div></div>
        <hr>    

        <div class="tablemain">

          <div class="row text-center">
               <div class="col-md-6 text-center mx-auto;">

                <table class="mt-5" style="width: 550px; height: 590px; border: 1px solid black; border-spacing: 15px; border-collapse: separate bord; margin-left: 85px; margin-right: 90px; ">
                    <fo:form modelAttribute="pc_time" name="pc_timefo" action="pc_enrolin">
                        <fo:hidden path="pc_name" value="${pc_name }"/>
                        <fo:hidden path="pc_b_number"  value="${pc_b_number }"/>
                        <c:forEach begin="0" end="4">
                        <tr style="text-align: center ; padding-left: 10px; background-color: #f1eff2;">
                            <td>
                              <fo:input type="text" style="margin-left: -500px; margin-right: -500px; font-size: 100; text-align: center; background-color: #f1eff2; border:none;"  placeholder='등록할 시간명'  path="pc_time_text"/><br>
                              <fo:input type="text" style="margin-left: -500px; margin-right: -500px; font-size: 10px; text-align: center; background-color: #f1eff2; border:none; color:#d94242;"  placeholder='등록할 시간(분)' path="pc_time"/><br>
                              <fo:input type="text" style="margin-left: -500px; margin-right: -500px; font-weight: bold; width: 157px; height: 30px; font-size: 20px; text-align: center; background-color: #f1eff2; border:none;"  placeholder='등록할 가격' path="pc_time_price"/>
                            </td>
                            <td>
                              <fo:input type="text" style="margin-left: -500px; margin-right: -500px; font-size: 100; text-align: center; background-color: #f1eff2; border:none;" placeholder='등록할 시간명' path="pc_time_text"/><br>
                              <fo:input type="text" style="margin-left: -500px; margin-right: -500px; font-size: 10px; text-align: center; background-color: #f1eff2; border:none; color:#d94242;"  placeholder='등록할 시간(분)' path="pc_time"/><br>
                              <fo:input type="text" style="margin-left: -500px; margin-right: -500px; font-weight: bold; width: 157px; height: 30px; font-size: 20px; text-align: center; background-color: #f1eff2; border:none;" placeholder='등록할 가격'  path="pc_time_price"/>
                            </td>
                        </tr> 
                        </c:forEach>
                         </fo:form>
                </table>
               </div>

               <div class="col-md-6 text-center mx-auto;">

                <table class="home_td bg-light mt-5" style="border:1px solid black; width:700px;">
                    <tr>
                        <td class="home_td"><label for='di'><img src='' class='tb_size'><input type='file' id='di' name="file"><br><input type="hidden" name="iden1" value="${pc_name }pc1"><br> </label></td>
                        <td class="home_td"><label for='di'><img src='' class='tb_size'><input type='file' id='di' name="file"><br><input type="hidden" name="iden2" value="${pc_name }pc2"><br></label></td>
                    </tr>
                    <tr>
                        <td class="home_td"><label for='di'><img src='' class='tb_size'><input type='file' id='di' name="file"><br><input type="hidden" name="iden3" value="${pc_name }pc3"><br></label></td>
                        <td class="home_td"><label for='di'><img src='' class='tb_size'><input type='file' id='di' name="file"><br><input type="hidden" name="iden4" value="${pc_name }pc4"><br></label></td>
                    </tr>
                </table>

             </div>
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
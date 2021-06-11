<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Document</title>
   <style>
      .wrapper{
         height: 750px;
         display: flex;
         align-items: center;
         justify-content: center;
      }
   </style>
</head>
<body>
   <div class="wrapper">
      <img src="/filepath/${errbackimg }" style="display: block;">
      <span style="position: absolute; top: 156px; left: 618px; font-size: 21px; cursor: pointer;" onclick="javascript:history.go(-1)">Back to home page</span>
      <span style="position: absolute; top: 173px; right: 365px; font-size: 21px; cursor: pointer;" onclick="location.htef='${pageContext.request.contextPath }/board/qaboardlist'">고객센터</span>
   </div>
</body>
</html>
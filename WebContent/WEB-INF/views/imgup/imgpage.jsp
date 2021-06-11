<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

<style>
.img_view {
	border: 1px solid black;
	width: 220px;
}
</style>
</head>
<body>
	
	<form action="img" method="post" enctype="multipart/form-data">
		<label for="Img">이미지</label> 
		<input type="file" id="Img" name="file"><br>
		식별이름:<input type="text" name="name"><br>
		<div id="img_view">
			<img src="">
		</div>
		<script>
		$("input[type=file]").change(function() {
			if (this.files && this.files[0]) {
				var reader = new FileReader;
				reader.onload = function(data) {
					$("#img_view img").attr("src", data.target.result).width(220);
					$("#img_view img").css("height", "300");
				}
				reader.readAsDataURL(this.files[0]);
			} 
		}); 
		</script>
		<input type="submit" value="전송">
	</form> 
</body>
</html>
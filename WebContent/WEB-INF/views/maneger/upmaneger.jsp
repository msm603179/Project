<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="fo" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>


<style>
.errorText {
	color: red;
}

.check_name {
	font-size: small;
}

input[type=button] {
	cursor: pointer;
}

body, html {
	background-image: url("경로");
	background-repeat: no-repeat;
	background-size: cover;
}
</style>
<script>
	window.onload = function() {
		document.getElementById('openw').onclick = function() {

			var zipcode = document.getElementById("zipcode").value;
			window.open('addr?zipcode=' + zipcode, '', 'width=600,height=400');
		}
	}
</script>
</head>
<body>

	<article class="container">


		<div class="card shadow mx-auto mt-5" style="width: 35rem;">
			<div class="card-body">

				<div class="page-header">
					<div>
						<h3 class="card-title text-center mx-auto">가맹주 정보 수정</h3>
					</div>
				</div>

				<div class="login_membershipform">
					<fieldset>
						<fo:form action="upmango" method="post" modelAttribute="man">
							<div class="col">
								<form role="form">
									<div class="form-group">
										<label for="inputName">피시방 이름</label>
										<fo:input path="pc_name" type="text" class="form-control"
											id="inputPcName" placeholder="이름을 입력해 주세요" />
										<fo:errors path="pc_name" cssClass="errorText" />
									</div>


									<div class="form-group">
										<label for="inputName">성명</label>
										<fo:input path="m_name" type="text" class="form-control"
											id="inputName" placeholder="이름을 입력해 주세요" />
										<fo:errors path="m_name" cssClass="errorText" />
									</div>

									<div class="form-group">
										<label for="inputId">아이디</label>
										<fo:label path="m_id" type="text" class="form-control"
											id="inputId" placeholder="영어와 숫자를 조합하여 6~15글자를 입력해주세요." />
										<fo:errors path="m_id" cssClass="errorText" />
									</div>


									<div class="form-group">
										<label for="inputPw">비밀번호</label>
										<fo:input path="m_pw" type="password" class="form-control"
											id="inputPw" placeholder="영어와 숫자를 조합하여 8~15글자를 입력해주세요" />
										<fo:errors path="m_pw" cssClass="errorText" />
									</div>

									<div class="form-group">
										<label for="inputPw1">생년월일</label>
										<fo:input path="m_birthday" class="form-control"
											id="u_birthday" placeholder="ex)901201" />
										<fo:errors path="m_birthday" cssClass="errorText" />
									</div>



									<div class="form-group">
										<label for="inputPhone">연락처</label>
										<fo:input path="m_phone" type="text" class="form-control"
											id="inputPhone" placeholder="연락처를 입력해 주세요" />
										<fo:errors path="m_phone" cssClass="errorText" />
									</div>

									<div class="form-group">
										<label for="inputAddr">주소</label>
										<fo:input path="pc_address" type="text" class="form-control"
											readonly="true" id="m_address" placeholder="우편번호를 검색해주세요." />
									</div>

									<div class="form-group">
										<label for="inputZip">우편번호</label> <input type="text"
											class="form-control" name="zipcode" id="zipcode"
											placeholder="우편번호를 검색해주세요." />
										<div class="form-group text-right mt-3">
											<input type="button" value="우편번호찾기" name="address2"
												id="openw" class="btn btn-outline-info"><br>
										</div>

									</div>
									<div class="form-group">
										<label for="inputEmail">이메일</label>
										<fo:input path="m_email" type="email" class="form-control"
											id="inputEmail" placeholder="이메일을 입력해 주세요" />
										<br>
										<fo:errors path="m_email" cssClass="errorText" />
									</div>
									<div class="form-group text-center">
										<fo:hidden path="pc_enrol" class="btn btn-primary"
											id="action" name="action" />


										<fo:button type="submit">수정</fo:button>
									</div>
								</form>
							</div>

						</fo:form>
					</fieldset>
				</div>
			</div>
		</div>
	</article>

</body>
</html>
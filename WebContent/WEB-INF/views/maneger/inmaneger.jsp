<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="fo" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<script>
	window.onload = function() {
		document.getElementById('openw').onclick = function() {

			var zipcode = document.getElementById("zipcode").value;
			window.open('addr?zipcode=' + zipcode, '', 'width=600,height=400');
		}
	}
</script>
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
	background-image: url("/filepath/${inuserbackimg}");
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
						<h3 class="card-title text-center mx-auto">회원가입</h3>
					</div>
				</div>

				<div class="login_membershipform">
					<fieldset>
						<fo:form name="user" action="inman" method="post"
							modelAttribute="pc_maneger">



							<div class="col">
								<form role="form">
									<div class="form-group">
										<label for="inputPcName">피시방 이름</label>
										<fo:input path="pc_name" type="text" class="form-control"
											id="inputPcName" placeholder="피시방 이름을 입력해 주세요" />
										<fo:errors path="pc_name" cssClass="errorText" />
									</div>


									<div class="form-group">
										<label for="inputPcBNumber">가맹점 번호</label>
										<fo:input path="pc_b_number" type="text" class="form-control"
											id="inputPcBNumber" placeholder="가맹점 번호 10자리를 입력해주세요." />
										<fo:errors path="pc_b_number" cssClass="errorText" />
									</div>

									<div class="form-group">
										<label for="inputName">성명</label>
										<fo:input path="m_name" type="text" class="form-control"
											id="inputName" placeholder="이름을 입력해 주세요" />
										<fo:errors path="m_name" cssClass="errorText" />
									</div>
									
									<div class="form-group">
										<label for="inputId">아이디</label>
										<fo:input path="m_id" type="text" class="form-control"
											id="inputId" placeholder="영어와 숫자를 조합하여 6~15글자를 입력해주세요." />
										<fo:errors path="m_id" cssClass="errorText" />
									</div>
									
									<div class="form-group">
										<label for="inputPw">비밀번호</label>
										<fo:input path="m_pw" type="password" name="pw" class="form-control"
											id="inputPw" placeholder="영어와 숫자를 조합하여 8~15글자를 입력해주세요" />
										<fo:errors path="m_pw" cssClass="errorText" />
									</div>

									<div class="form-group">
										<label for="inputPw1">비밀번호 확인</label>
										<fo:input path="m_pwchk" type="password" name="pw1" class="form-control"
											id="inputPw1" placeholder="비밀번호를 다시 입력해 주세요" />
										<fo:errors path="m_pwchk" cssClass="errorText" />
									</div>

									<div class="form-group">
										<label for="m_birthday">생년월일</label>
										<fo:input path="m_birthday" class="form-control"
											id="m_birthday" placeholder="ex)901201" />
										<fo:errors path="m_birthday" cssClass="errorText" />
									</div>


									<div class="form-group">
										<label for="inputPhone">연락처</label>
										<fo:input path="m_phone" type="text" class="form-control"
											id="inputPhone" placeholder="연락처를 입력해 주세요" />
										<fo:errors path="m_phone" cssClass="errorText" />
									</div>

									<div class="form-group">
										<label for="pc_address">주소</label>
										<fo:input path="pc_address" type="text" class="form-control"
											readonly="true" id="pc_address" placeholder="우편번호를 검색해주세요." />
									</div>
									
									
									<div class="form-group">
										<label for="inputZip">우편번호</label>
										<input type="text" class="form-control"
											name="zipcode" id="zipcode" placeholder="우편번호를 검색해주세요." />
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
									

									<fo:hidden path="pc_enrol" />
									
									<div class="form-group">
										<label>약관 동의</label>
										<div data-toggle="buttons">
											<label class="btn btn-primary active"> <span
												class="fa fa-check"></span> <input id="agree"
												type="checkbox" autocomplete="off" checked>
											</label> <a href="terms.html"
												onclick="window.open('', '_blank', 'width=800, height=600 scrollbars=yes'); return false;">서비스
												이용약관</a>에 동의합니다.
										</div>
									</div>

									<div class="form-group">
										<div data-toggle="buttons">
											<label class="btn btn-primary active"> <span
												class="fa fa-check"></span> <input id="agree"
												type="checkbox" autocomplete="off" checked>
											</label> <a href="privacy.html"
												onclick="window.open('', '_blank', 'width=800, height=600 scrollbars=yes'); return false;">개인정보
												이용 및 활용 동의</a>에 동의합니다.
										</div>
									</div>

									<div class="form-group text-center">

										<input type="submit" value="등록" class="btn btn-primary"
											id="action" name="action">
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
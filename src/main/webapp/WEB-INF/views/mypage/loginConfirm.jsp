<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
	<style>
		.re_login_btn{
	width: 300px;
	height: 300px;
}
</style>
</head>
<body>
	<h1>회원 정보 확인</h1>
	<div class="wrapper">
		<div class="wrap">
			<form id="re_login_form" method="post">
				아이디 : ${member.id}
				<div class="pw_wrap">
					<div class="pw_input_box">
						비밀번호 확인 : <input class="pw_input" name="pw" value="1234">
					</div>
				</div>
				<c:if test="${result==0}">
					<div class="login_warn">사용자 ID 또는 비밀번호를 잘못 입력하셨습니다.</div>
				</c:if>
				<div class="re_login_btn_wrap">
					<input type="button" class="re_login_btn" value="확인">
				</div>
				<input type="hidden" name="id" value = "${member.id}">
			</form>
		</div>
	</div>
	<script>
		$(".re_login_btn").click(function() {
			$("#re_login_form").attr("action", "/mypage/loginConfirm");
			$("#re_login_form").submit();
		});
	</script>
</body>
</html>
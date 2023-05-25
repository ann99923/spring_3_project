<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>브랜드명</title>
<link rel="stylesheet" href="../resources/css/Login/login.css">
  <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
<body>

	<div class="wrapper">
		<div class="wrap">
		
		<%@include file = "../include/header.jsp" %>
		<form id="login_form" method="post">
		
			<!-- 로그인 부분 -->

		<span>로그인</span>
		<div class="logo_wrap">
	
			<div class="id_wrap">
					<div class="id_name">아이디</div>
					<div class="id_input_box">
						<input class="id_input"  name="id">
					</div>
			</div>
			<div class="pw_wrap">
				<div class="pw_name">비밀번호</div>
				<div class="pw_input_box">
					<input class="pw_input"  name="pw">
				</div>
			</div>
			
			<c:if test ="${result == 0}">
			<div class="login_warn">	사용자 ID 또는 비밀번호를 잘못 입력하셨습니다.</div>
			</c:if>
			</div>
			
			<div class="button">
			<div class="login_button_wrap">
				<input type="button" class="login_button" value="로그인">
				</div>
				
			<div>
				<input type="button" class="join" value="회원가입" onclick="location.href='/join/joinPage'">
			</div>
			
			<div class="login_btn">
				<input type="button" class="n_login" value="네이버 로그인">
				<input type="button" class="g_login" value="구글 로그인">
			</div>
			</div>
			
				
			</form>
			</div></div>
			
		

		
		
		
			<!-- footer -->
			<%@include file = "../include/footer.jsp" %>
		
	<script>
 
    /* 로그인 버튼 클릭 메서드 */
    $(".login_button").click(function(){
        
        //alert("로그인 버튼 작동");
        
        //로그인 메서드 서버 요청
        $("#login_form").attr("action","/login/login");
        $("#login_form").submit();
        
    });
    
    /*회원가입 버튼 클릭 메서드*/
    $(".join").click(function(){
		//alert("회원가입 버튼 작동")
	})
 

</script>
	

</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>브랜드명</title>

<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
	<div class="wrapper">
	<div class="wrap">
	<!-- 윗부분 바 -->
			<div class="top_gnb_area">
			<a class="logo"  href="/main">
				<img class="logo" src="/resources/img/logo.png">
				</a>
				<ul class="top_left">
					<li><a href="../shop/productMain">제품보기</a></li>
					
					
				</ul>
				
				<ul class="top_right">
				<!-- 로그인 x -->
				<c:if test= "${member == null}">
					<li>
					<a href="/login/login">로그인</a>
					</li>
					<li>
					<a href="/join/joinPage">회원가입</a>
					</li>
				
					</c:if>
				
				<!-- 로그인 o -->	
				<c:if test="${member != null}">
				<div class="login_success_area">
					<c:if test="${member.adminCk == 1 }"> <!-- 관리자 계정 -->
						<li><a href="adminProd/main">관리자 페이지</a></li>
					</c:if>
					
					<li>${member.name} 님</li>
					<li>마이룸</li>
					<li><a href="/cart/${member.id}">장바구니</a></li>
					<li>고객센터</li>
					<li><a href="/login/logout.do">로그아웃</a></li>
				</div>
				</c:if>
					</ul>
			</div>
</body>
</html>
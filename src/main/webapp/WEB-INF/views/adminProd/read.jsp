<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Read Page</title>
<link rel="stylesheet" href="../resources/css/adminProd/read.css">
<link rel="stylesheet" href="../resources/css/includes/admin/header.css">
<link rel="stylesheet" href="../resources/css/includes/admin/footer.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
</head>
<body>
	<%@include file="../includes/admin/header.jsp"%>
	
	<div>
		<div class="img_wrap">
			<label>이 미 지 파 일 : </label><br>
			<img class="img" src="/resources/image/${pageInfo.img1}">
			<img class="img" src="/resources/image/${pageInfo.img2}">
			<img class="img" src="/resources/image/${pageInfo.img3}"><br>
		</div>	
		<div class="read_wrap">
			<label>상 품 번 호 : </label>
			<c:out value="${pageInfo.prodNum}"/>
		</div>
		<div class="read_wrap">
			<label>카 테 고 리 번 호 : </label>
			<c:out value="${pageInfo.categoryNum}" />
		</div>
		<div class="read_wrap">
			<label>상 품 명 : </label>
			<c:out value="${pageInfo.prodName}" />
		</div>
		<div class="read_wrap">
			<label>상 품 가 격 : </label>
			<c:out value="${pageInfo.price}"/>
		</div>
		<div class="read_wrap">
			<label>상 품 상 세 정 보 : </label>
			<c:out value="${pageInfo.prodInfo}" />
		</div>
		<div class="read_wrap">
			<label>재 고 량 : </label>
			<c:out value="${pageInfo.stock}"/>
		</div>
	
		<div class="btn_wrap">
			<a class="btn" id="list_btn">목록 페이지</a>
			<a class="btn" id="update_btn">수정하기</a>
		</div>
	</div>
	
	<form id="infoForm" method="get" action="/adminProd/list">
		<input type="hidden" id="prodNum" name="prodNum" value='<c:out value = "${pageInfo.prodNum}"/>'>
		<input type="hidden" name="type" value='<c:out value = "${cri.type}"/>'> 
		<input type="hidden" name="keyword" value='<c:out value = "${cri.keyword}"/>'>
	</form>

	<%@include file="../includes/admin/footer.jsp"%>

	<script>	
      let form = $("#infoForm");
      $("#list_btn").on("click", function(e) {
         form.find("#prodNum").remove();
         form.attr("action", "/adminProd/list");
         form.submit();
      });
      $("#update_btn").on("click", function(e) {
         form.attr("action", "/adminProd/update");
         form.submit();
      });
   </script>
</body>
</html>
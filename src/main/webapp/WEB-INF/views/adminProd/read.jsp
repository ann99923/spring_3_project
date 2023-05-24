<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Read Page</title>
<link rel="stylesheet" href="../resources/css/admin/main.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
</head>
<body>
	<%@include file="../includes/admin/header.jsp"%>

	<h1>조회 페이지</h1>
	<div class="input_wrap">
		<label>이 미 지 파 일</label><br>		
			<img src="/resources/image/${pageInfo.img1}" style="width: 150px; height: 100px;">
			<img src="/resources/image/${pageInfo.img2}" style="width: 150px; height: 100px;">
			<img src="/resources/image/${pageInfo.img3}" style="width: 150px; height: 100px;"><br>
			<!-- 	
			<input type="file" name="img1" value="${pageInfo.img1}" readonly><br>
			<input type="file" name="img2" value="${pageInfo.img2}" readonly><br>
			<input type="file" name="img3" value="${pageInfo.img3}" readonly><br>
			 -->
	</div>
	<div class="input_wrap">
		<label>상 품 번 호</label>
			<input name="prodNum" value='<c:out value="${pageInfo.prodNum}"/>' readonly>
	</div>
	<div class="input_wrap">
		<label>카 테 고 리 번 호</label>
			<input name="categoryNum" value='<c:out value="${pageInfo.categoryNum}"/>' readonly>
	</div>
	<div class="input_wrap">
		<label>상 품 명</label>
			<input name="prodName" value='<c:out value="${pageInfo.prodName}"/>' readonly>
	</div>
	<div class="input_wrap">
		<label>상 품 가 격</label>
			<input name="price" value='<c:out value="${pageInfo.price}"/>' readonly>
	</div>
	<div class="input_wrap">
		<label>상 품 상 세 정 보</label><br>
		<textarea rows="3" name="prodInfo" readonly>
		<c:out value="${pageInfo.prodInfo}" /></textarea>
	</div>
	<div class="input_wrap">
		<label>재 고 량</label>
			<input name="stock" value='<c:out value="${pageInfo.stock}"/>' readonly>
	</div>

	<div class="btn_wrap">
		<a class="btn" id="main_btn">목록 페이지</a>
		<a class="btn" id="update_btn">수정하기</a>
	</div>
	<form id="infoForm" method="get" action="/adminProd/list">
		<input type="hidden" id="prodNum" name="prodNum" value='<c:out value = "${pageInfo.prodNum}"/>'>
		<input type="hidden" name="type" value='<c:out value = "${cri.type}"/>'> 
		<input type="hidden" name="keyword" value='<c:out value = "${cri.keyword}"/>'>
	</form>

	<%@include file="../includes/admin/footer.jsp"%>

	<script>	
      let form = $("#infoForm");
      $("#main_btn").on("click", function(e) {
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
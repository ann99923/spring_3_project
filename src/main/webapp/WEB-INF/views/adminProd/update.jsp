<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Update Page</title>
<link rel="stylesheet" href="../resources/css/admin/main.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
</head>
<body>
	<%@include file="../includes/admin/header.jsp"%>
	
	<form action="/adminProd/update" method="post" id="updateForm">
		<h1>수정 페이지</h1>
		<div class="input_wrap">
			<label>이 미 지 파 일</label><br>
				<input type="file" name="img1" src="/resources/image/*"><br>
				<input type="file" name="img2" src="/resources/image/*"><br>
				<input type="file" name="img3" src="/resources/image/*"><br>
		</div>
		<div class="input_wrap">
			<label>상 품 번 호</label>
				<input name="prodNum" value="${pageInfo.prodNum}" readonly/>
		</div>
		<div class="input_wrap">
			<label>카 테 고 리 번 호</label>
				<input name="categoryNum" value="${pageInfo.categoryNum}" readonly/>
		</div>
		<div class="input_wrap">
			<label>상 품 명</label>
				<input name="prodName" value="${pageInfo.prodName}" />
		</div>
		<div class="input_wrap">
			<label>상 품 가 격</label>
				<input name="price" value="${pageInfo.price}" />
		</div>
		<div class="input_wrap">
			<label>상 품 상 세 정 보</label><br>
			<textarea rows="3" name="prodInfo">${pageInfo.prodInfo}</textarea>
		</div>
		<div class="input_wrap">
			<label>재 고 량</label>
				<input name="stock" value="${pageInfo.stock}" />
		</div>
		
		<div class="btn_wrap">
			<a class="btn" id="list_btn">목록 페이지</a>
			<a class="btn" id="submit_btn">수정하기</a>
			<a class="btn" id="delete_btn">삭제하기</a>
		</div>
	</form>
	
	<form id="infoForm" method="get" action="/adminProd/list">
		<input type="hidden" id="prodNum" name="prodNum" value="${pageInfo.prodNum}"/>
		<input type="hidden" name="type" value='<c:out value = "${cri.amount}"/>'> 
		<input type="hidden" name="keyword" value='<c:out value = "${cri.keyword}"/>'>
	</form>

	<%@include file="../includes/admin/footer.jsp"%>

	<script>
      let form = $("#infoForm");
      let form2 = $("#updateForm");
      
      $("#list_btn").on("click", function(e) {
         form.find("#prodNum").remove();
         form.attr("action", "/adminProd/list");
         form.submit();
      });
      $("#submit_btn").on("click", function(e) {         
         form2.submit();
      });
      $("#delete_btn").on("click", function(e) {         
         form.attr("action", "/adminProd/delete");
         form.attr("method", "post");
         form.submit();         
      });
   </script>
</body>
</html>
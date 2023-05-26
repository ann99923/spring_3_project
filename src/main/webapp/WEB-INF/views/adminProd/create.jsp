<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Create Page</title>
<link rel="stylesheet" href="../resources/css/adminProd/create.css">
<link rel="stylesheet" href="../resources/css/includes/admin/header.css">
<link rel="stylesheet" href="../resources/css/includes/admin/footer.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
</head>
<body>

	<%@include file="../includes/admin/header.jsp"%>
	
		<div class="admin_content_wrap">
			<form action="/adminProd/create" method="post" id="createForm">
				이 미 지 파 일 : <br> 
				<input type="file" name="img1" src="/resources/image/*"><br>
				<input type="file" name="img2" src="/resources/image/*"><br>
				<input type="file" name="img3" src="/resources/image/*"><br>
				<!-- 상 품 코 드 : <input name="prodNum"><br> -->
				카 테 고 리 번 호 : <input name="categoryNum"><br>
				상 품 명 : <input name="prodName"><br>
				상 품 가 격 : <input name="price"><br>
				상 품 정 보 : <input name="prodInfo"><br>
				재 고 량 : <input name="stock"><br>
			</form>
				<button id="enrollBtn" class="btn enroll_btn">등록</button>
				<button id="cancelBtn" class="btn">취소</button>
		</div>
		
	<%@include file="../includes/admin/footer.jsp"%>
	
	<script>
		/* 이미지 업로드 */
		$("input[type='file']").on("change", function(e){
			//alert("이미지 삽입");
			let fileInput = $('input[name="img1"]');
			let fileList = fileInput.files;
			console.log("fileList : " + fileList);
		});
		$("input[type='file']").on("change", function(e){
			//alert("이미지 삽입");
			let fileInput = $('input[name="img2"]');
			let fileList = fileInput.files;
			console.log("fileList : " + fileList);
		});
		$("input[type='file']").on("change", function(e){
			//alert("이미지 삽입");
			let fileInput = $('input[name="img3"]');
			let fileList = fileInput.files;
			console.log("fileList : " + fileList);
		});
		/*등록 버튼*/
		$("#enrollBtn").click(function() {
			$("#createForm").submit();
		});
		/*취소 버튼*/
		$("#cancelBtn").click(function() {
			location.href = "/adminProd/list";
		});
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Order Update</title>
<link rel="stylesheet" href="../resources/css/admin/main.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
</head>
<body>
	<%@include file="../includes/admin/header.jsp"%>

	<form action="/adminOrder/orderUpdate" id="status" method="post">
	<h1>주문 상태 수정 ${olist.orderNum}번</h1>
		<div>
      		<select id="oStatus">
				<option value="상품준비">상품준비</option>
				<option value="배송준비">배송준비</option>
				<option value="배송중">배송중</option>
				<option value="배송완료">배송완료</option> 
			</select>
		</div>	
		<div>
			<input type="button" id="submit_btn" value="수정하기">
		</div>
		<input type="hidden" id="orderNum" name="orderNum" value="${olist.orderNum}"/>
	</form>
		
	<%@include file="../includes/admin/footer.jsp"%>
	
	<script>
		let form = $("#status");
		
		$("#submit_btn").on("click", function () {
			var a = document.getElementById('oStatus').options[document.getElementById('oStatus').selectedIndex].value;
			alert(a);
			form.append($('<input/>', {type: 'hidden', name: 'orderStatus' , value: a }));
			form.submit();
		});
	</script>
</body>
</html>
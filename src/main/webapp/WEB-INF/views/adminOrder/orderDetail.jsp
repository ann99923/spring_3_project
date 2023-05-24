<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Order Detail</title>
<link rel="stylesheet" href="../resources/css/admin/main.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
</head>
<body>
	<%@include file="../includes/admin/header.jsp"%>

		<h1>주문 목록 상세 페이지</h1>
		<div>
			<label>주 문 번 호</label>
			<input name="orderNum" value="${olist.orderNum}" readonly>
		</div>
		<div>
			<label>회 원 아 이 디</label>
			<input name="id" value="${olist.id}" readonly>
		</div>
		<div>
			<label>금 액</label>
			<input name="orderPrice" value="${olist.orderPrice}" readonly>
		</div>
		<div>
			<label>주 문 일 자</label>
			<input name="orderDate" value="${olist.orderDate}" pattern="yyyy/MM/dd" readonly>
		</div>
		<div>
			<label>결 제 수 단</label>
			<input name="orderPay" value="${olist.orderPay}" readonly>
		</div>
		<div>
			<label>주 문 상 태</label>
			<input name="orderStatus" value="${olist.orderStatus}" readonly>
		</div>
		<div>
			<label>수 령 인</label>
			<input name="orderRecv" value="${olist.orderRecv}" readonly>
		</div>
		<div>
			<label>우 편 번 호</label>
			<input name="orderPost" value="${olist.orderPost}" readonly>
		</div>
		<div>
			<label>수 령 주 소</label> <br>
			<input name="ordeAddr1" value="${olist.orderAddr1}" readonly>
			<input name="ordeAddr2" value="${olist.orderAddr2}" readonly>
		</div>
		<div>
			<label>배 송 메 시 지</label> <br>
			<textarea readonly>${olist.orderMsg}</textarea> 
		</div>
		<div>
			<label>받 는 적 립 금</label>
			<input name="orderPointIn" value="${olist.orderPointIn}" readonly>
		</div>
		<div>
			<label>내 는 적 립 금</label>
			<input name="orderPointOut" value="${olist.orderPointOut}" readonly>
		</div>
		<input type="button" id="list_btn" value="목록으로 돌아가기" style="background: aqua; width: 120px; height: 30px;">
	
		<form id="infoForm" method="get" action="/adminOrder/orderList">
			<input type="hidden" id="orderNum" name="orderNum" value='<c:out value = "${olist.orderNum}"/>'>
			<input type="hidden" name="type" value='<c:out value = "${cri.type}"/>'> 
			<input type="hidden" name="keyword" value='<c:out value = "${cri.keyword}"/>'>
		</form>
				
	<%@include file="../includes/admin/footer.jsp"%>	
	
		<script>
			let form = $("#infoForm");
			
			$("#list_btn").on("click", function() {
				form.find("#orderNum").remove();
				form.attr("action", "/adminOrder/orderList");
				form.submit();
			});
			
		</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
		<div>
			<table border="1" style="font-size: 30px; text-align: center;">
				<tr>
					<th>주 문 번 호</th>
					<td>${olist.orderNum}</td>
				</tr>
				<tr>
					<th>회 원 아 이 디</th>
					<td>${olist.id}</td>
				</tr>
				<tr>
					<th>주 문 금 액</th>
					<td><fmt:formatNumber value="${olist.orderPrice}" pattern="\#,###.##" /></td>
				</tr>
				<tr>
					<th>주 문 일 자</th>
					<td><fmt:formatDate value="${olist.orderDate}" pattern="yyyy/MM/dd" /></td>
				</tr>
				<tr>
					<th>결 제 수 단</th>
					<td>${olist.orderPay}</td>
				</tr>
				<tr>
					<th>주 문 상 태</th>
					<td>${olist.orderStatus}</td>
				</tr>
				<tr>
					<th>수 령 인</th>
					<td>${olist.orderRecv}</td>
				</tr>
				<tr>
					<th>우 편 번 호</th>
					<td>${olist.orderPost}</td>
				</tr>
				<tr>
					<th>수 령 주 소</th>
					<td>${olist.orderAddr1} ${olist.orderAddr2}</td>
				</tr>
				<tr>
					<th>배 송 메 시 지</th>
					<td>${olist.orderMsg}</td>
				</tr>
				<tr>
					<th>받 는 적 립 금</th>
					<td>${olist.orderPointIn}</td>
				</tr>
				<tr>
					<th>내 는 적 립 금</th>
					<td>${olist.orderPointOut}</td>
				</tr>
				<tr cols="2">
					<td><input type="button" id="list_btn" value="목록으로 돌아가기" style="background: aqua; width: 200px; height: 50px; font-size: 22px; float: right;"></td>
				</tr>
			</table>
		</div>
	
		<form id="infoForm" method="get" action="/adminOrder/orderList">
			<input type="hidden" id="orderNum" name="orderNum" value='<c:out value = "${olist.orderNum}"/>'>
			<input type="hidden" id="type" name="type" value='<c:out value = "${cri.type}"/>'> 
			<input type="hidden" id="keyword" name="keyword" value='<c:out value = "${cri.keyword}"/>'>
		</form>
				
	<%@include file="../includes/admin/footer.jsp"%>	
	
		<script>
			let form = $("#infoForm");
			
			$("#list_btn").on("click", function() {
				form.find("#orderNum").remove();
				form.find("#type").remove();
				form.find("#keyword").remove();
				form.attr("action", "/adminOrder/orderList");
				form.submit();
			});
			
		</script>
</body>
</html>
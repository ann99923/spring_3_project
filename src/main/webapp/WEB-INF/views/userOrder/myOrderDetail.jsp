<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/userOrder/myOrderDetail.css">
</head>
<body>

	<%@ include file="/WEB-INF/views/include/header.jsp" %>
	<%@ include file="../myPage/sideBar.jsp"%>

	<div class="order-details">
		<h2>주문 상세 정보</h2>
		
		<a class="cancel_order">주문 취소하기</a>		

		<div class="order-summary">
			<h3>주문 요약</h3>
			<p>
				<strong>주문 번호:</strong> ${order.orderNum }
			</p>
			<p>
				<strong>주문 날짜:</strong> ${order.orderDate }
			</p>
			<p>
				<strong>주문 금액:</strong> ${order.orderPrice }
			</p>
		</div>

		<div class="shipping-details">
			<h3>배송 정보</h3>
			<p>
				<strong>받는 사람:</strong> ${order.orderRecv }
			</p>
			<p>
				<strong>배송 주소:</strong> ${order.orderPost }<br>${order.orderAddr1 }<br>${order.orderAddr2 }
			</p>
		</div>

		<div class="delivery-progress">
			<h3>배송 진행 상황</h3>
			<p>${order.orderStatus }</p>
		</div>

		<div class="order-items">
			<h3>주문 상품</h3>
			<table>
				<thead>
					<tr>
						<th>상품</th>
						<th>가격</th>
						<th>수량</th>
						<th>합계</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="od" items="${detail }">
					<tr>
						<td> ${od.prodNum }
						</td>
						<td>${od.prodPrice }</td>
						<td>${od.prodCount }</td>
						<td>${od.prodPrice * od.prodCount }</td>
					</tr>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="3">총 주문 금액:</td>
						<td>${order.orderPrice }</td>
					</tr>
				</tfoot>
			</table>
			사용포인트
			적립포인트
			배송비 ${orderPrice }
		</div>
	</div>
	
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>

	<script>
		$(".cancel_order").on("click", function(){
			if(${order.orderStatus eq '상품준비'}){
				$(".cancel_order").attr("href", "/userOrder/cancelOrder/${orderNum }");
			}else{
				alert("취소가 불가능합니다.");
			}
		});
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>          
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome BookMall</title>
<link rel="stylesheet" href="/resources/css/cart.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
<body>

<div class="wrapper">
	<div class="wrap">
		<div class="top_gnb_area">
			
			<ul class="list">
				<c:if test = "${member == null}">	<!-- 로그인 x -->	
					<li >
						<a href="/member/login">로그인</a>
					</li>
					<li>
						<a href="/member/join">회원가입</a>
					</li>
				</c:if>
				<c:if test="${member != null}">	
				<!-- 로그인 o -->		
					<c:if test="${member.adminCk == 1 }">	
					<!-- 관리자 계정 -->
						<li><a href="/admin/main">관리자 페이지</a></li>
					</c:if>							
					<li>
						<a id="gnb_logout_button">로그아웃</a>
					</li>
					<li>
						마이룸
					</li>
					<li>
						<a href="/cart/${member.memberId}">장바구니</a>
					</li>
				</c:if>				
				<li> 고객센터 </li>			
			</ul>			
		</div>
			<div class="clearfix"></div>			
		
		
		
		
		<div class="content_area">
		<div class="content_subject"><span>장바구니</span></div>
			<!-- 장바구니 리스트 -->
			<div class="content_middle_section"></div>
			<!-- 장바구니 가격 합계 -->
			<!-- cartInfo -->
			<div class="content_totalCount_section">
				
				<table class="subject_table">
					<span>쇼핑백</span>
				</table>
				<table class="cart_table">
					<caption>표 내용 부분</caption>
					<tbody>
						<c:forEach items="${cartInfo}" var="ci">
							<tr>
								<td class="td_width_1 cart_info_td">
											
			<input type="hidden" class="individual_Price_input" value="${ci.price}">
			<input type="hidden" class="individual_cartCount_input" value="${ci.cartCount}">
			<input type="hidden" class="individual_totalPrice_input" value="${ci.price * ci.cartCount}">
			<input type="hidden" class="individual_prodNum_input" value="${ci.prodNum}">
								</td>	
								<td class="td_width_2">
									
								</td>
								<td class="td_width_3">${ci.prodName}</td>
								<td class="td_width_4 price_td">
									 <fmt:formatNumber value="${ci.price}" pattern="#,### 원" /><br>
									
								</td>
								<td class="td_width_4 table_text_align_center">
									<div class="table_text_align_center quantity_div">
										<input type="text" value="${ci.cartCount}" class="quantity_input">	
										<button class="quantity_btn plus_btn">+</button>
										<button class="quantity_btn minus_btn">-</button>
									</div>
									<a class="quantity_modify_btn" data-cartnum="${ci.cartNum}">변경</a>
								</td>
								<td class="td_width_4 table_text_align_center">
									<fmt:formatNumber value="${ci.price * ci.cartCount}" pattern="#,### 원" />
								</td>
								<td class="td_width_4 table_text_align_center">
								<button class="delete_btn" data-cartnum="${ci.cartNum}">삭제</button></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<table class="list_table">
				</table>
			</div>
			
			
			
			<!-- 가격 종합 -->
			<div class="content_total_section">
				<div class="total_wrap">
					<table>
						<tr>
							<td>
								<table>
									<tr>
										<td>총 상품 가격</td>
										<td>
											<span class="totalPrice_span">70000</span> 원
										</td>
									</tr>
									<tr>
										<td>배송비</td>
										<td>
											<span class="delivery_price">3000</span>원
										</td>
									</tr>									
									<tr>
										<td>총 주문 상품수</td>
										<td><span class="totalCount_span"></span> 개</td>
									</tr>
								</table>
							</td>
							<td>
								<table>
									<tr>
										<td></td>
										<td></td>
									</tr>
								</table>							
							</td>
						</tr>
					</table>
					<div class="boundary_div">----------------------</div>
					<table>
						<tr>
							<td>
								<table>
									<tbody>
										<tr>
											<td>
												<strong>총 결제 예상 금액</strong>
											</td>
											<td>
												<span class="finalTotalPrice_span"></span> 원
											</td>
										</tr>
									</tbody>
								</table>
							</td>
					
						</tr>
					</table>
				</div>
			</div>
			
			<!-- 쇼핑계속하기 버튼 -->
			<div class="continue_btn_section">
				<a class="continue_btn">쇼핑 계속하기</a>
			</div>
			<!-- 구매 버튼 영역 -->
			<div class="content_btn_section">
				<a class="order_btn">주문하기</a>
			</div>
			
		</div>
		
		<!-- 수량 조정 form -->
			<form action="/cart/update" method="POST" class="quantity_update_form">
				<input type="hidden" name="cartNum" class="update_cartNum">
				<input type="hidden" name="cartCount" class="update_cartCount">
				<input type="hidden" name="Id" value="${member.id}">
			</form>
			
			<!-- 삭제 form -->
			<form action="/cart/delete" method="POST" class="quantity_delete_form">
				<input type="hidden" name="cartNum" class="delete_cartNum">
				<input type="hidden" name="Id" value="${member.id}">
			</form>
			
			<!-- 주문 form -->
			<form action="#" method="get" class="order_form">
			
			</form>
		
		<!-- Footer 영역 -->
		<div class="footer_nav">
			<div class="footer_nav_container">
				<ul>
					<li>회사소개</li>
					<span class="line">|</span>
					<li>이용약관</li>
					<span class="line">|</span>
					<li>고객센터</li>
					<span class="line">|</span>
					<li>광고문의</li>
					<span class="line">|</span>
					<li>채용정보</li>
					<span class="line">|</span>
				</ul>
			</div>
		</div> <!-- class="footer_nav" -->
		
		<div class="footer">
			<div class="footer_container">
				
				<div class="footer_left">
					<img src="#">
				</div>
				<div class="footer_right">
					(주) VamBook    대표이사 : OOO
					<br>
					사업자등록번호 : ooo-oo-ooooo
					<br>
					대표전화 : oooo-oooo(발신자 부담전화)
					<br>
					<br>
					COPYRIGHT(C) <strong>kimvampa.tistory.com</strong>	ALL RIGHTS RESERVED.
				</div>
				<div class="clearfix"></div>
			</div>
		</div> <!-- class="footer" -->		
		
	</div>	<!-- class="wrap" -->
</div>	<!-- class="wrapper" -->


<script>

$(document).ready(function(){
	
	/* 종합 정보 섹션 정보 삽입 */
	setTotalInfo();	
	});	

/* 총 주문 정보 세팅(배송비, 총 가격, 마일리지, 물품 수, 종류) */
function setTotalInfo(){
	
	let totalPrice = 0;				// 총 가격
	let totalCount = 0;				// 총 갯수
	
	let deliveryPrice = 0;			// 배송비
	let finalTotalPrice = 0; 		// 최종 가격(총 가격 + 배송비)
	
	$(".cart_info_td").each(function(index, element){
		
		
			// 총 가격
			totalPrice += parseInt($(element).find(".individual_totalPrice_input").val());
			// 총 갯수
			totalCount += parseInt($(element).find(".individual_cartCount_input").val());
			console.log(totalCount);
		
	});
	
	
	/* 배송비 결정 */
	if(totalPrice >= 30000){
		deliveryPrice = 0;
	} else if(totalPrice == 0){
		deliveryPrice = 0;
	} else {
		deliveryPrice = 3000;	
	}
	
		finalTotalPrice = totalPrice + deliveryPrice;
	
	/* ※ 세자리 컴마 Javscript Number 객체의 toLocaleString() */
	
	// 총 가격
	$(".totalPrice_span").text(totalPrice.toLocaleString());
	// 총 갯수
	$(".totalCount_span").text(totalCount);

	// 배송비
	$(".delivery_price").text(deliveryPrice);	
	// 최종 가격(총 가격 + 배송비)
	$(".finalTotalPrice_span").text(finalTotalPrice.toLocaleString());		
}


/* 수량버튼 */
$(".plus_btn").on("click", function(){
	let quantity = $(this).parent("div").find("input").val();
	$(this).parent("div").find("input").val(++quantity);
});
$(".minus_btn").on("click", function(){
	let quantity = $(this).parent("div").find("input").val();
	if(quantity > 1){
		$(this).parent("div").find("input").val(--quantity);		
	}
});


/* 수량 수정 버튼 */
$(".quantity_modify_btn").on("click", function(){
	let cartNum = $(this).data("cartnum");
	let cartCount = $(this).parent("td").find("input").val();
	
	$(".update_cartNum").val(cartNum);
	$(".update_cartCount").val(cartCount);
	$(".quantity_update_form").submit();
	
});

/* 장바구니 삭제 버튼 */
$(".delete_btn").on("click", function(e){
	e.preventDefault();
	const cartNum = $(this).data("cartnum");
	
	console.log(cartNum);
	
	$(".delete_cartNum").val(cartNum);
	
	$(".quantity_delete_form").submit();
});

/*주문 페이지 이동*/
$(".order_btn").on("click", function(){
	let form_contents ='';
	let orderNumber = 0;
	$(".cart_info_td").each(function(index, element){
		let prodNum = $(element).find(".individual_prodNum_input").val();
		let cartCount = $(element).find(".individual_cartCount_input").val();
		
		let prodNum_input = "<input name='orders[" + orderNumber + "].prodNum' type='hidden' value='" + prodNum + "'>";
		form_contents += prodNum_input;
		
		let cartCount_input = "<input name='orders[" + orderNumber + "].cartCount' type='hidden' value='" + cartCount + "'>";
		form_contents += cartCount_input;
		
		orderNumber += 1;
	});
	
	$(".order_form").html(form_contents);
	$(".order_form").submit();
});
 

		
</script>

</body>
</html>
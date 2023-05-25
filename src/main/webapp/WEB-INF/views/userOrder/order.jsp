<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<link rel="stylesheet" href="/resources/css/userOrder/order.css">
</head>
<body>
	
	<%@include file = "/WEB-INF/views/include/header.jsp" %>
	
			<div class="content_area">
			
				<div class="content_main column-container">		
				<form id="orderForm" method="post">
		
				<div class="column-left">
					<div class="content_subject"><h2>주문/결제</h2></div>
					<div class="accordion-box">
					<ul class="list">
						<!-- 주문자 정보 -->	
						<li>
							<p class="title t1">주문자 정보</p>
							<div class="member_info_div con1">
								<div>
									<span>이름</span>
									<div><input type="text" class="name_input" name="name" value="${memberInfo.name }"></div>
								</div>
								<div>
									<span>이메일</span>
									<div><input type="text" class="email_input" name="email" value="${memberInfo.email }"></div>
								</div>
								<div>
									<span>연락처</span>
									<div><input type="text" class="tel_input" name="tel" value="${memberInfo.tel }"></div>
								</div>
								<div>
									<a class="con1_btn">저장하고 다음 단계로</a>
								</div>
								<input type="hidden" name="id" value="${memberInfo.id }">
							</div>
						</li>
					
						<!-- 배송 정보 -->
						<li>
							<p class="title t2">배송 정보</p>
							<div class="delivery_div con2">						
								<div>
									<span>수령인</span>
									<br><a class="my_info" onclick="userInfo()">주문자 정보와 동일</a>
									<div><input class="orderRecv_input" type="text" name="orderRecv"></div>
								</div>
								<div>
									<!-- 수령인 연락처 DB 추가 -->
									<span>연락처</span>
									<div><input type="text" class="recvTel_input" name="recvTel"></div>
								</div>
								<div>
									<span>배송주소</span>
									<div>
										<input type="text" class="post_input" name="orderPost" readonly="readonly">
										<!-- 주소찾기 버튼 -->
										<div class="addr_button" onclick="execution_daum_address()"><span>주소찾기</span></div>
										<div class="clearfix"></div>
									</div>
									<div><input type="text" class="addr1_input" name="orderAddr1" readonly="readonly"></div>
									<div><input type="text" class="addr2_input" name="orderAddr2" readonly="readonly"></div>
								</div>
								<div>
									<span>기사님께 전하는 메시지</span>
									<div><input type="text" name="orderMsg"></div>
								</div>
								<div>
									<a class="con2_btn">저장하고 다음 단계로</a>
								</div>
							</div>
						</li>
						
						<!-- 할인/혜택 사용 -->
						<li>
							<p class="title t3">할인/혜택 사용</p>
							<div class="point_div con3">				
								<div class="point">
									<span>보유 포인트</span>
									<div><input type="text" name="myPoint" disabled="disabled" value="${point }"></div>
								</div>
								<div>
									<span>포인트 사용</span>
									<div>
										<div><input class="order_point_out" type="text" name="orderPointOut" value="0"></div>
										<a class="order_point_input_btn order_point_input_btn_N" data-state="N">전액 사용</a>
										<a class="order_point_input_btn order_point_input_btn_Y" data-state="Y" style="display: none;">적용 취소</a>
									</div>
									<!-- 버튼 영역 -->
									<div><button class="order_btn">결제하기</button></div>
								</div>
							</div>		
						</li>
					</ul>
					</div> <!-- accodion-box -->
				</div><!-- column-left -->
				
				
				<div class="column-right">
				<div class="content_subject2"><h2>결제 내역</h2></div>
					<!-- 결제 내역 -->
					<div>
						<!-- 상품정보 -->
						<div class="selected-products">
							<ul class="product-list">
							<c:forEach var="ol" items="${orderList }">			
								<li class="prod_table_price_td">
									<div>${ol.prodName}</div>
									<div>${ol.prodCount}개</div>
									<div><fmt:formatNumber value="${ol.totalPrice}" pattern="#,### 원" /></div>
	
									<input type="hidden" class="individual_price_input" value="${ol.price}">
									<input type="hidden" class="individual_prodCount_input" value="${ol.prodCount}">
									<input type="hidden" class="individual_totalPrice_input" value="${ol.price * ol.prodCount}">
									<input type="hidden" class="individual_point_input" value="${ol.point}">
									<input type="hidden" class="individual_totalPoint_input" value="${ol.totalPoint}">
									<input type="hidden" class="individual_prodNum_input" value="${ol.prodNum}">
								</li>	
							</c:forEach>
							</ul>
						</div>

						<div class="total_info_div">
							<!-- 가격 종합 정보 -->
							<div class="total_info_price_div">
								<div>
								<!-- 주문 총 금액 -->
								<span>주문금액</span>
								<span class="totalPrice_span"></span>
								</div>
								<div>
								<!-- 배송비 -->
								<span>배송비</span>
								<span class="deliveryPrice_span"></span>
								</div>
								<div>
								<!-- 할인 금액 -->
								<span>할인금액</span>
								<span class="usePoint_span"></span>
								</div>
							</div>
							<div>
								<!-- 총 금액 -->
								<span>총 금액</span>
								<span class="finalTotalPrice_span"></span>
							</div>
							<div>
								<!-- 적립금액 -->
								<span>총 적립금액</span>
								<span class="totalPoint_span"></span>
							</div>
						</div>
					</div>
				</div><!-- column-right -->
					</form>
				</div>		
			</div>
			
		<%@include file = "/WEB-INF/views/include/footer.jsp" %>
	
	
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<!-- 스크립트 -->
	<script>
	
		/* 주문자 정보와 동일 버튼 클릭 시 */
		function userInfo(){
			$('.orderRecv_input').val("${memberInfo.name}");
			$('.recvTel_input').val('${memberInfo.tel}');
			$('.post_input').val('${memberInfo.post}');
			$('.addr1_input').val('${memberInfo.addr1}');
			$('.addr2_input').val('${memberInfo.addr2}');
		}
		
		/* 포인트 */
		// 0 이상 & 최대 포인트 수 이하
		$(".order_point_out").on("propertychange chagne keyup paste input", function(){
			const maxPoint = ${point};
			
			let inputVal = parseInt($(this).val());
			if(inputVal < 0){
				$(this).val(0);
			}else if(inputVal > maxPoint){
				$(this).val(maxPoint);
			}
			
			/* 주문 조합정보란 최신화 */
			setTotalInfo();
		});
		
		// 전액 사용 & 취소 버튼
		$(".order_point_input_btn").on("click", function(){
			const maxPoint = ${point};
			
			let state = $(this).data("state");
			if(state == 'N'){
				console.log("모두사용");
				$(".order_point_out").val(maxPoint);
				$(".order_point_input_btn_Y").css('display','inline-block');
				$(".order_point_input_btn_N").css('display','none');
			}else if(state == 'Y'){
				console.log("전체삭제");
				$(".order_point_out").val(0);
				$(".order_point_input_btn_Y").css('display','none');
				$(".order_point_input_btn_N").css('display','inline-block');
			}
			
			/* 주문 조합정보란 최신화 */
			setTotalInfo();
		});
		
		/* 총 주문 정보 세팅 */
		function setTotalInfo(){
			let totalPrice = 0;		// 총 가격
			let totalPoint = 0;		// 총 포인트
			let deliveryPoint = 0;	// 배송비
			let usePoint = 0;		// 사용 포인트
			let finalTotalPrice = 0;	// 최종 가격
			
			$(".prod_table_price_td").each(function(index, element){
				// 총 가격
				totalPrice += parseInt($(element).find(".individual_totalPrice_input").val());
				// 총 마일리지
				totalPoint += parseInt($(element).find(".individual_totalPoint_input").val());
			});
			
			// 배송비
			if(totalPrice >= 50000){
				deliveryPrice = 0;
			}else if(totalPrice == 0){
				deliveryPrice = 0;
			}else{
				deliveryPrice = 3000;
			}

			// 사용 포인트
			usePoint = $(".order_point_out").val();
			
			// 최종 가격
			finalTotalPrice = totalPrice + deliveryPrice - usePoint;
			
			/* 값 삽입 */
			// 총 가격
			$(".totalPrice_span").text(totalPrice.toLocaleString());
			// 총 마일리지
			$(".totalPoint_span").text(totalPoint.toLocaleString());
			// 배송비
			$(".deliveryPrice_span").text(deliveryPrice.toLocaleString());
			// 할인 금액
			$(".usePoint_span").text(usePoint.toLocaleString());
			// 최종 가격(총가격+배송비-포인트)
			$(".finalTotalPrice_span").text(finalTotalPrice.toLocaleString());

		}
		
		/* 유효성 검사 통과유무 변수 */
		var recvCheck = false;	// 수령인
		var reTelCheck = false;	// 수령인 연락처
		var addrCheck = false;	// 배송주소
		
		$(document).ready(function(){
			/* 주문 조합정보란 최신화 */
			setTotalInfo();
			
			/* 주문 요청 */
			$(".order_btn").on("click", function(){
				// 사용 포인트
				$("input[name='orderPointOut']").val($(".order_point_out").val());
				
				// 상품정보
				let form_contents ="";
				$(".prod_table_price_td").each(function(index,element){
					let prodNum = $(element).find(".individual_prodNum_input").val();
					let prodCount = $(element).find(".individual_prodCount_input").val();
					let prodNum_input = "<input name='orders[" + index + "].prodNum' type='hidden' value='" + prodNum + "'>";
					form_contents += prodNum_input;
					let prodCount_input = "<input name='orders[" + index + "].prodCount' type='hidden' value='" + prodCount + "'>";
					form_contents += prodCount_input;
					let prodPrice = $(element).find(".individual_price_input").val();
					let prodPrice_input = "<input name='orders[" + index + "].prodPrice' type='hidden' value='" + prodPrice + "'>";
					form_contents += prodPrice_input;
					
				});
				$("#orderForm").append(form_contents);
				
				/* 유효성 검사 */
				
				/* 입력값 변수 */
				var odRecv = $('.orderRecv_input').val();		// 수령인 입력란
				var odTel = $('.recvTel_input').val();			// 수령인 연락처 입력란
				var odAddr = $('.addr2_input').val();			// 수령주소 입력란
				
				/* 수령인 유효성 검사 */
				if(odRecv == ""){
					$('.orderRecv_input').css('border-color', 'red');
					recvCheck = false;
				}else{
					$('.orderRecv_input').css('border-color', 'black');
					recvCheck = true;
				}
				/* 수령 연락처 유효성 검사 */
				if(odTel == ""){
					$('.recvTel_input').css('border-color', 'red');
					reTelCheck = false;
				}else{
					$('.recvTel_input').css('border-color', 'black');
					reTelCheck = true;
				}
				/* 수령주소 유효성 검사 */
				if(odAddr == ""){
					$('.post_input').css('border-color', 'red');
					$('.addr1_input').css('border-color', 'red');
					$('.addr2_input').css('border-color', 'red');
					addrCheck = false;
				}else{
					$('.post_input').css('border-color', 'black');
					$('.addr1_input').css('border-color', 'black');
					$('.addr2_input').css('border-color', 'black');
					addrCheck = true;
				}
				/* 최종 유효성 검사 */
				if(recvCheck && reTelCheck && addrCheck){
					alert("회원가입");
					$("#orderForm").attr("action","/userOrder/order");
					$("#orderForm").submit();
				}
				return false;
			});
		});
		
		/* 다음 주소 연동 */
		function execution_daum_address(){
			new daum.Postcode({
		        oncomplete: function(data) {
		        	 // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수

	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }

	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 주소변수 문자열과 참고항목 문자열 합치기
	                    addr += extraAddr;
	                
	                } else {
	                   addr += ' ';
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                $(".post_input").val(data.zonecode);
	                $(".addr1_input").val(addr);
	                // 커서를 상세주소 필드로 이동한다.
	                $(".addr2_input").attr("readonly", false);
	                $(".addr2_input").focus();
	                $(".addr2_input").val("");
		        }
		    }).open();
		}
		
		// 아코디언 효과
		$("p.t1").on('click',function(){
			  $(".con1").slideDown(100);
			  $(".con2").slideUp(100);
			  $(".con3").slideUp(100);
			});
		$(".con1_btn").on('click', function(){
			// 아이디 이메일 번호 유효성검사
			$(".con1").slideUp(100);
			$(".con2").slideDown(100);
		});
		$(".con2_btn").on('click', function(){
			// 수령인 주소 유효성검사
			$(".con2").slideUp(100);
			$(".con3").slideDown(100);
		});
	</script>
	
</body>
</html>
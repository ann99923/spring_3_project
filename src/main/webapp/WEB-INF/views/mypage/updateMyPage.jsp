<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/mypage/updateMyPage.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>


</head>
<body>
	<h1>회원정보수정</h1>
	<form action="/mypage/updateMyPage" method="post"
		id="updateMyPage_form">

		<div class="id_wrap">
			<div class="id_name">아이디 : ${member.id}</div>
			<input type="hidden" class="id" name="id" value="${member.id}">
		</div>
		<div class="name_wrap">
			<div class="name_name">이름 : ${member.name}</div>
		</div>
		<div class="tel_wrap">
			<div class="tel_name">
				연락처 : <input class="tel_input" name="tel" value="${member.tel}">
			</div>
			<span class="final_tel_check">연락처를 입력해주세요.</span>
		</div>
		<div class="email_wrap">
			<div class="email_name">
				이메일 : <input class="email_input" name="email"
					value="${member.email}">
			</div>
			<span class="final_email_check">이메일을 입력해주세요.</span>
		</div>

		<div class="change_pw_wrap">
			<div class="change_pw_name">
				비밀번호 변경
				<div class="current_pw_input_box">
					현재 비밀번호 : <input class="current_pw_input" name="current_pw">
				</div>
				<span class="current_pwck_input_re_1">현재 비밀번호가 일치합니다.</span> <span
					class="current_pwck_input_re_2">현재 비밀번호가 일치하지 않습니다.</span>

				<div class="new_pw_input_box">
					새로운 비밀번호 : <input class="new_pw_input" name="pw">
				</div>
				<!-- 
				<span class="new_pw_input_re_1">새로운 비밀번호가 일치합니다.</span> <span
					class="new_pw_input_re_2">새로운 비밀번호가 일치하지 않습니다.</span>
					 -->
				<div class="new_pwck_input_box">
					새로운 비밀번호 확인: <input class="new_pwck_input">
				</div>
				<span class="new_pwck_input_re_1">새로운 비밀번호 확인이 일치합니다.</span> <span
					class="new_pwck_input_re_2">새로운 비밀번호가 확인이 일치하지 않습니다.</span>
					<span class="new_pwck_input_re_3">새로운 비밀번호 확인이 일치합니다.</span>


				<div class="pw_change_btn_wrap">
					<input type="button" class="pw_change_btn" value="비밀번호 변경">
				</div>
			</div>
		</div>

		<div class="birth_wrap">
			<div class="birth_name">
				생년월일 : <input name="birth" autocomplete="off" readonly="readonly"
					value=<fmt:formatDate pattern="yyyy/MM/dd" value="${member.birth}"/>>
			</div>
		</div>

		<div class="address_wrap">
			<div class="address_name">주소</div>
			<div class="post_input_wrap">
				<div class="post_input_box">
					<input class="post_input" name="post" value="${member.post}"
						readonly="readonly">
				</div>
				<div class="address_btn" onclick="execution_daum_address()">
					<span>주소 찾기</span>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="addr1_input_wrap">
				<div class="addr1_input_box">
					<input class="addr1_input" name="addr1" value="${member.addr1}"
						readonly="readonly">
				</div>
			</div>
			<div class="addr2_input_wrap">
				<div class="addr2_input_box">
					<input class="addr2_input" name="addr2" value="${member.addr2}"
						readonly="readonly">
				</div>
				<span class="final_addr_check">상세주소를 입력해주세요.</span>
			</div>
		</div>

		<div class="confirm_btn_wrap">
			<input type="button" class="confirm_btn" value="확인">
		</div>
		<div class="cancel_btn_wrap">
			<input type="button" class="cancel_btn" value="취소">
		</div>
		<div class="secession_btn_wrap">
			<input type="button" class="secession_btn" value="회원 탈퇴">
		</div>
		<!-- 
	<input type="hidden" name = "id" value ="${member.id}">
	<input type="hidden" name = "name" value ="${member.name}">
	 -->
	</form>
	<script>
		let pwchk1 = false;
		let pwchk2 = false;
		let pwchk3 = false;

		$(".confirm_btn").click(function() {
			$("#updateMyPage_form").submit();
		});

		$(".secession_btn")
				.click(
						function() {
							window
									.open('../mypage/secessionConfirm', '',
											'width=500, height=700, scrollbars=yes, resizable=no');
							//$("#secession_form").attr("action","/mypage/secssionConfirm");
							//$("#secession_form").attr("method","get");
							//$("#secession_form").submit();
						});

		$(".cancel_btn").click(function() {
			location.href = "/mypage/loginConfirm";
		});

		function execution_daum_address() {

			new daum.Postcode(
					{
						oncomplete : function(data) {
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
							if (data.userSelectedType === 'R') {
								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								if (extraAddr !== '') {
									extraAddr = ' (' + extraAddr + ')';
								}
								// 조합된 참고항목을 해당 필드에 넣는다.
								//document.getElementById("sample6_extraAddress").value = extraAddr;
								addr += extraAddr; //+

							} else {
								//document.getElementById("sample6_extraAddress").value = '';
								addr += ' ';
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							//document.getElementById('sample6_postcode').value = data.zonecode;
							//document.getElementById("sample6_address").value = addr;							
							// 커서를 상세주소 필드로 이동한다.
							$(".post_input").val(data.zonecode);
							$(".addr1_input").val(addr);
							//document.getElementById("sample6_detailAddress").focus();
							$(".addr2_input").attr("readonly", false);
							$(".addr2_input").focus();
						}
					}).open();
		}

		const config = {
			dateFormat : 'yy/mm/dd',
			showOn : "button",
			buttonText : "날짜 선택",
			prevText : '이전 달',
			nextText : '다음 달',
			monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
					'9월', '10월', '11월', '12월' ],
			monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
					'9월', '10월', '11월', '12월' ],
			dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
			dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
			dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
			yearSuffix : '년',

			changeMonth : true,
			changeYear : true
		}

		$(function() {
			$("input[name='birth']").datepicker(config);
		});

		//비번 중복검사
		$('.current_pw_input').on(
				"propertychange change keyup paste input",
				function() {
					var current_pw = $('.current_pw_input').val();
					var data = {
						pw : current_pw
					}
					$.ajax({
						type : "post",
						url : "/mypage/pwCheck",
						data : data,
						success : function(result) {
							if (result == 'ok') {
								$('.current_pwck_input_re_1').css("display",
										"inline-block");
								$('.current_pwck_input_re_2').css("display",
										"none");
								pwchk1 = true;
							} else {
								$('.current_pwck_input_re_2').css("display",
										"inline-block");
								$('.current_pwck_input_re_1').css("display",
										"none");
								pwchk1 = false;
							}
						},
						error : function(error) {
							console.log("error" + error);

						}
					});

				});

		///////////////////////////////////////////////////////////////
		/*
		$.ajax({
		type: "POST",
		url: "/mypage/checkPw",
		headers: {
			"Content-Type": "application/json",
		    "X-HTTP-Method-Override": "POST"
		},
		data: pw,
		datatype: "json",
		success: function(result) {			
			console.log(result);
						
			if(result === "pwConfirmOK") {
				$('#pwMsg').html('');
				chk1 = true;
			} else {
				$('#pwMsg').html('');
				chk1 = false;
			}
										
		},
		error : function(error) {
			console.log("error : " + error);
		}
		});
		 */
		/////////////////////////////////////////////
		/*
		$('.new_pw_input').on(
				"propertychange change keyup paste input",function() {
		 
		 //비밀번호 공백 확인
			if($(".new_pw_input").val() === ""){
				$('.new_pw_input_re_1').css("display","inline-block");
				$('.new_pw_input_re_1').html('비밀번호는 필수 정보입니다.');
				pwchk2 = false;
			} 
			else if( $(".new_pw_input").val() != $(".new_pwck_input").val()) {
				$('.new_pw_input_re_2').css("display","inline-block");
				$('.new_pw_input_re_1').css("display","none");
				pwchk2 = false;
			} 
			else {
				$('.new_pw_input_re_1').css("display","inline-block");
				$('.new_pw_input_re_2').css("display","none");
				pwchk2 = true;
		}
				console.log(pwchk2);
		}); //end of new password
					
					
		//비밀번호 확인
		$('.new_pwck_input').on(
				"propertychange change keyup paste input",function() {
			
			if($(".new_pwck_input").val() === "") {
				$('.new_pwck_input_re_1').css("display","inline-block");
				$('.new_pwck_input_re_1').html('비밀번호 확인은 필수 정보입니다.');
				pwchk3 = false;
			} else if( $(".new_pw_input").val() != $(".new_pwck_input").val()) {
				$('.new_pwck_input_re_2').css("display","inline-block");
				$('.new_pwck_input_re_1').css("display","none");
				pwchk3 = false;
			} else {
				$('.new_pwck_input_re_1').css("display","inline-block");
				$('.new_pwck_input_re_2').css("display","none");
				pwchk3 = true;
		}
			console.log(pwchk3);
		});
		 */

		/*
		$('.new_pw_input').keyup( function() {
		var new_pw = $('.new_pw_input').val();
		var new_pwck = $('.new_pwck_input').val();
		var data = {
			new_pw : new_pw,
			new_pwck : new_pwck
		}
		$.ajax({
			type : "post",
			url : "/mypage/new_pwCheck",
			data : data,
			success : function(result) {
				if (result == 'eq') {
					console.log("ss");							
					$('.new_pw_input_re_1').css("display","inline-block");
					$('.new_pw_input_re_2').css("display","none");
					pwchk2 = true;							
				} else if(result =='not_eq'){	
					console.log("rr");
					$('.new_pw_input_re_2').css("display","inline-block");
					$('.new_pw_input_re_1').css("display","none");
					pwchk2 = false;
				} else{
					$('.new_pw_input_re_1').css("display","inline-block");
					$('.new_pw_input_re_1').html('비밀번호 입력은 필수 정보입니다.');
					pwchk2 = false;
				}
			},
			error: function (error) {
				console.log("error"+error);
				
			}
		});			
		
		}); //end of new password
				
				
		//비밀번호 확인
		$('.new_pwck_input').keyup( function() {
		
		var new_pw = $('.new_pw_input').val();
		var new_pwck = $('.new_pwck_input').val();
		var data = {
			new_pw : new_pw,
			new_pwck : new_pwck
		}
		$.ajax({
			type : "post",
			url : "/mypage/new_pwCheck",
			data : data,
			success : function(result) {
				if (result == 'eq') {
					console.log("ss");							
					$('.new_pwck_input_re_1').css("display","inline-block");
					$('.new_pwck_input_re_2').css("display","none");
					pwchk3 = true;					
				} else if(result =='not_eq'){	
					console.log("rr");
					$('.new_pwck_input_re_2').css("display","inline-block");
					$('.new_pwck_input_re_1').css("display","none");
					pwchk3 = false;
				}else{
					$('.new_pwck_input_re_1').css("display","inline-block");
					$('.new_pwck_input_re_1').html('비밀번호 확인은 필수 정보입니다.');
					pwchk3 = false;
				}
			},
			error: function (error) {
				console.log("error"+error);
				
			}
		});			
		
		});
		 */

		$('.new_pw_input').on("propertychange change keyup paste", function() {
			
				//비밀번호 공백 확인
				if ($(".new_pw_input").val() === "") {
					$('.new_pwck_input_re_3').css("display", "inline-block");
					$('.new_pwck_input_re_3').html('비밀번호는 필수 정보입니다.');
					$('.new_pwck_input_re_1').css("display", "none");
					$('.new_pwck_input_re_2').css("display", "none");
					pwchk2 = false;
				}else if( $(".new_pw_input").val() != $(".new_pwck_input").val()){
					$('.new_pwck_input_re_2').css("display", "inline-block");
					$('.new_pwck_input_re_1').css("display", "none");
					$('.new_pwck_input_re_3').css("display", "none");
					pwchk2 = false;
					pwchk3 = false;
				}else if( $(".new_pw_input").val() == $(".new_pwck_input").val()) {					
					$('.new_pwck_input_re_1').css("display", "inline-block");
					$('.new_pwck_input_re_2').css("display", "none");
					$('.new_pwck_input_re_3').css("display", "none");
					pwchk2 = true;
					pwchk3 = true;
				}
			
			console.log(pwchk2);
		}); //end of new password

		
		$('.new_pwck_input').on("propertychange change keyup paste", function() {
		
				//비밀번호 공백 확인
				if ($(".new_pwck_input").val() === "") {	
					$('.new_pwck_input_re_3').html('비밀번호 새창은 필수 정보입니다.');
					$('.new_pwck_input_re_3').css("display", "inline-block");
					$('.new_pwck_input_re_1').css("display", "none");
					$('.new_pwck_input_re_2').css("display", "none");
					pwchk3 = false;
				}else if( $(".new_pwck_input").val() != $(".new_pw_input").val()){
					$('.new_pwck_input_re_2').css("display", "inline-block");
					$('.new_pwck_input_re_1').css("display", "none");	
					$('.new_pwck_input_re_3').css("display", "none");
					pwchk2 = false;
					pwchk3 = false;
				}else if( $(".new_pwck_input").val() == $(".new_pw_input").val()) {
					$('.new_pwck_input_re_1').css("display", "inline-block");
					$('.new_pwck_input_re_2').css("display", "none");
					$('.new_pwck_input_re_3').css("display", "none");
					pwchk2 = true;
					pwchk3 = true;
				}
			
			console.log(pwchk2);
		}); //end of new password
		
		/*
		//비밀번호 확인
		$('.new_pwck_input').on("propertychange change keyup paste",function() {
				if ($(".new_pw_input").val() !== "") {
					if ($(".new_pwck_input").val() === "") {
						$('.new_pwck_input_re_1').css("display", "inline-block");
						$('.new_pwck_input_re_1').html('비밀번호 확인은 필수 정보입니다.');
						pwchk3 = false;
					} else if ($(".new_pw_input").val() != $(".new_pwck_input").val()) {
						$('.new_pwck_input_re_2').css("display", "inline-block");
						$('.new_pwck_input_re_1').css("display", "none");
						$('.new_pw_input_re_2').css("display", "inline-block");
						$('.new_pw_input_re_1').css("display", "none");
						pwchk3 = false;
					} else if( $(".new_pw_input").val() == $(".new_pwck_input").val()) {
						$('.new_pwck_input_re_1').css("display", "inline-block");
						$('.new_pwck_input_re_2').css("display", "none");
						$('.new_pw_input_re_1').css("display", "inline-block");
						$('.new_pw_input_re_2').css("display", "none");
						pwchk3 = true;
					}
				}
					console.log(pwchk3);
				});
		*/

		$(".pw_change_btn").click(function() {
			
			if (pwchk1 == false) {
				alert('현재 비밀번호가 틀렸습니다.');

			} else if (pwchk2 == false) {
				alert('2번 틀림');
			} else if (pwchk3 == false) {
				alert('3번 틀림');

			} else if (pwchk1 && pwchk2 && pwchk3 ) {

				const id = $(".id").val();
				const pw = $(".new_pwck_input").val();
				const data = {
					id : id,
					pw : pw

				};
				
				$.ajax({
					type : "POST",
					url : "/mypage/pwChange",
					async : true,
					data : data,
					success : function(result) {

						console.log("result: " + result);
						if (result === "changeSuccess") {
							alert('비밀번호가 변경되었습니다.');
							location.href = "/mypage/loginConfirm";
						} else {
							alert('현재 비밀번호가 틀렸습니다.');
						}
					},
					error : function(error) {
						console.log("error" + error);
					}
				});
			}
		});
	</script>

</body>
</html>
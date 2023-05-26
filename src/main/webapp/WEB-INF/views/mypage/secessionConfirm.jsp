<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
</head>
<body>
	<div align="center">
		<h1>비밀번호 확인</h1>
		<form action="/mypage/secessionConfirm" method="post"
			id="secession_form">
			<input type="hidden" name="id" value="${member.id}">
			<table style="width: 80%">
				<tr>
					<th>${member.id}의${member.name}님탈퇴하시겠습니까</th>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input name="pw" size="20" value="1234"></td>
				</tr>
				<tr>
					<th>확인문자</th>
				</tr>

			</table>


			<div class="form-group">
				<label for="captcha" style="display: block;">자동 로그인 방지</label>
				<div class="captcha">
					<div class="form-group">
						<img id="captchaImg" title="캡차 이미지" src="captchaImg.do"
							alt="캡차 이미지" />
						<div id="captchaAudio" style="display: none;"></div>
					</div>
					<div class="form-group">
						<a onclick="javascript:refreshBtn()" class="refreshBtn"> <input
							type="button" value="새로고침" />
						</a> <a onclick="javascript:audio()" class="refreshBtn"> <input
							type="button" value="음성듣기" />
						</a>
					</div>
					<div class="form-group">
						<input type="text" name="answer" id="answer" class="form-control" />
					</div>
				</div>
			</div>



			<br>
			<div class="secession_btn_wrap">
				<input type="button" class="secession_btn" value="탈퇴">
				<!-- <input type="submit" value="탈탈"> -->
			</div>

		</form>
	</div>
	<script>
		/*
		$(".secession_btn").click(function() {	
			
			opener.location.href = '/member/login';
			//parent.opener.location = '/member/login';	
			$.ajax({
				type : "post",
				url : "/mypage/secessionConfirm",
				data:"id",
				success : function(result) {
					
					window.close();
				}
			});

		});
		 */
		/*
		$(function() {
		$(".secession_btn").click(function() {
			$("#secession_form").submit();
			opener.location.href = '/member/login';
			//parent.opener.location = '/member/login';	

			setTimeout(function() {
				alert("이용해주셔서 감사합니다.");
				window.close();

			}, 100);
		});
		});
		 */
		$(document).ready(function() {
			let result = '<c:out value="${result}"/>';
			checkAlert(result);
			function checkAlert(result) {
				if (result === ' ') { //객체와 주소값까지 비교
					return; //return false = X -> true/false 개념이 아님
				}
				if (result === '자동 방지 문자 틀림') {
					alert("자동 방지 문자가 틀렸습니다.");
				}
				if (result === '비밀 번호 틀림') {
					alert("비밀 번호가 틀렸습니다.");
				}
			}
		});

		$(".secession_btn").click(function() {

			$("#secession_form").submit();
			//opener.location.href = '/member/login';
			//window.open("about:blank","_self").close();			
		});

		function audio() {
			var rand = Math.random();
			var url = 'captchaAudio.do';
			$.ajax({
				url : url,
				type : 'POST',
				dataType : 'text',
				data : 'rand=' + rand,
				async : false,
				success : function(resp) {
					var uAgent = navigator.userAgent;
					var soundUrl = 'captchaAudio.do?rand=' + rand;

					if (uAgent.indexOf('Trident') > -1
							|| uAgent.indexOf('MSIE') > -1) {
						winPlayer(soundUrl);
					} else if (!!document.createElement('audio').canPlayType) {
						try {
							new Audio(soundUrl).play();
						} catch (e) {
							winPlayer(soundUrl);
						}
					} else {
						window.open(soundUrl, '', 'width=1, height=1');
					}
				}

			});

		}

		function refreshBtn(type) {
			var rand = Math.random();
			var url = "captchaImg.do?rand=" + rand;
			$('#captchaImg').attr("src", url);
		}
		function winPlayer(objUrl) {
			$('#captchaAudio').html('<vgsound src="' + objUrl + '">');
		}
	</script>
</body>
</html>
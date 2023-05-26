<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/cosmeticsCate.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
</head>
<body>
	<div class="wrapper">
		<div class="wrap">
			<!-- 윗부분 바 -->
			<div class="top_gnb_area">
				<a class="logo" href="/main"> <img class="logo"
					src="/resources/img/logo.png">
				</a>
				<ul class="top_left">
					<li>
						<div class="search_wrap">
							<form id="searchForm" action="/cosmeticsCate" method="get">
								<div class="search_input">
									<select name="type">
										<option value="T">상품명</option>
									</select> <input type="text" name="keyword"
										value="<c:out value="${pageMaker.ccri.keyword}"/>">
									<button class='btn search_btn'>검 색</button>
								</div>
							</form>
						</div>
					</li>
					<li><a href="../shop/productMain">제품보기</a></li>
				</ul>

				<ul class="top_right">
					<!-- 로그인 x -->
					<c:if test="${member == null}">
						<li><a href="/login/login">로그인</a></li>
						<li><a href="/join/joinPage">회원가입</a></li>

					</c:if>

					<!-- 로그인 o -->
					<c:if test="${member != null}">
						<div class="login_success_area">
							<c:if test="${member.adminCk == 1 }">
								<!-- 관리자 계정 -->
								<li><a href="/adminProd/main">관리자 페이지</a></li>
								<li>관리자 님</li>
								<li><a href="/login/logout.do">로그아웃</a></li>
							</c:if>

							<c:if test="${member.adminCk == 0 }">
								<li>${member.name}님</li>
								<li><a href="/userOrder/myOrder">마이룸</a></li>
								<li><a href="/cart/${member.id}">장바구니</a></li>
								<li>고객센터</li>
								<li><a href="/login/logout.do">로그아웃</a></li>
							</c:if>
						</div>
					</c:if>
				</ul>
			</div>

			<!-- top_subject_area -->
			<div class="admin_top_wrap">
				<div class="top_navi_wrap">
					<div class="dropdown">
						<button class="dropbtn">
							<img class="cate1" src="../resources/img/top1.jpg"><i
								class="fa fa-caret-down"></i>
						</button>
						<div class="dropdown-content">
							<a href="/cosmeticsCate?type=C&cateCode=101000">스킨케어</a> <a
								href="/cosmeticsCate?type=C&cateCode=102000">썬&바디</a>
						</div>
					</div>
					<div class="dropdown">
						<button class="dropbtn">
							메이크업 <i class="fa fa-caret-down"></i>
						</button>
						<div class="dropdown-content">
							<a href="/cosmeticsCate?type=C&cateCode=201000">베이스</a> <a
								href="/cosmeticsCate?type=C&cateCode=202000">립</a> <a
								href="/cosmeticsCate?type=C&cateCode=203000">아이</a>
						</div>
					</div>
					<div class="dropdown">
						<button class="dropbtn">
							향수 <i class="fa fa-caret-down"></i>
						</button>
						<div class="dropdown-content">
							<a href="/cosmeticsCate?type=C&cateCode=401000">남성향수</a> <a
								href="/cosmeticsCate?type=C&cateCode=402000">여성향수</a>
						</div>
					</div>
					<div class="dropdown">
						<button class="dropbtn">
							메이크업 소품 <i class="fa fa-caret-down"></i>
						</button>
						<div class="dropdown-content">
							<a href="/cosmeticsCate?type=C&cateCode=501000">베이스</a> <a
								href="/cosmeticsCate?type=C&cateCode=502000">립&아이</a>
						</div>
					</div>
				</div>
			</div>
			<div class="dropdown_wrap"></div>

			<!-- contents area -->
			<div class="admin_wrap">
				<!-- 네비영역 -->
				<div class="clearfix"></div>
				<div class="content_area">
					<!-- 게시물 o -->
					<c:if test="${listcheck != 'empty'}">
						<div class="list_search_result">
							<table class="type_list">
								<colgroup>
									<col width="110">
									<col width="*">
									<col width="120">
								</colgroup>
								<tbody id="searchList>">
									<c:forEach items="${list}" var="list">
										<tr>
											<td class="image"></td>
											<td class="detail">
												<div class="category">[${list.cateName}]</div>
												<div class="title">
													<a href="#">${list.prodName}</a>
												</div>
											</td>
											<td class="price">
												<div class="org_price">${list.price}</div>
											</td>
											<td class="option"></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<!-- 페이지 이동 인터페이스 -->
						<div class="pageMaker_wrap">
							<ul class="pageMaker">

								<!-- 이전 버튼 -->
								<c:if test="${pageMaker.prev }">
									<li class="pageMaker_btn prev"><a
										href="${pageMaker.pageStart -1}">이전</a></li>
								</c:if>

								<!-- 페이지 번호 -->
								<c:forEach begin="${pageMaker.pageStart }"
									end="${pageMaker.pageEnd }" var="num">
									<li
										class="pageMaker_btn ${pageMaker.ccri.pageNum == num ? 'active':''}">
										<a href="${num}">${num}</a>
									</li>
								</c:forEach>

								<!-- 다음 버튼 -->
								<c:if test="${pageMaker.next}">
									<li class="pageMaker_btn next"><a
										href="${pageMaker.pageEnd + 1 }">다음</a></li>
								</c:if>
							</ul>
						</div>

						<form id="moveForm" action="/cosmeticsCate" method="get">
							<input type="hidden" name="pageNum"
								value="${pageMaker.ccri.pageNum}"> <input type="hidden"
								name="amount" value="${pageMaker.ccri.amount}"> <input
								type="hidden" name="keyword" value="${pageMaker.ccri.keyword}">
							<input type="hidden" name="type" value="${pageMaker.ccri.type}">
						</form>

					</c:if>
					<!-- 게시물 x -->
					<c:if test="${listcheck == 'empty'}">
						<div class="table_empty">검색결과가 없습니다.</div>
					</c:if>
				</div>
				<div class="clearfix"></div>
			</div>
			<!-- footer 영역 -->
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
			</div>

			<div class="footer">
				<div class="footer_container">
					<div class="footer_left">
						<img src="../resources/img/hibook.png">
					</div>
					<div class="footer_right">
						(주)HiBook 대표이사:박하영<br> 사업자 등록 번호:000-00-0000<br> 대표 전화
						번호:02-000-0000<br> <br> COPYRIGHT(C) <strong>하용.com</strong>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>

		</div>


		<script>
			/* 페이지 이동 버튼 */
			const moveForm = $('#moveForm');

			$(".pageMaker_btn a").on(
					"click",
					function(e) {

						e.preventDefault();

						moveForm.find("input[name='pageNum']").val(
								$(this).attr("href"));

						moveForm.submit();

					});

			// 검색 타입 선택 selected
			$(document)
					.ready(
							function() {

								const selectedType = '<c:out value="${pageMaker.ccri.type}"/>';
								if (selectedType != "") {
									$("select[name='type']").val(selectedType)
											.attr("selected", "selected");
								}

							});
		</script>
</body>
</html>

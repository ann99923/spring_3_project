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
	<%@include file="includes/header.jsp"%>
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
										<div class="title"><a href="#">${list.prodName}</a></div>
									</td>
									<td class="price">
										<div class="org_price">
											${list.price}
										</div>
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
								class="pageMaker_btn ${pageMaker.cri.pageNum == num ? 'active':''}">
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
						value="${pageMaker.cri.pageNum}"> <input type="hidden"
						name="amount" value="${pageMaker.cri.amount}"> <input
						type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
					<input type="hidden" name="type" value="${pageMaker.cri.type}">
				</form>

			</c:if>
			<!-- 게시물 x -->
			<c:if test="${listcheck == 'empty'}">
				<div class="table_empty">검색결과가 없습니다.</div>
			</c:if>
		</div>
		<%@include file="includes/footer.jsp"%>
	</div>
	

	<script>
		/* 페이지 이동 버튼 */
		const moveForm = $('#moveForm');

		$(".pageMaker_btn a").on("click", function(e) {

			e.preventDefault();

			moveForm.find("input[name='pageNum']").val($(this).attr("href"));

			moveForm.submit();

		});
		
		// 검색 타입 선택 selected
		$(document).ready(function(){
			
			const selectedType = '<c:out value="${pageMaker.cri.type}"/>';
			if(selectedType != ""){
				$("select[name='type']").val(selectedType).attr("selected", "selected");	
			}
			
		});
	</script>

</body>
</html>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/user/userList.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
</head>
<body>
	<h1>���� Ȯ�� ������</h1>
	<div class="table_wrap">
		<table>
			<thead>
				<tr>
					<th class=id_width>���̵�</th>
					<th class=name_width>�̸�</th>
					<th class=tel_width>��ȭ��ȣ</th>
					<th class=addr1_width>�ּ�</th>
					<th class=addr2_width>�� �ּ�</th>
					<th class=email_width>�̸���</th>
					<th class=adminCk_width>����</th>
				</tr>
			</thead>
			<c:forEach items="${list}" var="list">
				<tr>
					<td><c:out value="${list.id }" /></td>
					<td><c:out value="${list.name }" /></td>
					<td><fmt:formatNumber var="licsNo" pattern="+82)###,####,####"
							value="${list.tel }" /> <c:out
							value="${fn:replace(licsNo, ',', '-')}" /></td>
					<td><c:out value="${list.addr1 }" /></td>
					<td><c:out value="${list.addr2 }" /></td>
					<td><c:out value="${list.email }" /></td>
					<td><c:out value="${list.adminCk }" /></td>
				</tr>
			</c:forEach>

		</table>

		<div class="pageInfo_wrap">
			<div class="pageInfo_area">

				<ul id="pageInfo" class="pageInfo">
					<!-- ���� ������ ��ư -->
					<c:if test="${pageMaker.prev }">
						<li class="pageInfo_btn previous"><a
							href="${pageMaker.startPage - 1 }">&lt;</a></li>
					</c:if>

					<!-- �� ��ȣ ������ ��ư -->
					<c:forEach var="num" begin="${pageMaker.startPage }"
						end="${pageMaker.endPage }">
						<li class="pageInfo_btn ${pageMaker.cri.pageNum == num ? "active":"" }"><a
							href="${num }">${num }</a></li>
					</c:forEach>

					<!-- ���� ������ ��ư -->
					<c:if test="${pageMaker.next }">
						<li class="pageInfo_btn next"><a
							href="${pageMaker.endPage + 1 }">&gt;</a></li>
					</c:if>
				</ul>
			</div>
		</div>

		<form id="moveForm" method="get">
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
		</form>
	</div>

	<script>
		let moveForm = $("#moveForm");
		$(".move").on(
				"click",
				function(e) {
					e.preventDefault();
					moveForm.submit();

				});

		$(".pageInfo a").on("click", function(e) {

			e.preventDefault();
			moveForm.find("input[name='pageNum']").val($(this).attr("href"));
			moveForm.attr("action", "/user/userList");
			moveForm.submit();
		});
	</script>

</body>
</html>
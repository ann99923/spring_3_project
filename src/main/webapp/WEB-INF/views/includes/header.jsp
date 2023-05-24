<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="wrapper">
	<div class="wrap">
		<!-- gnb_area -->
		<div class="top_gnb_area">
			<ul class="list">
				<li>
					<div class="search_wrap">
						<form id="searchForm" action="/cosmeticsCate" method="get">
							<div class="search_input">
								<select name="type">
									<option value="T">상품명</option>
								</select> <input type="text" name="keyword"
									value="<c:out value="${pageMaker.cri.keyword}"/>">
								<button class='btn search_btn'>검 색</button>
							</div>
						</form>
					</div>
				</li>
				<li><a href="/main">메인 페이지</a></li>
				<li><a href="/member/logout.do">로그아웃</a></li>
				<li><a href="/admin/prodEnroll">상품 등록</a></li>
			</ul>
		</div>

		<!-- top_subject_area -->
		<div class="admin_top_wrap">
			<div class="top_navi_wrap">
				<div class="dropdown">
					<button class="dropbtn">
						기초 화장품 <i class="fa fa-caret-down"></i>
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
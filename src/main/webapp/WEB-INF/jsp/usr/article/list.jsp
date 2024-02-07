<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="#{board.code } ARTICLE LIST"></c:set>
<%@ include file="../common/head.jspf"%>


<section class="mt-8 text-xl px-4">
	<div class="mx-auto overflow-x-auto">
		<div class="badge badge-outline">${articlesCount }개</div>
		<table class="table-box-1 table" border="1">
			<colgroup>
				<col style="width: 10%" />
				<col style="width: 20%" />
				<col style="width: 60%" />
				<col style="width: 10%" />
			</colgroup>
			<thead>
				<tr>
					<th>번호</th>
					<th>날짜</th>
					<th>제목</th>
					<th>작성자</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach var="article" items="${articles }">
					<tr class="hover">
						<td>${article.id }</td>
						<td>${article.regDate.substring(0,10) }</td>
						<td><a href="detail?id=${article.id }">${article.title }</a></td>
						<td>${article.extra__writer }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<!-- 	동적 페이징 -->
	<div class="pagination flex justify-center mt-3">
		<c:set var="paginationLen" value="3" />
		<c:set var="startPage" value="${page -  paginationLen  >= 1 ? page - paginationLen : 1}" />
		<c:set var="endPage" value="${page +  paginationLen  <= pagesCount ? page + paginationLen : pagesCount}" />

		<c:if test="${startPage > 1 }">
			<a class="btn btn-sm" href="?page=1&boardId=${boardId }&searchKeywordTypeCode=${searchKeywordTypeCode}&searchKeyword=${searchKeyword}">1</a>
			<button class="btn btn-sm btn-disabled">...</button>
		</c:if>

		<c:forEach begin="${startPage }" end="${endPage }" var="i">
			<a class="btn btn-sm ${param.page == i ? 'btn-active' : '' }" href="?page=${i }&boardId=${boardId}&searchKeywordTypeCode=${searchKeywordTypeCode}&searchKeyword=${searchKeyword}">${i }</a>
		</c:forEach>

		<c:if test="${endPage < pagesCount }">
			<button class="btn btn-sm btn-disabled">...</button>
			<a class="btn btn-sm" href="?page=${pagesCount }&boardId=${boardId }&searchKeywordTypeCode=${searchKeywordTypeCode}&searchKeyword=${searchKeyword}">${pagesCount }</a>
		</c:if>

	</div>

	<!-- 	원래 페이징 -->
	<div class="pagination flex justify-center mt-3">
		<div class="btn-group">
			<c:forEach begin="1" end="${pagesCount }" var="i">
				<a class="btn btn-sm ${param.page == i ? 'btn-active' : '' }" href="?page=${i }&boardId=${param.boardId}&searchKeywordTypeCode=${searchKeywordTypeCode}&searchKeyword=${searchKeyword}">${i }</a>
			</c:forEach>
		</div>
	</div>
	<h1 class="title"></h1>
	<div class="search_wrap">
		<div class="search_area">
			<select name="type">
				<option value="" <c:out value="${pageMaker.cri.type == null?'selected':'' }"/>>--</option>
				<option value="T" <c:out value="${pageMaker.cri.type eq 'T'?'selected':'' }"/>>제목</option>
				<option value="C" <c:out value="${pageMaker.cri.type eq 'C'?'selected':'' }"/>>내용</option>
				<option value="W" <c:out value="${pageMaker.cri.type eq 'W'?'selected':'' }"/>>작성자</option>
				<option value="TC" <c:out value="${pageMaker.cri.type eq 'TC'?'selected':'' }"/>>제목 + 내용</option>
				<option value="TW" <c:out value="${pageMaker.cri.type eq 'TW'?'selected':'' }"/>>제목 + 작성자</option>
				<option value="TCW" <c:out value="${pageMaker.cri.type eq 'TCW'?'selected':'' }"/>>제목 + 내용 + 작성자</option>
			</select> <input type="text" name="keyword" value="${pageMaker.cri.keyword }">
			<button>Search</button>
		</div>
	</div>
	<form id="actionForm" action="/board/list" method="get">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }"> <input type="hidden" name="amount"
			value="${pageMaker.cri.amount }"
		> <input type="hidden" name="keyword" value="${pageMaker.cri.keyword }"> <input type="hidden" name="type"
			value="${pageMaker.cri.type }"
		>
	</form>

</section>

<script>
	$(".search_area button").on("click", function(e) {

		var type = $(".search_area select").val();
		var keyword = $(".search_area input[name='keyword']").val();

		var sKey = '<c:out value="${pageMaker.cri.keyword}"/>';
		// Criteria 필드 멤버의 검색어.

		console.log("이전 검색어: " + sKey);
		console.log("현재 검색어: " + keyword);

		if (!type) {
			alert("키워드를 입력하세요");
			return false;
		}

		if (!keyword) {
			alert("키워드를 입력하세요.");
			return false;
		}

		if (sKey != keyword) {
			actionForm.find("input[name='pageNum']").val(1);
			// 새로운 검색어라면 1페이지로 이동.
		}

		actionForm.find("input[name='type']").val(type);
		actionForm.find("input[name='keyword']").val(keyword);
		// 1페이지로 이동하는 구문
		/* actionForm.find("input[name='pageNum']").val(1); */
		actionForm.submit();
	});
</script>


<%@ include file="../common/foot.jspf"%>
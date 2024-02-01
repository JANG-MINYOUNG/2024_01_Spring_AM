<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="ARTICLE DETAIL"></c:set>
<%@ include file="../common/head.jspf"%>

<section class="mt-8 text-xl px-4">
	<div class="mx-auto">
		<table class="table-box-1" border="1">
			<thead>
				<tr>
					<th>번호</th>
					<th>날짜</th>
					<th>수정날짜</th>
					<th>제목</th>
					<th>내용</th>
					<th>작성자</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>${article.id }</td>
					<td>${article.regDate }</td>
					<td>${article.updateDate }</td>
					<td>${article.title }</td>
					<td>${article.body }</td>
					<td>${article.nickname }</td>
				</tr>
			</tbody>
		</table>
		<div class="btns">
			<button class="hover:underline" type="button" onclick="history.back();">뒤로가기</button>
			<a href="../article/modify?id=${article.id}">수정</a>
			<a href="../article/doDelete?id=${article.id}">삭제</a>
		</div>
	</div>
</section>
<%@ include file="../common/foot.jspf"%>
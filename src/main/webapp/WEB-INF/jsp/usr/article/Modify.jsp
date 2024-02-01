<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="ARTICLE Modify"></c:set>


<h3>${article.get("id")}번 게시물 수정
	</h3>
	<div>
		번호 :
		${article.get("id")}</div>
	<div>
		날짜 :
		${article.get("regDate")}</div>
	<form method="POST" action="doModify">
		<input type="hidden" value="${article.get("id")}" name="id" />
		<div>
			제목 : <input type="text" name="title"
				value="${article.get("title")}"/ >
		</div>
		<div>
			내용 :
			<textarea type="text" name="body">${article.get("body")}</textarea>
		</div>
		<button type="submit">수정</button>
	</form>


	<div>
		<a style="color: green" href="list">리스트로 돌아가기</a>
	</div>
	
<%@ include file="../common/foot.jspf"%>
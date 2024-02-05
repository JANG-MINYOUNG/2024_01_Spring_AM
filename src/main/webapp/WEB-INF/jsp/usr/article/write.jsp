<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="ARTICLE WRITE"></c:set>
<%@ include file="../common/head.jspf"%>



<form method="POST" action="doWrite">
	<table class="write-box table-box-1" border="1">
		<tbody>
			<tr>
				<th>제목</th>
				<td><input type="text" placeholder="제목을 입력해주세요" name="title" /></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea type="text" placeholder="내용을 입력해주세요" name="body"></textarea></td>
			</tr>
			<tr>
				<th></th>
				<td><button type="submit">작성</button></td>
	</table>
</form>


<div>
	<a style="color: green" href="list">리스트로 돌아가기</a>
</div>


<%@ include file="../common/foot.jspf"%>
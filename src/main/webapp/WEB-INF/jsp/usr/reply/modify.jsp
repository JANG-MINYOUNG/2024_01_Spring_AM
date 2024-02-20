<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="Reply MODIFY"></c:set>
<%@ include file="../common/head.jspf"%>


<section class="mt-8 text-xl px-4">
	<div class="mx-auto">
		<form action="../reply/doModify" method="POST">
			<input type="hidden" name="id" value="${reply.id }" />
			<table class="modify-box table-box-1" border="1">
				<tbody>
					<tr>
						<th>번호</th>
						<td>${reply.id }</td>
					</tr>
					<tr>
						<th>작성날짜</th>
						<td>${reply.regDate }</td>
					</tr>
					<tr>
						<th>수정날짜</th>
						<td>${reply.updateDate }</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>${reply.extra__writer }</td>
					</tr>
					<tr>
						<th>내용</th>
						<td><input class="input input-bordered input-primary w-full max-w-xs" autocomplete="off" type="text"
							placeholder="내용을 입력해주세요" name="body" value="${reply.body }" /></td>
					</tr>
					<tr>
						<th></th>
						<td><input class="btn btn-info" type="submit" value="수정" /></td>
					</tr>
				</tbody>
			</table>
		</form>
		<div class="btns">
			<button class="btn btn-outline" type="button" onclick="history.back();">뒤로가기</button>
		</div>

	</div>
</section>



<%@ include file="../common/foot.jspf"%>
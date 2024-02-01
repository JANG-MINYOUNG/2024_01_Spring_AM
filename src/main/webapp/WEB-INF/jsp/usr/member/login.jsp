<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="Login"></c:set>
<%@ include file="../common/head.jspf"%>

<form method= "post" action="doLogin">
<div>
로그인 아이디 : <input autocomplete= "off" type="text" placeholder= "아이디를 입력해주세요."name="loginId" /></div>
<div>
로그인 비밀번호 : <input autocomplete= "off" type="text" placeholder= "비밀번호를 입력해주세요."name="loginPw" /></div>
	<button type="submit">로그인</button>
</form>


<%@ include file="../common/foot.jspf"%>
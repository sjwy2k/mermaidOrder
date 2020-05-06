<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구글 로그인</title>
<script src="https://apis.google.com/js/platform.js" async defer></script>
</head>
<body>
	<!-- 구글 로그인 화면으로 이동 시키는 URL -->
	<!-- 구글 로그인 화면에서 ID, PW를 올바르게 입력하면 oauth2callback 메소드 실행 요청-->
	<div id="google_id_login" style="text-align: center">
		<a href="${google_url}"><img width="230"
			src="${pageContext.request.contextPath}/resources/img/google.png" />
		</a>
	</div>
</body>
</html>
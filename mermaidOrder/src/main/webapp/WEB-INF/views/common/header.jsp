<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>머메이드오더</title>
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<!-- Popper JS -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

	<meta property="og:type" content="website">
	<meta property="og:title" content="머메이드오더">
	<meta name="description" content="쉽고 빠른 주문. 모든 매장용 사이렌오더">
	<meta property="og:description" content="쉽고 빠른 주문. 모든 매장용 사이렌오더">
	<meta property="og:image" content="${path}/resources/img/mermaid.png" alt="로고영역">
	<!-- favicon.ico -->
	<meta property="og:url" content="${path}/resources/">
	<link rel="apple-touch-icon" sizes="180x180" href="${path}/resources/img/mermaid.png">
	<link rel="icon" type="image/png" sizes="32x32" href="${path}/resources/img/mermaid.png">
	<link rel="icon" type="image/png" sizes="16x16" href="${path}/resources/img/mermaid.png">
	<meta name="msapplication-TileColor" content="#da532c">

	<link rel="stylesheet" href="${path}/resources/css/style.css">
</head>
<body>
<div class="container-fluid">
	<div id="nav" class="container-fluid navbar navbar-expand-sm fixed-top">
		<div class="row w-100">
			<div class="col-2">
				<img class="logo row d-flex" src="${path}/resources/img/mermaid.png" style="border-radius:50px;cursor:pointer;" onclick="location.href='${path}'">
			</div>
			<div class="col-10 collapse navbar-collapse">
				<ul class="row navbar-nav ml-auto">
					<li class="nav-item">
						<a href="#first" class="tab mr-5 nav-link first">시작하기</a>
					</li>
					<li class="nav-item">
						<a href="#second" class="tab mr-5 nav-link second">고객</a>
					</li>
					<li class="nav-item">
						<a href="#third" class="tab mr-5 nav-link third">사업자</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
</body>
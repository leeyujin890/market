<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css"/>
<title>상품 아이디 오류</title>
</head>
	<jsp:include page="menu.jsp"/>
	<div class="jumbotron">
		<div class="container">
		<h2 class="alert alert-danger">요청하신 페이지가 없습니다.</h2>
		</div>
	</div>
	<div class="container">
	<p><%=request.getRequestURI() %>?<%=request.getQueryString() %>
	<p><a href="product.jsp" class="btn btn-secondary"> 상품목록 &raquo;</a>
	</div>
</html>
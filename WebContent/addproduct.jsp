<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Product" %>
<jsp:useBean id="productDAO" class="dao.productRepository" scope="session" />
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css"/>
<script type="text/javascript" src="./resources/js/validation.js"></script>
<title>상품 등록</title>
</head>
<body>
	<fmt:setLocale value='<%=request.getParameter("language") %>'/>
	<fmt:bundle basename="resourceBundle.message">
	<jsp:include page="menu.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3"><fmt:message key="title"/></h1>
			</div>
			</div>
		<div class="container" >
		<div class="text-right">
		<a href="?language="ko">Korean</a>|<a href="?language=en" >English</a>
		<a href="logout.jsp" class="btn btn-sm btn-success pull-right">logout</a>
		</div>
		<form action="processaddproduct.jsp" name="newProduct" method="post" class="form-horizontal" enctype="multipart/form-data">
		<div class="form-group row">
		<label class="col-sm-2"><fmt:message key="productID"/> </label>
		<div class="col-sm-3">
		<input type="text" id="productID" name="productID" class="form-control" placeholder="p123"> 
		</div>
		</div>
		<div class="form-group row">
		<label class="col-sm-2"> <fmt:message key="pname"/> </label>
		<div class="col-sm-3">
		<input type="text" id="pname" name="pname" class="form-control" placeholder="iPhone6s"> 
		</div>
		</div>
		<div class="form-group row">
		<label class="col-sm-2"> <fmt:message key="unitPrice"/> </label>
		<div class="col-sm-3">
		<input type="text" id="unitPrice" name="unitPrice" class="form-control" placeholder="80000"> 
		</div>
		</div>
		<div class="form-group row">
		<label class="col-sm-2"> <fmt:message key="description"/> </label>
		<div class="col-sm-5">
		<textarea name="description" cols="50" rows="2" placeholder="4-7-inch, 1334X750 Renina HD display,8-megapixel iSight Camera"></textarea>
		</div>
		</div>
		<div class="form-group row">
		<label class="col-sm-2"> <fmt:message key="manufacturer"/> </label>
		<div class="col-sm-3">
		<input type="text" name="manufacturer" class="form-control" placeholder="Apple">
		</div>
		</div>
		<div class="form-group row">
		<label class="col-sm-2"> <fmt:message key="category"/> </label>
		<div class="col-sm-3">
		<input type="text" name="category" class="form-control" placeholder="Smart Phone">
		</div>
		</div>
		<div class="form-group row">
		<label class="col-sm-2"> <fmt:message key="unitsInStock"/> </label>
		<div class="col-sm-3">
		<input type="text" id="unitsInStock" name="unitsInStock" class="form-control" placeholder="1000">
		</div>
		</div>
		<div class="form-group row">
		<label class="col-sm-2"> <fmt:message key="condition"/> </label>
		<div class="col-sm-5">
		<input type="radio" name="condition" value="condition_new" checked> <fmt:message key="condition_new"/> 
		<input type="radio" name="condition" value="condition_old" > <fmt:message key="condition_old"/>
		<input type="radio" name="condition" value="condition_Refurbished" >  <fmt:message key="condition_Refurbished"/>
		</div>
		</div>
		<div class="form-group row">
		<label class="col-sm-2"> <fmt:message key="fileImage"/> </label>
		<div class="col-sm-5">
		<input type="file" name="fileImage" class="form-control"> 
		</div>
		</div>
		<p> <input type="button" class="btn btn-primary" value="<fmt:message key="button"/>" onClick="CheckAddProduct()">
		</form>
</fmt:bundle>
</body>
</html>
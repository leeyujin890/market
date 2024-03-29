<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Product" %>
<%@ page import="dao.productRepository" %>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css"/>
<title>상품 목록</title>
</head>
<body>
	<jsp:include page="menu.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3"> 상품 목록</h1>
			</div>
			</div>
			<%
				productRepository dao=productRepository.getInstance();
				ArrayList<Product> listOfProducts = dao.getAllProducts();
			%>
			<div class="container">
		<div class="row" align="center">
		<%
			for(int i=0;i<listOfProducts.size();++i){
			Product product=listOfProducts.get(i);
		%>
		<div class="col-md-3">
		<img src="c:/upload/<%=product.getFilename()%>" style="width: 100%">
		</div>
		<div class="col-sm-3">
		<h3><%=product.getPname()%></h3>
		<p><%= product.getDescription()%>
		<p><%=product.getUnitPrice()%> 원
		<p><a href="./products.jsp?id=<%=product.getProductID()%>" class="btn btn-secondary" role="button"> 상세정보 &raquo;</a>
		</div>
		<%
				}
			%>
		</div>
		<hr>
	</div>
		<jsp:include page="footer.jsp"/>
</body>
</html>
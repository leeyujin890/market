<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Product" %>
<%@ page import="dao.productRepository" %>
<%@ page errorPage="errorPage.jsp" %>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css"/>
<title>상품 상세 정보</title>
<script type="text/javascript">
	function addToCart(){
		if(confirm("상품을 장바구니에 추가하시겠습니까?")){
			document.addForm.submit();
		}else{
			document.addForm.reset();
		}
	}
</script>
</head>
<body>
	<jsp:include page="menu.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3"> 상품 정보</h1>
			</div>
			</div>
			<% String id=request.getParameter("id");
			productRepository dao=productRepository.getInstance();
			Product product=dao.getproductbyid(id);%>
			<div class="container">
			<div class="row">
			<div class="col-md-5">
			<img src="c:/upload/<%=product.getFilename()%>" style="width: 100%">
			</div>
		<div class="col-md-6">
		<h3><%=product.getPname()%></h3>
		<p><%= product.getDescription()%>
		<p><b>상품코드 : </b><span class=badge badge-dagner"><%=product.getProductID()%></span>
		<p><b>제조사 : </b><%=product.getManufacturer()%>
		<p><b>분류 : </b><%=product.getCategory()%>
		<p><b>제고수 : </b><%=product.getUnitsInStock()%>
		<h4><%=product.getUnitPrice() %>원</h4>
		<p><form name="addForm" action="./addCart.jsp?id=<%=product.getProductID() %>" method="post">
		<p><a href="#" class="btn btn-info" onClick="addToCart()">상품 주문 &raquo;</a>
		<p><a href="./cart.jsp" class="btn btn-warning">장바구니 &raquo;</a>
		<a href="./product.jsp" class="btn btn-secondary">상품 목록 &raquo;</a>
		</div>
		</div>
		</form>
		<hr>
		<jsp:include page="footer.jsp"/>
</body>
</html>
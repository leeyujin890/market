<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Product" %>
<%@ page import="dao.productRepository" %>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css"/>
<%
	String cartId=session.getId();
%>
<title> 장바구니 </title>
</head>
<body>
	<jsp:include page="menu.jsp"/>
		<div class="jumbotron">
			<div class="container">
				<h1 class="display-3"> 상품 정보</h1>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<table width="100%">
					<tr>
						<td align="left"><a href="./deleteCart.jsp?cartId=<%=cartId %>" class="btn btn-danger"> 삭제하기 </a></td>
						<td align=right"><a href="#" class="btn btn-success"> 주문하기 </a></td>
					</tr>
				</table>
			</div>
			<div style="padding-top: 50px">
				<table class="table table-hover">
					<tr>
						<th>상품</th>
						<th>가격</th>
						<th>수량</th>
						<th>소계</th>
						<th>비고</th>
					</tr>
					<%
						int sum=0;
					ArrayList<Product> cartList=(ArrayList<Product>) session.getAttribute("cartlist");
					if(cartList==null)
						cartList=new ArrayList<Product>();
					
					// 상품 리스트 하나씩 출력
					for(int i=0;i<cartList.size();++i){
						Product product=cartList.get(i);
						int total=product.getUnitPrice()*product.getQuantity();
						sum=sum+total;
					%>
					<tr>
						<td><%=product.getProductID() %>-<%=product.getPname() %></td>
						<td><%=product.getUnitPrice() %></td>
						<td><%=product.getQuantity() %></td>
						<td><%=total %></td>
						<td><a href="./removeCart.jsp?id=<%=product.getProductID() %>" class="btn btn-danger">삭제</a></td>
					</tr>
					<%
					}
					%>
					<tr>
						<th></th>
						<th></th>
						<th>총액</th>
						<th><%=sum %></th>
						<th></th>
				</table>
				<a href="./product.jsp" class="btn btn-secondary"> &laquo; 쇼핑 계속하기 </a>
		</div>
		<hr>
		</div>
		<jsp:include page="footer.jsp"/>
</body>
</html>
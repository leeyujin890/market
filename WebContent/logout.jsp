<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<title>login page</title>
</head>
<body>
	<%
	session.invalidate();
	response.sendRedirect("addproduct.jsp");
	%> 
</body>
</html>
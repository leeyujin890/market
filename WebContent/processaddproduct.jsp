<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="dto.Product" %>
<%@ page import="dao.productRepository" %>
<%@ page import="java.util.*"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
	<%
	request.setCharacterEncoding("utf-8");
	
	String filename="";
	String realFolder="C:\\upload";
	int maxSize=5*1024*1024;
	String encType="utf-8";
	
	MultipartRequest multi=new MultipartRequest(request,realFolder,maxSize,encType,new DefaultFileRenamePolicy());
	
	String productID=multi.getParameter("productID");
	String pname=multi.getParameter("pname");
	String unitPrice=multi.getParameter("unitPrice");
	String description=multi.getParameter("description");
	String manufacturer=multi.getParameter("manufacturer");
	String category=multi.getParameter("category");
	String unitsInStock=multi.getParameter("unitsInStock");
	String condition=multi.getParameter("condition");
	
	Integer price;
	
	if (unitPrice.isEmpty())
		price = 0;
	else
		price = Integer.valueOf(unitPrice);
	
	long stock;
	if(unitsInStock.isEmpty())
		stock=0;
	else 
		stock=Long.valueOf(unitsInStock);
	
	Enumeration files = multi.getFileNames();
	String fname=(String) files.nextElement();
	String fileName=multi.getFilesystemName(fname);
	
	productRepository dao = productRepository.getInstance();
	
	Product newProduct = new Product();
	newProduct.setProductID(productID);
	newProduct.setPname(pname);
	newProduct.setUnitPrice(price);
	newProduct.setDescription(description);
	newProduct.setManufacturer(manufacturer);
	newProduct.setCategory(category);
	newProduct.setUnitsInStock(stock);
	newProduct.setCondition(condition);
	newProduct.setFilename(fileName);
	
	dao.addProduct(newProduct);
	response.sendRedirect("product.jsp");
	%>

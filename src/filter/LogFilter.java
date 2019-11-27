package filter;

import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.io.FileWriter; // ���� ���� 
import java.io.PrintWriter; //�ڹٿ��� ������ �����͸� ����ϱ� ���� ��� 
import java.io.IOException;

public class LogFilter implements Filter{

	PrintWriter writer;
	
	// �Ű����� config : JSP�����̳ʰ� �ʱ�ȭ �� ���Ϳ� ������ �����ϴµ� ���
	public void init(FilterConfig filterConfig) throws ServletException{
		String filename=filterConfig.getInitParameter("filename");
		
		if(filename==null) 
			throw new ServletException("�α� ������ �̸��� ã�� �� �����ϴ�.");
			
			 try {
				 writer=new PrintWriter(new FileWriter(filename,true),true);
			 }catch(IOException e) {
				 throw new ServletException("�α� ������ �� �� �����ϴ�.");
			 }
	}
	
	public void doFilter(ServletRequest request,ServletResponse response,FilterChain chain) throws java.io.IOException,ServletException{
		writer.println("������ Ŭ���̾�Ʈ IP : " + request.getRemoteAddr());
		long start=System.currentTimeMillis();
		writer.println("������ url ��� : " + getURLPath(request));
		writer.println("��û ó�� �ð� : "+ getCurrentTime());
		chain.doFilter(request, response);
		
		long end=System.currentTimeMillis();
		writer.println("��û ���� �ð� : "+ getCurrentTime());
		writer.println("��û ó�� �ҿ� �ð� : "+ (end-start)+"ms");
		writer.println("======================================================================================================");
	}
	public void destroy() {
		writer.close();
	}
	private String getURLPath(ServletRequest request) {
		HttpServletRequest req; // �ѹ��� ��û���� ����� ���������� ������ �����ϰ��� �� �� ���ȴ�.
		String currentPath="";
		String queryString="";
		
		if(request instanceof HttpServletRequest) {//���� �������� ������ �� �����ڷ� boolean�� �� �ϳ��� ��ȯ�Ѵ�. true�� ����ٴ� ���� ���������� �˻��� Ÿ������ �� ��ȯ�� �����ϴٴ� ���� ���Ѵ�.
			req=(HttpServletRequest)request;
			currentPath=req.getRequestURI();
			queryString=req.getQueryString();
			queryString=queryString==null?"":"?"+queryString;
		}
		return currentPath+queryString;
	}
	private String getCurrentTime() {
		DateFormat formatter=new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Calendar calendar=Calendar.getInstance();
		calendar.setTimeInMillis(System.currentTimeMillis());
		return formatter.format(calendar.getTime());
	}
}

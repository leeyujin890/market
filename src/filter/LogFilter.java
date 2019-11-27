package filter;

import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.io.FileWriter; // 파일 쓰기 
import java.io.PrintWriter; //자바에서 웹으로 데이터를 출력하기 위해 사용 
import java.io.IOException;

public class LogFilter implements Filter{

	PrintWriter writer;
	
	// 매개변수 config : JSP컨테이너가 초기화 중 필터에 정보를 전달하는데 사용
	public void init(FilterConfig filterConfig) throws ServletException{
		String filename=filterConfig.getInitParameter("filename");
		
		if(filename==null) 
			throw new ServletException("로그 파일의 이름을 찾을 수 없습니다.");
			
			 try {
				 writer=new PrintWriter(new FileWriter(filename,true),true);
			 }catch(IOException e) {
				 throw new ServletException("로그 파일을 열 수 없습니다.");
			 }
	}
	
	public void doFilter(ServletRequest request,ServletResponse response,FilterChain chain) throws java.io.IOException,ServletException{
		writer.println("접속한 클라이언트 IP : " + request.getRemoteAddr());
		long start=System.currentTimeMillis();
		writer.println("접근한 url 경로 : " + getURLPath(request));
		writer.println("요청 처리 시각 : "+ getCurrentTime());
		chain.doFilter(request, response);
		
		long end=System.currentTimeMillis();
		writer.println("요청 종료 시각 : "+ getCurrentTime());
		writer.println("요청 처리 소요 시각 : "+ (end-start)+"ms");
		writer.println("======================================================================================================");
	}
	public void destroy() {
		writer.close();
	}
	private String getURLPath(ServletRequest request) {
		HttpServletRequest req; // 한번의 요청으로 실행된 페이지끼리 정보를 공유하고자 할 때 사용된다.
		String currentPath="";
		String queryString="";
		
		if(request instanceof HttpServletRequest) {//왼쪽 참조변수 오른쪽 피 연산자로 boolean값 중 하나를 반환한다. true를 얻었다는 것은 참조변수가 검사한 타입으로 형 변환이 가능하다는 것을 뜻한다.
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

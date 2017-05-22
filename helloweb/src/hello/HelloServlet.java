package hello;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/* Servlet클래스 구현
 * 1. public class로 선언.
 * 2. javax.servlet.http.HTTPServlet를 상속(extends) -> javaEE API
 * 3. 매개변수 없는 생성자 (no-argument)-> 자동으로 생기니까 그냥 만들지말어.
 * 4. doGet() doPost() 메서드를 오버라이딩.-> 서블릿이 서비스할 내용을 구현한다. 
 * 5. 구현한 Servlet class를 톰캣에 등록 -> 1. web.xml 2. Annotation을 이용해 등록.(서블릿3.0부터 - 톰캣7)
 */

public class HelloServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)throws IOException, ServletException{
		Date date = new Date();//실행시점의 일시.
		String current = String.format("%tY-%<tm-%<td %<tH:%<tM:%<tS", date);
		
		//SimpleDateFormat : java.util.Date --> String (format()) String-->Date (parse())
		//yyyy:년도(4자리) MM:월(2) dd:일(2) HH:시간(24제 2자리) mm:분(2) ss:초(2)
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String current2 = sdf.format(date);
		//Date dd = sdf.parse("2011-11-20 23:22:05");
		
		response.setContentType("text/html;charset=UTF-8");//여기서 주소넣을때 공백넣으면 안된다 
		PrintWriter out = response.getWriter();
		out.println("<!docType html>");
		out.println("<html>");
		out.println("<head><title>현재시간</title></head>");
		out.println("<body>");
		out.printf("현재시간1 : %s<br>",current);
		out.printf("현재시간2 : %s<br>",current2);
		out.println("</body></html>");

	}
}

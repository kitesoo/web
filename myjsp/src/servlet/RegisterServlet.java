package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vo.Member;

public class RegisterServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Member member = (Member)req.getAttribute("member");
		//이미 forward.jsp에서 멤버타입에다가 요청파라미터를 전부넣어서 보내는 작업을 함.
		System.out.println("요청파라미터 : "+member);
		
		//비즈니스로직 - memberService.addMember(member);
		
		//req.getRequestDispatcher("/actiontag/response3.jsp").forward(req, resp);//새로고침할때마다 재등록되므로 그러면 안된다. 
		resp.sendRedirect("/myjsp/actiontag/response3.jsp");
	}
}

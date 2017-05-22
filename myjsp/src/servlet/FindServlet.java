package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vo.Member;

public class FindServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		//1.요청파라미터 조회
		String id = req.getParameter("id");
		
		//2. 비지니스 로직처리 - model 호출
		Member member = new Member(id,"1111","이회원","lee@nana.com",2302000);//조회결과
		
		//3.응답-view호출(jsp)
		req.setAttribute("result", member);
		req.getRequestDispatcher("/actiontag/response2.jsp").forward(req, resp);
	}
	
}

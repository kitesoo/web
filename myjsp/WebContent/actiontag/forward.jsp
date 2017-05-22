<%@ page contentType="text/html;charset=UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean scope= "request" id = "member" class="vo.Member">
	<!-- null이여서 자기가 생성해서 넣을때만 실행되는 내용.  -->
</jsp:useBean>
<jsp:setProperty name = "member" property = "*"/>
<%
	//요청디스패치방식으로 registerServlet으로 이동
	//request.getRequestDispatcher("/register").forward(request, response);
	
%>
<jsp:forward page="/register"/><!--요청디스패치방식으로 page에 지정한 url로 이동  -->
<!-- 
	Member member = (Member) request.getAttribute("member");
	if(member==null){
		member = new Member();
		request.setAttribute("member",member);
	}
	
	----setProperty
	jsp:setProperty name = "member" property= "id" param = "id" //property와 param이 같으면 param생략,* 는 일괄적으로 다 넣어라 
	member.setId(request.getParameter("id"))
 -->

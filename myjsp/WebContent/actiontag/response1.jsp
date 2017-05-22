<%@page import="vo.Member"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>조회결과</h1>
<%
Member member = (Member)request.getAttribute("result");
%>
id : <%=member.getId() %><br>
password : <%=member.getPassword() %> <br>
name : <%=member.getName() %><br>
email : <%=member.getEmail() %><br>
point : <%= member.getPoint() %><br>


</body>
</html>
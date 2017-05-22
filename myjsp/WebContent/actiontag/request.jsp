<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<jsp:include  page = "/actiontag/menu.jsp"/>
<%@include file = "/actiontag/menu.jsp" %>
<body>
<form action = "/myjsp/findById" method="post">
	조회할 ID <input type="text" name = "id">
	
	<input type = "submit" value = "검색">
</form>
<h1>등록</h1>
<form action = "/myjsp/actiontag/forward.jsp" method = "post">
	ID: <input type = "text" name = "id"><br>
	password : <input type = "password" name = "password"><br>
	이름 : <input type = "text" name = "name"><br>
	이메일 : <input type = "text" name = "email"><br>
	포인트 : <input type = "text" name = "point"><br>
	<input type="submit" value="등록">
</form>
</body>
</html>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date,java.util.ArrayList"%>
<%@ page contentType="text/html;charset=UTF-8"%>

<%! //선언자 태그 - servlet의 member변수/메소드를 선언 및 정의(구현)
	int counter = 0; // instance변수
	//JSP lifecycle메소드 : jspInit(),jspDestroy()->오버라이딩 but!  _jspService()-> 오버라이딩 ㄴㄴ
	public void jspInit(){
		System.out.println("counter.jsp의 jspInit()");
	}
	public void jspDestroy(){
		System.out.println("counter.jsp의 jspDestroy()");
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<jsp:include page="/actiontag/menu.jsp"/>

<%
	//현재시간저장
	Date d = new Date();
	ArrayList list = new ArrayList();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분 ss초");
	String current = sdf.format(d);
	
	int size = (int)(Math.random()*6)+1;//1-6
%>
현재시간 : <%=current %>
<font size = "<%=size%>"><%=size%></font>

카운터 : <%=++counter %>
</body>
</html>
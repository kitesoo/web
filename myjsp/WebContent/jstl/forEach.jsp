<%@page import="java.util.HashMap"%>
<%@page import="vo.Customer"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setAttribute("names", new String[] { "김영수", "홍길동", "최영희", "박영철" });
	ArrayList<Customer> customerList = new ArrayList<>();
	customerList.add(new Customer("이고객", "lee@na.com", 30, 70.6, true));
	customerList.add(new Customer("김고객", "kim@na.com", 40, 80, false));
	customerList.add(new Customer("박고객", "park@na.com", 50, 45, true));

	request.setAttribute("list", customerList);

	HashMap map = new HashMap();
	map.put("pId", "p-111");
	map.put("product name", "노트북");
	map.put("price", 3000000);
	map.put("cust",new Customer("리고객", "lee@na.com", 30, 70.6, true));

	session.setAttribute("info", map);
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<select>
		<c:forEach items='${requestScope.names}' var="name">
			<option>${name}</option>
		</c:forEach>
	</select>

	<h1>고객정보</h1>
	<table border='1' width='500px'>
		<thead>
			<tr>
				<td>이름</td>
				<td>이메일</td>
				<td>나이</td>
				<td>몸무게</td>
				<td>결혼여부</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${requestScope.list}" var="customer">
				<tr>
					<td>${customer.name}</td>
					<td>${customer.email}</td>
					<td>${customer.age}세</td>
					<td>${customer.weight}kg</td>
					<td>${customer.marriage?"기혼":"미혼"}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<h2>forEach를 이용해 map 전체조회</h2>
	<c:forEach items = "${sessionScope.info}" var="info">
		<!-- info : Entry -->
		<c:choose>
			<c:when test = '${info.key =="cust"}'>
				<ul>
					<li>${info.value.name}</li>
					<li>${info.value.email}</li>
					<li>${info.value.age}</li>
				</ul>
			</c:when>
			<c:otherwise>
				key: ${info.key} value: ${info.value }<br>		
			</c:otherwise>
		</c:choose>
	</c:forEach>
	
	<h2>forEach를 이용한 단순반복</h2>
	<ol>
	<!--비긴: 시작숫자, 엔드 종료숫자, 스텝 증가숫자 생략시 1, 비긴,엔드,스텝은 음수 못와  -->
	<c:forEach begin ="1" end="10" step="1" var ="no">
		<li>안녕-${no }</li>
	</c:forEach>
	</ol>
</body>
</html>
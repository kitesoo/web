<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setAttribute("names", new String[]{"김강우","김하늘","최정원","이제훈","김정훈","김철","박철"});
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:choose>
		<c:when test="${fn:length(requestScope.names)==0 }">
		조회된 내용이 없습니다.
	</c:when>
		<c:otherwise>
			<h2>김씨만 출력</h2>
			<c:forEach items="${requestScope.names}" var="name">
				<c:if test="${fn:startsWith(name,'김')}">
				${name}
				</c:if>
			</c:forEach><br>
			<c:forEach items="${requestScope.names }" var="name">
				<c:if test="${fn:length(name)==2}">
					${name }
				</c:if>
			</c:forEach><br>
			<h2>이름개수</h2>
			${fn:length(requestScope.names)}<br>
			join():${fn:join(requestScope.names,",")}<br>
			
		</c:otherwise>
	</c:choose>
</body>
</html>
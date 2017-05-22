<%@page import="vo.Customer"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<!--jstl태그라이브러리 등록  -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--
	sessionScope에 login_cutomer 이름으로 Customer객체를 속성으로 등록
--%>
<c:set scope="session" var="login_customer"
	value='<%=new Customer("이회원", "lee@na.com", 22, 80, true)%>' />
<%-- <c:remove scope = "session" var = "login_customer"/> <!--속성제거  --> --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!--로그인한 고객의 나이가 19세 이상이면 성인용품 메뉴를 보여준다.  -->
	메뉴 :
	<c:choose>
		<c:when test="${empty sessionScope.login_customer}"> <!--로그인상태가 아니면  -->
			로그인,회원가입
		</c:when>			
		<c:otherwise>
			로그아웃, 마이페이지, 고객센터
			<c:if test="${sessionScope.login_customer.age >=19}">
			성인용품
			</c:if>
		</c:otherwise>	
	</c:choose>

</body>
</html>
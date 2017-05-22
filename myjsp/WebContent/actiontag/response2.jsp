
<%@ page contentType="text/html;charset=UTF-8"%>
<jsp:useBean scope = "request" id = "result" class = "vo.Member"/>
<!--위의 useBean구문이 나타내는바======> 
	result = (vo.Member) request.getAttribute("result")
	if(result==null){ // null이면 못사용하니까 만드는과정
		result = new vo.Member();
		request.serAttribute("result",result);
	}  -->

<!--useBean : 속성영역에서 속성객체(vo)를 가져오는 태그.없으면 만들어서 넣어준다. 
	태그의 속성-scope : 속성영역지정 - page(기본)=이 객체, request, session, application 중에 한값을 가져야한다.
			-id : 속성명지정, 가져온 속성객체의 식별자. 
			-class : 속성의 클래스명을 지정. 패키지명을 포함해서 설정해야함.	 
 -->
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/actiontag/menu.jsp"/>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	id : <jsp:getProperty property="id" name="result"/><br>
	이름 : <%=result.getName() %> : <jsp:getProperty property="name" name="result"/><br>
	<%-- 이름 : ${requestScope.member.email} --%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
MAIN
<form:form action="${pageContext.request.contextPath}/logout" method="POST">
	<input type="submit" value="로그아웃"/>
</form:form>

</body>
</html>
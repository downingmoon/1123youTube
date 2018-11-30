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

<a href="insertURL">URL 등록</a>
<a href="insertGallary">이미지 파일 업로드</a>
<a href="${pageContext.request.contextPath}/client/list">리스트 보기</a>

</body>
</html>
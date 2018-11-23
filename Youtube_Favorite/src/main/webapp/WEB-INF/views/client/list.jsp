<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
클라이언트 리스트 화면
<c:forEach items="${list}" var="item">
	<div>
		${item.y_no} - ${item.y_url} - ${item.y_regdate}
	</div>
</c:forEach>
</body>
</html>
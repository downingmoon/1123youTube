<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리스트</title>
</head>
<body>

	클라이언트 리스트 화면<br>
	<a href="${pageContext.request.contextPath}/admin/insertURL">URL 등록</a><br>
<table>
	<c:forEach items="${list}" var="item">
	<tr>
		<th><a href="${pageContext.request.contextPath}/client/playVideo?y_no=${item.y_no}">${item.y_title}</a></th>
	</tr>
	<tr>
		<td><img style="width:300px;height:300px;" src="https://img.youtube.com/vi/${item.y_url}/maxresdefault.jpg"></td>
		<td><iframe width="300" height="300" src="https://www.youtube.com/embed/${item.y_url}"></iframe></td>
	</tr>
	<tr>
		<td><button type="button" onclick="location.href='${pageContext.request.contextPath}/admin/deleteVideo?y_no=${item.y_no}'">삭제</button>
	</tr>
	</c:forEach>
</table>	
	<!-- 
	<c:forEach items="${list}" var="item">
		<div>
			주석에 el표기 쓰면안됨. 스프링에서 찾음${item.y_no} - ${item.y_url} - ${item.y_regdate}
		</div>
	</c:forEach>
	-->
</body>
</html>
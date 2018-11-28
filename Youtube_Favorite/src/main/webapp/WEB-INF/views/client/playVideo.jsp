<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${vo.y_title}</title>
</head>
<body>
<h1>유튜브 영상을 봅시당</h1><br>
<h3>${vo.y_title}</h3>

<iframe width="500" height="500" src="https://www.youtube.com/embed/${vo.y_url}"></iframe>
</body>
</html>
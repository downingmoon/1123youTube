<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
<!-- 아무것도 안적어도 post로 가짐 -->
	<form:form>
		<p>
			<label for="u_id">아이디</label>
			<input type="text" id="u_id" name="u_id" value="joy97q12" />
		</p>
		<p>
			<label for="u_pw">비밀번호</label>
			<input type="password" id="u_pw" name="u_pw" value="1020" />
		</p>
		<p>
			<label for="u_name">이름</label>
			<input type="text" id="u_name" name="u_name" value="문다운"/>
		</p>
		<p>
			<label for="u_email">이메일</label>
			<input type="text" id="u_email" name="u_email" value="4joy97@naver.com"/>
		</p>
		<p>
			<label for="u_nickname">닉네임</label>
			<input type="text" id="u_nickname" name="u_nickname" value="FallingMoon"/>
		</p>
		<p>
			<label for="u_auth">권한</label>
			<input type="text" id="u_auth" name="u_auth" value="USER"/>
		</p>
		<button type="submit" class="btn">회원가입</button>
	</form:form>

</body>
</html>
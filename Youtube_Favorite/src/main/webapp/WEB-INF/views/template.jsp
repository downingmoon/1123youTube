<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%
	pageContext.setAttribute("cn", "\n");
	pageContext.setAttribute("br", "<br>");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/navBar.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/login.css">
<script src="${pageContext.request.contextPath}/res/js/navBar.js"></script>
<script>



</script>
</head>
<body>
<div class="container-fluid" id="test">
	<div id="wrapper" class="active">
		<div id="sidebar-wrapper">
	    	<ul id="sidebar_menu" class="sidebar-nav">
	        	<li class="sidebar-brand"><a id="menu-toggle" href="#">MyTube<span id="main_icon" class="glyphicon glyphicon-align-justify"></span></a></li>
	      	</ul>
	        <ul class="sidebar-nav" id="sidebar">
	        	<sec:authorize access="isAnonymous()">
	        		<li><a onclick="clkLogin()" href="#" data-toggle="modal" data-target="#login-modal">Login</a></li>
	        	</sec:authorize>
	        	<sec:authorize access="isAuthenticated()">
	        		<li><a href="/youtube/logout">Logout</a></li>
	        	</sec:authorize>
	        	<li><a href="/youtube">Home
	        		<span class="sub_icon glyphicon glyphicon-link"></span></a></li>     
	        	<li><a href="/youtube/client/insertURL">URL 등록</a></li>
	        	<li><a href="/youtube/client/insertGallary">이미지 업로드</a></li>
	        </ul>
	     </div>
	     <div id="page-content-wrapper">
	     	<div class="page-content inset">
	        	<div class="row" id="row">
	            	<div class="col-md-12">
	            		<img style="width:100%;" alt="MainLogo" src="/youtube/res/img/mytube.png">
	              		<jsp:include page="${target}.jsp"/> 
	              		<jsp:include page="default/footer.jsp"/>
	            	</div>
	          	</div>
	        </div>
	     </div>
	</div>
</div>
<!-- Login Modal -->
<div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
	<div class="modal-dialog">
		<div class="loginmodal-container">
			<h1>MyTube 로그인</h1><br>
			<form action="/youtube/login" method="post" onsubmit="return loginFrm()" name="loginForm">
				<input class="form-control" type="text" id="username" name="username" maxlength="20" placeholder="아이디 입력">
				<input class="form-control" type="password" id="password" name="password" maxlength="20" placeholder="비밀번호 입력">
				<input class="login loginmodal-submit" type="submit" onclick="return loginFrm()" value="LOGIN" class="submitBtn">
			</form>
			<!-- <div class="login-help"><a href="forgotPw">비밀번호 찾기</a></div> -->
		</div>
	</div>
</div>


</body>
</html>
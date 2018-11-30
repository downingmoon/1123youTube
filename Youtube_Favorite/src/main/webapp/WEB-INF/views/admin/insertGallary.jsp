<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이미지 업로드</title>
<script>
	function upload() {
		var frm = document.frm;
		if(frm.title.value == "") {
			alert("파일 제목을 입력해주세요.");
			frm.title.focus();
			return false;
		} else if(frm.img.value == "") {
			alert("파일이 선택되지 않았습니다.");
			frm.img.focus();
			return false;
		}
		return true;
	}
</script>
</head>


<body>
	<form:form id="frm" name="frm" onsubmit="return upload()" enctype="multipart/form-data">
		<p>
			제목 : <input type="text" name="title"><br>
			이미지 : <input type="file" name="img" id="file" accept="image/*"><br>
		</p>
		<input type="submit" value="업로드">
	</form:form>
</body>
</html>
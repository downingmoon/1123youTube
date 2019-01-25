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
		if(frm.g_title.value == "") {
			alert("파일 제목을 입력해주세요.");
			frm.g_title.focus();
			return false;
		} else if(frm.img.value == "") {
			alert("파일이 선택되지 않았습니다.");
			frm.img.focus();
			return false;
		}
		return true;
	}
	
$(function() {
	$("#file").on("change", function() {
		var fileValue = $("#file").val().split("\\");
		var fileName = fileValue[fileValue.length-1]; // 파일명
		var frm = document.frm;
		frm.selected_file.value = fileName;
	});
});	

</script>
</head>


<body>
<div class="col-md-12">
	<form:form id="frm" name="frm" onsubmit="return upload()" enctype="multipart/form-data">
		<div class="col-md-2">
			<label for="file" class="btn btn-primary" style="width:100%;">이미지선택</label>
		</div>
		<div class="col-md-10">
			<input type="text" name="g_title" class="form-control" style="width:100%;" placeholder="이미지 제목">
		</div>
		<div class="col-md-2">
			<input type="submit" value="업로드" style="width:100%;" class="btn btn-default">
		</div>
		<div class="col-md-10">
			<input type="text" name="selected_file" style="width:100%;" class="selFile form-control" value="" readonly placeholder="선택된 파일명">
		</div>
		<input style="opacity:0;" type="file" name="img" id="file" accept="image/*">
	</form:form>
</div>
</body>
</html>
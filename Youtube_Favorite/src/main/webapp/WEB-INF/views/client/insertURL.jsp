<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>URL등록</title>
</head>
<body>

	<form:form id="frm" onsubmit="return beforeSend()"> 
			<input class="form-control" type="text" name="y_url" id="y_url" placeholder="Insert URL"> 
			<input type="hidden" name="y_title" id="y_title">
			<input type="hidden" name="y_chname" id="y_chname">
			<input class="btn btn-default" type="submit" value="URL등록">
	</form:form>
	
<script>
	
	function beforeSend() {
		var frm = document.getElementById("frm");
		var y_url = frm.y_url.value;
		
		var target = "https://www.googleapis.com/youtube/v3/videos?id=" + y_url + "&key=AIzaSyB23rgPTWa0fbyYfCSN7XFXV62TqMiHyMk&part=snippet,statistics";
		
		//json 통신부분
		var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() { //먼저실행되지않음 send 후 통신이 되면 if문 진입 status가 200이면 통신이 잘 된것
			if(this.readyState == 4 && this.status == 200) {
				
				var obj = JSON.parse(this.responseText); // this.responseText = 통신한 결과값이 들어가있음
							//parsing을 하면 String이 자바스크립트 객체가 됨(같은모양)
				if(obj.items[0] != undefined) {
					var y_title = document.getElementById("y_title");
					var y_chname = document.getElementById("y_chname");
					y_title.value = obj.items[0].snippet.title;
					y_chname.value = obj.items[0].snippet.channelTitle;
					
					frm.submit();
				}
			}
		};
		xhttp.open("GET", target, true);
		xhttp.send();
		
		return false; //무조건 false를 리턴해야함 / 비동기식.
	}

</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${vo.y_title}</title>
</head>
<script>
	function authCheck(nick, c_no, y_no) {
		var returnData = true;
		$.ajax({
			url : 'authCheckAjax',
			type : 'post',
			async : false,
			data : {
				nick : nick,
				c_no : c_no,
				y_no : y_no
			},
			success : function(result) {
				console.log('result : ' + result);
				returnData = result;
			},
			error : function() {
				alert('권한을 확인하던중 에러가 발생했습니다.');
			}
		});
		return returnData;
	}

	function deleteComment(nick, c_no, y_no) {
		var data = authCheck(nick, c_no, y_no);
		if(data == false) {
			alert('자신이 작성한 댓글만 삭제할수 있습니다.');
			return false;
		} else {
			//TODO : ajax Delete
			
			$.ajax({
				url : 'deleteCommentAjax',
				type : 'post',
				data : {
					c_no : c_no,
					y_no : y_no
				},
				success : function() {
					alert('삭제되었습니다.');
					location.reload();
					
				},
				error : function() {
					alert('삭제도중 에러가 발생했습니다.');
				}
			});
		}
	}
	
	function commentCheck() {
		var frm = document.frm;
		if(frm.c_writer.value == "f") {
			alert('회원만 댓글을 달수있습니다.');
			return false;
		} else if(frm.c_content.value == "") {
			alert('댓글내용이 입력되지 않았습니다.');
			frm.c_writer.focus();
			return false;
		} else {
			$.ajax({
				url : 'commentAjax',
				type : 'post',
				data : {
					y_no : $('#y_no').val(),
					c_content : $('#c_content').val(),
					c_writer : $('#c_writer').val()
				},
				success : function() {
					alert('댓글이 등록됐습니다.');
					location.reload();
				},
				error : function() {
					alert('에러가 발생했습니다.');
				}
			});
		}
	}
</script>
<body>
<h3>${vo.y_title}</h3>

<iframe width="100%;" height="500" src="https://www.youtube.com/embed/${vo.y_url}"></iframe>

<div class="panel panel-default">
	<div class="panel-heading"><small>댓글&nbsp;&nbsp;<span class="badge">${cnt}</span></small></div>
	<div class="panel-body">
	    <c:if test="${list.size() == 0 }">
	    	<center>등록된 댓글이 없습니다.</center>
	    </c:if>
	    <table style="width:100%;">
	    	<c:forEach var="list" items="${list}">
		   		<tr>
		   			<td><b>${list.c_writer}</b></td>
		   			<td><button class="btn btn-xs btn-danger pull-right" 
		   				onclick="deleteComment('${nick}', '${list.c_no}', '${y_no}')">삭제</button></td>
		   		</tr>
		   		<tr>
		   			<td colspan="2">${list.c_content}</td>
		   		</tr>
		   		<tr>
		   			<td colspan="2" style="color:lightgray;"><small>${list.c_regdate}</small></td>
		   		</tr>
		   		<tr>
		   			<td><hr style="margin:5px; width:100%;"></td>
		   		</tr>
		   		
		   	</c:forEach>
	   	</table>
	   	<hr>
	   	<form onsubmit="return commentCheck()" name="frm" method="post">
	   		<textarea class="form-control" rows="5" id="c_content" name="c_content"></textarea><br>
	   		<c:choose>
	   			<c:when test="${nick == null}">
	   				<input type="hidden" id="c_writer" name="c_writer" value="f">
	   			</c:when>
	   			<c:otherwise>
	   				<input type="hidden" id="c_writer" name="c_writer" value="${nick}">	
	   			</c:otherwise>
	   		</c:choose>
	   		<input type="hidden" id="y_no" name="y_no" value="${y_no}">
	   		<button type="submit" class="btn btn-success">댓글작성</button>
	   	</form>
  	</div>
</div>
</body>
</html>
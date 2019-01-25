<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
$(document).ready(function () {
	var page = 1;
  $(document).scroll(function() {
	  
    var maxHeight = $(document).height();
    var currentScroll = $(window).scrollTop() + $(window).height();
    var target = "jsonList";

    if (maxHeight <= currentScroll + 10) {
    	$.ajax({
    		url : '/youtube/client/jsonList',
    		type : 'post',
    		dataType : 'json',
    		success : function(data) {
    			for(var i in data) {
    				alert(data[i].y_no)	
    			}
    			
    		}
    	})
    	//$.ajax({
    	//	url : 'getMoreVideoAjax',
    	//	type : 'post',
    	//	data : {
    	//		page : page
    	//	},
    	//	success : function() {
    	//		alert('success');
    	//	},
    	//	error : function() {
    	//		alert('error');
    	//	}
    	//})
    	$('#testDiv').after(
    			'<div class="clearfix">'
    			+ '<div class="col-md-12">'
    			+ '<a href="">제목임</a>'
    			+ '</div>'
    			+ '<div class="col-md-10 col-sm-6 col-xs-12">'
    			+ '<p>By : 채널이름임</p>'
    			+ '</div>'
    			+ '<div class="col-md-1 col-sm-6 hidden-xs">'
    			+ '<button type="button" class="btn btn-danger" onclick="">삭제</button>'
    			+ '</div>'
    			+ '</div>'
    			
    			);
      alert(page);
    	page++;
    }
  })
});
</script>

<c:if test="${list.size() == 0}">
	영상이 없습니다.
</c:if>
<div id="testDiv">
<c:forEach items="${list}" var="item" varStatus="i">
<div class="clearfix">
	<div class="col-md-12">
		<a href="${pageContext.request.contextPath}/client/playVideo?y_no=${item.y_no}">${item.y_title}</a>
	</div>
	<div class="col-md-10 col-sm-6 col-xs-12">
		<p>By : ${item.y_chname}</p>
	</div>
	<div class="col-md-1 col-sm-6 hidden-xs">
		<button type="button" class="btn btn-danger" onclick="location.href='/youtube/admin/deleteVideo?y_no=${item.y_no}'">삭제</button> 
	</div>
</div>
<div class="iframe embed-responsive embed-responsive-16by9">
	<iframe style="width:100%;height:500px;" src="https://www.youtube.com/embed/${item.y_url}" allowfullscreen ></iframe>
</div>
<hr class="more_${i.count}">
</c:forEach>
</div>
</body>
</html>

<!-- Image Link
		<img style="width:300px;height:300px;" src="https://img.youtube.com/vi/${item.y_url}/maxresdefault.jpg">
 -->
 <!-- Original Table
 <table class="table"> 
	<c:forEach items="${list}" var="item">
	<tr>
		<th><a href="${pageContext.request.contextPath}/client/playVideo?y_no=${item.y_no}">${item.y_title}</a></th>
		<td class="hidden-xs hidden-sm">
			<button type="button" class="btn btn-danger" onclick="location.href='/youtube/admin/deleteVideo?y_no=${item.y_no}'">삭제</button>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<div class="embed-responsive embed-responsive-16by9">
				<iframe style="width:100%;height:500px;" src="https://www.youtube.com/embed/${item.y_url}" allowfullscreen ></iframe>
			</div>
		</td>
	</tr>
	</c:forEach>
</table>
-->
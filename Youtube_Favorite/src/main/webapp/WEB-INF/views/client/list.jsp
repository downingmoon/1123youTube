<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
$(document).ready(function () {
	var page = 3;
  $(document).scroll(function() {
	  
    var maxHeight = $(document).height();
    var currentScroll = $(window).scrollTop() + $(window).height();

    if (maxHeight <= currentScroll + 100) {
    	$.ajax({
    		url : '/youtube/client/getMoreVideoAjax',
    		type : 'post',
    		dataType : 'json',
    		data : {
    			page : page
    		},
    		async : false,
    		success : function(data) {
    			console.log('data : ' + data);
    			if(page != '999999' && page != 999999) {
    				console.log('page is not -1. page is ' + page);
    			
    			if(data != null && data != undefined && data != '' ) {
    				for(var i in data) {
        				console.log('y_no : '+data[i].y_no);
        				//if(data[i].y_no != undefined || data[i].y_no != '' || data[i].y_no != null) {
        					console.log('DIV name is testDiv'+(parseInt(page)+1));
        					$(('#testDiv'+ page)).after(
        							'<div id="testDiv'+(parseInt(page)+1)+ '">'
                	    			+ '<div class="clearfix">'
                	    			+ '<div class="col-md-12">'
                	    			+ '<a href="/youtube/client/playVideo?y_no='+data[i].y_no+'">'+data[i].y_title+'</a>'
                	    			+ '</div>'
                	    			+ '<div class="col-md-10 col-sm-6 col-xs-12">'
                	    			+ '<p>By : '+data[i].y_chname+'</p>'
                	    			+ '</div>'
                	    			+ '<div class="col-md-1 col-sm-6 hidden-xs">'
                	    			+ '<button type="button" class="btn btn-danger" onclick="">삭제</button>'
                	    			+ '</div>'
                	    			+ '</div>'
                	    			+ '<div class="iframe embed-responsive embed-responsive-16by9">'
                	    			+ '<iframe style="width:100%;height:500px;" src="https://www.youtube.com/embed/'+data[i].y_url+'" allowfullscreen ></iframe>'
                	    			+ '</div>'
                	    			+ '<hr>'
                	    			+ '</div>')
            				page++;
        				}
        			console.log('page : ' + page);	
    			} else {
					console.log('list is end. page is ' + page)
					$(('#testDiv'+parseInt(page))).after(
							'<div class="clearfix">'
							+ '<div class="col-md-12">'
							+ '<h3 class="center-block">영상이 더 없습니다.</h3></div>'
							);	
					page = 999999;
				}
    			}
    		}
    	});
    }
  })
});
</script>

<c:if test="${list.size() == 0}">
	영상이 없습니다.
</c:if>

<c:forEach items="${list}" var="item" varStatus="i">
<div id="testDiv${i.count}">
<div class="clearfix" id="clearDiv">
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
<hr>
</div>
</c:forEach>

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
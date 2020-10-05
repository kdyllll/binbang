<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/commonLink.jsp"%>
<h2>숙소요청</h2>
<form class="myHouseCon houseAll" method="post">
	<div>houseRequest</div>
	<button class="deleteH">테스츠</button>
</form>
<script>
	$(".deleteH").on("click",e => {
		$(".houseAll").attr("action","<%=request.getContextPath()%>/house/houseRequest").submit();
	})
</script>

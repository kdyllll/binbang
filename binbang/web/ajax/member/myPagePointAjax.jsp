<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.binbang.member.model.vo.Member"%>
<%@ include file="/views/common/commonLink.jsp"%>
<%
	Member m = (Member) session.getAttribute("m");
%>
<style>
/* 4. POINT 사용내역 */
.section {
	padding: 6% 20%;			
}
.section .point {
	width: 500px;
	display: flex;
	flex-direction: column;	
	margin-bottom: 10%;
}

.border{
display:flex;
justify-content:center;
}

.addContent {
	padding:0 2%;	
}

/* POINT변화유무 */
.pointCount .line6 {
	width: 100%;
	height: 2px;
	background-color: black;
	margin: 2% 0;
}
.pointCount .line7 {
	width: 100%;
	height: 1px;
	background-color: black;
	opacity: 40%;
	margin-top: 2%;
}
.pointCount {
	margin-top: 1%;
}
.pointCount>ul {
	display: flex;
	justify-content: space-between;
	font-size: 12px;
	margin: 1% 0;
}
</style>

<!-- 2. 총 포인트 -->
<div class="border">
	<div class="point">
		<div>
			<div class="pointContents">
				POINT : <%=m.getTotalPoint()%>
			</div>
		</div>
	
		<!-- 포인트사용/추가시 마다 추가되는 로직 -->
		<div class="pointCount">
			<div class="line6"></div>
			<ul>
				<li class="addDate">2020-09-05</li>
				<li class="addContent">이나주니 집사용</li>
				<li class="addpoint">100,000,000 point 사용</li>
			</ul>
			<div class="line7"></div>
		</div>
	</div>
</div>



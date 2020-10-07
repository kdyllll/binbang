<%@page
	import="com.binbang.member.model.vo.Member,com.binbang.host.model.vo.Host"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/commonLink.jsp"%>

<%
	List<Host> list = (List) request.getAttribute("list");
	List cell = (List) request.getAttribute("cell");
	String adminTitle = (String) request.getAttribute("adminTitle");
	String memberNo = (String) request.getAttribute("memberNo");
//int result=(int)request.getAttribute("result");
%>


<p class="pageTitle"><%=adminTitle%></p>


<form class="tb_wrap" method="post">
	<div class="tableDiv">
		<table class="tableAll">
			<tr id="reserveList" class="fixed_top">
				<th class="<%=cell.get(0)%>">이름</th>
				<th class="<%=cell.get(1)%>">전화번호</th>
				<th class="<%=cell.get(2)%>">본인사진</th>
				<th class="<%=cell.get(3)%>">신분증사진</th>
				<th class="<%=cell.get(4)%>">요청날짜</th>
				<th class="<%=cell.get(5)%>">승인 여부</th>

			</tr>

			<%
				for (Host h : list) {
			%>

			<%
				if (h.getHostAcceptDate() == null) {
			%>
			<tr>
				<td class="<%=cell.get(0)%>"><%=h.getMemberName()%></td>
				<td class="<%=cell.get(1)%>"><%=h.getMemberPhone()%></td>
				<td class="<%=cell.get(2)%>"><%=h.getProfilePic()%></td>
				<td class="<%=cell.get(3)%>"><%=h.getIdCard()%></td>
				<td class="<%=cell.get(4)%>"><%=h.getHostEnrollDate()%></td>
				<td class="<%=cell.get(5)%>">
					<div class="acceptChoice">
						<input type="hidden" name="memberNo" class="mNo" value="<%=h.getMemberNo()%>">
						<input type="button" name="acceptY" value="승인" class="yes">
						<input type="button" name="acceptN" value="거절" class="no">
					</div>
				</td>
			</tr>
			<%
				}
			%>
			<%
				}
			%>

		</table>
	</div>
</form>


<script>
	
	$(".yes").on("click",e=>{
		$.ajax({
			url:"<%=request.getContextPath()%>/admin/hostAccept",
			data:{"memberNo" : $(".mNo").val() },
			dataType:"html",
			success: data => { 
				 if(result>0){ 
					alert("승인되었습니다."); 
				}else{
					alert("승인을 실패하였습니다.") 
				}  
				console.log(data);
			}

		}); 
		});
		</script>




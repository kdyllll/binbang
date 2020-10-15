<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="java.util.List"%>
<%@ page import="com.binbang.host.model.vo.Host" %>
<%@ include file="/views/common/commonLink.jsp"%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/manager.css" />
<%
	
	List<Host> list = (List) request.getAttribute("list");
%>    
  </head>

  <body>
    <div class="wrap">
	<%@ include file="/views/common/adminHeader.jsp"%>
      <section class="section">
        <%@ include file="/views/admin/adminNav.jsp"%>
 

            <p class="pageTitle">호스트 승인</p>
            
            <div class="tb_wrap">
              <div class="tableDiv" >
                <table class="tableAll">
                  <tr class="fixed_top">
                    <th class="cell1">이름</th>
                    <th class="cell3">전화번호</th>
                    <th class="cell3">본인사진</th>
                    <th class="cell3">신분증사진</th>
                    <th class="cell2">요청날짜</th>
                    <th class="cell2">승인 여부</th>
                  </tr>
           
       
            <%for (Host h : list) {%>
	  	 
			<%if (h.getHostAcceptDate() == null) {%>
			 <form class="form">
			 
			<tr>
				<td class="cell1"><%=h.getHostName()%></td>
				<td class="cell3"><%=h.getMemberPhone()%></td>
				<td class="cell3">
					<a href="#" onclick="window.open('<%=request.getContextPath()%>/upload/host/<%=h.getProfilePic() %>','','width=500px,height=450px')">
					<%=h.getProfilePic()%></a>
				</td>
				<td class="cell3">
					<a href="#" onclick="window.open('<%=request.getContextPath()%>/upload/host/<%=h.getIdCard() %>','','width=500px,height=450px')">
					<%=h.getIdCard()%></a>
				</td>
				<td class="cell2"><%=h.getHostEnrollDate()%></td>
				<td class="cell2">
					<div class="acceptChoice">
						<input type="hidden" name="memberNo" value="<%=h.getMemberNo() %>">
						<input type="hidden" name="memberId" value="<%=h.getHostEmail() %>">
						<input type="hidden" name="idPic" value="<%=h.getIdCard() %>">
						<input type="button" class="acceptY" name="acceptY" value="승인" class="yes" onclick="fn_accept();">
						<input type="button" class="acceptN" name="acceptN" value="거절" class="no" onclick="fn_reject();">
					</div>
				</td>
			</tr>
			</form>
				<%
					}
				%>
				
			<%
				}
			%>
			
			
                </table>
              </div>
            </div>
          
    </section>
    </div>

  </body>
</html>

<script>

function fn_accept(){         
    $(".form").attr("action","<%=request.getContextPath() %>/admin/hostAccept").submit();                           
 }
 
 function fn_reject(){
	 $(".form").attr("action","<%=request.getContextPath() %>/admin/hostReject").submit();                           
 }
 
	
	<%--  $(".yes").on("click",e=>{
		$.ajax({
			url:"<%=request.getContextPath()%>/admin/moveHostAcceptList",
			data:{"memberNo" : $(".mNo").val(),"memberId":$(".mId").val() },
			dataType:"json",
			success: data => { 
				alert(data);
				location.reload();
			}
	
		}); 
	}); 
	 
	 $(".no").on("click",e=>{
		 $.ajax({
			 url:"<%=request.getContextPath()%>/admin/hostReject",
			 data:{"memberNo" : $(".mNo").val(),"memberId":$(".mId").val() },
			 dataType:"json",
			 success: data => { 
				alert(data);
				location.reload();
			 }
		 });
	 }); --%>
	 
 	
</script>
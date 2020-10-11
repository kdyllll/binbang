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
 
 <form id="acceptListContents" class="searchCommon">
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
              	<%
				for (Host h : list) {
			%>

			<%
				if (h.getHostAcceptDate() == null) {
			%>
			<tr>
				<td class="cell1"><%=h.getHostName()%></td>
				<td class="cell3"><%=h.getMemberPhone()%></td>
				<td class="cell3 pro"><%=h.getProfilePic()%></td>
				<input type="hidden" class="profilePic" value="<%=h.getProfilePic()%>">
				<td class="cell3 idc"><%=h.getIdCard()%></td>
				<input type="hidden" class="IdCardPic" value="<%=h.getIdCard()%>">
				<td class="cell2"><%=h.getHostEnrollDate()%></td>
				<td class="cell2">
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
            </div>
          </form>
    </section>
    </div>

  </body>
</html>

<script>
	 $(".yes").on("click",e=>{
		$.ajax({
			url:"<%=request.getContextPath()%>/admin/moveHostAcceptList",
			data:{"memberNo" : $(".mNo").val() },
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
			 data:{"memberNo" : $(".mNo").val() },
			 dataType:"json",
			 success: data => { 
				alert(data);
				location.reload();
			 }
		 });
	 });
	 
	//프로필 사진 띄우기
	
 	$(".pro").on("click",function(){
 		let profilePic=$(".profilePic").val();
        let url1="<%=request.getContextPath()%>/upload/host/"+profilePic;
        let status1="width=500px,height=450px,top=150px,left=150px";
        open(url1,"",status1);
     }); 
	 
 <%-- 	$(".pro").on("click",function(){
 		let profilePic=$(".profilePic").val();
 		profilePic.each(function(index,item){
 			let url1="<%=request.getContextPath()%>/upload/host/"+profilePic;
 	        let status1="width=500px,height=450px,top=150px,left=150px";
 	        open(url1,"",status1);
 		});
     });  --%>
 	
     
 	//신분증 사진 띄우기
 	
 	$(".idc").on("click",function(){
 		let IdCardPic=$(".IdCardPic").val();
        let url2="<%=request.getContextPath()%>/upload/host/"+IdCardPic;
        let status2="width=500px,height=450px,top=150px,left=150px";
        open(url2,"",status2);
     });
 	
</script>
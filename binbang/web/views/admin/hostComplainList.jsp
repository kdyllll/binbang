<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.binbang.member.model.vo.Complaint"%>
<%@page import="java.util.List"%>
<%@ include file="/views/common/commonLink.jsp"%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/manager.css" />
<%
	List<Complaint> list=(List)request.getAttribute("list"); 
	String type=request.getParameter("searchType");
	String key=request.getParameter("searchKeyword");

%>

  </head>
  <body>
  
    <div class="wrap">
	<%@ include file="/views/common/adminHeader.jsp"%>
      <section class="section">
        <%@ include file="/views/admin/adminNav.jsp"%>
        
        <div id="blackListContents" class="searchCommon">
            <p class="pageTitle">호스트 신고 관리</p>
           
            
            <div class="tb_wrap">
              <div class="tableDiv" >
                <table class="tableAll">
                  <tr class="fixed_top">
                    <th class="cell2">신고 아이디</th>
                    <th colspan="2" class="cell4">신고사유</th>
                    <th class="cell1">호스트 이름</th>
                    <th class="cell1">숙소 번호</th>
                    <th class="cell1">신고날짜</th>
                    <th class="cell3">신고처리상황</th>
                  </tr>
                
                <form id="form">
                  <%for(Complaint com : list) {%>
                
                  <tr>
                    <td class="cell2"><%=com.getMemberEmail() %></td>
                    <td class="cell1"><%=com.getComplaintCategory() %></td>
                    <td class="cell2 complaintDetail">
                    	<a href="" onclick="window.open('<%=request.getContextPath() %>/admin/hostComplainPopup?complaintNo=<%=com.getComplaintNo() %>','','width=800px,height=550px')">
                    	<%=com.getComplaintDetail().length() > 9 ? com.getComplaintDetail().substring(0,8) +"..." : com.getComplaintDetail() %>
                    	</a>
                    </td>
                    <td class="cell1"><%=com.getHostName() %></td>
                    <td class="cell1"><%=com.getHouseNo() %></td>
                    <td class="cell1"><%=com.getComplaintDate() %></td>
                    <td class="complainCurrent cell3">
                      <div class="complainChoice">
                   
                    <%if(com.getComplaintState().equals("대기")||com.getComplaintState()==null||com.getComplaintState().equals("")) {%>
                        	<input type="button" class="accept" value="승인" onclick="location.href='<%=request.getContextPath()%>/admin/hostComplainAccept?hostNo=<%=com.getHostNo() %>&complaintNo=<%=com.getComplaintNo()%>&memberEmail=<%=com.getMemberEmail()%>'">
                        	<input type="button" name="cancle" class="cancle" value="거절" onclick="location.href='<%=request.getContextPath()%>/admin/hostComplainReject?hostNo=<%=com.getHostNo() %>&memberEmail=<%=com.getMemberEmail() %>&complaintNo=<%=com.getComplaintNo()%>'">
                        	<input type="button" name="out" class="out" value="권한박탈" style="color:red" onclick="location.href='<%=request.getContextPath()%>/admin/hostComplainOut?hostNo=<%=com.getHostNo() %>&memberEmail=<%=com.getMemberEmail() %>&complaintNo=<%=com.getComplaintNo()%>&memberNo=<%=com.getMemberNo() %>>'">
                    <%} else if(com.getComplaintState().equals("신고")){ %>
                    	<p>신고 완료</p>  
                    <%} else if(com.getComplaintState().equals("거절")) {%>
                    	<p>거절 완료</p>
                    <%} else if(com.getComplaintState().equals("권한박탈")) {%>
                    	<p style='color:red'>권한박탈</p> 
                    <%} %> 
                      
                      
                      </div>
                    </td>
                  </tr>
                  
                  <%} %>
                  
                  </form>  
                  
                  
                </table>
              </div>
            </div>
            
         
      </section>
      
       </body>
</html>


<script>
	
	//검색
	$(function(){
		let memberName=$("#search-bl.member_name");
		let hostNo=$("#search-host_no");
		let email=$("#search-c.email");
		
		$("#searchType").change(e => {
			memberName.css("display","none");
			hostNo.css("display","none");
			email.css("display","none");
			let v=$(e.target).val(); 
			$("#search-"+v).css("display","inline-block");
		});
		$("#searchType").change(); 
		
	});
	
	$(function(){
		$(".out").click(e=>{
			alert("정말 호스트 권한박탈을 하시겠습니까?");
		});
	});
	
/*  	$(function(){
		$(".accept, .cancel, .out").on({
		    "click":function(e){
		        let id = $(e.target).val();
		        
		        console.log(id);
		        let msg='';
		        if( id == "accept") {
		        	msg='승인완료';
		        } else if (id == "cancel" ) {
		        	msg='거절완료';
		        }  else if (id == "out") {
		        	msg='권한박탈';
		        } 
		        $(e.target).parent().html($("<span>").text(text));
		    }
		});
 	}); */
	//신고 승인
	<%--  $(".accept").click(e=>{
		$.ajax({
			url:"<%=request.getContextPath()%>/admin/hostComplainAccept",
			data:{"hostNo":$(".hostNo").val(),"complaintNo":$(".complaintNo").val()},
			dataType:"json",
			succecc:data => {
				alert(data);
			}
			
		});
	});  --%>

</script>
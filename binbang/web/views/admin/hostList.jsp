<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.binbang.host.model.vo.Host"%>
<%@page import="java.util.List"%>
<%@ include file="/views/common/commonLink.jsp"%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/manager.css" />
<%
	List<Host> list=(List)request.getAttribute("list"); 
	String type=request.getParameter("searchType");
	String key=request.getParameter("searchKeyword");
%>

  </head>
  <body>
  
    <div class="wrap">
	<%@ include file="/views/common/adminHeader.jsp"%>
      <section class="section">
          <%@ include file="/views/admin/adminNav.jsp"%>
        
        <div id="hostListContents" class="searchCommon">
            <p class="pageTitle">호스트 목록</p>
            
           
            <select class="searchCategory"  id="searchType">
		      <option value="" selected disabled hidden>선택</option>
		      <option value="host_no" <%=type!=null&&type.equals("host_no")?"selected":"" %>>호스트 번호</option>
		      <option value="member_name" <%=type!=null&&type.equals("member_name")?"selected":"" %>>이름</option>
   			</select>
			
	    	<div class="search" id="search-host_no">
	    		<form action="<%=request.getContextPath()%>/admin/searchHostList">
	    			<input type="hidden" name="searchType" value="host_no">
	    			<input type="text"  class="searchinput" name="searchKeyword" size="25"
	    				value="<%=key!=null&&type!=null&&type.equals("host_no")?key:""%>">
	    			<button class="inputButton"></button>
	    		</form>
	    	</div>
	    	
	    	<div class="search" id="search-member_name">
	     		<form action="<%=request.getContextPath()%>/admin/searchHostList">
	    			<input type="hidden" name="searchType" value="member_name">
	    			<input type="text"  class="searchinput" name="searchKeyword" size="25"
	    				value="<%=key!=null&&type!=null&&type.equals("member_name")?key:""%>">
	    			<button class="inputButton"></button>
	    		</form>
	    	</div>
	    	
            <div class="tb_wrap">
              <div class="tableDiv" >
               <table class="tableAll">
                  <tr class="fixed_top">
                  	<th class="cell2">회원 번호</th>
                    <th class="cell2">호스트 번호</th>
                    <th class="cell2">이름</th>
                    <th class="cell3">이메일</th>	
                    <th class="cell3">승인 날짜</th>
                    <th class="cell2">신고 누적 횟수</th>
                  </tr>
                  <%for(Host h:list){%>
                  	<%if(h.getHostAcceptDate()!=null) {%>
                  <tr>
                  	<td class="cell2"><%=h.getMemberNo() %></td>
                    <td class="cell2"><%=h.getHostNo() %></td>
                    <td class="cell2"><%=h.getHostName() %></td>
                    <td class="cell3"><%=h.getHostEmail() %></td>
                    <td class="cell3"><%=h.getHostAcceptDate() %></td>
                    <td class="cell2"><%=h.getComplaintCount() %></td>
                  
                 </tr>
                 	<%} %>
                 <%} %>
                </table>
             </div>
            </div>
         </div>
        
         </section>
 </div>
  
  </body>
</html>


<script>
$(function(){
	let memberName=$("#search-member_name");
	let hostNo=$("#search-host_no");
	
	
	$("#searchType").change(e => {
		memberName.css("display","none");
		hostNo.css("display","none");
		
		let v=$(e.target).val(); 
		$("#search-"+v).css("display","inline-block");
	});
	$("#searchType").change(); 
	
});
</script>
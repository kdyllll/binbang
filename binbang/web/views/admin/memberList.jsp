<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.binbang.member.model.vo.Member"%>
<%@page import="java.util.List"%>
<%@ include file="/views/common/commonLink.jsp"%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/manager.css" />
<%
	List<Member> list=(List)request.getAttribute("list"); 
	String type=request.getParameter("searchType");
	String key=request.getParameter("searchKeyword");
%>

  </head>
  <body>
  
    <div class="wrap">
	<%@ include file="/views/common/adminHeader.jsp"%>
      <section class="section">
          <%@ include file="/views/admin/adminNav.jsp"%>


          <form id="memberAllContents" class="searchCommon">
            <p class="pageTitle">회원 현황</p>
         
         <select class="searchCategory"  id="searchType">
		      <option value="" selected disabled hidden>선택</option>
		      <option value="member_name" <%=type!=null&&type.equals("member_name")?"selected":"" %>>이름</option>
		      <option value="email" <%=type!=null&&type.equals("email")?"selected":"" %>>이메일</option>
   		</select>
   		
		<div class="search" id="search-member_name">
     		<form action="<%=request.getContextPath()%>/admin/searchMemberList">
    			<input type="hidden" name="searchType" value="member_name">
    			<input type="text"  class="searchinput" name="searchKeyword" size="25"
    				value="<%=key!=null&&type!=null&&type.equals("member_name")?key:""%>">
    			<button class="inputButton"></button>
    		</form>
    	</div>
    	
    	<div class="search" id="search-email">
    		<form action="<%=request.getContextPath()%>/admin/searchMemberList">
    			<input type="hidden" name="searchType" value="email">
    			<input type="text"  class="searchinput" name="searchKeyword" size="25"
    				value="<%=key!=null&&type!=null&&type.equals("email")?key:""%>">
  				<button class="inputButton"></button>  			
    		</form>
    	</div>
            

            <div class="tb_wrap"> 
              <div class="tableDiv">
                <table class="tableAll">
                  
                  <tr class="fixed_top">
                    <th class="cell1" >회원 번호</th>
                    <th class="cell2" >회원 분류</th>
                    <th class="cell2" >회원 이름</th>
                    <th class="cell4" >이메일</th>
                    <th class="cell2" >전화번호</th>
                    <th class="cell3" >가입일</th>
                  </tr>
                  
                 <% for (Member ml : list) { %>
                 <% if(!ml.getEmail().equals("admin@naver.com")) {%>
         		<tr>
		            <td class="cell1" ><%=ml.getMemberNo() %></td>
		           
		            <%
		               if (ml.getHostConfirm()!=null) {
		            %> 
		          		<td class="cell2">호스트</td>
		            <%
		               } else {
		            %>
		            	<td class="cell2">일반</td>
		            <%
		               }
		            %> 
		             <td class="cell2" ><%=ml.getMemberName() %></td>
		            <td class="cell4" ><%=ml.getEmail() %></td>
		            <td class="cell2" ><%=ml.getPhone() %></td>
		            <td class="cell3" ><%=ml.getEnrollDate() %></td>
		         </tr> 
		         	<%} %>
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
$(function(){
	let memberName=$("#search-member_name");
	let email=$("#search-email");
	
	$("#searchType").change(e => {
		memberName.css("display","none");
		email.css("display","none");
		let v=$(e.target).val(); 
		$("#search-"+v).css("display","inline-block");
	});
	$("#searchType").change(); 
	
});
</script>

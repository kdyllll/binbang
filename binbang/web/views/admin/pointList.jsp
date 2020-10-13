<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.binbang.booking.model.vo.Booking"%>
<%@page import="java.util.List"%>
<%@ include file="/views/common/commonLink.jsp"%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/manager.css" />
<%
	List<Booking> list=(List)request.getAttribute("list"); 
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
            <p class="pageTitle">적립금 관리</p>
         
         <select class="searchCategory"  id="searchType">
		      <option value="" selected disabled hidden>선택</option>
		      <option value="member_name" <%=type!=null&&type.equals("member_name")?"selected":"" %>>이름</option>
		      <option value="host_confirm" <%=type!=null&&type.equals("host_confirm")?"selected":"" %>>분류</option>
		      <option value="email" <%=type!=null&&type.equals("email")?"selected":"" %>>이메일</option>
   		</select>
   		
		<div class="search" id="search-member_name">
     		<form action="<%=request.getContextPath()%>/admin/adminSearch">
    			<input type="hidden" name="searchType" value="member_name">
    			<input type="text"  class="searchinput" name="searchKeyword" size="25"
    				value="<%=key!=null&&type!=null&&type.equals("member_name")?key:""%>">
    			<button class="inputButton"></button>
    		</form>
    	</div>
    	<div class="search" id="search-host_confirm">
    		<form action="<%=request.getContextPath()%>/admin/adminSearch">
    			<input type="hidden" name="searchType" value="host_confirm">
    			<input type="text"  class="searchinput" name="searchKeyword" size="25"
    				value="<%=key!=null&&type!=null&&type.equals("host_confirm")?key:""%>">
    			<button class="inputButton"></button>
    		</form>
    	</div>
    	<div class="search" id="search-email">
    		<form action="<%=request.getContextPath()%>/admin/adminSearch">
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
                    <th class="cell2" >회원 번호</th>
                    <th class="cell2" >숙소 번호</th>
                    <th class="cell2" >분류</th>
                    <th class="cell2" >해당 금액</th>
                    <th class="cell3" >날짜</th>
                    <th class="cell3" >보유총금액</th>
                  </tr>
                  
                  <% for (Booking b : list) { %>
                  <% if (b.getPointPlus()!=0 || b.getPointMinus()!=0) {%>
                 
         		<tr>
		            <td class="cell2" ><%=b.getMemberNo() %></td>
		           	<td class="cell2"><%=b.getHouseNo() %></td>
		            <%
		               if (b.getPointPlus()==0 && b.getPointMinus()!=0) {
		            %> 
		          		<td class="cell2">사용</td>
		          		<td class="cell2">-<%=b.getPointMinus() %></td>
		            <%
		               } else if(b.getPointPlus()!=0 && b.getPointMinus()==0){
		            %>
		            	<td class="cell2">적립</td>
		            	<td class="cell2">+<%=b.getPointPlus() %></td>
		            <%
		               }else if(b.getPointPlus()!=0 && b.getPointMinus()!=0){
		           	%>
		            	<td class="cell2">적립&사용</td>
		            	<td class="cell2">+<%=b.getPointPlus() %>,-<%=b.getPointMinus() %></td>
		            <%
		               }
		            %> 
		        
		            <td class="cell3" ><%=b.getReservDate() %></td>
		            <td class="cell3" ><%=b.getTotalPoint() %></td>
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
$(function(){
	let memberName=$("#search-member_name");
	let hostConfirm=$("#search-host_confirm");
	let email=$("#search-email");
	
	$("#searchType").change(e => {
		memberName.css("display","none");
		hostConfirm.css("display","none");
		email.css("display","none");
		let v=$(e.target).val(); 
		$("#search-"+v).css("display","inline-block");
	});
	$("#searchType").change(); 
	
});
</script>

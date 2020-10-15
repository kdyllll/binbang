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
		      <option value="member_no" <%=type!=null&&type.equals("member_no")?"selected":"" %>>회원번호</option>
		      <option value="house_no" <%=type!=null&&type.equals("house_no")?"selected":"" %>>숙소번호</option>
   		</select>
   		
		<div class="search" id="search-member_no">
     		<form action="<%=request.getContextPath()%>/admin/adminSearch">
    			<input type="hidden" name="searchType" value="member_no">
    			<input type="text"  class="searchinput" name="searchKeyword" size="25"
    				value="<%=key!=null&&type!=null&&type.equals("member_no")?key:""%>">
    			<button class="inputButton"></button>
    		</form>
    	</div>
    	<div class="search" id="search-house_no">
    		<form action="<%=request.getContextPath()%>/admin/adminSearch">
    			<input type="hidden" name="searchType" value="house_no">
    			<input type="text"  class="searchinput" name="searchKeyword" size="25"
    				value="<%=key!=null&&type!=null&&type.equals("house_no")?key:""%>">
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
	let memberNo=$("#search-member_no");
	let houseNo=$("#search-house_no");
	
	$("#searchType").change(e => {
		memberNo.css("display","none");
		houseNo.css("display","none");
		let v=$(e.target).val(); 
		$("#search-"+v).css("display","inline-block");
	});
	$("#searchType").change(); 
	
});
</script>

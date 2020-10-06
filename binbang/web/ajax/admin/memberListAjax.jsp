<%@page import="com.binbang.member.model.vo.Member"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/views/common/commonLink.jsp"%>

<%
	List<Member> list = (List) request.getAttribute("memberList");
	List searchCategory = (List) request.getAttribute("searchCategory");
	List cell = (List) request.getAttribute("cell");
	String adminTitle = (String) request.getAttribute("adminTitle");
	String type=request.getParameter("searchType");
 	String key=request.getParameter("searchKeyword");
%>

<div id="AllContents" class="searchCommon">
<p class="pageTitle"><%=adminTitle%></p>


   <select class="searchCategory" name="searchCategory" id="searchType">
      <option value="" selected disabled hidden>선택</option>
      <option value="member_name" <%=type!=null&&type.equals("member_name")?"selected":"" %>><%=searchCategory.get(0)%></option>
      <option value="host_confirm" <%=type!=null&&type.equals("host_confirm")?"selected":"" %>><%=searchCategory.get(1)%></option>
      <option value="enroll_date" <%=type!=null&&type.equals("enroll_date")?"selected":"" %>><%=searchCategory.get(2)%></option>
     
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
    	<div class="search" id="search-enroll_date">
    		<form action="<%=request.getContextPath()%>/admin/adminSearch">
    			<input type="hidden" name="searchType" value="enroll_date">
    			<input type="text"  class="searchinput" name="" size="25"
    				value="<%=key!=null&&type!=null&&type.equals("enroll_date")?key:""%>">
  				<button class="inputButton"></button>  			
    		</form>
    	</div>
        

<div class="tb_wrap">
   <div class="tableDiv">
      <table class="tableAll">
         <tr id="reserveList" class="fixed_top">
            <th class="<%=cell.get(0)%>">회원 번호</th>
            <th class="<%=cell.get(1)%>">회원 분류</th>
            <th class="<%=cell.get(2)%>">회원 이름</th>
            <th class="<%=cell.get(3)%>">이메일</th>
            <th class="<%=cell.get(4)%>">전화번호</th>
            <th class="<%=cell.get(5)%>">가입일</th>

         </tr>
         <%
            for (Member m : list) {
         %>
         <tr>
            <td class="<%=cell.get(0)%>"><%=m.getMemberNo()%></td>
           
            <% 
               if (m.getHostConfirm()!=null) {
            %> 
          		<td class="<%=cell.get(1)%>">호스트</td>
            <%
               } else {
            %>
            	<td class="<%=cell.get(1)%>">일반</td>
            <%
               }
            %> 
             <td class="<%=cell.get(2)%>"><%=m.getMemberName()%></td>
            <td class="<%=cell.get(3)%>"><%=m.getEmail()%></td>
            <td class="<%=cell.get(4)%>"><%=m.getPhone()%></td>
            <td class="<%=cell.get(5)%>"><%=m.getEnrollDate()%></td>
         </tr>
         <%
            }
         %>
      

      </table>
   </div>
</div>
</div>

<script>
$(function(){
	let memberName=$("#search-member_name");
	let hostConfirm=$("#search-host_confirm");
	let enrollDate=$("#search-enroll_date");
	
	$("#searchType").change(e => {
		memberName.css("display","none");
		hostConfirm.css("display","none");
		enrollDate.css("display","none");
		let v=$(e.target).val(); 
		$("#search-"+v).css("display","inline-block");
	});
	$("#searchType").change(); 
	
});
</script>
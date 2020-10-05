<%@page import="com.binbang.member.model.vo.Member"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/views/common/commonLink.jsp"%>

<%
	List<Member> list = (List) request.getAttribute("list");
	List searchCategory = (List) request.getAttribute("searchCategory");
	List cell = (List) request.getAttribute("cell");
	String adminTitle = (String) request.getAttribute("adminTitle");
%>

<div id="AllContents" class="searchCommon">
<p class="pageTitle"><%=adminTitle%></p>
<form action="">

   <select class="searchCategory" name="searchCategory">
      <option value="" selected disabled hidden>선택</option>
      <option value="이름"><%=searchCategory.get(0)%></option>
      <option value="분류"><%=searchCategory.get(1)%></option>
      <option value="가입일"><%=searchCategory.get(2)%></option>
      <!-- 최신순,오래된순 -->
   </select>

   <div class="search">
      <input type="text" class="searchinput">
      <button class="inputButton"></button>
   </div>
</form>

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
         
         <% %>

      </table>
   </div>
</div>
</div>
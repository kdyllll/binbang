<%@page import="com.binbang.member.model.vo.Member"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	List<Member> list = (List) request.getAttribute("list");
	List searchCategory = (List) request.getAttribute("searchCategory");
	List cell = (List) request.getAttribute("cell");
	String adminTitle = (String) request.getAttribute("adminTitle");
%>

<div id="reserveAllContents" class="searchCommon">
  <p class="pageTitle"><%=adminTitle%></p>

  <select class="searchCategory" name="reserveCategory">
    <option value="" selected disabled hidden>선택</option>  
    <option value="예약자 이름"><%=searchCategory.get(0) %></option> 
    <option value="예약 날짜"><%=searchCategory.get(1) %></option>  
    <!-- 최신순,오래된순 -->
    <option value="숙소 번호"><%=searchCategory.get(2) %></option>  
  </select>
  <div class="search">
    <input type="text" class="searchinput">
    <button class="inputButton"></button>
  </div>

  <div class="tb_wrap">
    <div class="tableDiv">
      <table class="tableAll">
        
        <tr class="fixed_top">
          <th class="<%=cell.get(0) %>" >회원 번호</th>
          <th class="<%=cell.get(1) %>" >예약 상태</th>
          <th class="<%=cell.get(2) %>" >예약자 이름</th>
          <th class="<%=cell.get(3) %>" >예약 날짜</th>
          <th class="<%=cell.get(4) %>" >숙소 번호</th>
          <th class="<%=cell.get(5) %>" >호스트 번호</th>
        </tr>
     
     	<%for(Member m : list) {%>
     		<tr>
     			<td class="<%=cell.get(0) %>"></td>
     			<td class="<%=cell.get(1) %>"></td>
     			<td class="<%=cell.get(2) %>"></td>
     			<td class="<%=cell.get(3) %>"></td>
     			<td class="<%=cell.get(4) %>"></td>
     			<td class="<%=cell.get(5) %>"></td>
     		</tr>
     	
     	<%} %>
      </table>
   </div>
  </div>
</div>
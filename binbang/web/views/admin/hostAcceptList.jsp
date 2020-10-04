<%@page import="com.binbang.member.model.vo.Member,com.binbang.host.model.vo.Host"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/views/common/commonLink.jsp"%>

<%
	List<Host> list = (List) request.getAttribute("list");
	List searchCategory = (List) request.getAttribute("searchCategory");
	List cell = (List) request.getAttribute("cell");
	String adminTitle = (String) request.getAttribute("adminTitle");
%>


<p class="pageTitle"><%=adminTitle%></p>


<div class="tb_wrap">
   <div class="tableDiv">
      <table class="tableAll">
         <tr id="reserveList" class="fixed_top">
            <th class="<%=cell.get(0)%>">이름</th>
            <th class="<%=cell.get(1)%>">전화번호</th>
            <th class="<%=cell.get(2)%>">본인사진</th>
            <th class="<%=cell.get(3)%>">신분증사진</th>
            <th class="<%=cell.get(4)%>">요청날짜</th>
            <th class="<%=cell.get(5)%>">승인 여부</th>

         </tr>
        
         <% for (Host h : list) { %>
         <% if(h.getHostConfirm()==null) { %>
         <tr>
            <td class="<%=cell.get(0)%>"><%=h.getMemberName()%></td>
          	<td class="<%=cell.get(1)%>"><%=h.getMemberPhone()%></td> 
            <td class="<%=cell.get(2)%>"><%=h.getProfilePic()%></td>
            <td class="<%=cell.get(3)%>"><%=h.getIdCard()%></td>
            <td class="<%=cell.get(4)%>"><%=h.getHostEnrollDate()%></td>
            <td class="<%=cell.get(5)%>">
            	<div class="acceptChoice">
                	<input type="checkbox" name="accept" value="승인" id="yes">승인
                    <input type="checkbox" name="accept" value="거절" id="no">거절
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

<script>
	$("#yes").click(e=>{
		alert("승인되었습니다");
	})
</script>
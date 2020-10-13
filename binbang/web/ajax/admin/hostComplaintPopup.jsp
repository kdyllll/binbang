<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.binbang.member.model.vo.Complaint"%>
<%@page import="java.util.List"%>
<% Complaint com=(Complaint)request.getAttribute("com");  %>


	<p> <%=com.getMemberEmail() %></p> 
	<p> <%=com.getHostName() %></p>
	<p> <%=com.getComplaintDate() %></p>
	<p> <%=com.getHouseNo() %></p>
	<p> <%=com.getComplaintCategory() %></p>
	<div> <%=com.getComplaintDetail() %></div>

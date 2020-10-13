<%@page import="com.binbang.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Member m = (Member)session.getAttribute("m");
%>
<nav class="headerNav" id="nav">

		<% if(m==null) { %>
		<ul>
			<li><a href="<%=request.getContextPath()%>/member/moveLoginPage">로그인</a></li>
			<li><a href="<%=request.getContextPath()%>/member/memberEnrollChoice">회원가입</a></li>
		</ul>
		<%} else if(m.getEmail().equals("admin@naver.com")) { %>
		<ul>
			<li><a href="<%=request.getContextPath()%>/admin/newMoveAdminPage">관리자페이지</a></li>
			<li><a href="<%=request.getContextPath()%>/member/moveLoginPage">로그아웃</a></li>
		</ul>
		<%} else if(m.getEmail()!=null && !m.getEmail().equals("admin")) {%>
		<ul>
			<li><a href="<%=request.getContextPath()%>/member/myPage?email=<%=m.getEmail()%>">마이페이지</a></li>
			<li><a href="<%=request.getContextPath()%>/member/favoriteFolder?memberNo=<%=m.getMemberNo()%>">관심숙소</a></li>
			<% if(m != null && m.getHostConfirm() == null) {%>
			<li><a href="<%=request.getContextPath()%>/hostEnroll">호스트등록</a></li>
			<%} else if(m.getHostConfirm() != null && m.getHostConfirm().equals("승인")) { %>
			<li><a href="<%=request.getContextPath()%>/host/hostDetail">호스트페이지</a>
			<%} %>
			<li><a href="<%=request.getContextPath()%>/member/logout">로그아웃</a></li>
		</ul>
		<% } %>
		
		<div class="navLine"></div>
		<ul>
			<li><a href="<%=request.getContextPath()%>/notice/noticeList">공지사항</a></li>
			<li><a href="#">챗봇</a></li>
		</ul>

	</nav>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/common/common.css" />
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/common/header.css" />
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/common/footer.css" />
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/common/nav.css" />
    <script src="<%=request.getContextPath() %>/js/common/jquery-3.5.1.min.js"></script> 
    <script src="https://cdn.ckeditor.com/4.15.0/standard/ckeditor.js"></script>
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/notice/noticeDetail.css" />
	
<%@ page import="com.binbang.notice.model.vo.Notice" %>
<% Notice n=(Notice)request.getAttribute("notice");%>
    
</head>
<body>
<div class="wrap">
    <%@ include file="/views/common/header.jsp"%>

      <section class="section">
        
        <div class="allBtns">
          <div class="modifyBtns">
          <% if(m!=null && m.getEmail().equals("admin@naver.com")) {%>
              <div class="modifyNotice"><a href="<%=request.getContextPath() %>/notice/noticeUpdate?noticeNo=<%=n.getNoticeNo() %>">수정</a></div>
              <div class="deleteNotice"><a href="<%=request.getContextPath() %>/notice/noticeDelete?noticeNo=<%=n.getNoticeNo() %>">삭제</a></div>
          <%} %>
          </div>

          <div class="noticeListBtns">
            <div class="prevNotice"><a href="<%=request.getContextPath() %>/notice/prevNoticeView?noticeNo=<%=n.getNoticeNo() %>">이전글</a></div>
            <div class="listNotice"><a href="<%=request.getContextPath() %>/notice/noticeList">목록</a></div>
            <div class="nextNotice"><a href="<%=request.getContextPath() %>/notice/nextNoticeView?noticeNo=<%=n.getNoticeNo() %>">다음글</a></div>
          </div>
        </div>

        <div class="selectNoticeline"></div>
      
      <div class="selectNoticeContent">
           <div class="titleDate">
             <p class="postingTitle"><%=n.getNoticeTitle() %></p>
             <p class="postingDate"><%=n.getNoticeDate() %></p>
           </div>
   
           <div class="selectNoticeline2"></div>
   
  
           <div class="postingContent"><%=n.getNoticeContents() %></div> 
      
          
        </div>
           
        <div class="selectNoticeline"></div>
		
      </section>
      
   <%@ include file="/views/common/footer.jsp"%>
    </div>
   
<script src="<%=request.getContextPath() %>/js/common/header.js"></script>
</body>
</html>

<script>
	
    /* var data = CKEDITOR.instances.editor1.getData(); */

   
    // Your code to save "data", usually through Ajax. */
</script>


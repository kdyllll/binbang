<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/commonLink.jsp" %>
<%@ page import="com.binbang.notice.model.vo.Notice" %>
<% 
	Notice n=(Notice)request.getAttribute("notice");
%>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/notice/noticeDetail.css" />
    
</head>
<body>
<div class="wrap">
    <%@ include file="/views/common/header.jsp"%>

      <section class="section">
        
        <div class="allBtns">
          <div class="modifyBtns">
              <div class="modifyNotice"><a href="#" class="enroll">수정</a></div>
              <div class="deleteNotice"><a href="#" class="enroll">삭제</a></div>
          </div>

          <div class="noticeListBtns">
            <div class="prevNotice"><a href="#" class="enroll">이전글</a></div>
            <div class="listNotice"><a href="<%=request.getContextPath() %>/notice/noticeList" class="enroll">목록</a></div>
            <div class="nextNotice"><a href="#" class="enroll">다음글</a></div>
          </div>
        </div>

        <div class="selectNoticeline"></div>
      
      <div class="selectNoticeContent">
           <div class="titleDate">
             <p class="postingTitle"><%=n.getNoticeTitle() %></p><br>
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

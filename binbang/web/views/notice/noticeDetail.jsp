<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/commonLink.jsp" %>
<%@ page import="com.binbang.notice.model.vo.Notice" %>
<script src="//cdn.ckeditor.com/4.15.0/standard/ckeditor.js"></script>
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
          <% if(m!=null && m.getEmail().equals("admin")) {%>
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

<script>
	
   /*  var data = CKEDITOR.instances.editor1.getData();

   
    // Your code to save "data", usually through Ajax. */
</script>

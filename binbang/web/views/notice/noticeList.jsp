<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/commonLink.jsp" %>
<%@ page import= "com.binbang.notice.model.vo.Notice"%>
<%@ page import= "java.util.List"%>
<%
   String pageBar=(String)request.getAttribute("pageBar");
	Member loginMember=(Member)session.getAttribute("loginMember");
	List<Notice> list=(List)request.getAttribute("list");
%>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/notice/notice.css" />
  </head>
  <body>
    <div class="wrap">
   <%@ include file="/views/common/header.jsp" %>

      <section class="section">
        <p class="title">공지사항</p>
        
        <table class="notice ">
          <tr class="noticeTr">
            <th class="postNumber">번호</th>
            <th class="postCategory">구분</th>
            <th class="postTitle">제목</th>
            <th class="postDate">등록일</th>
          </tr>
                
           <%for(Notice n : list) { %>
            <tr>
            
               <td class="postNumber"><%=n.getNoticeNo() %></td>
               <td class="postCategory"><%=n.getNoticeCategory() %></td>
               <td class="eachPostTitles">
                  <a href="<%=request.getContextPath() %>/notice/noticeDetailView?noticeNo=<%=n.getNoticeNo() %>">
                  <%=n.getNoticeTitle() %>
                  </a>
               </td>
               <td class="postDate"><%=n.getNoticeDate() %></td>
               
            </tr>
             <% } %>
          
        </table>
        
        <!-- 관리자에게만 보이는 버튼 -->
        <div class="postBtn">
           <% if(loginMember!=null&&loginMember.getEmail().equals("admin")) {%> 
           <button  class="postButton" onclick="location.assign('<%=request.getContextPath() %>/notice/noticeWrite')">게시글 등록</button>
            <% } %>
        </div>
     
        <!-- 페이징 처리하기-->
        <div class="pageBar">
          <%=pageBar %>
       </div>
      </section>

 
      <%@ include file="/views/common/footer.jsp"%>
    </div>
   <script src="<%=request.getContextPath() %>/js/common/header.js"></script>
  </body>
</html>

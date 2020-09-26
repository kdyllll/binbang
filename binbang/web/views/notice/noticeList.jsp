<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/commonLink.jsp" %>
<%
   String pageBar=(String)request.getAttribute("pageBar");
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
          <tr class="noticeTr"> 
            <td>1</td>
            <td>중요</td>
            <td class="eachPostTitles">안녕</td>
            <td>2020-09-04</td>
          </tr>   
          <tr class="noticeTr">
            <td>2</td>
            <td>중요</td>
            <td class="eachPostTitles">몸과 마음의 안식처,빈방</td>
            <td>2020-09-04</td>
          </tr>  
             
           <%--for(Notice n : list) {
            <tr>
               <td><%=n.getNoticeNo() %></td>
               <td><%=n.getNoticeCategory()%></td>
               <td>
                  <a href="<%=request.getContextPath()%>/notice/noticeView?noticeNo=<%=n.getNoticeNo() %>">
                  <%=n.getNoticeTitle() %>
                  </a>
               </td>
               <td><%=n.getNoticeDate() %></td>
            </tr>
            } --%> 
        </table>
        
        <!-- 관리자에게만 보이는 버튼 -->
        <div class="postBtn">
           <%--if(loginMember!=null&&loginMember.getUserId().equals("admin")) { --%>
           <button  class="postButton" onclick="location.assign('<%=request.getContextPath() %>/notice/noticeWrite')">게시글 등록</button>
            <%-- } --%> 
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

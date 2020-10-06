<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.binbang.member.model.vo.Member,com.binbang.host.model.vo.Host"%>
<%@page import="java.util.List"%>

<%@ include file="/views/common/commonLink.jsp"%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/manager.css" />
<%
	//List<Member> memberList=(List<Member>)request.getAttribute("memberList");
	//List<Host> hostList = (List<Host>) request.getAttribute("hostList");
//	List cell = (List) request.getAttribute("cell");
//	String adminTitle = (String) request.getAttribute("adminTitle");
//	String memberNo = (String) request.getAttribute("memberNo");
//int result=(int)request.getAttribute("result");
%>

     
  </head>

  <body>
    <div class="wrap">
    <%@ include file="/views/common/adminHeader.jsp"%>

      <section class="section">
        <%@ include file="/views/admin/adminNav.jsp"%>
 
 <form id="acceptListContents" class="searchCommon">
            <p class="pageTitle">호스트 승인</p>
            <!-- 호스트 관리자 승인 후 접속 가능하게 -임시저장..?-->
            <!-- 회원번호,이름,전화번호,신분증사진,본인사진, 가입날짜 -->
            <!-- 수락,거절 시 안내 메일가기 -->
            <div class="tb_wrap">
              <div class="tableDiv" >
                <table class="tableAll">
                  <tr class="fixed_top">
                    <th class="cell1">이름</th>
                    <th class="cell3">전화번호</th>
                    <th class="cell3">본인사진</th>
                    <th class="cell3">신분증사진</th>
                    <th class="cell2">요청날짜</th>
                    <th class="cell2">승인 여부</th>
                  </tr>
              
                </table>
              </div>
            </div>
          </form>
    </section>
    </div>

    <%@ include file="/views/common/footer.jsp"%>
    <script src="<%=request.getContextPath() %>/js/common/header.js"></script>
    <script src="<%=request.getContextPath() %>/js/admin/manager.js"></script>


  </body>
</html>
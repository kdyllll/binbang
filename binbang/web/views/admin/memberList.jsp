<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.binbang.member.model.vo.Member,com.binbang.host.model.vo.Host"%>
<%@page import="java.util.List"%>

<%@ include file="/views/common/commonLink.jsp"%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/manager.css" />
<%
//	List<Member> memberList=(List<Member>)request.getAttribute("memberList");
//	List<Host> hostList = (List<Host>) request.getAttribute("hostList");
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

        <!-- 회원현황 -->

          <form id="memberAllContents" class="searchCommon">
            <p class="pageTitle">회원 현황</p>
         
              <select class="researchCategory" name="membercategory">
                <option value="" selected disabled hidden>선택</option>  
                <option value="member_no">이름</option> 
                <option value="분류">분류</option>  
                <option value="가입일">가입일</option>  
                <!-- 최신순,오래된순 -->
              </select>
              <div class="search">
                <input type="text" class="searchinput">
                <button class="inputButton"></button>
              </div>
            

            <div class="tb_wrap"> 
              <div class="tableDiv">
                <table class="tableAll">
                  
                  <tr class="fixed_top">
                    <th class="cell1" >회원 번호</th>
                    <th class="cell2" >회원 분류</th>
                    <th class="cell2" >회원 이름</th>
                    <th class="cell4" >이메일</th>
                    <th class="cell2" >전화번호</th>
                    <th class="cell3" >가입일</th>
                  </tr>
                  
                 <%--
            		for (Member ml : memberList) {
        		 --%>
         		<!--<tr>
		            <td class="cell1" ><%--ml.getMemberNo()%></td>
		           
		            <%--
		               if (ml.getHostConfirm()!=null) {
		            --%> 
		          		<td class="cell2">호스트</td>
		            <%--
		               } else {
		            --%>
		            	<td class="cell2">일반</td>
		            <%--
		               }
		            --%> 
		             <td class="cell2" ><%--ml.getMemberName()--%></td>
		            <td class="cell4" ><%--ml.getEmail()--%></td>
		            <td class="cell2" ><%--ml.getPhone()--%></td>
		            <td class="cell3" ><%--ml.getEnrollDate()--%></td>
		         </tr> -->
		         <%--
		            }
		         --%>
         
         
           

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




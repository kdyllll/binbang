<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.binbang.member.model.vo.Member,com.binbang.host.model.vo.Host"%>
<%@page import="java.util.List"%>

<%@ include file="/views/common/commonLink.jsp"%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/manager.css" />
<%
	List<Member> memberList=(List<Member>)request.getAttribute("memberList");
	List<Host> hostList = (List<Host>) request.getAttribute("hostList");
//	List cell = (List) request.getAttribute("cell");
//	String adminTitle = (String) request.getAttribute("adminTitle");
//	String memberNo = (String) request.getAttribute("memberNo");
//int result=(int)request.getAttribute("result");
%>

     
  </head>

  <body>
    <div class="wrap">
    <%@ include file="/views/common/header.jsp"%>

      <section class="section">
        
        <div class="sidebar">

          <ul id="menuAll">
            <li id="memberAll" class="clickList" onclick="memberList();">회원 현황</li>

            <li id="reserveAll" >예약 현황</li>
            <li id="hostAll" onclick="slideMenu(event);">호스트 관리
              <ul id="subAll">
                <li id="hostList">호스트 목록</li>
                <li id="acceptList" onclick="acceptList();">호스트 승인</li>
                <li id="blackList">호스트 신고</li>
              </ul>
            </li>
          </ul>
        </div>

        <!-- 회원현황 -->

          <form id="memberAllContents" class="searchCommon">
            <p class="pageTitle">회원 현황</p>
            
              <!-- <div class="test"> -->
              <select class="researchCategory" name="membercategory">
                <option value="" selected disabled hidden>선택</option>  
                <option value="이름">이름</option> 
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
                  
                  <%
            		for (Member ml : memberList) {
        		 %>
         		<tr>
		            <td class="cell1" ><%=ml.getMemberNo()%></td>
		           
		            <% 
		               if (ml.getHostConfirm()!=null) {
		            %> 
		          		<td class="cell2">호스트</td>
		            <%
		               } else {
		            %>
		            	<td class="cell2">일반</td>
		            <%
		               }
		            %> 
		             <td class="cell2" ><%=ml.getMemberName()%></td>
		            <td class="cell4" ><%=ml.getEmail()%></td>
		            <td class="cell2" ><%=ml.getPhone()%></td>
		            <td class="cell3" ><%=ml.getEnrollDate()%></td>
		         </tr>
		         <%
		            }
		         %>
         
           

                </table>
              </div>
            </div>
          </form>

          <!-- 예약 현황 -->
          <form id="reserveAllContents" class="searchCommon">
            <p class="pageTitle">예약 현황</p>
            
              <select class="researchCategory" name="reserveCategory">
                <option value="" selected disabled hidden>선택</option>  
                <option value="예약자 이름">예약자 이름</option> 
                <option value="예약 날짜">예약 날짜</option>  
                <!-- 최신순,오래된순 -->
                <option value="숙소 번호">숙소 번호</option>  
              </select>
              <div class="search">
                <input type="text" class="searchinput">
                <!-- <a href=""><img src="search.png" alt=""></a> -->
                <button class="inputButton"></button>
              </div>
           
            <div class="tb_wrap">
              <div class="tableDiv">
                <table class="tableAll">
                  
                  <tr class="fixed_top">
                    <th class="cell1" >회원 번호</th>
                    <th class="cell3" >예약 상태</th>
                    <th class="cell3" >예약자 이름</th>
                    <th class="cell3" >예약 날짜</th>
                    <th class="cell2" >숙소 번호</th>
                    <th class="cell2" >호스트 번호</th>
                  </tr>
                  <tr>
                    <td class="cell1">1</td>
                    <td class="cell3">예약중</td>
                    <td class="cell3">한수경</td>
                    <td class="cell3">2020-09-08</td>
                    <td class="cell2">10</td>
                    <td class="cell2">3</td>
                  </tr>
                  <tr>
                    <td class="cell1">1</td>
                    <td class="cell3">예약완료</td>
                    <td class="cell3">한수경</td>
                    <td class="cell3">2020-09-08</td>
                    <td class="cell2" >10</td>
                    <td class="cell2">3</td>
                  </tr>
                </table>
             </div>
            </div>
          </form>

          <!-- 호스트 목록 -->
          <div id="hostListContents" class="searchCommon">
            <p class="pageTitle">호스트 목록</p>
            <form action="">
              <select class="researchCategory" name="hostCategory">
                <option value="" selected disabled hidden>선택</option>  
                <option value="호스트 번호">호스트 이름</option>  
                <option value="신고 누적 횟수">신고 누적 횟수</option>  
                <option value="블랙리스트 여부">블랙리스트 여부</option>  
                <!-- <option value="보유 숙소 개수">보유 숙소 개수</option>   -->
              </select>
              <div class="search">
                <input type="text" class="searchinput">
                <button class="inputButton"></button>
              </div>
            </form> 

            <div class="tb_wrap">
              <div class="tableDiv" >
               <table class="tableAll">
                  <tr class="fixed_top">
                    <th class="cell2">회원 번호</th>
                    <th class="cell2">호스트 번호</th>
                    <th class="cell2">이름</th>
                    <th class="cell4">이메일</th>
                    <th class="cell2">신고 누적 횟수</th>
                    <th class="cell2">블랙리스트 여부</th>
                  </tr>
                  <tr>
                    <td class="cell2">1</td>
                    <td class="cell2">3</td>
                    <td class="cell2">한수경</td>
                    <td class="cell4">gkstnr2668@gmail.com</td>
                    <td class="cell2">0</td>
                    <td class="cell2">N</td>
                 </tr>
                </table>
             </div>
            </div>
         </div>

          <!-- 호스트 승인 -->
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

          <!-- 호스트 신고 -->
          <div id="blackListContents" class="searchCommon">
            <p class="pageTitle">호스트 신고 관리</p>
            <form action="">
              <select class="researchCategory" name="complainCategory">
                <option value="" selected disabled hidden>선택</option>  
                <option value="신고된 호스트">신고된 호스트</option>  
                <option value="신고 날짜">신고 날짜</option>   
              </select>
              <div class="search">
                <input type="text" class="searchinput">
                <button class="inputButton"></button>
                <!-- <button class="removeAll">처리완료 목록 삭제</button> -->
              </div>
            </form>
            
            <div class="tb_wrap">
              <div class="tableDiv" >
                <table class="tableAll">
                  <tr class="fixed_top">
                    <th class="cell1">신고자</th>
                    <th colspan="2" class="cell5">신고사유</th>
                    <th class="cell2">신고된 호스트</th>
                    <th class="cell2">신고날짜</th>
                    <th class="cell4">신고처리상황</th>
                  </tr>
                  <tr>
                    <td class="cell1">김다예</td>
                    <td class="cell2 complainCategory">허위정보, 청결, 안전위협</td>
                    <td class="cell3 complainReason">침대가 2개라고 하셨는데 하나는 침대가 아니라 소파더라구요</td>
                    <td class="cell2">인하준</td>
                    <td class="cell2">2020-09-09</td>
                    <td class="complainCurrent cell4">
                      <div class="complainChoice">
                        <input type="checkbox" name="complain" value="신고" id="complain">신고
                        <input type="checkbox" name="complain" value="취소" id="cancel">취소
                        <input type="checkbox" name="complain" value="권한박탈" id="out">권한박탈
                      </div>
                    </td>
                  </tr>
                </table>
              </div>
            </div>
            <!-- 팝업 -->
            <div class="enrollbg">
              <div id="popup">
               
                <div class="popupHead"><p class="popupTitle">신고 내역</p></div>
                <div class="popupBtn">x</div>
              
                <div class="popupContent">
                    
                    <p class="complainTitle">신고한 회원 아이디 :</p> 
                    <p class="complainTitle">호스트 아이디 : </p>
                    <p class="complainTitle">신고 날짜 : </p>
                    <p class="complainTitle eachComplainReason">신고 사유 : </p>
                    <p class="eachComplainCategory">허위 정보</p>
                    <div class="reasonBox">
                        침대가 2개라고 하셨는데 하나는 침대가 아니라 소파더라구요..
                        그 외에도 오션뷰라고 하셨는데 창문 틈 사이로 희미하게 바다가 보인다든지
                        화장실도 하나는 문을 막아놓으시는 등 허위정보들이 여러 개 있었습니다..
                        호스트에게 직접 문의를 해도 답변이 없었던 부분이 제일 화가 났습니다ㅠㅠ 
                    </div>
                
              </div>
        
              </div>
            </div>

          </div>
      </section>

    </div>
    <%@ include file="/views/common/footer.jsp"%>
    <script src="<%=request.getContextPath() %>/js/common/header.js"></script>
    <script src="<%=request.getContextPath() %>/js/admin/manager.js"></script>


  </body>
</html>

<%-- <script>
	function memberList(){
		$("#memberAllContents").attr("action","<%=request.getContextPath()%>/admin/memberListAjax").submit();
	}
	function acceptList(){
		$("#acceptListContents").attr("action","<%=request.getContextPath()%>/admin/hostAcceptListAjax").submit();
	}
	
	
</script> --%>

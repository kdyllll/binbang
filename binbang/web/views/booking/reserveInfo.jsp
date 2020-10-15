<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.binbang.house.model.vo.House,com.binbang.booking.model.vo.Booking,com.binbang.member.model.vo.Member"%>
    <%
	    String guestName = (String)request.getAttribute("guestName");
	    String houseName = (String)request.getAttribute("houseName");
	    String in = (String)request.getAttribute("in");
	    String out1 = (String)request.getAttribute("out1");
	    int pnum = (int)request.getAttribute("pnum");
	    String pay = (String)request.getAttribute("pay");
	    int price = (int)request.getAttribute("price");
	    int totalPoint = (int)request.getAttribute("totalPoint");
    %>

<%@ include file="/views/common/commonLink.jsp" %>
<title>booking</title>
<link rel="stylesheet"
   href="<%=request.getContextPath()%>/css/booking/reserveInfo.css" />
 <link rel="stylesheet" href="<%=request.getContextPath() %>/css/common/bookingHeader.css" />

<body>
   <div class="wrap">
        <%@ include file="/views/common/bookingHeader.jsp" %>
      <section class="section">

         <div class="bookingInfo">
            <div class="title">
               예약정보 <br>
               <br>
            </div>
            <div class="infoBox">
               <div class="info">
                  <div>숙소 명 :  <%=houseName%></div>
                  <div>숙박 기간 : <%=in%> ~ <%=out1%></div>
                  <div>게스트 이름 : <%=guestName %></div>
                  <div>인원 : <%=pnum %>명</div>
                  <div>적립금 : <%=totalPoint %>원</div>
                  <div>결제 방법 : <%=pay %></div>
                  <div class="priceLine">
                     <div class="priceInfoBox">
                        <div class="priceInfo">￦<%=price %></div>
                     </div>
                  </div>
                  <div> 무통장 입금의 경우 1~3일 정도의 승인기간이 필요합니다. 추후 마이페이지 에서 확인하세요 </div>
               </div>
            </div>
            <div class="moveBox">
               <a href="<%=request.getContextPath()%>/mainMove" class="mainPage">
                  <div class="main">메인페이지</div>
               </a> 
                <a href="<%=request.getContextPath()%>/member/myPage" class="myPage">
                  <div class="my">마이페이지</div>
               </a>
            </div>
         </div>

      </section>
      <%@ include file="/views/common/footer.jsp"%>
   </div>
   <script src="<%=request.getContextPath()%>/js/common/header.js"></script>
</body>
</html>

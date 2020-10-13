<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.binbang.house.model.vo.House,com.binbang.booking.model.vo.Booking,com.binbang.member.model.vo.Member"%>
    <%
    	House h=(House)request.getAttribute("house");
    	Booking b=(Booking)request.getAttribute("booking");
    	Member m2 = (Member) session.getAttribute("m");
    	String in=(String) request.getAttribute("checkIn");
    	String out1=(String) request.getAttribute("checkOut");
    	String price=(String) request.getAttribute("totalPrice");
   	 	String totalPoint=(String) request.getAttribute("totalPoint");
   	 	String totalPoints=(String) request.getAttribute("totalPoints");
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
                  <div>예약 번호 : <%-- <%=b.getReservationNo()%> --%> </div>
                  <div>숙소 명 :  <%=h.getHouseName()%></div>
                  <div>숙박 기간 : <%=in%> ~ <%=out1%></div>
                  <div>예약자 이름 : <%=m2.getMemberName() %></div>
               	  <div>예약자 번호 : <%-- <%=b.getReservationNo()%> --%></div>
                  <div>인원 : <%-- <%=b.getGuestPnum() %> 명 --%></div>
                  <div>적립금 : <%=totalPoint %> point</div>
                  <div>결제 방법 : <%-- <%=b.getPaymentOption() %> --%></div>
                  <div class="priceLine">
                     <div class="priceInfoBox">
                        <div class="priceInfo">￦ <%=price%> </div>
                     </div>
                  </div>
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

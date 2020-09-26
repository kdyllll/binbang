<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/commonLink.jsp" %>
<title>booking</title>
<link rel="stylesheet"
   href="<%=request.getContextPath()%>/css/booking/reserveInfo.css" />
  <link rel="stylesheet" href="<%=request.getContextPath() %>/css/common/bookingHeader.css" />

<body>
   <div class="wrap">
      <%@ include file="/views/common/bookingHeader.jsp"%>
      <section class="section">

         <div class="bookingInfo">
            <div class="title">
               예약정보 <br>
               <br>
            </div>
            <div class="infoBox">
               <div class="info">
                  <div>예약 번호 : 37394750</div>
                  <div>숙소 명 : 써니 마인드 업</div>
                  <div>숙박 기간 : 2020 년 09 월 23일 ~ 2020 년 09 월 24일</div>
                  <div>예약자 이름 : 김다예</div>
                  <div>예약자 번호 : 47502649</div>
                  <div>인원 : 2 명</div>
                  <div>결제 방법 : 신용카드</div>
                  <div class="priceLine">
                     <div class="priceInfoBox">
                        <div class="priceInfo">￦150,000 × 1박 → ￦150,000</div>
                     </div>
                  </div>
               </div>
            </div>
            <div class="moveBox">
               <a href="#" class="mainPage">
                  <div class="main">메인페이지</div>
               </a> <a href="#" class="myPage">
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

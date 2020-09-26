<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/commonLink.jsp" %>

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
            <div class="listNotice"><a href="#" class="enroll">목록</a></div>
            <div class="nextNotice"><a href="#" class="enroll">다음글</a></div>
          </div>
        </div>

        <div class="selectNoticeline"></div>
      
      <div class="selectNoticeContent">
           <div class="titleDate">
             <p class="postingTitle">숙박쿠폰 이용안내</p><br>
             <p class="postingDate">2020-09-04</p>
           </div>
   
           <div class="selectNoticeline2"></div>
   
           <div class="postingContent">
              
              <p>빈방 사이트를 통해 완료돤 예약에 한하여, <b>10박 당 숙박쿠폰 한 개</b>가 지급됩니다.<br>
              <br> 숙박 쿠폰은 가격 제한 없이 이용하실 수 있으며<strong> 한 건의 예약당 총 한 개의 숙박쿠폰만 사용</strong>하실 수 있습니다.&nbsp;</p>
<br>
<p>숙박쿠폰의 사용기한은 회원 탈퇴 시까지 적용됩니다.</p>
<br>
<p>숙박쿠폰을 통한 예약의 경우, 숙박 요금에 대해선 빈방에서 부담하며 해당 호스트에겐 어떠한 불이익도 없음을 알려드립니다.&nbsp;&nbsp;</p>


              
           </div>
        </div>

        <div class="selectNoticeline"></div>

      </section>
      
   <%@ include file="/views/common/footer.jsp"%>
    </div>
   
<script src="<%=request.getContextPath() %>/js/common/header.js"></script>
</body>
</html>

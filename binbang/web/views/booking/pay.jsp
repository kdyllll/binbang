<!DOCTYPE html>
<html>
  <head>
  </head>
  <body>
  


  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-x.y.z.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@page import="com.binbang.house.model.vo.House,com.binbang.booking.model.vo.Booking,com.binbang.member.model.vo.Member"%>
<%
	 String no = (String)request.getAttribute("houseNo");
	 Member m2 = (Member) session.getAttribute("m");
	 Booking b=(Booking)request.getAttribute("b");
	 String in=(String) request.getAttribute("checkIn");
	 String out1=(String) request.getAttribute("checkOut");
	 String price=(String) request.getAttribute("totalPrice");
	 String oriPrice=(String) request.getAttribute("oriPrice");
	 String totalPoint=(String) request.getAttribute("totalPoint");
	 String memberNo=(String) request.getAttribute("m");
	 String totalPoints=(String)request.getParameter("totalPoints");
%>
<div class="request_pay"></div>
<script>
IMP.init('imp27633438');
IMP.request_pay({
    pg : 'html5_inicis',
    pay_method : 'card',
    merchant_uid : 'merchant_' + new Date().getTime(),
    name : '주문명:결제테스트',
    amount : <%=price%>,
    buyer_email : 'iamport@siot.do',
    buyer_name : '구매자이름',
    buyer_tel : '010-8801-0923',
    buyer_addr : '서울특별시 강남구 삼성동',
    buyer_postcode : '123-456',

}, function(rsp) {
    if ( rsp.success ) {
        var msg = '결제가 완료되었습니다.';
        msg += '고유ID : ' + rsp.imp_uid;
        msg += '상점 거래ID : ' + rsp.merchant_uid;
        msg += '결제 금액 : ' + rsp.paid_amount;
        msg += '카드 승인번호 : ' + rsp.apply_num;
        location.assign("<%=request.getContextPath()%>/booking/reservation?houseNo=<%=no%>&checkIn=<%=in%>&checkOut=<%=out1%>&totalPrice=<%=price%>&totalPoint=<%=totalPoint%>&m=<%=m2.getMemberNo()%>");//레져베이션으로 가는구문

        
      
    } else {
        var msg = '결제에 실패하였습니다.';
        msg += '에러내용 : ' + rsp.error_msg;
        location.assign("<%=request.getContextPath()%>/booking/booking?houseNo=<%=no%>&checkIn=<%=in%>&checkOut=<%=out1%>&totalPrice=<%=oriPrice%>&totalPoint=<%=totalPoint%>");//부킹으로 가는구문 
       

    }

    alert(msg);
    
    
   
   
});

function test() {	
	var finalPoint = <%=totalPoint%> + <%=totalPoints%>;	

}



</script>

  </body>
</html>
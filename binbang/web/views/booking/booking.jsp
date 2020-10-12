<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page
	import="com.binbang.house.model.vo.House,com.binbang.booking.model.vo.Booking"%>
<%
	House h = (House) request.getAttribute("house");
	Member m2 = (Member) session.getAttribute("m");
	Booking b = (Booking) request.getAttribute("b");
	String houseNo = (String) request.getAttribute("houseNo");
	String in = (String) request.getAttribute("checkIn");
	String out1 = (String) request.getAttribute("checkOut");
	String price = (String) request.getAttribute("totalPrice");
%>


<%@ include file="/views/common/commonLink.jsp"%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/booking/booking.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/booking/bookingPopup.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/common/bookingHeader.css" />
<script
	src="<%=request.getContextPath()%>/js/common/jquery-3.5.1.min.js"></script>
<body>
	<div class="wrap">
		<%@ include file="/views/common/bookingHeader.jsp"%>
		<section class="section">
			<form action="<%=request.getContextPath()%>/booking/bookingFinal" method="post">
				<div class="reservation">
					<ul>
						<li>예약자 이름 :<%=m2.getMemberName()%><%=m2.getMemberNo() %>
						</li>
						<br>
						<br>
						<li>회원 번호 : <%=m2.getMemberNo()%></li>
						<br>
						<br>
						<li>이메일 :<%=m2.getEmail()%></li>
						<br>
						<br>

					</ul>
					<div class="personnel">
						인원: <label class="personnel1" for="card">성인</label> <input
							class="personnel1" type="number" name="nval" min="0" max="10"
							step="1" value="0"> <label class="personnel1" for="card">소아</label>
						<input class="personnel1" type="number" name="nval" min="0"
							max="10" step="1" value="0"> <label class="personnel1"
							for="card">유아</label> <input class="personnel1" type="number"
							name="nval" min="0" max="10" step="1" value="0">
					</div>

					<br>
					<br>
					<p class="point">총 포인트 : <div class="totalPoints"><%=m.getTotalPoint() %></div></p>
					<br>
					<br>
					<div class="cuphone">
					
						포인트사용 : <input class="pointWriter" name="point" type="text"
							placeholder="사용할 포인트를 입력하세요"> 
							<input class="personnel1" type="button" onclick="test();" value="사용하기">
					</div>
					<br>
					<div class="payMent">
						결제방법 :
						<div class="payments">
							<label><input type="radio" name="pay" value="card"
								id="card">신용카드</label> <label><input type="radio"
								name="pay" value="bankTransfer" id="bankTransfer">무통장입금</label>
						</div>
					</div>
					<br> <br>
					<div class="guidanceBox">
						<div class="guidanceLine">
							한 번 더 확인해주세요! <br>
							<%=h.getHouseName()%>은(는) 많은 여행자가 다녀가는 공간이기에 몇 가지 이용 수칙이 있습니다. <br>당일
							예약, 입실은 불가능합니다. <br>체크인 시간 및 체크아웃 시간은
							<%=h.getInoutTime()%>
							입니다. <br>
							<%=h.getHouseName()%>의 전 객실은 기본 2인을 기준으로 합니다.<br> (1인 만원
							추가, 최대 4인)
							<%=h.getHouseName()%>는 13~19세의 미성년자는 보호자 동반 시에만 숙박이 가능합니다 . <br>사전
							예약된 숙박인원 외 방문자 입실은 불가하며 이에 따른 책임은 게스트에게 있습니다. <br>(위반시 퇴실조치
							되오니 유의해주세요.) <br>건물 앞 흡연과 실내 흡연은 엄격히 금지됩니다. <br>(담배꽁초
							민원이 들어옵니다. 실내흡연시엔 10만원의 청소비를 부담하게 됩니다. 전자담배포함) 실내에서 냄새나 연기가 많이 나는
							구이류(생선, 고기) 요리를 하실 수 없습니다. <br><%=h.getAttention()%>
							<br>2박 숙박시, 수건 교체와 청소는 제공되지 않고 3박 이상 숙박시 침구 및 수건 교체와 청소가
							제공됩니다. <br>안전을 위한 CCTV가 2층 현관 앞에 설치되어 있습니다. 해변 이용 시 1층 카페 옆
							수고에서 모래와 바닷물을 충분히 제거하시고 입장하세요. <br>(모래로 인해 샤워 시 배수구가 막히게
							됩니다.) 사전에 협의되지 않은 상업 사진, 영상 촬영 (광고, 제품사진, 쇼핑몰, SNS 마켓)은 불가합니다. <br>시설,
							집기의 훼손 또는 파손시 경우에 따라 변상비를 청구할 수 있습니다. <br>(오염이나 훼손, 파손 시
							매니저에게 필히 알려주세요.) 헤어 염색으로 인한 타월 오염이 예상될 경우 미리 말씀해주세요. (짙은색 타월로
							교체해드립니다.) <br>모든 제품은 써니 사이드업 내에서만 사용 가능하며 외부로 가져가실 수 없습니다. <br>계단이
							미끄럽습니다. 비오는 날 각별히 주의하세요. (날씨가 좋지 않은 날에는 옥상 출입이 금지됩니다.) <br>실내에서
							성냥, 라이터, 초 등 화기 사용은 제한됩니다. <br> <br>위의 사항은 엄격히 관리하고
							있습니다. 위반 시, 강제퇴실과 위약금이 발생하니 소중하게 사용해주세요.
						</div>
					</div>
					<div class="refund">
						환불규정 <br> 환불 시 아래의 기준일에 따른 환불 금액을 드립니다. <br>이용 10일전까지 총
						결제금액의 100% 환불 <br>이용 9일전까지 총 결제금액의 90% 환불 <br>이용 8일전까지 총
						결제금액의 80% 환불 <br>이용 7일전까지 총 결제금액의 70% 환불 <br>이용 6일전까지 총
						결제금액의 60% 환불 <br>이용 5일전까지 총 결제금액의 50% 환불 <br>이용 4일전까지 총
						결제금액의 40% 환불 <br>이용 3일전부터 변경 / 환불 불가
					</div>
				</div>

				<div class="guestRoom">
					<div class="guestInfo">
						객실정보
						<div class="guestInfo2">
							<div><%=h.getHouseName()%></div>
							<br>
							<div><%=h.getHouseComment()%></div>
							<br>
							<div class="reservationDay">
								<div>[ <%=in%> ~ <%=out1%> ]</div>
							</div>
							<br>
							<div class="housePrice"><%=price%></div>
							<br>
							<div class="payInfoBox">
								<div class="payInfo" method="POST">
									결제 약관 정보 <br> <input type="checkbox" name="check"
										value="전체동의" id="check"> <label for="check">결제약관(개인정보)전체동의</label>
									<div class="guidance">체크인 5일 전까지 결제 취소 시 전액환불처리됩니다.</div>
									<div class="guidanceDetails">
										<!-- js에 연결해놓음 -->
										자세히보기
									</div>
								</div>

							</div>
							<div class="payBox">
								<div class="pay">
								 <a href="<%=request.getContextPath()%>/booking/bookingFinal?houseNo=<%=h.getHouseNo()%>&checkIn=<%=in%>&checkOut=<%=out1%>&totalPrice=<%=price%>">booking</a> 
									<input type="hidden" name="houseNo" value="<%=h.getHouseNo()%>">
									<input type="hidden" name="originalPrice" value="<%=price%>">
									<input type="hidden" name="checkIn" value="<%=in%>">
									<input type="hidden" name="checkOut" value="<%=out1%>">
									<input type="hidden" class="totalPoint" name="totalPoint">
									<input type="hidden" class="totalPrice" name="totalPrice" value="">
									<input type="hidden" class="memberNo" name="memberNo" value="<%=m2%>">
									<input type="submit" value="Booking">
								</div>
							</div>

						</div>
					</div>

				</div>



				<div class="enrollbg">
					<div id="popup">
						<div class="color"></div>
						<div class="popupBtn">x</div>
						<div class="popupContent">
							<p class="popupTitle">자세히 보기</p>
							<div class="reasonBox">
								제 1조 (총칙) 개인정보란 생존하는 개인에 관한 정보로서 당해 정보에 포함되어 있는 성명, 주민등록번호 등의
								사항에 의하여 당해 개인을 식별할 수 있는 정보 (당해 정보만으로는 특정 개인을 식별할 수 없더라도 다른 정보와
								용이하게 결합하여 식별할 수 있는 것을 포함합니다.) 를 말합니다. <br> <br> 빈방은
								귀하의 개인정보 보호를 매우 중요시하며, ‘정보통신망 이용촉진 및 정보보호에 관한 법률’ 상의 개인정보 보호규정 및
								정보통신부가 제정한 ‘개인정보 보호지침’을 준수하고 있습니다. 빈방은 개인정보취급방침을 정하고 이를 귀하께서 언제나
								쉽게 확인할 수 있게 공개하도록 하고 있습니다. <br> <br> <br> 빈방은
								개인정보 처리방침의 지속적인 개선을 위하여 개정하는데 필요한 절차를 정하고 있으며, 개인정보 처리방침을 회사의
								필요한 사회적 변화에 맞게 변경할 수 있습니다. <br> <br> 그리고 개인정보처리방침을
								개정하는 경우 버전번호 등을 부여하여 개정된 사항을 귀하께서 쉽게 알아볼 수 있도록 하고 있습니다. <br>
								<br> 제 2조 (수집하는 개인정보 항목 및 수집방법) 빈방은 별도의 회원가입 절차 없이 대부분의
								컨텐츠에 자유롭게 접근할 수 있습니다. <br> <br> 빈방에서 예약 및 프로모션. 이벤트
								서비스를 이용하시고자 할 경우 다음의 정보를 입력해주셔야 합니다.<br> <br> 입력항목 :
								희망ID, 비밀번호, 성명, 이메일주소 또한 서비스 이용과정이나 사업 처리 과정에서 아래와 같은 정보들이 생성되어
								수집될 수 있습니다. <br> <br> 최근접속일, 접속 IP 정보, 쿠키, 구매로그, 이벤트로그
								회원가입 시 회원이 원하시는 경우에 한하여 추가 정보를 선택, 제공하실 수 있도록 되어있으며, 일부 재화 또는 용역
								상품에 대한 주문 및 예약 시 회원이 원하는 정확한 주문 내용 파악을 통한 원활한 고객 응대 및 예약 처리를 위하여
								추가적인 정보를 요구하고 있습니다. <br> <br> 빈방은 다음과 같은 방법으로 개인정보를
								수집합니다.
							</div>
						</div>

					</div>
				</div>
			</form>

		</section>

		<%@ include file="/views/common/footer.jsp"%>
	</div>
	<script>

	function test() {	

		//housePrice에 초기값 넣어줌. 중복안되게
		$(".housePrice").html('<%=price%>');
		//point value를 가져옴 => 너거 text넣은 값
		let point = $(".pointWriter").val();
		//기본값
		let price = $(".housePrice").html();
		//결과는 기본값 - 포인터차감
		let result = <%=price%> - point;	
		let totalPoint = result * 2;
		let totalPoints = <%=m.getTotalPoint()%> - point;
		//눈으로 확인하기위해
		$(".housePrice").html(result);
		$(".totalPrice").val(result);
		$(".totalPoint").val(totalPoint);
		$(".totalPoints").html(totalPoints);
		console.log(result);

	}
	
	

  
</script>
	<script src="<%=request.getContextPath()%>/js/common/header.js"></script>
	<script src="<%=request.getContextPath()%>/js/booking/bookingPopup.js"></script>
	<script src="<%=request.getContextPath()%>/js/booking/booking.js"></script>
	<script src="<%=request.getContextPath()%>/js/booking/pay.js"></script>
</body>


</html>
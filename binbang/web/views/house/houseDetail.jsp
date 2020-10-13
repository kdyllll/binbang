
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page
	import="java.util.List,com.binbang.house.model.vo.House,com.binbang.house.model.vo.Review,com.binbang.booking.model.vo.Booking"%>


<%
	House h = (House) request.getAttribute("house");
Booking b = (Booking) request.getAttribute("booking");
Double grade = (Double) request.getAttribute("grade");
Member m2 = (Member) session.getAttribute("m");
List<Review> list = (List) request.getAttribute("list");
String in = (String) request.getAttribute("checkIn");
String out1 = (String) request.getAttribute("checkOut");
String price = (String) request.getAttribute("totalPrice");
%>

<%
	/*  String[] filter = new String[] { "bathRoom.png", "bbq.png", "breakfast.png", "dog.png", "kitchen.png",
    "laundrtRoom.png", "park.png", "parking.png", "projector.png", "refrigerator.png", "shower.png", "smoking.png",
    "swimming.png", "terrace.png", "wifi.png" }; */
%>



<%@ include file="/views/common/commonLink.jsp"%>


<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.0/css/swiper.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.0/js/swiper.min.js"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.0/js/swiper-bundle.min.js"></script>


<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/house/searchBox.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/house/Filter.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/house/houseSwiper.css" />
<title>house_regist</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/house/houseDetail.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/house/housePopup.css" />

</head>

<body class="body">
	<div class="wrap">
		<header class="header headerColor">
			<a href="<%=request.getContextPath()%>/mainMove" class="logo"></a>
			<div class="searchBox"></div>
			<div class="headerBox displayNone">
				<a href="#test" class="infoFilter"> 정보 </a> <a href="#"
					class="reviewFilter"> 후기 </a> <a href="#" class="photoFilter">
					주변시설 </a>
			</div>
			<div class="headerBtn" id="headerBtn">
				<div class="ham mainHamColor"></div>
				<div class="ham mainHamColor"></div>
				<div class="ham mainHamColor"></div>

			</div>
			<%@ include file="/views/common/nav.jsp"%>
		</header>

		<section class="section">
			<div class="mainBox">
				<div class="swiper-container first">
					<div class="swiper-wrapper">
						<%
					
						for (int i=0;i<h.getHousePicture().length;i++) {
							if(h.getHousePicture()[i]!=null){
						%>
						<div class="swiper-slide">
							<img
								src="<%=request.getContextPath()%>/upload/house/<%=h.getHousePicture()[i]%>"
								style="width: 100%; height: 100%;">
						</div>
						<%	}
						}
						%>

					</div>
					<!-- Add Arrows -->
					<div class="swiper-button-next"></div>
					<div class="swiper-button-prev"></div>
					<!-- Add Pagination -->
					<div class="swiper-pagination"></div>
				</div>

				<div class="info">
					<div class="title">

						<%=h.getHouseName()%>


						<div class="heartCommon heart"></div>
					</div>
					<br> <br> <br>
					<div class="titleInfo">
						<%=h.getHouseComment()%>
						<br> <br>
						<%=h.getInoutTime()%>
						<br>
						<br>
					</div>
					<div class="host">
						<div class="hostInfo">
							<a
								href="<%=request.getContextPath()%>/hostInfoPage?hostNo=<%=h.getHostNo()%>">호스트정보</a>
						</div>
					</div>
					<br>

					<div class="pricebox">
						<div class="price"><%=price%>
							won
						</div>
					</div>
					<br> <br>
					<div class="paybox">
						<div class="pay">
							<%
								if (m2 != null) {
							%>
							<a
								href="<%=request.getContextPath()%>/booking/booking?houseNo=<%=h.getHouseNo()%>&checkIn=<%=in%>&checkOut=<%=out1%>&totalPrice=<%=price%>&m=<%=m2.getMemberNo()%>">booking</a>
							<%
								} else {
							%>
							<form name="loginPopUp">
								<input type="button" onclick="fn_loginPopUp();">
							</form>
							<%
								}
							%>
						</div>
					</div>
				</div>

			</div>


			<div class="houseinfobox">
				<div class="houseinfo">
					<div class="infoDetail">
						<div><%=h.getHouseName()%></div>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
						<div><%=h.getInoutTime()%></div>
						<br>
						<br>
						<div><%=h.getHouseLocation()%></div>
						<br>
						<br>
					</div>
					<div class="infoDetail2">
						<div>
							숙박허용인원
							<%=h.getHousePnum()%>
							명
						</div>
						<br>
						<div>
							숙소 유형
							<%=h.getHouseType()%></div>
						<br>
						<div>
							숙소 방 갯수
							<%=h.getRoomNum()%></div>
						<br>
						<div>
							숙소 화장실 갯수<%=h.getBathNum()%></div>
						<br>
						<div>
							숙소 침대 갯수<%=h.getBedNum()%></div>
						<br>
					</div>
					<br> <br>



				</div>
				<div class="houseIntroduce">
					<div>
						<%=h.getHouseComment()%>
					</div>

					<div>
						<div class="test">

							<div class="service">
								SERVICE
								<div class="a">
									<div class="aserviceimg">
										<div class="swiper-container second">
											<div class="swiper-wrapper">
												<%
													for (Object o : h.getFilter()) {

													String filtername = (String) o;
												%>
												<div class="swiper-slide">
													<img
														src="<%=request.getContextPath()%>/image/house/filter/<%=filtername%>"
														style="width: 60%; height: 60%;">
												</div>
												<%
													}
												%>



											</div>
											<!-- Add Arrows -->
											<div class="swiper-button-next "></div>
											<div class="swiper-button-prev "></div>
											<!-- Add Pagination -->
											<div class="swiper-pagination"></div>
										</div>

									</div>

								</div>

							</div>
						</div>
					</div>



					<div class="test">
						<div class="amienity">
							AMIENITY
							<div class="all">
								<div>와이파이</div>
								<div>옷장</div>
								<div>타월</div>
								<div>샴푸</div>
								<div>컨디셔너</div>
							</div>
						</div>
					</div>

					<div class="test">
						<div class="eqiipment">
							EQUIPMENT
							<div class="all">
								<div>헤어드라이기</div>
								<div>냉장고</div>
								<div>전기포트</div>
								<div>와인냉장고</div>
								<div>전자레인지</div>
								<div>토스트</div>
								<div>TV</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="houseinfobox2">
				<div>
					전하고 싶은말
					<div class="houseIntroduce2"><%=h.getHouseGemsung()%></div>
				</div>

			</div>
			<div class="reviewFilterScroll"></div>
			<!-- 이건 상단바에서 후기 눌렀을때 해당 위치로 오라고 만들어준 DIV -->

			<div class="gradeTitle">

				★평균 평점 (<%=grade%>)

				<div class="writing">
					<%
						if (m2 != null) {
					%>
					<a
						href="<%=request.getContextPath()%>/house/review?houseNo=<%=h.getHouseNo()%>&memberNo=<%=m2.getMemberNo()%>">글쓰기</a>
					<%
						}
					%>
				</div>
			</div>

			<div class="comment">
			<%if(list == null) { %>
			<span>후기없음</span>
			<%} else {%>
				<div class="swiper-container three">
					<div class="swiper-wrapper threeButton">
						<%
							for (Review r : list) {
						%>
						<div class="swiper-slide">
							<div class="gradePhoto">
								<img
									src="<%=request.getContextPath()%>/upload/review/<%=r.getFilePath()%>"
									style="width: 100%; height: 100%;">
							</div>
							<div class="customer">
								<div class="gradeall">
									<div class="gradeinfo">

										<div class="a">
											평점 :
											<%=r.getHouseGrade()%></div>
										<br> <br>
										<div class="a">
											숙박 기간 :
											<%=b.getCheckInDate()%>
											~
											<%=b.getCheckOutDate()%></div>
										<br> <br>
										<div class="b">
											제목 :
											<%=r.getCommentTitle()%>
										</div>
										<br> <br>
										<div class="c">
											내용 :
											<%=r.getCommentContents()%>
										</div>
										<div class="ex">댓글 등록하기</div>

									</div>
								</div>
							</div>
						</div>
						<%
							}
						%>
					</div>
					<!-- Add Arrows -->
					<div class="swiper-button-next"></div>
					<div class="swiper-button-prev"></div>
					<!-- Add Pagination -->
					<div class="swiper-pagination"></div>
					<!-- <div class="swiper-pagination"></div> -->

				</div>
				<%} %>
				<!--  <div class="graderoom">트윈룸/유야동반(투숙객 정보)</div> -->

			</div>


			<div class="photoFilterScroll"></div>
			<!-- 이건 상단바에서 주변시설 눌렀을때 해당 위치로 오라고 만들어준 DIV -->

			<div class="place">
				<div class="placeSection">
					<div class="placeSort">
						<div class="placeinfo">
							<div class="placename">
								이름: <span> 인하준꽃집</span>
							</div>
							<div class="placeContents">
								내용: <span>누가 꽃이게? 알겠어 욕하지마</span>
							</div>
							<div class="placeClassification">
								분류: <span>기타</span>
							</div>
						</div>
					</div>

					<div class="placeSort">
						<div class="placeinfo">
							<div class="placename">
								이름: <span> hajun coffee</span>
							</div>
							<div class="placeContents">
								내용: <span>밤에 잠안와 너무 잠이 안와 이건 하준 커피때문 하준이네 커피 중독적이야</span>
							</div>
							<div class="placeClassification">
								분류: <span>일반음식점</span>
							</div>
						</div>
					</div>

					<div class="placeSort">
						<div class="placeinfo">
							<div class="placename">
								이름: <span> 하준이네 포차</span>
							</div>
							<div class="placeContents">
								내용: <span>꽐라꽐라 그거 알아? 코알라가 술취한 사람들 같다고 해서 코알라 꼬알라 꽐라 꽐라 </span>
							</div>
							<div class="placeClassification">
								분류: <span>음식점</span>
							</div>
						</div>
					</div>
				</div>
				<div class="placemap"></div>
			</div>



			<aside class="enrollbg active">

				<div id="popup">
					<div class="color"></div>
					<div class="popupBtn">x</div>
					<div class="popupContent">
						<p class="popupTitle">게스트에게 답변해주기</p>
						<div class="reasonBox">
							<form action="<%=request.getContextPath()%>/board/boardWriteEnd"
								method="post" enctype="multipart/form-data">
								<table id='tbl-board'>
									<div>
										<div>제목 :</div>
										<div>
											<%-- <%=r.getCommentTitle()%>  --%>
										</div>
										<br>
									</div>
									<div>
										<div>작성자 :</div>
										<div>
											<%-- <%=m.getNickName()%>  --%>
										</div>
										<br>
									</div>

									<div>
										<div>내용</div>
										<div>
											<textarea rows="5" cols="45" name="content"></textarea>
										</div>
									</div>
									<div>
										<div colspan="2">
											<input type="submit" value="등록하기" onclick="">
										</div>
									</div>
								</table>
							</form>
						</div>
					</div>

				</div>

			</aside>

		</section>
		<%@ include file="/views/common/footer.jsp"%>
	</div>
	<script src="<%=request.getContextPath()%>/js/common/header.js"></script>
	<script src="<%=request.getContextPath()%>/js/common/heart.js"></script>
	<script
		src="<%=request.getContextPath()%>/js/house/houseDetailHeader.js"></script>
	<script
		src="<%=request.getContextPath()%>/js/house/houseDetailSwiper.js"></script>
	<script src="<%=request.getContextPath()%>/js/house/filter.js"></script>
	<script src="<%=request.getContextPath()%>/js/house/housePopup.js"></script>
	<script>
		function fn_loginPopUp() {
		 	const url = "<%=request.getContextPath()%>
		/loginPopUp";
			const title = "loginPopUp";
			const status = "left=100px, top=100px, width=250px, height=250px";
			open("", title, status);

			loginPopUp.target = title;
			loginPopUp.action = url;
			loginPopUp.method = "post";

			loginPopUp.submit();
		}
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List,com.binbang.house.model.vo.House"%>
<%
	/*  List<House> list = (List)request.getAttribute("list"); */


%>

<%
	String[] filter = new String[] { "bathRoom.png", "bbq.png", "breakfast.png", "dog.png", "kitchen.png",
		"laundrtRoom.png", "park.png", "parking.png", "projector.png", "refrigerator.png", "shower.png", "smoking.png",
		"swimming.png", "terrace.png", "wifi.png" };
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
		<%@ include file="/views/common/houseHeader.jsp"%>
		<section class="section">
			<div class="mainBox">
				<div class="swiper-container first">
					<div class="swiper-wrapper">
						<div class="swiper-slide">Slide 1</div>
						<div class="swiper-slide">Slide 2</div>
						<div class="swiper-slide">Slide 3</div>
						<div class="swiper-slide">Slide 4</div>
						<div class="swiper-slide">Slide 5</div>
						<div class="swiper-slide">Slide 6</div>
						<div class="swiper-slide">Slide 7</div>
						<div class="swiper-slide">Slide 8</div>
						<div class="swiper-slide">Slide 9</div>
						<div class="swiper-slide">Slide 10</div>
					</div>
					<!-- Add Arrows -->
					<div class="swiper-button-next"></div>
					<div class="swiper-button-prev"></div>
					<!-- Add Pagination -->
					<div class="swiper-pagination"></div>
				</div>
				<div class="info">
					<div class="title">
						써니 사이드업
						<div class="heartCommon heart"></div>
					</div>
					<br> <br> <br>
					<div class="titleInfo">
						밤과 음악사이는 청춘남녀들을 위한 청춘 숙소입니다 <br> <br> check in 15:00 <br>
						check out 11:00 <br>
					</div>
					<div class="host">
						<div class="hostInfo">
							<a href="#">호스팅정보</a>
						</div>
					</div>
					<br>

					<div class="pricebox">
						<div class="price">$ 150,000 WON</div>
					</div>
					<br> <br>
					<div class="paybox">
						<div class="pay">
							<a href="<%=request.getContextPath()%>/booking/booking">booking</a>
						</div>
					</div>
				</div>

			</div>
			<div class="infoFilterScroll"></div>
			<!-- 이건 상단바에서 후기 눌렀을때 해당 위치로 오라고 만들어준 DIV -->



			<div class="houseinfobox">
				<div class="houseinfo">
					<div>
						201호 <br> <br> 체크인 16:00/체크아웃 <br> <br> <br>
						기준 인원 2명 / 최대인원 4명 <br> <br> 객식면적 10㎡<br> <br>
						더블배드 1
					</div>
				</div>
				<div class="houseIntroduce">
					<div>
						오픈플랜으로 구성된 정수리 아파트 4개의 객실중, 201호애는 욕조가 마련되어있습니다. <br> 여행의 피로를
						풀며 편안한 휴식을 취할수 있습니다
					</div>




					<div>
						<div class="test">

							<div class="service">
								SERVICE
								<div class="a">
									<div class="aserviceimg">
										<div class="swiper-container second">
											<div class="swiper-wrapper">
												<%-- 	<% for(String h : filter){ %> --%>
												<!-- <div> -->
												<div class="swiper-slide">Slide 1</div>
												<div class="swiper-slide">Slide 2</div>
												<div class="swiper-slide">Slide 3</div>
												<div class="swiper-slide">Slide 4</div>

												<!-- Add Pagination -->
												<!-- <div class="swiper-pagination"></div> -->
												<!-- Add Arrows -->

												<%-- <img src="<%=request.getContextPath()%>/views/images/filter"width="20" height="20"> --%>
												<!-- </div> -->
												<%-- <%} %> --%>

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
				<div class="houseIntroduce2">바다와 하나가 된 듯한 느낌이 드는 인피니티풀은 여름을
					제외한 4월~11월 기간 미온수 신청도 가능하여 쌀쌀한 봄, 가을날도 춥지 않게 수영을 즐길 수 있다. 또한 모든
					객실에서 바베큐 그릴을 이용할 수 있다고 하니, 소중한 사람들과 함께 온전한 휴식을 즐기는데에 최적의 환경이 아닐까.
					각박한 현실에서 벗어나 숨 돌릴 여유가 필요한 지금, 하늘과 바다를 품은 풀빌라에서의 황홀한 휴식이 기다리고 있다.</div>
				<div class="houseinfo2"></div>

			</div>
			<div class="reviewFilterScroll"></div>
			<!-- 이건 상단바에서 후기 눌렀을때 해당 위치로 오라고 만들어준 DIV -->

			<div class="gradeTitle">
				★총 평점 후기()개
				<div class="writing">
					<a href="<%=request.getContextPath()%>/house/review">글쓰기</a>
				</div>
			</div>

			<div class="comment">
				<div class="swiper-container three">
					<div class="swiper-wrapper threeButton">
						<div class="gradePhoto"></div>
						<div class="customer">
							<div class="gradeall">
								<div class="gradeinfo">
									<div class="a">평점 :</div>
									<br> <br>
									<div class="b">제목 :</div>
									<br> <br>
									<div class="c">내용 :</div>
									<div class="ex">댓글 등록하기</div>
								</div>
								
							</div>

						</div>


					</div>



					<!-- Add Arrows -->
					<div class="swiper-button-next"></div>
					<div class="swiper-button-prev"></div>
					<!-- Add Pagination -->
					<div class="swiper-pagination"></div>
					<!-- <div class="swiper-pagination"></div> -->

				</div>

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
							<form action="<%=request.getContextPath() %>/board/boardWriteEnd" method="post"
							    enctype="multipart/form-data">
										<table id='tbl-board'>
											<div>
												<div>제목 : </div>
												<div><%-- <%=loginMember.getUserId()%>  --%></div><br>
											</div>
											<div>
												<div>작성자 : </div>
												<div><input type="text" name="writer" 
							            value="" readonly></div><br>
											</div>
											
											<div>
												<div>내용</div>
												<div><textarea rows="5" cols="45" name="content"></textarea> </div>
											</div>
											<div>
												<div colspan="2">
													   <input type="submit" value="등록하기" onclick=>
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

</body>
</html>
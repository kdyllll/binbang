<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/commonLink.jsp"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/house/searchBox.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/house/houseSearch.css" />
</head>
<body>
	<div class="wrap">
		<%@ include file="/views/common/header.jsp"%>

		<section class="section">

			<div class="section1">
				<!-- 정렬구역 -->

				<div class="btnCon">
					<div class="btn">
						<p class="btnText">정렬</p>
						<div class="arrow"></div>
					</div>

					<ul class="box" id="houseSort">
						<li>기본순</li>
						<li>추천순</li>
						<li>가격낮은순</li>
						<li>가격높은순</li>
					</ul>
				</div>

				<form action="" class="btnCon">
					<div class="btn">
						<p class="btnText">요금</p>
						<div class="arrow"></div>
					</div>

					<ul class="box">
						<li><input type="checkbox" name="price" value="10만원 이하"
							id="10"><label for="10"> 10만원 이하</label></li>
						<li><input type="checkbox" name="price"
							value="10만원 이상 20만원 이하" id="20"><label for="20">
								10만원 이상 20만원 이하</label></li>
						<li><input type="checkbox" name="price"
							value="20만원 이상 30만원 이하" id="30"><label for="30">
								20만원 이상 30만원 이하</label></li>
						<li><input type="checkbox" name="price"
							value="30만원 이상 40만원 이하" id="40"><label for="40">
								30만원 이상 40만원 이하</label></li>
						<li><input type="checkbox" name="price"
							value="40만원 이상 50만원 이하" id="50"><label for="50">
								40만원 이상 50만원 이하</label></li>
						<li><input type="checkbox" name="price"
							value="50만원 이상 60만원 이하" id="60"><label for="60">
								50만원 이상 60만원 이하</label></li>
						<li><input type="checkbox" name="price" value="60만원 이상"
							id="70"><label for="70"> 60만원 이상</label></li>
						<li class="selectBtn"><div>해당숙소 00개</div></li>
					</ul>
				</form>

				<form action="" class="btnCon">
					<div class="btn">
						<p class="btnText">필터</p>
						<div class="arrow"></div>
					</div>
					<ul class="box">
						<li><input type="checkbox" name="filter" value="반려동물"
							id="animal"><label for="animal"> 반려동물</label></li>
						<li><input type="checkbox" name="filter" value="흡연가능"
							id="smoke"><label for="smoke"> 흡연가능</label></li>
						<li><input type="checkbox" name="filter" value="주차공간"
							id="park"><label for="park"> 주차공간</label></li>
						<li><input type="checkbox" name="filter" value="주방 사용"
							id="kitchen"><label for="kitchen"> 주방 사용</label></li>
						<li><input type="checkbox" name="filter" value="세탁기 사용"
							id="wash"><label for="wash"> 세탁기 사용</label></li>
						<li><input type="checkbox" name="filter" value="드라이기"
							id="dry"><label for="dry"> 드라이기</label></li>
						<li><input type="checkbox" name="filter" value="에어컨/난방"
							id="aircon"><label for="aircon"> 에어컨/난방</label></li>
						<li><input type="checkbox" name="filter" value="냉장고 사용"
							id="ref"><label for="ref"> 냉장고 사용</label></li>
						<li class="selectBtn"><div>해당숙소 00개</div></li>
					</ul>
				</form>

			</div>

			<div class="section2">
				<!-- 지도와 숙소들 영역 -->
				<!-- 지도 -->
				<div class="map">지도</div>
				<!-- 선 -->
				<div class="line"></div>
				<!-- 숙소리스트 -->
				<div class="list">
					<div class="house1">

						<a href="<%=request.getContextPath() %>/house/houseDetailMove" class="housePic1"></a>
						<div class="houseContents">

							<div class="contentSection1">
								<p class="houseName">제주제주</p>
								<div class="heartCommon heart"></div>
							</div>

							<div class="houseLine"></div>


							<div class="contentSection2">
								<div class="contentBox">
									<div class="iconLocation"></div>
									<p class="locationName">제주</p>
								</div>

								<div class="contentLine"></div>

								<div class="contentBox">
									<div class="iconGrade"></div>
									<p class="gradeName">4.5/5</p>
								</div>
							</div>
							<div class="houseLine2"></div>
							<div class="contentSection3">
								<div class="contentBox">
									<div class="iconPrice"></div>
									<p class="priceName">100,000</p>
								</div>

								<div class="contentLine"></div>

								<div class="contentBox">
									<div class="iconPeople"></div>
									<p class="PeopleName">최대 인원 8명</p>
								</div>
							</div>

						</div>
					</div>

					<div class="house2">
						<a href="#" class="housePic2"></a>
						<div class="houseContents">

							<div class="contentSection1">
								<p class="houseName">제주제주</p>
								<div class="heartCommon heart"></div>
							</div>

							<div class="houseLine"></div>


							<div class="contentSection2">
								<div class="contentBox">
									<div class="iconLocation"></div>
									<p class="locationName">제주</p>
								</div>

								<div class="contentLine"></div>

								<div class="contentBox">
									<div class="iconGrade"></div>
									<p class="gradeName">4.5/5</p>
								</div>
							</div>
							<div class="houseLine2"></div>
							<div class="contentSection3">
								<div class="contentBox">
									<div class="iconPrice"></div>
									<p class="priceName">100,000</p>
								</div>

								<div class="contentLine"></div>

								<div class="contentBox">
									<div class="iconPeople"></div>
									<p class="PeopleName">최대 인원 8명</p>
								</div>
							</div>

						</div>
					</div>
					<div class="house3">
						<a href="#" class="housePic3"></a>
						<div class="houseContents">

							<div class="contentSection1">
								<p class="houseName">제주제주</p>
								<div class="heartCommon heart"></div>
							</div>

							<div class="houseLine"></div>


							<div class="contentSection2">
								<div class="contentBox">
									<div class="iconLocation"></div>
									<p class="locationName">제주</p>
								</div>

								<div class="contentLine"></div>

								<div class="contentBox">
									<div class="iconGrade"></div>
									<p class="gradeName">4.5/5</p>
								</div>
							</div>
							<div class="houseLine2"></div>
							<div class="contentSection3">
								<div class="contentBox">
									<div class="iconPrice"></div>
									<p class="priceName">100,000</p>
								</div>

								<div class="contentLine"></div>

								<div class="contentBox">
									<div class="iconPeople"></div>
									<p class="PeopleName">최대 인원 8명</p>
								</div>
							</div>

						</div>
					</div>
					<div class="house4">
						<a href="#" class="housePic4"></a>
						<div class="houseContents">

							<div class="contentSection1">
								<p class="houseName">제주제주</p>
								<div class="heartCommon heart"></div>
							</div>

							<div class="houseLine"></div>


							<div class="contentSection2">
								<div class="contentBox">
									<div class="iconLocation"></div>
									<p class="locationName">제주</p>
								</div>

								<div class="contentLine"></div>

								<div class="contentBox">
									<div class="iconGrade"></div>
									<p class="gradeName">4.5/5</p>
								</div>
							</div>
							<div class="houseLine2"></div>
							<div class="contentSection3">
								<div class="contentBox">
									<div class="iconPrice"></div>
									<p class="priceName">100,000</p>
								</div>

								<div class="contentLine"></div>

								<div class="contentBox">
									<div class="iconPeople"></div>
									<p class="PeopleName">최대 인원 8명</p>
								</div>
							</div>

						</div>
					</div>
					<div class="house5">
						<a href="#" class="housePic5"></a>
						<div class="houseContents">

							<div class="contentSection1">
								<p class="houseName">제주제주</p>
								<div class="heartCommon heart"></div>
							</div>

							<div class="houseLine"></div>


							<div class="contentSection2">
								<div class="contentBox">
									<div class="iconLocation"></div>
									<p class="locationName">제주</p>
								</div>

								<div class="contentLine"></div>

								<div class="contentBox">
									<div class="iconGrade"></div>
									<p class="gradeName">4.5/5</p>
								</div>
							</div>
							<div class="houseLine2"></div>
							<div class="contentSection3">
								<div class="contentBox">
									<div class="iconPrice"></div>
									<p class="priceName">100,000</p>
								</div>

								<div class="contentLine"></div>

								<div class="contentBox">
									<div class="iconPeople"></div>
									<p class="PeopleName">최대 인원 8명</p>
								</div>
							</div>

						</div>
					</div>
					<div class="house6">
						<a href="#" class="housePic6"></a>
						<div class="houseContents">

							<div class="contentSection1">
								<p class="houseName">제주제주</p>
								<div class="heartCommon heart"></div>
							</div>

							<div class="houseLine"></div>


							<div class="contentSection2">
								<div class="contentBox">
									<div class="iconLocation"></div>
									<p class="locationName">제주</p>
								</div>

								<div class="contentLine"></div>

								<div class="contentBox">
									<div class="iconGrade"></div>
									<p class="gradeName">4.5/5</p>
								</div>
							</div>
							<div class="houseLine2"></div>
							<div class="contentSection3">
								<div class="contentBox">
									<div class="iconPrice"></div>
									<p class="priceName">100,000</p>
								</div>

								<div class="contentLine"></div>

								<div class="contentBox">
									<div class="iconPeople"></div>
									<p class="PeopleName">최대 인원 8명</p>
								</div>
							</div>

						</div>
					</div>
					<div class="house7">
						<a href="#" class="housePic7"></a>
						<div class="houseContents">

							<div class="contentSection1">
								<p class="houseName">제주제주</p>
								<div class="heartCommon heart"></div>
							</div>

							<div class="houseLine"></div>


							<div class="contentSection2">
								<div class="contentBox">
									<div class="iconLocation"></div>
									<p class="locationName">제주</p>
								</div>

								<div class="contentLine"></div>

								<div class="contentBox">
									<div class="iconGrade"></div>
									<p class="gradeName">4.5/5</p>
								</div>
							</div>
							<div class="houseLine2"></div>
							<div class="contentSection3">
								<div class="contentBox">
									<div class="iconPrice"></div>
									<p class="priceName">100,000</p>
								</div>

								<div class="contentLine"></div>

								<div class="contentBox">
									<div class="iconPeople"></div>
									<p class="PeopleName">최대 인원 8명</p>
								</div>
							</div>

						</div>
					</div>
					<div class="house8">
						<a href="#" class="housePic8"></a>
						<div class="houseContents">

							<div class="contentSection1">
								<p class="houseName">제주제주</p>
								<div class="heartCommon heart"></div>
							</div>

							<div class="houseLine"></div>


							<div class="contentSection2">
								<div class="contentBox">
									<div class="iconLocation"></div>
									<p class="locationName">제주</p>
								</div>

								<div class="contentLine"></div>

								<div class="contentBox">
									<div class="iconGrade"></div>
									<p class="gradeName">4.5/5</p>
								</div>
							</div>
							<div class="houseLine2"></div>
							<div class="contentSection3">
								<div class="contentBox">
									<div class="iconPrice"></div>
									<p class="priceName">100,000</p>
								</div>

								<div class="contentLine"></div>

								<div class="contentBox">
									<div class="iconPeople"></div>
									<p class="PeopleName">최대 인원 8명</p>
								</div>
							</div>

						</div>
					</div>
					<div class="house9">
						<a href="#" class="housePic9"></a>
						<div class="houseContents">

							<div class="contentSection1">
								<p class="houseName">제주제주</p>
								<div class="heartCommon heart"></div>
							</div>

							<div class="houseLine"></div>


							<div class="contentSection2">
								<div class="contentBox">
									<div class="iconLocation"></div>
									<p class="locationName">제주</p>
								</div>

								<div class="contentLine"></div>

								<div class="contentBox">
									<div class="iconGrade"></div>
									<p class="gradeName">4.5/5</p>
								</div>
							</div>
							<div class="houseLine2"></div>
							<div class="contentSection3">
								<div class="contentBox">
									<div class="iconPrice"></div>
									<p class="priceName">100,000</p>
								</div>

								<div class="contentLine"></div>

								<div class="contentBox">
									<div class="iconPeople"></div>
									<p class="PeopleName">최대 인원 8명</p>
								</div>
							</div>

						</div>
					</div>

				</div>

			</div>


		</section>

		<%@ include file="/views/common/footer.jsp"%>
	</div>
	<script src="<%=request.getContextPath()%>/js/common/header.js"></script>
	<script src="<%=request.getContextPath()%>/js/house/houseSearch.js"></script>
	<script src="<%=request.getContextPath()%>/js/common/heart.js"></script>


</body>
</html>
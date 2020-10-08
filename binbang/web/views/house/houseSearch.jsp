<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.binbang.member.model.vo.Favorite"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/commonLink.jsp"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/house/searchBox.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/house/houseSearch.css" />
<%@ page import="java.util.List,com.binbang.house.model.vo.House"%>
<%
	List<House> house = (List<House>) request.getAttribute("house");
	List<Favorite> favorite = (List<Favorite>) request.getAttribute("favorite");
	Member member = (Member) session.getAttribute("m");
	String pageBar = (String) request.getAttribute("pageBar");
	List dayList = (List) request.getAttribute("dayList");
%>


</head>
<body>
	<div class="wrap">
		<%@ include file="/views/common/header.jsp"%>

		<section class="section">

			<div class="section1">
				<!-- 정렬구역 -->

				<form class="btnCon sort">
					<div class="btn">
						<p class="btnText pSort">정렬</p>
						<div class="arrow"></div>
					</div>

					<ul class="box" id="houseSort">
						<li>기본순</li>
						<li>추천순</li>
						<li>가격낮은순</li>
						<li>가격높은순</li>
					</ul>
				</form>

				<form id="priceForm" name="priceForm" class="btnCon">
					<div class="btn">
						<p class="btnText">요금</p>
						<div class="arrow"></div>
					</div>

					<ul class="box">
						<li><input type="checkbox" name="price" value="10" id="10"><label
							for="10"> 10만원 이하</label></li>
						<li><input type="checkbox" name="price" value="20" id="20"><label
							for="20"> 10만원 이상 20만원 이하</label></li>
						<li><input type="checkbox" name="price" value="30" id="30"><label
							for="30"> 20만원 이상 30만원 이하</label></li>
						<li><input type="checkbox" name="price" value="40" id="40"><label
							for="40"> 30만원 이상 40만원 이하</label></li>
						<li><input type="checkbox" name="price" value="50" id="50"><label
							for="50"> 40만원 이상 50만원 이하</label></li>
						<li><input type="checkbox" name="price" value="60" id="60"><label
							for="60"> 50만원 이상 60만원 이하</label></li>
						<li><input type="checkbox" name="price" value="70" id="70"><label
							for="70"> 60만원 이상</label></li>
						<li id="priceBtn" class="selectBtn"><div>해당숙소 00개</div></li>
					</ul>
				</form>

				<form id="filterForm" name="filterForm" class="btnCon">
					<div class="btn">
						<p class="btnText">필터</p>
						<div class="arrow"></div>
					</div>
					<ul class="box">
						<li><input type="checkbox" id="bbq" name="filter" value="1"><label
							for="bbq"> 바베큐</label></li>
						<li><input type="checkbox" id="breakfast" name="filter"
							value="2"><label for="breakfast"> 조식</label></li>
						<li><input type="checkbox" id="terrace" name="filter"
							value="3"><label for="terrace"> 테라스</label></li>
						<li><input type="checkbox" id="shower" name="filter"
							value="4"><label for="shower"> 샤워룸</label></li>
						<li><input type="checkbox" id="park" name="filter" value="5"><label
							for="park"> 정원</label></li>
						<li><input type="checkbox" id="swimming" name="filter"
							value="6"><label for="swimming"> 수영장</label></li>
						<li><input type="checkbox" id="dog" name="filter" value="7"><label
							for="dog"> 반려동물</label></li>
						<li><input type="checkbox" id="smoking" name="filter"
							value="8"><label for="smoking"> 흡연</label></li>
						<li><input type="checkbox" id="parking" name="filter"
							value="9"><label for="parking"> 주차</label></li>
						<li><input type="checkbox" id="kitchen" name="filter"
							value="10"><label for="kitchen"> 주방</label></li>
						<li><input type="checkbox" id="laundryRoom" name="filter"
							value="11"><label for="laundryRoom"> 세탁실</label></li>
						<li><input type="checkbox" id="wifi" name="filter" value="12"><label
							for="wifi"> 와이파이</label></li>
						<li id="filterBtn" class="selectBtn"><div>해당숙소 00개</div></li>
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
				<div class="listCon">
					<div class="list">

						<%
							for (House h : house) {
						%>
						<div class="house">
						<%	//총요금과 날짜 구하는 식(a태그로 같이 넘겨주기 위해서 상단으로 옮김)
							int total=0;
							int days=0;
							int price=0;
							//주말인지 평일인지 //성수기인지 비수기인지
						for (Object o : dayList) {
							String day = (String) o; //숙박 날짜 하루하루
						
							//요일 구하기
							SimpleDateFormat form = new SimpleDateFormat("yyyy/MM/dd");
							Date date = form.parse(day);
							Calendar c = Calendar.getInstance();
							c.setTime(date);
							int dayNum = c.get(Calendar.DAY_OF_WEEK);//6,7이라면 금,토	//여기까지 요일 구하기
							
							if (dayNum == 6 || dayNum == 7) {//주말(금토)이라면
								for (Object o1 : h.getTotalPeak()) { //성수기
									String pDay = "20"+(String) o1;
									if (day.equals(pDay)) {//성수기(주말)라면
										total+=h.getPricePeakWeekend();
										days++;
									}else{//비수기(주말)라면
										total+=h.getPriceWeekend();
										days++;
									}
									total+=h.getPriceWeekend();//성수기 기간이 없다면
									days++;
								}							
							}else{//평일이라면													
								for (Object o1 : h.getTotalPeak()) { //성수기
									String pDay = "20"+(String) o1;
									if (day.equals(pDay)) {//성수기(평일)라면
										total+=h.getPricePeakDay();
										days++;
									}else{//비수기(평일)라면
										total+=h.getPriceDay();
										days++;
									}
								}
								total+=h.getPriceDay(); //성수기 기간이 없다면
								days++;
							}
						}	
							if(total!=0&&days!=0){
								price=total/days;
							}
						%>

							<a 
								href="<%=request.getContextPath()%>/house/houseDetailMove?houseNo=<%=h.getHouseNo()%>&total=<%=total%>"
								class="housePic"
								style="background-image : url('<%=request.getContextPath()%>/upload/house/<%=h.getHousePicture()[0]%>');"></a>
							<div class="houseContents">

								<div class="contentSection1">
									<p class="houseName"><%=h.getHouseName()%></p>
									<div class="heartCommon heart">
										<%
											if (favorite != null) {
											for (Favorite f : favorite) {
												if (f.getHouseNo().equals(h.getHouseNo())) {
											//이집이 관심숙소 리스트에 있는 집이면 heart
										%>
										<script>
											$(".heartCommon").removeClass(
													".heart");
											$(".heartCommon").addClass(".fav");
										</script>
										<%
											}
										}
										}
										%>
									</div>
								</div>

								<div class="houseLine"></div>


								<div class="contentSection2">
									<div class="contentBox">
										<div class="iconLocation"></div>
										<p class="locationName"><%=(h.getHouseLocation()).substring(0, 2)%></p>
									</div>

									<div class="contentLine"></div>

									<div class="contentBox">
										<div class="iconGrade"></div>
										<p class="gradeName">
											<%=h.getAvgGrade()%>/5
										</p>
									</div>
								</div>
								<div class="houseLine2"></div>
								<div class="contentSection3">
									<div class="contentBox">
										<div class="iconPrice"></div>
										<p class="priceName">
											<!-- 가격 : 총요금/날짜수-->
											
											약 <span class="price" value="<%=price%>"><%=price%></span>원/1박
										</p>
									</div>

									<div class="contentLine"></div>

									<div class="contentBox">
										<div class="iconPeople"></div>
										<p class="PeopleName"><%=h.getHousePnum()%>명
										</p>
									</div>
								</div>

							</div>
						</div>
						<%
							}
						%>

					</div>
					<div id="pageBar">
						<%=pageBar%>
					</div>
				</div>

			</div>
	</div>


	</section>

	<%@ include file="/views/common/footer.jsp"%>
	</div>

	<script>
		let houseList =<%=request.getAttribute("houseJson")%>;
		console.log(houseList);
		//정렬 버튼 누를때
		$("#houseSort > li").on("click", function(e) {
			let standard = $(e.target).val();
		
			//기본순(최신순)=하우스넘버 내림차순
			function basicSort(a, b) {
				if (a.houseNo == b.houseNo) {
					return 0
				}
				return a.houseNo > b.houseNo ? -1 : 1;
			}
			//추천순=총평점 내림차순
			function gradeSort(a, b) {
				if (a.avgGrade == b.avgGrade) {
					return 0
				}
				return a.avgGrade > b.avgGrade ? -1 : 1;
			}
			//가격 낮은순
			$(".price").val()
			//가격 높은순

			houseList.sort(basicSort);

			console.dir("정렬 후" + JSON.stringify(houseList));
		});

		//금액 검색 누를때
		$("#filterBtn").on("click", function(e) {

		});

		//필터 검색 누를 때
		$("#priceBtn").on("click", function(e) {

		});
		
	</script>
	<script src="<%=request.getContextPath()%>/js/common/header.js"></script>
	<script src="<%=request.getContextPath()%>/js/house/houseSearch.js"></script>
	<script src="<%=request.getContextPath()%>/js/common/heart.js"></script>


</body>
</html>
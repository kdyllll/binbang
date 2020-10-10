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
<%@ page
	import="java.util.List,com.binbang.house.model.vo.House,com.binbang.house.model.vo.Review"%>
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
						<li id="priceBtn" class="selectBtn"><div onclick="fn_option();">해당숙소 <span><%=house.size() %></span>개</div></li>
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
						<li id="filterBtn" class="selectBtn"><div onclick="fn_option();">해당숙소 <span><%=house.size() %></span>개</div></li>
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
					<div class="list"></div>
					<div id="pageBar">
						<%=pageBar%>
					</div>
				</div>

			</div>
	</div>
	<div id="ttttest"></div>

	</section>

	<%@ include file="/views/common/footer.jsp"%>
	</div>

	<script>	
		let houseList =<%=request.getAttribute("houseJson")%>;
		let dayList =<%=request.getAttribute("dayJson")%>;
		let days=dayList.length;
		let checkIn=<%=request.getAttribute("checkIn")%>;
		let checkOut=<%=request.getAttribute("checkOut")%>;
		let favorite =<%=request.getAttribute("filterJson")%>;
		console.log(houseList);
		listPrint();
		//정렬 버튼 누를때
		$("#houseSort > li").on("click", function(e) {
			
			let standard = $(e.target).text();
			console.log(standard);
			if(standard == "기본순"||standard=="정렬") houseList.sort(basicSort); 
			else if(standard == "추천순") houseList.sort(gradeSort); 
			else if(standard == "가격낮은순") houseList.sort(priceLowSort); 
			else if(standard == "가격높은순") houseList.sort(priceHighSort); 		
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
			//가격 낮은순(오름차)
			function priceLowSort(a, b){
				if(a.totalPrice == b.totalPrice){
					return 0
				}
				return a.totalPrice > b.totalPrice ? 1 : -1;
			}
			//가격 높은순(내림차)
			function priceHighSort(a, b){
				if(a.totalPrice == b.totalPrice){
					return 0
				}
				return a.totalPrice > b.totalPrice ? -1 : 1;
			}
			console.log("정렬 후" + JSON.stringify(houseList));
			listPrint();
			fn_option();
			
		});
		
		function listPrint(){
			//for(var ele in i){  //ele는 배열의 인덱스 값(0번이 첫번째 객체...)
			//	for(var ele2 in i[ele]){  //ele2는 객체의 키값(name등)
			//		console.log(i[ele][ele2]); // 배열이름/인덱스(객체순서)/키값 이 되는 것
			//	} 
			//}
			let html="";
			let list="";
			for(let h in houseList){
				console.log("집들"+houseList[h]);
				let filterNames="";
				let filterList=houseList[h].filter;
				for(let f in filterList){
					if(filterNames!="") filterNames=filterNames+","+filterList[f];
					else filterNames=filterList[f];
				}
				list = `<div class="house">
							<a onclick="fn_next();"
								class="housePic"
								style="cursor:pointer;background-image : url('<%=request.getContextPath()%>/upload/house/`+houseList[h].housePicture[0]+`');"></a>
							<div class="houseContents">

								<div class="contentSection1">
									<p class="houseName">`+houseList[h].houseName+`</p>
									<div class="heartCommon heart"></div>
								</div>

								<div class="houseLine"></div>

								<div class="contentSection2">
									<div class="contentBox box1">
										<div class="iconLocation"></div>
										<p class="locationName">`+houseList[h].houseLocation+`</p>
										
									</div>

									<div class="contentLine"></div>

									<div class="contentBox box2">
										<div class="iconGrade"></div>
										<p class="gradeName">
											`+houseList[h].avgGrade+`/5
										</p>
									</div>
								</div>
								<div class="houseLine2"></div>
								<div class="contentSection3">
									<div class="contentBox box1">
										<div class="iconPrice"></div>
										<p class="priceName">
											<!-- 가격 : 총요금/날짜수-->											
											약 <span class="price">`+houseList[h].totalPrice / days+`</span>원/1박
											
										</p>
									</div>

									<div class="contentLine"></div>

									<div class="contentBox box2">
										<div class="iconPeople"></div>
										<p class="PeopleName">`+houseList[h].housePnum+`명
										</p>
									</div>
								</div>						
							</div>
							<input type="hidden" class="filterInput" value="`+filterNames+`">
							<form class="go" action="<%=request.getContextPath()%>/house/houseDetailMove" method="post">
									<input type="hidden" name="houseNo" value="`+houseList[h].houseNo+`">
									<input type="hidden" name="checkIn" value="`+checkIn+`">
									<input type="hidden" name="checkOut" value="`+checkOut+`">
									<input type="hidden" name="totalPrice" value="`+houseList[h].totalPrice+`">
							</form>
						</div> `;
				html=html+list;	
				for(let f in favorite){
					if(favorite[f].houseNo == houseList[h].houseNo){
						$(".heartCommon").removeClass(".heart");
						$(".heartCommon").addClass(".fav");
					}
				}	
			}
			
			$(".list").children().remove();
			$(".list").append(html);	
		}

		//금액 검색 누를때(show,hide쓰거나 정보들 다 넘겨서 ajax쓰거나)
		//필터 검색 누를때 두개 다
		function fn_option(){
			if($("input[name=price]:checked").length!=0||$("input[name=filter]:checked").length!=0){
				//금액이나 필터가 선택되어 있을때만 div 다 가리기
			$("div.house").hide();
			}
			//금액 
			$("input[name=price]:checked").each(function(j,t) {
				let showPriceTag=$(".price").filter(function(i,v){ //v는 filter앞에 적힌 태그, i는 순서(돌리는)			
					if($(t).val() == "10"){ //10만원 이하
						return $(v).text()<=100000;
					}else if($(t).val() == "20"){ //10만원 이상 20만원 이하
						return $(v).text()>=100000 && $(v).text()<=200000;
					}else if($(t).val() == "30"){ //20만원 이상 30만원 이하
						return $(v).text()>=200000 && $(v).text()<=300000;
					}else if($(t).val() == "40"){ //30만원 이상 40만원 이하
						return $(v).text()>=300000 && $(v).text()<=400000;
					}else if($(t).val() == "50"){ //40만원 이상 50만원 이하
						return $(v).text()>=400000 && $(v).text()<=500000;
					}else if($(t).val() == "60"){ //50만원 이상 60만원 이하
						return $(v).text()>=500000 && $(v).text()<=600000;
					}else if($(t).val() == "70"){ //60만원 이상
						return $(v).text()>=600000;
					}
				});
				showPriceTag.each(function(i,v){
					$(v).parents("div.house").show();
				});	
			});
				

			//주변시설
		
			$("input[name=filter]:checked").each(function(j,t) {	
				let showFilterTag=$(".filterInput").filter(function(i,v){
					let filterNo=$(v).val().split(","); //숙소가 가지고 있는 필터 번호 하나씩 떼서 배열로 담음
					for(let f in filterNo){
						if($(t).val()==filterNo[f]){ //this는 클릭된 체크박스
							return $(v); //v는 히든인풋태그
						}
					}
				});
				showFilterTag.each(function(i,v){
					$(v).parents("div.house").show();
				});
			});

		
				
		};

			//사진 클릭하면 form태그 실행
			function fn_next(e){
				$(".go").submit();
			}
		
	</script>
	<script src="<%=request.getContextPath()%>/js/common/header.js"></script>
	<script src="<%=request.getContextPath()%>/js/house/houseSearch.js"></script>
	<script src="<%=request.getContextPath()%>/js/common/heart.js"></script>


</body>
</html>
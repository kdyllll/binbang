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
<!-- 지도 api -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c98adfd52f6b697ce8e033c4b2ff215a&libraries=services"></script>
<%@ page
	import="java.util.List,com.binbang.house.model.vo.House,com.binbang.house.model.vo.Review"%>
<%
	List<House> house = (List<House>) request.getAttribute("house");
	List<Favorite> favoriteList = (List<Favorite>) request.getAttribute("favorite");
	Member member = (Member) session.getAttribute("m");
	String pageBar = (String) request.getAttribute("pageBar");
	List dayList = (List) request.getAttribute("dayList");
	String checkIn=(String)request.getAttribute("checkIn");
	String checkOut=(String)request.getAttribute("checkOut");
%>
<style>
.header{
	z-index:1000;
}
</style>
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

					<ul class="box" onclick="fn_houseSu();">
						<li><input type="checkbox" name="price" value="10" id="10"><label
							for="10"> 10만원 미만</label></li>
						<li><input type="checkbox" name="price" value="20" id="20"><label
							for="20"> 10만원 이상 20만원 미만</label></li>
						<li><input type="checkbox" name="price" value="30" id="30"><label
							for="30"> 20만원 이상 30만원 미만</label></li>
						<li><input type="checkbox" name="price" value="40" id="40"><label
							for="40"> 30만원 이상 40만원 미만</label></li>
						<li><input type="checkbox" name="price" value="50" id="50"><label
							for="50"> 40만원 이상 50만원 미만</label></li>
						<li><input type="checkbox" name="price" value="60" id="60"><label
							for="60"> 50만원 이상 60만원 미만</label></li>
						<li><input type="checkbox" name="price" value="70" id="70"><label
							for="70"> 60만원 이상</label></li>
						<li id="priceBtn" class="selectBtn"><div onclick="fn_option();">해당숙소 <span class="houseNum"></span>개</div></li>
					</ul>
				</form>

				<form id="filterForm" name="filterForm" class="btnCon">
					<div class="btn">
						<p class="btnText">필터</p>
						<div class="arrow"></div>
					</div>
					<ul class="box" onclick="fn_houseSu();">
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
						<li id="filterBtn" class="selectBtn"><div onclick="fn_option();">해당숙소 <span class="houseNum"></span>개</div></li>
					</ul>
				</form>

			</div>
			
			<div class="section2">
				
				<!-- 지도와 숙소들 영역 -->
				<!-- 지도 -->
				<div id="map" class="map"></div>
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

		let favorite =<%=request.getAttribute("favoriteJson")%>;
		$(".houseNum").html(houseList.length);
		listPrint();
		//정렬 버튼 누를때
		$("#houseSort > li").on("click", function(e) {
			
			let standard = $(e.target).text();
			// console.log(standard);
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
			// console.log("정렬 후" + JSON.stringify(houseList));
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
				let filterNames="";
				let filterList=houseList[h].filter;
				let location=houseList[h].houseLocation.substring(0,2);
				for(let f in filterList){
					if(filterNames!="") filterNames=filterNames+","+filterList[f];
					else filterNames=filterList[f];
				}
				list = `<div class="house">
							<form class="go" action="<%=request.getContextPath()%>/house/houseDetailMove" method="post">
								<input type="hidden" class="houseNo1" name="houseNo" value="`+houseList[h].houseNo+`">
								<input type="hidden" name="checkIn" value="<%=checkIn%>">
								<input type="hidden" name="checkOut" value="<%=checkOut%>">
								<input type="hidden" name="totalPrice" value="`+houseList[h].totalPrice+`">
								<button class="housePicBtn" type="submit" onclick="fn_next();">
								<div class="housePic"
									style="cursor:pointer;background-image : url('<%=request.getContextPath()%>/upload/house/`+houseList[h].housePicture[0]+`');"></div> 
								</button>
							</form>
							
							<div class="houseContents">

								<div class="contentSection1" name="contentSection1">
									<p class="houseName">`+houseList[h].houseName+`</p>
									<a class="heartCommon heart"></a>
									<input type="hidden" class="houseNoPopUp" name="houseNo" value="`+houseList[h].houseNo+`">
									
								</div>

								<div class="houseLine"></div>

								<div class="contentSection2">
									<div class="contentBox box1">
										<div class="iconLocation"></div>
										<p class="locationName">`+location+`</p>
										
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
							
						</div> `;
				html=html+list;	
					
			}
			$(".list").children().remove();
			$(".list").append(html);	
			
			for(let f in favorite){
				let hNo=($(".houseNoPopUp"));
				for(let i=0;i<hNo.length;i++){		
					if(favorite[f].houseNo==hNo[i].value){	
						console.log(hNo[i].previousSibling.previousSibling);
						hNo[i].previousSibling.previousSibling.className="heartCommon fav";
						/* hNo[i].prev(".heartCommon").addClass(".fav"); */
					} 
				}
			}
		}
		//금액 검색 누를때(show,hide쓰거나 정보들 다 넘겨서 ajax쓰거나)
		//필터 검색 누를때 두개 다
		function fn_option(){
			if($("input[name=price]:checked").length!=0){
				$("div.house").hide();
				//금액 
				$("input[name=price]:checked").each(function(j,t) {
					let showPriceTag=$("div.house").filter(function(i,v){ //v는 filter앞에 적힌 태그, i는 순서(돌리는)						
							let price=$(v).find(".price").text()	
							if($(t).val() == "10"){ //10만원 미만
								return price<=100000;
							}else if($(t).val() == "20"){ //10만원 이상 20만원 미만
								return price>=100000 && price<200000;
							}else if($(t).val() == "30"){ //20만원 이상 30만원 미만
								return price>=200000 && price<300000;
							}else if($(t).val() == "40"){ //30만원 이상 40만원 미만
								return price>=300000 && price<400000;
							}else if($(t).val() == "50"){ //40만원 이상 50만원 미만
								return price>=400000 && price<500000;
							}else if($(t).val() == "60"){ //50만원 이상 60만원 미만
								return price>=500000 && price<600000;
							}else if($(t).val() == "70"){ //60만원 이상
								return price>=600000;
							}
						});				
					$("div.house").each(function(j,t){
						showPriceTag.each(function(i,v){ //v는 show안에 들어있는 각각의 것
							if(v==t){
								$(t).show();
								return;
							}
						});
					});						
				});
				//시설
				$("input[name=filter]:checked").each(function(j,t) {	
					let showFilterTag=$("div.house").filter(function(i,v){
						let filterInput=$(v).find(".filterInput").val();
						let filterNo=filterInput.split(","); //숙소가 가지고 있는 필터 번호 하나씩 떼서 배열로 담음
						for(let f in filterNo){
							if($(t).val()==filterNo[f]){ //t는 클릭된 체크박스
								return $(v); //v는 하우스태그
							}
						}
					});					
					$("div.house").each(function(j,t){
						let result=false;
						showFilterTag.each(function(i,v){
							if(v==t){
								result=true;
								return;
							}
						});
						if(result==false){
							$(t).hide();
						}
					});
				});
			}else if($("input[name=filter]:checked").length!=0){
				$("input[name=filter]:checked").each(function(j,t) {	
					let showFilterTag=$("div.house").filter(function(i,v){
						let filterInput=$(v).find(".filterInput").val();
						let filterNo=filterInput.split(","); //숙소가 가지고 있는 필터 번호 하나씩 떼서 배열로 담음
						for(let f in filterNo){
							if($(t).val()==filterNo[f]){ //t는 클릭된 체크박스
								return $(v); //v는 하우스태그
							}
						}
					});					
					$("div.house").each(function(j,t){
						let result=false;
						showFilterTag.each(function(i,v){
							if(v==t){
								result=true;
								return;
							}
						});
						if(result==false){
							$(t).hide();
						}
					});
				});
			}else{
				$("div.house").show();
			}
			
				
		};
//해당숙소 00개 버튼에 숫자 반영
		function fn_houseSu(){
			let houseArr=[];
			let priceArr=[];
			let filterArr=[];
			let wholeArr=[]; //검색된 하우스 배열
			$("div.house").each(function(i,v){
				wholeArr.push(v);
			});
			let difArr=[];
			if($("input[name=price]:checked").length!=0){
					$("input[name=price]:checked").each(function(j,t) {
						let pHouse=$("div.house").filter(function(i,v){ //v는 filter앞에 적힌 태그, i는 순서(돌리는)						
									let price=$(v).find(".price").text()	
									if($(t).val() == "10"){ //10만원 미만
										return price<=100000;
									}else if($(t).val() == "20"){ //10만원 이상 20만원 미만
										return price>=100000 && price<200000;
									}else if($(t).val() == "30"){ //20만원 이상 30만원 미만
										return price>=200000 && price<300000;
									}else if($(t).val() == "40"){ //30만원 이상 40만원 미만
										return price>=300000 && price<400000;
									}else if($(t).val() == "50"){ //40만원 이상 50만원 미만
										return price>=400000 && price<500000;
									}else if($(t).val() == "60"){ //50만원 이상 60만원 미만
										return price>=500000 && price<600000;
									}else if($(t).val() == "70"){ //60만원 이상
										return price>=600000;
									}
						});	
						for(let i=0;i<pHouse.length;i++){
							priceArr.push(pHouse[i]);
						};							
						// priceArr=priceArr.filter((i, v) => priceArr.indexOf(i) === v);		//중복값 삭제	
						houseArr=priceArr;	
					});
					if($("input[name=filter]:checked").length!=0){
						$("input[name=filter]:checked").each(function(j,t) {		
						let filterTemp=[];			
						let fHouse=$("div.house").filter(function(i,v){
							let filterInput=$(v).find(".filterInput").val();
							let filterNo=filterInput.split(","); //숙소가 가지고 있는 필터 번호 하나씩 떼서 배열로 담음
							for(let f in filterNo){
								if($(t).val()==filterNo[f]){ //t는 클릭된 체크박스
									return $(v); //v는 하우스태그
								}
							}
						});
						//해당안되는거 = 전체리스트에서 해당하는 걸 빼
							for(let i=0;i<fHouse.length;i++){							
								filterTemp.push(fHouse[i]); //해당하는 거							
							}
							filterTemp = filterTemp.filter(function(i, pos, self) {
							return self.indexOf(i) == pos;
							}); //중복값 제거
							difArr=difArr.concat(wholeArr.filter(x => !filterTemp.includes(x))); //전체에서 해당하는걸 뺀 것(차집합)							
							difArr = difArr.filter(function(i, pos, self) {
								return self.indexOf(i) == pos;
							}); //중복값 삭제
						});	
						filterArr=wholeArr.filter(x => !difArr.includes(x)); //전체-해당안되는거=해당하는 거
		
						if(filterArr.length==0){
							houseArr=[];
						}else{
							//전체-(금액에서 해당 안되는 거 + 필터에서 해당 안하는거) 
							let noPriceArr=wholeArr.filter(x => !priceArr.includes(x)); //금액에서 해당 안하는 거
							let noBothArr=difArr.concat(noPriceArr); //금액에서 해당안되는거 + 필터에서 해당 안하는거
							noBothArr=noBothArr.filter((i, v) => noBothArr.indexOf(i) === v); //중복값 삭제
							houseArr=wholeArr.filter(x => !noBothArr.includes(x)); //전체에서 빼주기
						// houseArr = priceArr.filter(x => filterArr.includes(x));	//중복값제거 (금액 해당하는거 + 필터 해당하는거 -> 이건 아냐)
						}					
					}	
					$(".houseNum").html(houseArr.length);
			}else if($("input[name=filter]:checked").length!=0){
					//해당안되는 걸 다 합친다음에 전체에서 빼 그게 갯수야				
				$("input[name=filter]:checked").each(function(j,t) {		
					let filterTemp=[];			
					let fHouse=$("div.house").filter(function(i,v){
						let filterInput=$(v).find(".filterInput").val();
						let filterNo=filterInput.split(","); //숙소가 가지고 있는 필터 번호 하나씩 떼서 배열로 담음
						for(let f in filterNo){
							if($(t).val()==filterNo[f]){ //t는 클릭된 체크박스
								return $(v); //v는 하우스태그
							}
						}
					});
					//해당안되는거 = 전체리스트에서 해당하는 걸 빼
						for(let i=0;i<fHouse.length;i++){							
							filterTemp.push(fHouse[i]); //해당하는 거							
						}
						filterTemp = filterTemp.filter(function(i, pos, self) {
						return self.indexOf(i) == pos;
						}); //중복값 제거
						difArr=difArr.concat(wholeArr.filter(x => !filterTemp.includes(x))); //전체에서 해당하는걸 뺀 것							
						difArr = difArr.filter(function(i, pos, self) {
							return self.indexOf(i) == pos;
						}); //중복값 삭제
				});	
				filterArr=wholeArr.filter(x => !difArr.includes(x)); //전체-해당안되는거=해당하는 거
				houseArr=filterArr;
				$(".houseNum").html(houseArr.length);			
			}else{
				$(".houseNum").html(houseList.length);
			}			
			
		};

		//사진 클릭하면 form태그 실행
		 function fn_next(e){	
			$(".go").submit();
		}; 
		
		//관심숙소 버튼눌렀을때
		 $(".heartCommon").on("click", e => {
			 let login = "";
			 let loginNo = "";

			<% if(member != null) {%>
				login = '<%=member %>';
				loginNo = '<%=member.getMemberNo() %>';
			<% } %>
			if(login == "") {
				alert("로그인한 회원만 이용가능합니다.");
				fn_loginPopUp();
			}  else {
				//관심숙소 고르는 팝업으로 넘어가기
				fn_favoritePopUp(e);
			}	
		});
		//로그인 안되어있다면 로그인팝업 호출
		function fn_loginPopUp() {
		 	const url = "<%=request.getContextPath()%>/loginPopUp";
	   		const title = "loginPopUp";
	   		const status = "left=100px, top=100px, width=500px, height=500px";
	   		open(url,title,status); 
		 }
		//로그인 되어있다면 관심숙소 팝업 호출
		function fn_favoritePopUp(e) {
		 	const url = "<%=request.getContextPath()%>/favorite/favoritePopUp?houseNo="+$(e.target).next().val();
	   		const title = "favoritePopUp";
	   		const status = "left=100px, top=100px, width=500px, height=500px";
	   		open(url,title,status);   
			 
		 }
		
		//지도
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div
		mapOption = {
		   center : new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
		   level : 3// 지도의 확대 레벨
		}; 		
		var map = new daum.maps.Map(mapContainer, mapOption); 	// 지도를 생성합니다    
		var geocoder = new daum.maps.services.Geocoder();// 주소-좌표 변환 객체를 생성합니다
		
		 for(let h in houseList) {	    	
				geocoder.addressSearch(houseList[h].houseLocation, function(result, status) {// 주소로 좌표를 검색합니다
						if (status === daum.maps.services.Status.OK) { // 정상적으로 검색이 완료됐으면 
				        var coords = new daum.maps.LatLng(result[0].y, result[0].x);	
				        var marker = new daum.maps.Marker({ // 결과값으로 받은 위치를 마커로 표시합니다
				            map: map,
				            position: coords
				        });
				     // 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
				        var iwContent = '<div style="padding:5px; border:0px; background-color: rgba(255, 255, 255, 0.5);">'+houseList[h].houseName+'</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
				            iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다		        
				        var infowindow = new kakao.maps.InfoWindow({// 인포윈도우를 생성합니다
				            content : iwContent,
				            removable : iwRemoveable
				        });
				        kakao.maps.event.addListener(marker, 'click', function() {// 마커에 클릭이벤트를 등록합니다	             
				              infowindow.open(map, marker);  // 마커 위에 인포윈도우를 표시합니다 
				        });		
				        map.setCenter(coords);  // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				    }
				});
			}; 
 	
	</script>
	<script src="<%=request.getContextPath()%>/js/common/header.js"></script>
	<script src="<%=request.getContextPath()%>/js/house/houseSearch.js"></script>


</body>
</html>
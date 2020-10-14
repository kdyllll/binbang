
<%@page import="com.binbang.member.model.vo.Favorite"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page
	import="java.util.List,com.binbang.house.model.vo.House,com.binbang.house.model.vo.Review,com.binbang.booking.model.vo.Booking"%>


<%
	List<Favorite> favoriteList = (List<Favorite>) request.getAttribute("favorite");
	House h = (House) request.getAttribute("house");
	Booking b = (Booking) request.getAttribute("booking");
	Double grade = (Double) request.getAttribute("grade");
	Member m2 = (Member) session.getAttribute("m");
	List<Review> list = (List) request.getAttribute("list");
	String in = (String) request.getAttribute("checkIn");
	String out1 = (String) request.getAttribute("checkOut");
	String price = (String) request.getAttribute("totalPrice");
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

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/house/map.css">
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c98adfd52f6b697ce8e033c4b2ff215a&libraries=services"></script>
</head>

<body class="body">
	<div class="wrap">
		<header class="header headerColor">
			<a href="<%=request.getContextPath()%>/mainMove" class="logo"></a>

			<div class="headerBox">
				<a href="#info" class="infoFilter"> 정보 </a> <a href="#grade"
					class="reviewFilter"> 후기 </a> <a href="#photoFilterScroll"
					class="photoFilter">주변시설 </a>
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
							for (int i = 0; i < h.getHousePicture().length; i++) {
								if (h.getHousePicture()[i] != null) {
						%>
						<div class="swiper-slide">
							<img
								src="<%=request.getContextPath()%>/upload/house/<%=h.getHousePicture()[i]%>"
								style="width: 100%; height: 100%;">
						</div>
						<%
							}
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

						<%
							if (favoriteList != null) {
								for (Favorite f : favoriteList) {
									if (f.getHouseNo() != null && f.getHouseNo().equals(h.getHouseNo())) {
						%>
						<div class="heartCommon fav"></div>
						<%
							} else {
						%>
						<div class="heartCommon heart"></div>
						<%
							}
								}
							} else {
						%>
						<div class="heartCommon heart"></div>
						<%
							}
						%>
						<input type="hidden" class="houseNoPopUp" name="houseNo"
							value="<%=h.getHostNo()%>">
					</div>
					<br> <br> <br>
					<div class="titleInfo">
						<%=h.getHouseComment()%>
						<br> <br>
						<%=h.getInoutTime()%>
						<br> <br>
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
								<input value="로그인"
									style="cursor: pointer; width: 100%; height: 100%; color: white; background: none; border: none; outline: none;"
									type="button" onclick="fn_loginPopUp();">
							</form>
							<%
								}
							%>
						</div>
					</div>
				</div>

			</div>
			<div id="info"></div>


			<div class="houseinfobox">
				<div class="houseinfo">
					<div class="infoDetail">
						<div><%=h.getHouseName()%></div>
						<br> <br> <br> <br> <br> <br> <br>
						<div><%=h.getInoutTime()%></div>
						<br> <br>
						<div><%=h.getHouseLocation()%></div>
						<br> <br>
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
								<div><%=h.getAmenity()%></div>

							</div>
						</div>
					</div>

					<div class="test">
						<div class="eqiipment">
							EQUIPMENT
							<div class="all1">
								<div><%=h.getEquipment()%></div>

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

			<div id="grade"></div>
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
				<%
					if (list == null) {
				%>
				<span>후기없음</span>
				<%
					} else {
				%>
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
											평점 :<%=r.getHouseGrade()%></div>
										<br>
										<div>
											숙박 기간 :
											<%=r.getCheckInDate()%>
											~
 
											 <%=r.getCheckOutDate()%> 
										</div>


										<div class="b">
											제목 :<%=r.getCommentTitle()%>
										</div>
										<br>
										<div class="c">
											내용 :<%=r.getCommentContents()%>
										</div>
										<!-- <div class="ex">댓글 등록하기</div> -->

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
				<%
					}
				%>
				<!--  <div class="graderoom">트윈룸/유야동반(투숙객 정보)</div> -->

			</div>


			<div id="photoFilterScroll"></div>
			<!-- 이건 상단바에서 주변시설 눌렀을때 해당 위치로 오라고 만들어준 DIV -->

			<div class="map_wrap">
				<div id="map"
					style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
				<ul id="category">
					<li id="BK9" data-order="0"><span class="category_bg bank"></span>
						은행</li>
					<li id="MT1" data-order="1"><span class="category_bg mart"></span>
						마트</li>
					<li id="PM9" data-order="2"><span class="category_bg pharmacy"></span>
						약국</li>
					<li id="OL7" data-order="3"><span class="category_bg oil"></span>
						주유소</li>
					<li id="CE7" data-order="4"><span class="category_bg cafe"></span>
						카페</li>
					<li id="CS2" data-order="5"><span class="category_bg store"></span>
						편의점</li>
				</ul>
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

	<%-- <script src="<%=request.getContextPath()%>/js/common/heart.js"></script> --%>

	<script src="<%=request.getContextPath()%>/js/common/heart.js"></script>
	<script
		src="<%=request.getContextPath()%>/js/house/houseDetailSwiper.js"></script>
	<script src="<%=request.getContextPath()%>/js/house/filter.js"></script>
	<script src="<%=request.getContextPath()%>/js/house/housePopup.js"></script>
	<script>
	//amenity 숙소에 split를 통해서 , 기준으로 자르는 js
	let amenity = '<%=h.getAmenity()%>';
    
    const words = amenity.split(',');
     
     let a = $("<div>");
     $(".amienity > .all ").html("");
     for(let i = 0; i<words.length; i++) {   
        $(".amienity > .all").append($("<div>").html(words[i]));
     }
     
 	//eqiipment 숙소에 split를 통해서 , 기준으로 자르는 js
     let eqiipment = '<%=h.getEquipment()%>';
     
     const words1 = eqiipment.split(',');
     
      let a1 = $("<div>");
      $(".eqiipment > .all1 ").html("");
      for(let i = 0; i<words1.length; i++) {   
         $(".eqiipment > .all1").append($("<div>").html(words1[i]));
      }

    
   

		function fn_loginPopUp() {
		 	const url = "<%=request.getContextPath()%>/loginPopUp";
			const title = "loginPopUp";
			const status = "left=100px, top=100px, width=500px, height=300px";
			open("", title, status);

			loginPopUp.target = title;
			loginPopUp.action = url;
			loginPopUp.method = "post";

			loginPopUp.submit();
		}
		
		//관심숙소 버튼눌렀을때
	       $(".heartCommon").on("click", e => {
	          let login = "";
	          let loginNo = "";

	         <%if (m2 != null) {%>
	            login = '<%=m2%>';
	            loginNo = '<%=m2.getMemberNo()%>';
	         <%}%>
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

	</script>
	<!-- 지도 -->
	<script>
		// 마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다
		var placeOverlay = new kakao.maps.CustomOverlay({zIndex:1}), 
		    contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
		    markers = [], // 마커를 담을 배열입니다
		    currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다
		 
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
		        level: 5 // 지도의 확대 레벨
		    };  
		
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		//주소-좌표 변환 객체를 생성
		var geocoder = new daum.maps.services.Geocoder();
		//주소부분만 바꿔주면 됨
		geocoder.addressSearch("<%=h.getHouseLocation()%>", function(results,
				status) {
			// 정상적으로 검색이 완료됐으면
			if (status === daum.maps.services.Status.OK) {
				var result = results[0]; //첫번째 결과의 값을 활용
				console.log(result);
		
				// 해당 주소에 대한 좌표를 받아서
				var coords = new daum.maps.LatLng(result.y,
						result.x);
		
				// 지도 중심을 변경한다.
				map.setCenter(coords);
				// 마커를 결과값으로 받은 위치로 옮긴다.
				marker.setPosition(coords)
			}
		});
		
		// 장소 검색 객체를 생성합니다
		var ps = new kakao.maps.services.Places(map); 
		
		// 지도에 idle 이벤트를 등록합니다
		kakao.maps.event.addListener(map, 'idle', searchPlaces);
		
		// 커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다 
		contentNode.className = 'placeinfo_wrap';
		
		// 커스텀 오버레이의 컨텐츠 노드에 mousedown, touchstart 이벤트가 발생했을때
		// 지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 kakao.maps.event.preventMap 메소드를 등록합니다 
		addEventHandle(contentNode, 'mousedown', kakao.maps.event.preventMap);
		addEventHandle(contentNode, 'touchstart', kakao.maps.event.preventMap);
		
		// 커스텀 오버레이 컨텐츠를 설정합니다
		placeOverlay.setContent(contentNode);  
		
		// 각 카테고리에 클릭 이벤트를 등록합니다
		addCategoryClickEvent();
		
		// 엘리먼트에 이벤트 핸들러를 등록하는 함수입니다
		function addEventHandle(target, type, callback) {
		    if (target.addEventListener) {
		        target.addEventListener(type, callback);
		    } else {
		        target.attachEvent('on' + type, callback);
		    }
		}
		
		// 카테고리 검색을 요청하는 함수입니다
		function searchPlaces() {
		    if (!currCategory) {
		        return;
		    }
		    
		    // 커스텀 오버레이를 숨깁니다 
		    placeOverlay.setMap(null);
		
		    // 지도에 표시되고 있는 마커를 제거합니다
		    removeMarker();
		    
		    ps.categorySearch(currCategory, placesSearchCB, {useMapBounds:true}); 
		}
		
		// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
		function placesSearchCB(data, status, pagination) {
		    if (status === kakao.maps.services.Status.OK) {
		
		        // 정상적으로 검색이 완료됐으면 지도에 마커를 표출합니다
		        displayPlaces(data);
		    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
		        // 검색결과가 없는경우 해야할 처리가 있다면 이곳에 작성해 주세요
		
		    } else if (status === kakao.maps.services.Status.ERROR) {
		        // 에러로 인해 검색결과가 나오지 않은 경우 해야할 처리가 있다면 이곳에 작성해 주세요
		        
		    }
		}
		
		// 지도에 마커를 표출하는 함수입니다
		function displayPlaces(places) {
		
		    // 몇번째 카테고리가 선택되어 있는지 얻어옵니다
		    // 이 순서는 스프라이트 이미지에서의 위치를 계산하는데 사용됩니다
		    var order = document.getElementById(currCategory).getAttribute('data-order');
		
		    
		
		    for ( var i=0; i<places.length; i++ ) {
		
		            // 마커를 생성하고 지도에 표시합니다
		            var marker = addMarker(new kakao.maps.LatLng(places[i].y, places[i].x), order);
		
		            // 마커와 검색결과 항목을 클릭 했을 때
		            // 장소정보를 표출하도록 클릭 이벤트를 등록합니다
		            (function(marker, place) {
		                kakao.maps.event.addListener(marker, 'click', function() {
		                    displayPlaceInfo(place);
		                });
		            })(marker, places[i]);
		    }
		}
		
		// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
		function addMarker(position, order) {
		    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
		        imageSize = new kakao.maps.Size(27, 28),  // 마커 이미지의 크기
		        imgOptions =  {
		            spriteSize : new kakao.maps.Size(72, 208), // 스프라이트 이미지의 크기
		            spriteOrigin : new kakao.maps.Point(46, (order*36)), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
		            offset: new kakao.maps.Point(11, 28) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
		        },
		        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
		            marker = new kakao.maps.Marker({
		            position: position, // 마커의 위치
		            image: markerImage 
		        });
		
		    marker.setMap(map); // 지도 위에 마커를 표출합니다
		    markers.push(marker);  // 배열에 생성된 마커를 추가합니다
		
		    return marker;
		}
		
		// 지도 위에 표시되고 있는 마커를 모두 제거합니다
		function removeMarker() {
		    for ( var i = 0; i < markers.length; i++ ) {
		        markers[i].setMap(null);
		    }   
		    markers = [];
		}
		
		// 클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수입니다
		function displayPlaceInfo (place) {
		    var content = '<div class="placeinfo">' +
		                    '   <a class="title" href="' + place.place_url + '" target="_blank" title="' + place.place_name + '">' + place.place_name + '</a>';   
		
		    if (place.road_address_name) {
		        content += '    <span title="' + place.road_address_name + '">' + place.road_address_name + '</span>' +
		                    '  <span class="jibun" title="' + place.address_name + '">(지번 : ' + place.address_name + ')</span>';
		    }  else {
		        content += '    <span title="' + place.address_name + '">' + place.address_name + '</span>';
		    }                
		   
		    content += '    <span class="tel">' + place.phone + '</span>' + 
		                '</div>' + 
		                '<div class="after"></div>';
		
		    contentNode.innerHTML = content;
		    placeOverlay.setPosition(new kakao.maps.LatLng(place.y, place.x));
		    placeOverlay.setMap(map);  
		}
		
		
		// 각 카테고리에 클릭 이벤트를 등록합니다
		function addCategoryClickEvent() {
		    var category = document.getElementById('category'),
		        children = category.children;
		
		    for (var i=0; i<children.length; i++) {
		        children[i].onclick = onClickCategory;
		    }
		}
		
		// 카테고리를 클릭했을 때 호출되는 함수입니다
		function onClickCategory() {
		    var id = this.id,
		        className = this.className;
		
		    placeOverlay.setMap(null);
		
		    if (className === 'on') {
		        currCategory = '';
		        changeCategoryClass();
		        removeMarker();
		    } else {
		        currCategory = id;
		        changeCategoryClass(this);
		        searchPlaces();
		    }
		}
		
		// 클릭된 카테고리에만 클릭된 스타일을 적용하는 함수입니다
		function changeCategoryClass(el) {
		    var category = document.getElementById('category'),
		        children = category.children,
		        i;
		
		    for ( i=0; i<children.length; i++ ) {
		        children[i].className = '';
		    }
		
		    if (el) {
		        el.className = 'on';
		    } 
		} 
		</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/commonLink.jsp"%>
<!-- 스와이퍼 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.0/css/swiper.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.0/js/swiper.min.js"></script>
<!--달력 css -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/common/cal.css" type="text/css" />
<!-- css -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/house/houseEnroll.css" />
<!-- 주소검색 api js -->
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<%
	Member member = (Member) session.getAttribute("m");
%>

</head>
<body>
	<div class="wrap">
		<%@ include file="/views/common/header.jsp"%>

		<section class="section">
			<!-- Swiper -->
			<form id="enrollForm"
				class="swiper-container first" 
				onsubmit="return fn_complete();" method="post"
				action="<%=request.getContextPath()%>/house/houseEnrollEnd"
				enctype="multipart/form-data">

				<div class="swiper-wrapper">
					<div class="swiper-slide box">
						<div class="slide1">
							<div class="hNameBox">
								<p>숙소 이름</p>
								<input type="text" name="hName" id="hName" placeholder="숙소 이름"
									>
							</div>
							<div class="line1"></div>
							<div class="hTypeBox">
								<p>숙소 유형</p>
								<div class="hTypeCon">
									<input type="radio"" name="hType" id="home" value="주택" > <label
										for="home">주택</label> <input type="radio" name="hType"
										id="apart" value="아파트"> <label for="apart">아파트</label> <input
										type="radio" name="hType" id="pension" value="펜션"> <label
										for="pension">펜션</label>
								</div>
							</div>
							<div class="line1"></div>
							<div class="hAddressBox">
								<p>숙소 위치</p>
								<div class="postcodeCon">
									<input type="text" id="postcode" placeholder="우편번호"> <input
										type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
								</div>
								<input type="text" name="roadAddress" id="roadAddress" placeholder="도로명주소">
								<span id="guide" style="color: #999; display: none"></span> <input
									type="text" name="detailAddress" id="detailAddress" placeholder="상세주소">
							</div>
						</div>
					</div>


					<div class="swiper-slide box">
						<div class="slide2">
							<div class="pNumBox">
								<p class="title2">숙소 최대 인원</p>
								<div class="pNumCon">
									<input type="number" name="pNum" id="pNum" min="0" max="9"
										step="1" > 명
								</div>
							</div>
							<div class="line2"></div>
							<div class="personalBox">
								<p class="title2">개인물건 유무</p>
								<div class="personalCon">
									<input type="radio" name="personal" id="personalY" value="Y"> <label for="personalY" >유</label> 
										<input type="radio" name="personal" id="personalN" value="N"> <label for="personalN">무</label>
								</div>
							</div>
							<div class="line2"></div>
							<div class="facilityBox">
								<p class="title2">이용 시설</p>
								<div class="roomNumBox">
									<p class="pNum">방 갯수</p>
									<div class="roomNumCon">
										<input type="number" name="roomNum" id="roomNum"
											class="inputNum" min="0" max="20" step="1" >
										개
									</div>
								</div>
								<div class="bedNumBox">
									<p class="pNum">침대 갯수</p>
									<div class="bedNumCon">
										<input type="number" name="bedNum" id="bedNum" 
											class="inputNum" in="0" max="20" step="1" > 개
									</div>
								</div>
								<div class="bathNumBox">
									<p class="pNum">욕실 갯수</p>
									<div class="bathNumCon">
										<input type="number" name="bathNum" id="bathNum"
											class="inputNum" min="0" max="20" step="1" >
										개
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="swiper-slide box">
						<div class="slide3">
							<div class="timeBox">
								<p>체크인아웃 시간</p>
								<input type="text" name="checkTime" id="checkTime"
									placeholder="(체크인 11:00 체크아웃 15:00)형식으로 작성해주세요." >
							</div>
							<div class="line3"></div>
							<div class="attentionBox">
								<p>주의사항</p>
								<div class="attentionCon">
									<textarea name="attention" id="attention" cols="60" rows="13"
										style="resize: none" ></textarea>
								</div>
							</div>
						</div>
					</div>

					<div class="swiper-slide box">
						<div class="slide4">
							<div class="photoListBox">
								<p>숙소 사진 등록(최소 3장/최대 10장)</p>
								<div class="photo1">
									<div class="picLine">
										<p class="picName" id="picName1">메인사진을 선택하세요</p>
									</div>
									<input type="file" name="picture1" id="picture1"
										class="picture" accept="images/*" > <label
										class="uploadPic" for="picture1">+</label> <label
										class="deletePic" id="deletePic1" for="">-</label>
								</div>
								<div class="photo2">
									<div class="picLine">
										<p class="picName" id="picName2">사진은 최소 3장 등록해주세요</p>
									</div>
									<input type="file" name="picture2" id="picture2"
										class="picture sub" accept="images/*" > <label
										class="uploadPic" for="picture2">+</label> <label
										class="deletePic" for="">-</label>
								</div>
								<div class="photo3">
									<div class="picLine">
										<p class="picName" id="picName3">사진은 최소 3장 등록해주세요</p>
									</div>
									<input type="file" name="picture3" id="picture3"
										class="picture sub" accept="images/*" > <label
										class="uploadPic" for="picture3">+</label> <label
										class="deletePic" for="">-</label>
								</div>
								<div class="photo4">
									<div class="picLine">
										<p class="picName" id="picName4"></p>
									</div>
									<input type="file" name="picture4" id="picture4"
										class="picture sub" accept="images/*"> <label
										class="uploadPic" for="picture4">+</label> <label
										class="deletePic" for="">-</label>
								</div>
								<div class="photo5">
									<div class="picLine">
										<p class="picName" id="picName5"></p>
									</div>
									<input type="file" name="picture5" id="picture5"
										class="picture sub" accept="images/*"> <label
										class="uploadPic" for="picture5">+</label> <label
										class="deletePic" for="">-</label>
								</div>
								<div class="photo6">
									<div class="picLine">
										<p class="picName" id="picName6"></p>
									</div>
									<input type="file" name="picture6" id="picture6"
										class="picture sub" accept="images/*"> <label
										class="uploadPic" for="picture6">+</label> <label
										class="deletePic" for="">-</label>
								</div>
								<div class="photo7">
									<div class="picLine">
										<p class="picName" id="picName7"></p>
									</div>
									<input type="file" name="picture7" id="picture7"
										class="picture sub" accept="images/*"> <label
										class="uploadPic" for="picture7">+</label> <label
										class="deletePic" for="">-</label>
								</div>
								<div class="photo8">
									<div class="picLine">
										<p class="picName" id="picName8"></p>
									</div>
									<input type="file" name="picture8" id="picture8"
										class="picture sub" accept="images/*"> <label
										class="uploadPic" for="picture8">+</label> <label
										class="deletePic" for="">-</label>
								</div>
								<div class="photo9">
									<div class="picLine">
										<p class="picName" id="picName9"></p>
									</div>
									<input type="file" name="picture9" id="picture9"
										class="picture sub" accept="images/*"> <label
										class="uploadPic" for="picture9">+</label> <label
										class="deletePic" for="">-</label>
								</div>
								<div class="photo10">
									<div class="picLine">
										<p class="picName" id="picName10"></p>
									</div>
									<input type="file" name="picture10" id="picture10"
										class="picture sub" accept="images/*"> <label
										class="uploadPic" for="picture10">+</label> <label
										class="deletePic" for="">-</label>
								</div>
							</div>
							<div class="line4"></div>
							<div class="photoPrevBox">
								<img class="prevImg">
							</div>
						</div>
					</div>

					<div class="swiper-slide box">
						<div class="slide5">
							<div class="filterBox">
								<p>편의 시설 및 서비스</p>
								<div class="filterContainer">
									<ul class="filterCon">
										<li><input type="checkbox" id="bbq" name="filter"
											value="1"><label for="bbq"> 바베큐</label></li>
										<li><input type="checkbox" id="breakfast" name="filter"
											value="2"><label for="breakfast"> 조식</label></li>
										<li><input type="checkbox" id="terrace" name="filter"
											value="3"><label for="terrace"> 테라스</label></li>
										<li><input type="checkbox" id="shower" name="filter"
											value="4"><label for="shower"> 샤워룸</label></li>
										<li><input type="checkbox" id="park" name="filter"
											value="5"><label for="park"> 정원</label></li>
										<li><input type="checkbox" id="swimming" name="filter"
											value="6"><label for="swimming"> 수영장</label></li>
									</ul>
									<ul class="filterCon">
										<li><input type="checkbox" id="dog" name="filter"
											value="7"><label for="dog"> 반려동물</label></li>
										<li><input type="checkbox" id="smoking" name="filter"
											value="8"><label for="smoking"> 흡연</label></li>
										<li><input type="checkbox" id="parking" name="filter"
											value="9"><label for="parking"> 주차</label></li>
										<li><input type="checkbox" id="kitchen" name="filter"
											value="10"><label for="kitchen"> 주방</label></li>
										<li><input type="checkbox" id="laundryRoom" name="filter"
											value="11"><label for="laundryRoom"> 세탁실</label></li>
										<li><input type="checkbox" id="wifi" name="filter"
											value="12"><label for="wifi"> 와이파이</label></li>
									</ul>
								</div>
							</div>
						</div>
					</div>

					<div class="swiper-slide box">
						<div class="slide6">
							<div class="amenityBox"">
								<p>AMENITY</p>
								<div class="amenityCon">
									<textarea name="amenity" id="amenity" cols="60" rows="3"
										style="resize: none" placeholder=",로 구분하여 입력하세요.&#13;&#10;ex)샴푸,컨디셔너" ></textarea>
								</div>
							</div>
							<div class="line6"></div>
							<div class="equipmentBox">
								<p>EQUIPMENT</p>
								<div class="equipmentCon">
									<textarea name="equipment" id="equipment" cols="60" rows="3"
										style="resize: none" placeholder=",로 구분하여 입력하세요.&#13;&#10;ex)드라이기,냉장고,전기포트"></textarea>
								</div>
							</div>
						</div>
					</div>

					<div class="swiper-slide box">
						<div class="slide7">
							<div class="explainBox">
								<p>숙소 설명</p>
								<div class="explainCon">
									<textarea name="explain" id="explain" cols="60" rows="6"
										style="resize: none" placeholder="2줄 이내로 작성해주세요" ></textarea>
								</div>
							</div>
							<div class="gemsungBox">
								<p>감성글</p>
								<div class="gemsungCon">
									<textarea name="gemsung" id="gemsung" cols="60" rows="10"
										style="resize: none" ></textarea>
								</div>
							</div>
						</div>
					</div>

					<div class="swiper-slide box">
						<div class="slide8">
							<div class="periodBox">
								<p>성수기 기간 선택</p>
								<div class="periodCon">
									<div class="season1">
										<p id="seasonName">시즌 1</p>
										<div class="startCon">
											<p>시작 날짜</p>
											<input type="text" id="startDay1" name="startDay1"
												class="date1" placeholder="날짜 선택" readonly
												autocomplete="off">
										</div>
										<div class="endCon">
											<p>끝 날짜</p>
											<input type="text" id="endDay1" name="endDay1" class="date2"
												placeholder="날짜 선택" readonly autocomplete="off">
										</div>
										<div class="deleteDate"></div>
									</div>
									<div class="season2">
										<p id="seasonName">시즌 2</p>
										<div class="startCon">
											<p>시작 날짜</p>
											<input type="text" id="startDay2" name="startDay2"
												class="date1" placeholder="날짜 선택" readonly
												autocomplete="off">
										</div>
										<div class="endCon">
											<p>끝 날짜</p>
											<input type="text" id="endDay2" name="endDay2" class="date2"
												placeholder="날짜 선택" readonly autocomplete="off">
										</div>
										<div class="deleteDate"></div>
									</div>
									<div class="season3">
										<p id="seasonName">시즌 3</p>
										<div class="startCon">
											<p>시작 날짜</p>
											<input type="text" id="startDay3" name="startDay3"
												class="date1" placeholder="날짜 선택" readonly
												autocomplete="off">
										</div>
										<div class="endCon">
											<p>끝 날짜</p>
											<input type="text" id="endDay3" name="endDay3" class="date2"
												placeholder="날짜 선택" readonly autocomplete="off">
										</div>
										<div class="deleteDate"></div>
									</div>
									<div class="season4">
										<p id="seasonName">시즌 4</p>
										<div class="startCon">
											<p>시작 날짜</p>
											<input type="text" id="startDay4" name="startDay4"
												class="date1" placeholder="날짜 선택" readonly
												autocomplete="off">
										</div>
										<div class="endCon">
											<p>끝 날짜</p>
											<input type="text" id="endDay4" name="endDay4" class="date2"
												placeholder="날짜 선택" readonly autocomplete="off">
										</div>
										<div class="deleteDate"></div>
									</div>
									<div class="season5">
										<p id="seasonName">시즌 5</p>
										<div class="startCon">
											<p>시작 날짜</p>
											<input type="text" id="startDay5" name="startDay5"
												class="date1" placeholder="날짜 선택" readonly
												autocomplete="off">
										</div>
										<div class="endCon">
											<p>끝 날짜</p>
											<input type="text" id="endDay5" name="endDay5" class="date2"
												placeholder="날짜 선택" readonly autocomplete="off">
										</div>
										<div class="deleteDate"></div>
									</div>
								</div>

							</div>
						</div>
					</div>

					<div class="swiper-slide box">
						<div class="slide9">
							<div class="moneyBox">
								<p>요금 설정</p>
								<div class="peakDayCon">
									<p>성수기 평일 요금</p>
									<input type="text" id="peakDay" name="peakDay"
										placeholder="성수기 평일" >
								</div>
								<div class="peakRestCon">
									<p>성수기 휴일 요금</p>
									<input type="text" id="peakRest" name="peakRest"
										placeholder="성수기 휴일" >
								</div>
								<div class="nonPeakDayCon">
									<p>비성수기 평일 요금</p>
									<input type="text" id="nonPeakDay" name="nonPeakDay"
										placeholder="비성수기 평일" >
								</div>
								<div class="nonPeakRestCon">
									<p>비성수기 휴일 요금</p>
									<input type="text" id="nonPeakRest" name="nonPeakRest"
										placeholder="비성수기 휴일" >
								</div>
							</div>
						</div>
						<div class="submitBox">
							<input type="submit" value="완료" class="submit" name="submit" >
						</div>
					</div>

				</div>
				<input type="hidden" name="loginHost"
					value="<%=member.getHostNo()%>">
				<!-- Add Pagination -->
				<div class="swiper-pagination"></div>
				<!-- Add Arrows -->
				<div class="swiper-button-next"></div>
				<div class="swiper-button-prev"></div>
			</form>
		</section>

		<%@ include file="/views/common/footer.jsp"%>
	</div>

	<script src="<%=request.getContextPath()%>/js/common/header.js"></script>
	<script src="<%=request.getContextPath()%>/js/house/houseEnroll.js"></script>

</script>
   <script src="<%=request.getContextPath()%>/js/house/houseEnroll.js"></script>

   <script>
      //  스와이퍼
      var swiper = new Swiper('.first', {
    	  touchRatio: 0,
         pagination : {
            el : '.swiper-pagination',
            type : 'progressbar',
         },
         navigation : {
            nextEl : '.swiper-button-next',
            prevEl : '.swiper-button-prev',
         },
      });

      function execDaumPostcode() {
         new daum.Postcode(
               {
                  oncomplete : function(data) {
                     // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                     // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                     // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                     var roadAddr = data.roadAddress; // 도로명 주소 변수
                     var extraRoadAddr = ''; // 참고 항목 변수

                     // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                     // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                     if (data.bname !== ''
                           && /[동|로|가]$/g.test(data.bname)) {
                        extraRoadAddr += data.bname;
                     }
                     // 건물명이 있고, 공동주택일 경우 추가한다.
                     if (data.buildingName !== ''
                           && data.apartment === 'Y') {
                        extraRoadAddr += (extraRoadAddr !== '' ? ', '
                              + data.buildingName : data.buildingName);
                     }
                     // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                     if (extraRoadAddr !== '') {
                        extraRoadAddr = ' (' + extraRoadAddr + ')';
                     }

                     // 우편번호와 주소 정보를 해당 필드에 넣는다.
                     document.getElementById('postcode').value = data.zonecode;
                     document.getElementById("roadAddress").value = roadAddr;

                     // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                     if (roadAddr !== '') {
                        document.getElementById("detailAddress").value = extraRoadAddr;
                     } else {
                        document.getElementById("detailAddress").value = '';
                     }

                     var guideTextBox = document.getElementById("guide");
                     // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                     if (data.autoRoadAddress) {
                        var expRoadAddr = data.autoRoadAddress
                              + extraRoadAddr;
                        guideTextBox.innerHTML = '(예상 도로명 주소 : '
                              + expRoadAddr + ')';
                        guideTextBox.style.display = 'block';

                     } else {
                        guideTextBox.innerHTML = '';
                        guideTextBox.style.display = 'none';
                     }
                  }
               }).open();
	  }
	$("#pNum").focusout(function(){
		if($(this).val()>9){
			alert("인원은 9명까지 입력 가능합니다.");
			$(this).val("9");
		}
	});

	//달력 기간 제한(시작날짜,끝날짜) 함수
	function fn_minMaxDate(s,e){
		s.datepicker("option", "maxDate", e.val());
		s.datepicker("option", "onClose", function (selectedDate){
			e.datepicker( "option", "minDate", selectedDate );
		});
		e.datepicker();
		e.datepicker("option", "minDate", s.val());
		e.datepicker("option", "onClose", function (selectedDate){
			s.datepicker( "option", "maxDate", selectedDate );
		});
	};
	//성수기 중복 입력 불가능 함수
	function disableDay(date){
		let day1=[];
		let day2=[];
		$(".date1").each(function(i,v){
			// console.log(v);
			day1.push(new Date($(v).val()));
			
		});
		$(".date2").each(function(i,v){
			// console.log(v);
			day2.push(new Date($(v).val()));
			
		});
		// day1.push(new Date($("#startDay1").val()));
		// day1.push(new Date($("#startDay2").val()));
		// day1.push(new Date($("#startDay3").val()));
		// day1.push(new Date($("#startDay4").val()));
		// day1.push(new Date($("#startDay5").val()));
		// day2.push(new Date($("#endDay1").val()));
		// day2.push(new Date($("#endDay2").val()));
		// day2.push(new Date($("#endDay3").val()));
		// day2.push(new Date($("#endDay4").val()));
		// day2.push(new Date($("#endDay5").val()));
		for(let i=0;i<5;i++){
			console.log(day1[i]);
			console.log(day2[i]);
			if(date>=day1[i]&&date<=day2[i]){
				return [false];
			}else return [true];
		};		
	};
	//성수기 선택 달력
    $(function() {
         $(".date1").datepicker({
                  dateFormat : "yy/mm/dd",
                  dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토" ],
                  monthNames : [ "1월", "2월", "3월", "4월", "5월", "6월",
                        "7월", "8월", "9월", "10월", "11월", "12월" ],
                  onSelect : function(d) {
                     $(this).val(d);
                     var week = new Array("일", "월", "화", "수", "목", "금",
                           "토");
				  },
				  beforeShow: function() {
						let i_offset= $(this).offset().top+$(this).height()-85; //클릭된 input의 위치값 체크
						setTimeout(function(){
							$('#ui-datepicker-div').css({'top':i_offset});  
						});
				  },
				  beforeShowDay : disableDay
		});

         $(".date2").datepicker({
                  dateFormat : "yy/mm/dd",
                  dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토" ],
                  monthNames : [ "1월", "2월", "3월", "4월", "5월", "6월",
                        "7월", "8월", "9월", "10월", "11월", "12월" ],
			      onSelect : function(d) {
                     $(this).val(d);
                     var week = new Array("일", "월", "화", "수", "목", "금",
                           "토");
				  },
				  beforeShow: function() {
						let i_offset= $(this).offset().top+$(this).height()-85; //클릭된 input의 위치값 체크
						setTimeout(function(){
							$('#ui-datepicker-div').css({'top':i_offset});  
						});
				  },
				  beforeShowDay : disableDay
         });
	  
		fn_minMaxDate($('#startDay1'),$('#endDay1'));
		fn_minMaxDate($('#startDay2'),$('#endDay2'));
		fn_minMaxDate($('#startDay3'),$('#endDay3'));
		fn_minMaxDate($('#startDay4'),$('#endDay4'));
		fn_minMaxDate($('#startDay5'),$('#endDay5'));
		
	});
  
      //입력항목 유효성검사
      function fn_complete(){
		let cnt=0;
		$(".sub").each(function(i,v){
			if($(v).val()){
				cnt++;
			}
		});
         if($("#hName").val().trim().length==0){
            alert("숙소 이름을 입력하세요.");
            return false;
         }else if($("input[name=hType]:checked").length==0){
            alert("숙소 유형을 선택하세요.");   
            return false;
         }else if($("#roadAddress").val().trim().length==0||$("#detailAddress").val().trim().length==0){
            alert("숙소 위치를 입력하세요.");   
            return false;
         }else if($("#pNum").val().trim().length==0){
            alert("숙소 최대 인원을 입력하세요.");   
            return false;
         }else if($("input[name=personal]:checked").length==0){
            alert("개인물건 유무를 선택하세요.");   
            return false;
         }else if($("#roomNum").val().trim().length==0){
            alert("방 갯수를 입력하세요.");   
            return false;
         }else if($("#bedNum").val().trim().length==0){
            alert("침대 갯수를 입력하세요.");   
            return false;
         }else if($("#bathNum").val().trim().length==0){
            alert("욕실 갯수를 입력하세요.");   
            return false;
         }else if($("#checkTime").val().trim().length==0){
            alert("체크인/체크아웃 시간을 입력하세요.");   
            return false;
         }else if($("#attention").val().trim().length==0){
            alert("주의사항을 입력하세요.");   
            return false;
         }else if(!$("#picture1").val()){
            alert("메인 사진을 등록하세요.");   
            return false;
         }else if(cnt<2){
            alert("사진을 3장 이상 등록해주세요.");   
            return false;
         }else if($("#amenity").val().trim().length==0){
             alert("amenity를 입력하세요.");   
             return false;
         }else if($("#equipment").val().trim().length==0){
              alert("equipment를 입력하세요.");   
              return false;
         }else if($("#explain").val().trim().length==0){
            alert("설명을 입력하세요.");   
            return false;
         }else if($("#gemsung").val().trim().length==0){
            alert("감성글을 입력하세요.");   
            return false;
         }else if($("#gemsung").val().trim().length==0){
            alert("감성글을 입력하세요.");   
            return false;
         }else if($("#startDay1").val().trim().length==0||$("#endDay1").val().trim().length==0){
            alert("성수기 기간을 하나 이상 입력하세요.");   
            return false;
         }else if($("#peakDay").val().trim().length==0){
            alert("성수기 평일 요금을 입력하세요.");   
            return false;
         }else if($("#peakRest").val().trim().length==0){
            alert("성수기 휴일 요금을 입력하세요.");   
            return false;
         }else if($("#nonPeakDay").val().trim().length==0){
            alert("비성수기 평일 요금을 입력하세요.");   
            return false;
         }else if($("#nonPeakRest").val().trim().length==0){
            alert("비성수기 휴일 요금을 입력하세요.");   
            return false;
         }else{      
		 return true;
         }
      }


   </script>



</body>
</html>
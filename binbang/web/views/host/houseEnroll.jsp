<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ include file="/views/common/commonLink.jsp" %>
   <!-- 스와이퍼 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.0/css/swiper.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.0/js/swiper.min.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/host/houseEnroll.css" /> 
</head>
<body>
    <div class="wrap">
        <%@ include file="/views/common/header.jsp" %>
  
        <section class="section">
            <!-- Swiper -->
           <form action="" class="swiper-container">
           
             <div class="swiper-wrapper">
               <div class="swiper-slide">
                     <div class="slide1">
                          <div class="hNameBox">
                      <p>숙소 이름</p>
                      <input type="text" name="hName" id="hName" placeholder="숙소 이름">
                    </div>                        
                    <div class="line1"></div>
                    <div class="hTypeBox">
                        <p>숙소 유형</p>
                        <div class="hTypeCon">
                            <input type="radio" name="hType" id="home"> <label for="home">주택</label>
                            <input type="radio" name="hType" id="apart"> <label for="apart">아파트</label>
                            <input type="radio" name="hType" id="pension"> <label for="pension">펜션</label>
                        </div>
                    </div>
                    <div class="line1"></div>
                    <div class="hAddressBox">
                        <p>위치</p>
                        <div class="hAddressCon">
                            <div class="hAddNumCon">
                                <div class="hAddNum"></div>
                                <div class="hAddBtn"></div>
                            </div>
                            <div class="hAdd"></div>
                            <div class="hAddDetail"></div>
                        </div>
                    </div>
                </div>
            </div>
                  
               <div class="swiper-slide">
              <div class="slide2">                       
                <div class="pNumBox">
                    <p class="title2">숙소 최대 인원</p>
                    <div class="pNumCon">
                      <input type="number" name="pNum" id="pNum" min="0" max="20" step="1"> 명
                    </div>
                </div>
                <div class="line2"></div>
                <div class="personalBox">
                    <p class="title2">개인물건 유무</p>
                    <div class="personalCon">
                        <input type="radio" name="personal" id="personalY"> <label for="personalY">유</label>
                        <input type="radio" name="personal" id="personalN"> <label for="personalN">무</label>
                    </div>
                </div>
                <div class="line2"></div>
                <div class="facilityBox">
                  <p class="title2">이용 시설</p>
                  <div class="roomNumBox">
                      <p class="pNum">방 갯수</p>
                      <div class="roomNumCon"><input type="number" name="roomNum" id="roomNum" class="inputNum" min="0" max="20" step="1"> 개</div>
                  </div>
                  <div class="bedNumBox">
                      <p class="pNum">침대 갯수</p>
                      <div class="bedNumCon"><input type="number" name="bedNum" id="bedNum" m class="inputNum" in="0" max="20" step="1"> 개</div>
                  </div>
                  <div class="bathNumBox">
                      <p class="pNum">욕실 갯수</p>
                      <div class="bathNumCon"><input type="number" name="bathNum" id="bathNum" class="inputNum" min="0" max="20" step="1"> 개</div>
                  </div>
                </div>                       
              </div>
            </div>
                  
               <div class="swiper-slide">
              <div class="slide3">
                <div class="timeBox">
                  <p>체크인아웃 시간</p>
                  <input type="text" name="checkTime" id="checkTime" placeholder="(체크인 11:00 체크아웃 15:00)형식으로 작성해주세요.">
                </div>                        
                <div class="line3"></div>
                <div class="phoneBox">
                    <p>호스트 번호 공개 유무</p>
                    <div class="phoneCon">
                      <input type="radio" name="phone" id="phoneY"> <label for="phoneY">유</label>
                      <input type="radio" name="phone" id="phoneN"> <label for="phoneN">무</label>
                    </div>
                </div>
                <div class="line3"></div>
                <div class="attentionBox">
                    <p>주의사항</p>
                    <div class="attentionCon">
                        <textarea name="attention" id="attention" cols="60" rows="8" style="resize:none"></textarea>
                    </div>
                </div> 
              </div>
            </div>

               <div class="swiper-slide">
              <div class="slide4">
                <div class="photoListBox">
                  <p>숙소 사진 등록(최소 3장/최대 10장) 여기 일단 보류</p>
                  <div class="photo1">
                    <div class="picLine">
                      <p class="picName"></p>
                    </div>
                    <input type="file" name="picture" id="picture1" class="picture" accept="images/*">
                    <label class="uploadPic" for="picture1">+</label>
                    <label class="deletePic" for="">-</label>
                  </div>
                  <div class="photo2">
                    <div class="picLine">
                      <p class="picName"></p>
                    </div>
                    <input type="file" name="picture" id="picture2" class="picture" accept="images/*">
                    <label class="uploadPic" for="picture2">+</label>
                    <label class="deletePic" for="">-</label>
                  </div>
                </div>
                <div class="line4"></div>
                <div class="photoPrevBox">
                  <div class="photoPreview">
                    <img class="previewImg" src="" alt="">
                  </div>
                </div>
              </div>
            </div>

               <div class="swiper-slide">
              <div class="slide5">
                <div class="filterBox">
                  <p>편의 시설 및 서비스(보류)</p>
                  <ul class="filterCon">
                    <li><input type="checkbox" id="animal" name="filter" value="animal"><label for="animal">반려동물 동반가능</label></li>
                    <li><input type="checkbox" id="smoke" name="filter" value="smoke"><label for="smoke">흡연 가능</label></li>
                    <li><input type="checkbox" id="park" name="filter" value="park"><label for="park">주차 가능</label></li>
                    <li><input type="checkbox" id="kitchen" name="filter" value="kitchen"><label for="kitchen">주방 사용 가능</label></li>
                    <li><input type="checkbox" id="laundry" name="filter" value="laundry"><label for="laundry">세탁실 사용 가능</label></li>
                    <li><input type="checkbox" id="dryer" name="filter" value="dryer"><label for="dryer">드라이기 구비</label></li>
                    <li><input type="checkbox" id="aircon" name="filter" value="aircon"><label for="aircon">냉난방</label></li>
                    <li><input type="checkbox" id="refri" name="filter" value="refri"><label for="refri">냉장고 사용 가능</label></li>
                  </ul>                
                </div>
              </div>
            </div>

            <div class="swiper-slide">
              <div class="slide6"> 
                  <p>주변 시설</p>
                  <div class="placeBox">
                    <div class="place1">
                      <div class="pTypeBox">
                        <p>분류</p>
                        <div class="pTypeCon">
                          <input type="radio" id="restaurant" name="pType"><label for="restaurant">음식점</label>
                          <input type="radio" id="culture" name="pType"><label for="culture">문화시설</label>
                          <input type="radio" id="etc" name="pType"><label for="etc">기타</label>
                        </div>
                      </div>
                      <div class="pNameBox">
                        <p>이름</p>
                        <input type="text" id="placeName" name="placeName">
                      </div>
                      <div class="pExplainBox">
                        <p>설명</p>
                        <input type="text" id="placeExplain" name="placeExplain">
                      </div>
                      <div class="pAddressBox">
                        <p>위치</p>
                        <div class="pAddressCon">
                          <div class="pAddNumCon">
                              <div class="pAddNum"></div>
                              <div class="pAddBtn"></div>
                          </div>
                          <div class="pAdd"></div>
                          <div class="pAddDetail"></div>
                        </div>
                      </div>
                    </div>
                    <div class="place2">
                      
                    </div>
                    <div class="place3">

                    </div>
                  </div>
              </div>              
            </div>

            <div class="swiper-slide">
              <div class="slide7">
                <div class="explainBox">
                  <p>숙소 설명</p>
                  <div class="explainCon">
                      <textarea name="explain" id="explain" cols="60" rows="10" style="resize:none"></textarea>
                  </div>
                </div> 
                <div class="gemsungBox">
                  <p>감성글</p>
                  <div class="gemsungCon">
                      <textarea name="gemsung" id="gemsung" cols="60" rows="10" style="resize:none"></textarea>
                  </div>
                </div> 
              </div>
            </div>

            <div class="swiper-slide">
              <div class="slide8">
                <div class="moneyBox">
                  <p>요금 설정</p>
                  <div class="periodCon">
                    <p>성수기 기간 선택</p>
                    <div class="calendar">달력</div>
                  </div>
                  <div class="peakDayCon">
                    <p>성수기 평일 요금</p>
                    <input type="text" id="peakDay" name="peakDay" placeholder="성수기 평일">
                  </div>
                  <div class="peakRestCon">
                    <p>성수기 휴일 요금</p>
                    <input type="text" id="peakRest" name="peakRest" placeholder="성수기 휴일">
                  </div>
                  <div class="nonPeakDayCon">
                    <p>비성수기 평일 요금</p>
                    <input type="text" id="nonPeakDay" name="nonPeakDay" placeholder="비성수기 평일">
                  </div>
                  <div class="nonPeakRestCon">
                    <p>비성수기 휴일 요금</p>
                    <input type="text" id="nonPeakRest" name="nonPeakRest" placeholder="비성수기 휴일">
                  </div>
                </div>
              </div>
            </div>

             </div>
           
             <!-- Add Pagination -->
             <div class="swiper-pagination"></div>
             <!-- Add Arrows -->
             <div class="swiper-button-next"></div>
             <div class="swiper-button-prev"></div>
           </form>
        </section>
  
      <%@ include file="/views/common/footer.jsp" %>
      </div>
    <script src="<%=request.getContextPath() %>/js/common/header.js"></script>
    <script src="<%=request.getContextPath() %>/js/host/houseEnroll.js"></script> 

   <script>
       var swiper = new Swiper('.swiper-container', {
         pagination: {
           el: '.swiper-pagination',
           type: 'progressbar',
         },
         navigation: {
           nextEl: '.swiper-button-next',
           prevEl: '.swiper-button-prev',
         },
       });
    </script>
   
</body>
</html>
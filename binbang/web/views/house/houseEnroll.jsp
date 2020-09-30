<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html  PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
  <html lang="en">
    <head>
      <meta charset="UTF-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <title>main</title>
      <link rel="stylesheet" href="<%=request.getContextPath() %>/css/common/reset.css" />
      <link rel="stylesheet" href="<%=request.getContextPath() %>/css/common/common.css" />
      <link rel="stylesheet" href="<%=request.getContextPath() %>/css/common/header.css" />
      <link rel="stylesheet" href="<%=request.getContextPath() %>/css/common/footer.css" />
      <link rel="stylesheet" href="<%=request.getContextPath() %>/css/common/nav.css" />
      <script src="<%=request.getContextPath() %>/js/common/jquery-3.5.1.min.js"></script>   <!-- 스와이퍼 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.0/css/swiper.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.0/js/swiper.min.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/house/houseEnroll.css" /> 
    <style>
  
        @font-face {
      font-family: 'IBMPlexSansKR-Light';
      src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/IBMPlexSansKR-Light.woff') format('woff');
      font-weight: normal;
      font-style: normal;
      }
              
      body {
        //font-family: 'IBMPlexSansKR-Light';
      }
                
    </style>
  </head>
<body>
    <div class="wrap">
        <%@ include file="/views/common/header.jsp" %>
  
        <section class="section">
            <!-- Swiper -->
           <form action="" class="swiper-container first">
           
             <div class="swiper-wrapper">
               <div class="swiper-slide box">
                     <div class="slide1">
                          <div class="hNameBox">
                      <p>숙소 이름</p>
                      <input type="text" name="hName" id="hName" placeholder="숙소 이름" required>
                    </div>                        
                    <div class="line1"></div>
                    <div class="hTypeBox">
                        <p>숙소 유형</p>
                        <div class="hTypeCon">
                            <input type="radio" name="hType" id="home" required> <label for="home">주택</label>
                            <input type="radio" name="hType" id="apart"> <label for="apart">아파트</label>
                            <input type="radio" name="hType" id="pension"> <label for="pension">펜션</label>
                        </div>
                    </div>
                    <div class="line1"></div>
                    
                    <input type="button" onclick="goPopup();" value="주소검색"/>
                    <div id="list"></div>
                    <div id="callBackDiv">
                      <table>                
                        <tr><td>우편번호             </td><td><input type="text"  style="width:500px;" id="zipNo"  name="zipNo" /></td></tr>
                        <tr><td>도로명주소 전체(포멧)</td><td><input type="text"  style="width:500px;" id="roadFullAddr"  name="roadFullAddr" /></td></tr>                        
                        <tr><td>고객입력 상세주소    </td><td><input type="text"  style="width:500px;" id="addrDetail"  name="addrDetail" /></td></tr>
                      </table>
                    </div>
                </div>
            </div>
                  
               <div class="swiper-slide box">
              <div class="slide2">                       
                <div class="pNumBox">
                    <p class="title2">숙소 최대 인원</p>
                    <div class="pNumCon">
                      <input type="number" name="pNum" id="pNum" min="0" max="9" step="1" required> 명
                    </div>
                </div>
                <div class="line2"></div>
                <div class="personalBox">
                    <p class="title2">개인물건 유무</p>
                    <div class="personalCon">
                        <input type="radio" name="personal" id="personalY"> <label for="personalY" required>유</label>
                        <input type="radio" name="personal" id="personalN"> <label for="personalN">무</label>
                    </div>
                </div>
                <div class="line2"></div>
                <div class="facilityBox">
                  <p class="title2">이용 시설</p>
                  <div class="roomNumBox">
                      <p class="pNum">방 갯수</p>
                      <div class="roomNumCon"><input type="number" name="roomNum" id="roomNum" class="inputNum" min="0" max="20" step="1" required> 개</div>
                  </div>
                  <div class="bedNumBox">
                      <p class="pNum">침대 갯수</p>
                      <div class="bedNumCon"><input type="number" name="bedNum" id="bedNum" m class="inputNum" in="0" max="20" step="1" required> 개</div>
                  </div>
                  <div class="bathNumBox">
                      <p class="pNum">욕실 갯수</p>
                      <div class="bathNumCon"><input type="number" name="bathNum" id="bathNum" class="inputNum" min="0" max="20" step="1" required> 개</div>
                  </div>
                </div>                       
              </div>
            </div>
                  
               <div class="swiper-slide box">
              <div class="slide3">
                <div class="timeBox">
                  <p>체크인아웃 시간</p>
                  <input type="text" name="checkTime" id="checkTime" placeholder="(체크인 11:00 체크아웃 15:00)형식으로 작성해주세요." required>
                </div>                        
                <div class="line3"></div>
                <div class="attentionBox">
                    <p>주의사항</p>
                    <div class="attentionCon">
                        <textarea name="attention" id="attention" cols="60" rows="13" style="resize:none" required></textarea>
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
                      <p class="picName"></p>
                    </div>
                    <input type="file" name="picture1" id="picture1" class="picture" accept="images/*" required>
                    <label class="uploadPic" for="picture1">+</label>
                    <label class="deletePic" id="deletePic1" for="">-</label>
                  </div>
                  <div class="photo2">
                    <div class="picLine">
                      <p class="picName"></p>
                    </div>
                    <input type="file" name="picture2" id="picture2" class="picture" accept="images/*" required>
                    <label class="uploadPic" for="picture2">+</label>
                    <label class="deletePic" for="">-</label>
                  </div>
                  <div class="photo3">
                    <div class="picLine">
                      <p class="picName"></p>
                    </div>
                    <input type="file" name="picture3" id="picture3" class="picture" accept="images/*" required>
                    <label class="uploadPic" for="picture2">+</label>
                    <label class="deletePic" for="">-</label>
                  </div>
                  <div class="photo4">
                    <div class="picLine">
                      <p class="picName"></p>
                    </div>
                    <input type="file" name="picture4" id="picture4" class="picture" accept="images/*">
                    <label class="uploadPic" for="picture2">+</label>
                    <label class="deletePic" for="">-</label>
                  </div>
                  <div class="photo5">
                    <div class="picLine">
                      <p class="picName"></p>
                    </div>
                    <input type="file" name="picture5" id="picture5" class="picture" accept="images/*">
                    <label class="uploadPic" for="picture2">+</label>
                    <label class="deletePic" for="">-</label>
                  </div>
                  <div class="photo6">
                    <div class="picLine">
                      <p class="picName"></p>
                    </div>
                    <input type="file" name="picture6" id="picture6" class="picture" accept="images/*">
                    <label class="uploadPic" for="picture2">+</label>
                    <label class="deletePic" for="">-</label>
                  </div>
                  <div class="photo7">
                    <div class="picLine">
                      <p class="picName"></p>
                    </div>
                    <input type="file" name="picture7" id="picture7" class="picture" accept="images/*">
                    <label class="uploadPic" for="picture2">+</label>
                    <label class="deletePic" for="">-</label>
                  </div>
                  <div class="photo8">
                    <div class="picLine">
                      <p class="picName"></p>
                    </div>
                    <input type="file" name="picture8" id="picture8" class="picture" accept="images/*">
                    <label class="uploadPic" for="picture2">+</label>
                    <label class="deletePic" for="">-</label>
                  </div>
                  <div class="photo9">
                    <div class="picLine">
                      <p class="picName"></p>
                    </div>
                    <input type="file" name="picture9" id="picture9" class="picture" accept="images/*">
                    <label class="uploadPic" for="picture2">+</label>
                    <label class="deletePic" for="">-</label>
                  </div>
                  <div class="photo10">
                    <div class="picLine">
                      <p class="picName"></p>
                    </div>
                    <input type="file" name="picture10" id="picture10" class="picture" accept="images/*">
                    <label class="uploadPic" for="picture2">+</label>
                    <label class="deletePic" for="">-</label>
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
                      <li><input type="checkbox" id="bbq" name="filter" value="bbq"><label for="bbq"> 바베큐</label></li>
                      <li><input type="checkbox" id="breakfast" name="filter" value="breakfast"><label for="breakfast"> 조식</label></li>
                      <li><input type="checkbox" id="terrace" name="filter" value="terrace"><label for="terrace"> 테라스</label></li>
                      <li><input type="checkbox" id="shower" name="filter" value="shower"><label for="shower"> 샤워룸</label></li>
                      <li><input type="checkbox" id="park" name="filter" value="park"><label for="park"> 정원</label></li>
                      <li><input type="checkbox" id="swimming" name="filter" value="swimming"><label for="swimming"> 수영장</label></li>
                    </ul>
                    <ul class="filterCon">  
                      <li><input type="checkbox" id="dog" name="filter" value="dog"><label for="dog"> 반려동물</label></li>
                      <li><input type="checkbox" id="smoking" name="filter" value="smoking"><label for="smoking"> 흡연</label></li>
                      <li><input type="checkbox" id="parking" name="filter" value="parking"><label for="parking"> 주차</label></li>
                      <li><input type="checkbox" id="kitchen" name="filter" value="kitchen"><label for="kitchen"> 주방</label></li>
                      <li><input type="checkbox" id="laundryRoom" name="filter" value="laundryRoom"><label for="laundryRoom"> 세탁실</label></li>
                      <li><input type="checkbox" id="wifi" name="filter" value="wifi"><label for="wifi"> 와이파이</label></li>                   
                    </ul>
                  </div>                
                </div>
              </div>
            </div>

             <div class="swiper-slide box">
              <div class="slide6"> 
                  <p>주변 시설</p>
                  <div class="placeBox">
                    <div class="place1">
                      <div class="placeCon">
                        <div class="pTypeBox">
                          <p>분류</p>
                          <ul class="pTypeCon">
                            <li><input type="radio" id="restaurant1" name="pType1" required><label for="restaurant">음식점</label></li>
                            <li><input type="radio" id="culture1" name="pType1"><label for="culture">문화시설</label></li>
                            <li><input type="radio" id="etc1" name="pType1"><label for="etc">기타</label></li>
                          </ul>
                        </div>
                        <div class="pNameBox">
                          <p>이름</p>
                          <input type="text" id="placeName1" name="placeName1" placeholder="주변 시설 이름" required>
                        </div>
                        <div class="pExplainBox">
                          <p>설명</p>
                          <input type="text" id="placeExplain1" name="placeExplain1" placeholder="주변 시설 설명" required>
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
                    </div>

                    <div class="place2">
                      <img src="<%=request.getContextPath()%>/image/house/houseEnroll/icon/plus.png" alt="" class="addPlace">
                      <div class="placeCon disnone">
                        <div class="pTypeBox">
                          <p>분류</p>
                          <ul class="pTypeCon">
                            <li><input type="radio" id="restaurant2" name="pType2"><label for="restaurant2">음식점</label></li>
                            <li><input type="radio" id="culture2" name="pType2"><label for="culture2">문화시설</label></li>
                            <li><input type="radio" id="etc2" name="pType2"><label for="etc2">기타</label></li>
                          </ul>
                        </div>
                        <div class="pNameBox">
                          <p>이름</p>
                          <input type="text" id="placeName2" name="placeName2" placeholder="주변 시설 이름">
                        </div>
                        <div class="pExplainBox">
                          <p>설명</p>
                          <input type="text" id="placeExplain2" name="placeExplain2" placeholder="주변 시설 설명">
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
                        <img src="<%=request.getContextPath()%>/image/house/houseEnroll/icon/x.png" alt="" class="deletePlace" width="50px" height="50px">
                      </div>                     
                    </div>

                    <div class="place3">
                      <img src="<%=request.getContextPath()%>/image/house/houseEnroll/icon/plus.png" alt="" class="addPlace">
                      <div class="placeCon disnone">
                        <div class="pTypeBox">
                          <p>분류</p>
                          <ul class="pTypeCon">
                            <li><input type="radio" id="restaurant3" name="pType3"><label for="restaurant3">음식점</label></li>
                            <li><input type="radio" id="culture3" name="pType3"><label for="culture3">문화시설</label></li>
                            <li><input type="radio" id="etc3" name="pType3"><label for="etc3">기타</label></li>
                          </ul>
                        </div>
                        <div class="pNameBox">
                          <p>이름</p>
                          <input type="text" id="placeName3" name="placeName3" placeholder="주변 시설 이름">
                        </div>
                        <div class="pExplainBox">
                          <p>설명</p>
                          <input type="text" id="placeExplain3" name="placeExplain3" placeholder="주변 시설 설명">
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
                        <img src="<%=request.getContextPath()%>/image/house/houseEnroll/icon/x.png" alt="" class="deletePlace" width="50px" height="50px">
                      </div>                  
                    </div>
                    
                  </div>
              </div>              
            </div>

            <div class="swiper-slide box">
              <div class="slide7">
                <div class="explainBox">
                  <p>숙소 설명</p>
                  <div class="explainCon">
                      <textarea name="explain" id="explain" cols="60" rows="10" style="resize:none" placeholder="2줄 이내로 작성해주세요" required></textarea>
                  </div>
                </div> 
                <div class="gemsungBox">
                  <p>감성글</p>
                  <div class="gemsungCon">
                      <textarea name="gemsung" id="gemsung" cols="60" rows="10" style="resize:none" required></textarea>
                  </div>
                </div> 
              </div>
            </div>

            <div class="swiper-slide box">
              <div class="slide8">
                <div class="moneyBox">
                  <p>요금 설정</p>
                  <div class="periodCon">
                    <p>성수기 기간 선택</p>
                    <div class="calendar">달력</div>
                  </div>
                  <div class="peakDayCon">
                    <p>성수기 평일 요금</p>
                    <input type="text" id="peakDay" name="peakDay" placeholder="성수기 평일" required>
                  </div>
                  <div class="peakRestCon">
                    <p>성수기 휴일 요금</p>
                    <input type="text" id="peakRest" name="peakRest" placeholder="성수기 휴일" required>
                  </div>
                  <div class="nonPeakDayCon">
                    <p>비성수기 평일 요금</p>
                    <input type="text" id="nonPeakDay" name="nonPeakDay" placeholder="비성수기 평일" required>
                  </div>
                  <div class="nonPeakRestCon">
                    <p>비성수기 휴일 요금</p>
                    <input type="text" id="nonPeakRest" name="nonPeakRest" placeholder="비성수기 휴일" required>
                  </div>
                </div>
              </div>
              <div class="submitBox">
                <input type="submit" value="완료" class="submit" name="submit">
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
    <script src="<%=request.getContextPath() %>/js/house/houseEnroll.js"></script> 

   <script>
    //  스와이퍼
      var swiper = new Swiper('.first', {
         pagination: {
           el: '.swiper-pagination',
           type: 'progressbar',
         },
         navigation: {
           nextEl: '.swiper-button-next',
           prevEl: '.swiper-button-prev',
         },
       });

     //주소검색  
       function goPopup(){
        // 주소검색을 수행할 팝업 페이지를 호출합니다.
        window.name="addressSearch";
        // 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
    	var pop = window.open("<%=request.getContextPath()%>/views/house/addressSearch.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
        // 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
          //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
      }
      function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
          // 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
          

    	  let zipNo1 = document.getElementById("zipNo");
          let roadFullAddr1 = document.getElementById("roadFullAddr");
          let addrDetail1 = document.getElementById("addrDetail");
          roadFullAddr1.value = roadFullAddr;
      
          addrDetail1.value = addrDetail;
     
          zipNo1.value = zipNo;
         
          
      }
 
    </script>
   
</body>
</html>
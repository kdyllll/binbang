<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/commonLink.jsp" %>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/host/hostMypage.css" />
  </head>
  <body>
    <div class="wrap">
      <%@ include file="/views/common/header.jsp" %>
      <section class="section">
        <!-- 호스트정보부분 -->
        <form class="hostInfoContainer"  method="get">
          <div class="hostInfoImg">
            <img src="<%=request.getContextPath() %>/image/host/host_regist/host_img/basic.jpg" alt="" />
            <input type="file" name="uploadImg" id="uploadImg" class="disnone">
            <label for="uploadImg" class="disnone">변경</label>
          </div>
          <div class="hostInfoContent">
            <div>
              <p>호스트이름</p>
              <input
                type="text"
                name="hostName"
                id="hostNameChn"
                value="인하준"
                style="padding-left:10px;"
              />
            </div>
            <div>
              <p>호스트이메일</p>
              <span style="padding-left:10px;">princeha@gmail.com</span>
            </div>
            <div>
              <p>소개글</p>
              <textarea name="hostIntro" id="textarea" cols="30" rows="10"></textarea>
            </div>
            
            <input
              type="submit"
              id="changeInfo"
              value="수정"
              onclick="return invalidate();"
            />
          </div>
        </form>
        <ul class="houseRequest">
          <li class="borderTop">숙소관리</li>
          <li>숙소요청</li>
          <li>숙소현황</li>
        </ul>
        <form class="myHouse">
          <h2>숙소관리</h2>
          <div class="myHouseImgCon">
            <div>
              <div>사진</div>
              <span>제목</span>
              <button>삭제</button>
            </div>
          </div>
        </form>
        <form class="houseReq disnone">
          <h2>숙소요청</h2>
        </form>
        <form class="houseReqConditon disnone">
          <h2>숙소현황</h2>
        </form>
      </section>
	<%@ include file="/views/common/footer.jsp" %>
    </div>
	<script src="<%=request.getContextPath() %>/js/common/header.js"></script>
    <script src="<%=request.getContextPath() %>/js/host/hostMypage.js"></script>
  </body>
</html>

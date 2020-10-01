<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/commonLink.jsp" %>
		<link rel="stylesheet" href="<%=request.getContextPath() %>/css/host/hostRegist.css" />

	</head>
<body>
	<div class="wrap">
		<%@ include file="/views/common/header.jsp" %>
		<section class="section">
        <div class="registImg">
          <form class="registContainer" id="hostFrm" method="post" enctype="multipart/form-data">
            <h2>호스트가 되어 수입을 올려보세요.</h2>
            <div>
              <div>
                <div class="addBtn">
                  <label for="idFile">추가</label>
                  <input type="file" id="idFile" name="uploadId" class="fileUpload"  accept="image/*"/>
                </div>
                <p class="hostCon">신분증 사진</p>
                <p class="uploadCommon"  id="uploadId" >파일이름</p>
                <div>
                  <div class="addBtn">
                    <label for="profileFile">추가</label>
                    <input type="file" name="uploadProfile" id="profileFile" class="fileUpload" accept="image/*" />
                  </div>
                  <p class="hostCon">프로필 사진 등록</p>
                  <p class="uploadCommon" id="uploadProfile">파일이름</p>
                </div>
                <p class="hostCon">호스트 소개글</p>
                <textarea name="hostCon" id="hostImg" cols="50" rows="5" focus></textarea>
              </div>
              <div class="hostImg">
                <img src="<%=request.getContextPath() %>/image/host/host_regist/host_img/basic.jpg" alt="" />
              </div>
            </div>
            <input type="button" value="등록하기" id="enrollHost" onclick="fn_enrollHost();" style="display:none;">
            <label class="hostEnrollEnd"  for="enrollHost">등록하기</label>
          </form>
        </div>
        <div class="hostRegist">
          <h2>안녕하세요</h2>
          <p>
            1백만 달러의 재산 피해 보호 프로그램 및 사고에 대비한 별도의
            1백만<br />
            달러 보험 등 BINBANG은 호스트, 호스트의 숙소와 재산 및 게스트를<br />
            보호할 수 있는 포괄적인 보호 장치를 마련해두고 있습니다.<br />
          </p>
          <div class="hLine"></div>
          <h3>호스트보호</h3>
          <div class="hostProtect">
            <img src="<%=request.getContextPath() %>/image/host/host_regist/host_banner.jpg" alt="" />
            <ul>
              <li>
                <img src="<%=request.getContextPath() %>/image/host/host_regist/icon/check.png" alt="" /> 예약하는
                게스트에게 신분증 인증 절차를 요구할 수 있음
              </li>
              <li>
                <img src="<%=request.getContextPath() %>/image/host/host_regist/icon/check.png" alt="" />게스트는
                숙소 이용규칙에 동의해야 함
              </li>
              <li>
                <img src="<%=request.getContextPath() %>/image/host/host_regist/icon/check.png" alt="" />게스트가
                이전 에어비앤비 숙박에서 받은 후기 확인 가능
              </li>
              <li>
                <img src="<%=request.getContextPath() %>/image/host/host_regist/icon/check.png" alt="" />숙소 파손
                시 최대 1백만 달러를 보상하는 무료 프로그램
              </li>
              <li>
                <img src="<%=request.getContextPath() %>/image/host/host_regist/icon/check.png" alt="" />무료로
                제공되는 1백만 달러의 책임 보험
              </li>
              <li>
                <img src="<%=request.getContextPath() %>/image/host/host_regist/icon/check.png" alt="" />연중무휴
                글로벌 고객 지원
              </li>
            </ul>
          </div>
        </div>
      </section>
		<%@ include file="/views/common/footer.jsp" %>
	</div>
	 <script src="<%=request.getContextPath() %>/js/common/header.js"></script>
	 <script src="<%=request.getContextPath() %>/js/host/hostRegist.js"></script>
	 <script>
	 	function fn_enrollHost() {
	 		$("#hostFrm").attr("action", "<%=request.getContextPath()%>/host/hostEnrollEnd").submit();
	 	}
	 </script>
</body>
</html>
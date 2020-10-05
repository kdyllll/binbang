<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/commonLink.jsp"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/member/favoriteFolder.css" />

</head>
<body>
	<div class="wrap">
		<%@ include file="/views/common/header.jsp"%>
		<!-- 관심숙소 -->
		<section class="section">
			<div class="line1">
				<p>관심숙소</p>
				<br>
				<div class="listLine"></div>
			</div>

			<!-- 관심숙소폴더 -->
			<div class="favorite">

				<!-- 목록만들기 팝업 -->
				<button id="listBuildBtn">목록만들기</button>

				<div class="listPop listDisNone">
					<div id="popupContent">
						<div class="popupHeader">
							<p>목록만들기</p>
							<button class="xBtn">x</button>
						</div>

						<div class="line2"></div>

						<div class="popupSection">
							<input id="listName" type="text" placeholder="이름">
						</div>

						<div class="line2"></div>

						<div class="popupFooter">
							<button id="checkBtn">저장</button>
						</div>

					</div>
				</div>

				<div class="favoriteList">				
					<a href="<%=request.getContextPath() %>/member/favoriteContents" class="eachList">
						<div class="recomPic1 recommon"></div>
						<div class="favoriteContents"></div>
					</a>
				
				</div>
			</div>

		</section>

		<%@ include file="/views/common/footer.jsp"%>
	</div>
	<script src="<%=request.getContextPath()%>/js/common/header.js"></script>
	<script src="<%=request.getContextPath()%>/js/member/favorite.js"></script>
</body>
</html>
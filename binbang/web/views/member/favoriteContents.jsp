<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/commonLink.jsp"%>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/member/favoriteContents.css" />
</head>
<body>
	<div class="wrap">
		<%@ include file="/views/common/header.jsp"%>

		<!-- 관심숙소 -->
		<section class="section">
			<div class="line1">
				<p>폴더명</p>
				<br>
				<div class="listLine"></div>
			</div>


			<!-- 관심숙소폴더 -->
			<div class="favorite">

				<!-- 버튼 -->
				<div class="backButton">
					<button id="backBtn">뒤로가기</button>
					<button id="modifyBtn">목록수정</button>
				</div>


				<div class="modifyPop ModDisNone">

					<div id="popupContent">
						<div class="popupHeader">
							<p>수정</p>
							<button class="xBtn">x</button>
						</div>

						<div class="line2"></div>

						<div class="popupSection">
							<input id="listName" type="text" placeholder="이름">
						</div>

						<div class="line2"></div>

						<div class="popupFooter">
							<button id="saveBtn">저장</button>
							<button id="deleteBtn">목록삭제</button>
						</div>

					</div>
				</div>

				<div class="favoriteList">
					<div class="eachList">
						<div class="recomPic1 recommon">
							<div class="heartButton fav"></div>
						</div>
						<div class="favoriteContents"></div>
					</div>
				</div>
			</div>

		</section>



		<%@ include file="/views/common/footer.jsp"%>
	</div>
	<script src="<%=request.getContextPath()%>/js/common/header.js"></script>
	<script src="<%=request.getContextPath()%>/js/member/favorite.js"></script>

</body>
</html>
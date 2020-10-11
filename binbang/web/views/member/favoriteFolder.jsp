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
				<div class="listLine"></div>
			</div>

			<!-- 관심숙소폴더 -->
			<div class="favorite">

				<!-- 목록만들기 팝업 -->
				<input type="button" id="listBuildBtn" value="목록만들기" >				

				<div class="listPop listDisNone">
					<div id="popupContent">
					
						<div class="popupHeader">
							<p class="makingTitle">목록만들기</p>
							<button class="xBtn">x</button>
						</div>

						<div class="popupSection">
							<input  type="text" id="listName" placeholder="이름">
							<input type="button" id="checkBtn" value="저장"> 							
						</div>												
						

					</div>
				</div>

				<div class="favoriteList">				
					<a href="<%=request.getContextPath() %>/member/favoriteContents" class="eachList">
						<div class="recomPic1 recommon"></div>						
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
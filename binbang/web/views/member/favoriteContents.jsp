<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/commonLink.jsp"%>

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/member/favoriteContents.css" />
</head>
<body>
	<div class="wrap">
		<%@ include file="/views/common/header.jsp"%>


		<!-- 관심숙소content -->
		<section class="section">
		
			<form id="favHouse" method="post">
			<div class="line1">
				<input type="text" value="관심폴더명" class="favTitle">
				<div class="listLine"></div>
			</div>


			<!-- 관심숙소폴더 -->
			<div class="favorite">

				<!-- 버튼 -->
				<div class="btnGroup">
					<input type="button" id="backBtn" value="뒤로가기" class="Btn" onclick="fn_back();">
					<input type="button" id="modifyBtn" value="목록수정" class="Btn">															
				</div>


				<div class="modifyPop ModDisNone">
					<div id="popupContent">
					
						<div class="popupHeader">
							<p class="modifyTitle">목록수정</p>
							<button class="xBtn">x</button>
						</div>

						<div class="popupSection">
							<input id="listName" type="text" placeholder="이름">
						</div>

						<div class="popupFooter">
							<input type="button" id="saveBtn" value="저장">
							<input type="button" id="deleteBtn" value="목록삭제">														
						</div>

					</div>
				</div>

				<div class="favoriteList">
					<div class="eachList">
						<div class="recomPic1 recommon">
							<div class="heartButton fav"></div>
						</div>						
					</div>
				</div>
			</div>
			
			</form>
		</section>

		<%@ include file="/views/common/footer.jsp"%>
	</div>
	
	<script>
	function fn_back(){					 
		         $("#favHouse").attr("action","<%=request.getContextPath()%>/member/favoriteFolder").submit();
		    }	
	</script>
	
	<script src="<%=request.getContextPath()%>/js/common/header.js"></script>
	<script src="<%=request.getContextPath()%>/js/member/favorite.js"></script>
</body>
</html>
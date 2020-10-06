<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/commonLink.jsp"%>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/member/mypage.css" />
   
  </head>
  <body>
    <div class="wrap">
			<!-- 숙소 -->
			<!-- 1. 예약완료된 숙소 -->
			<div class="house">
				<div class="reserved">
					<div class="line8">
						<p>예약완료된 숙소</p>
					</div>
					<div class="reservedList">
						<div>
							<div class="recomPic1 recommon"></div>
							<div class="reservedContents">
								<table>
									<tr>
										<td>숙소이름</td>
										<td>예약완료</td>
									</tr>
									<tr>
										<td>2020-01-08 ~ 2020-05-08</td>
										<td>예약취소</td>
									</tr>
								</table>
							</div>
						</div>
						<div>
							<div class="recomPic2 recommon"></div>
							<div class="reservedContents"></div>
						</div>
						<div>
							<div class="recomPic3 recommon"></div>
							<div class="reservedContents"></div>
						</div>
						<div>
							<div class="recomPic4 recommon"></div>
							<div class="reservedContents"></div>
						</div>
					</div>
				</div>

				<!-- 2. 이용했던숙소 -->
				<div class="stayed">
					<div class="line8">
						<p>이용했던 숙소</p>
					</div>
					<div class="stayedList">
						<div>
							<div class="recomPic1 recommon"></div>
							<div class="stayedContents"></div>
						</div>
						<div>
							<div class="recomPic2 recommon"></div>
							<div class="stayedContents"></div>
						</div>
						<div>
							<div class="recomPic3 recommon"></div>
							<div class="stayedContents"></div>
						</div>
						<div>
							<div class="recomPic4 recommon"></div>
							<div class="stayedContents"></div>
						</div>
					</div>
				</div>

			</div>
            
   
    </div>
    <script src="<%=request.getContextPath() %>/js/common/header.js"></script>
  </body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/member/mypage.css" />

		<!-- 숙소 -->
		<!-- 1. 예약완료된 숙소 -->
		<form class="house" method="post">
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
									<td><button>예약취소</button></td>
								</tr>
							</table>
						</div>
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

		</form>


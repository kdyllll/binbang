<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/views/common/commonLink.jsp"%>
<%
	String email=request.getParameter("email");	
%>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/member/myPage.css" />

</head>
<body>
	<div class="wrap">
		<%@ include file="/views/common/header.jsp" %>

		<section class="section">
			<div class="myPageLogo">
				<p>My Page</p>
			</div>
			
			<form id="memberFrm" method="post">
			<!-- 회원정보 -->
			<div class="lineList">
				<div class="line1">
					<p>회원이름</p>
					<div class="memberName"  id="name_"><%=m.getMemberName()%></div>
				</div>
				<div class="line2">
					<p>이메일</p>
					<div class="memberEmail" id="email_"><%=m.getEmail()%></div>
				</div>
				<div class="line3">
					<p>전화번호</p>
					<div class="memberPhone"id="phone_"><%=m.getPhone() %></div>
				</div>
				<div class="line4">
					<p>닉네임</p>
					<div class="memeberNickName" id="nickname_"><%=m.getNickname() %></div>
				</div>
			</div>
		</form>
		
			<!-- 회원메뉴 -->
			<div class="nav">
				<div class="line5"></div>
				<ul>
					<li><button id="changeStayed">숙소</button></li>
					<li><button id="changeCoupon">쿠폰</button></li>
					<li><button id="changeModify" onclick="fn_modify();">개인정보수정</button></li>
				</ul>
			</div>

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

			<!-- 2. 총 보유쿠폰 -->
			<div class="coupon">
				<div class="couponSum">
					<div class="couponContents">현재보유쿠폰    : <%=m.getCoupon()%> 개</div>
				</div>

				<!-- 구분선 -->
				<!-- 쿠폰사용/생성시 마다 추가되는 로직 -->
				<div class="couponCount">
					<div class="line6"></div>
					<ul>
						<li class="addDate">2020-09-05</li>
						<li class="addContent">이나주니 집사용</li>
						<li class="addCoupon">1박쿠폰 -</li>
					</ul>
						<div class="line7"></div>
				</div>
			</div>

			<!-- 3. 개인정보변경 -->
		<form id="memberModify" method="post">
			<div class="private">
				<div>			
					<p>개인정보변경</p>
					 <input type="hidden" value="<%=email %>" name="email">
					 									
					<div class="line6"></div>
				</div>
				
				<table>
					
					<tr>
						<td>새로운 비밀번호</td>
						<td><input type="password" placeholder="비밀번호 입력" name="new_pw" id="pw"></td>
							<td><span id="pwCheck"></span></td>
					</tr>
					<tr class="tr2">
						<td>비밀번호 확인</td>
						<td><input type="password" placeholder="비밀번호 확인" id="pwck" onkeyup="pwCheck();"></td>						
						<td><input type="button" onclick="fn_updatePassword();" id="btn3" value="비밀번호변경"/> </td>					
					</tr>			
					<tr>
						<td>현재 닉네임 </td>
						<td><%=m.getNickname()%></td>
					</tr>	
					<tr class="tr2">
						<td>새로운 닉네임</td>
						<td><input type="text" name="nickname" placeholder="닉네임 입력"></td>						
						<td></td>
					</tr>
					<tr>
						<td>현재 전화번호</td>
						<td> <%=m.getPhone()%></td>
					</tr>
					<tr>
						<td>새로운 전화번호</td>
						<td><input type="text" name="phone" placeholder="전화번호 입력"></td>
						<td><input type="button" onclick="fn_updateMember();" id="btn2" value="수정완료"/></td>
					</tr>		
				</table>						
				
				<div class="modifyComplete">				
					<div class="line6"></div>
					<input type="button" onclick="fn_deleteMember();" id="btn1" value="회원탈퇴"/>																					
				</div>				
			</div>
			</form>
			
		</section>

		<%@ include file="/views/common/footer.jsp"%>
	</div>
	<script src="<%=request.getContextPath()%>/js/common/header.js"></script>
	<script src="<%=request.getContextPath()%>/js/member/myPage.js"></script>
	
	<script>
			//비밀번호 & 비밀번호확인
		    function pwCheck() {
		        let pw=$("#pw").val().trim();
		        let pwck=$("#pwck").val().trim();
		        if(pw==pwck){
		            $("#pwCheck").css("color","green").html("비밀번호가 동일합니다.");            
		          }else if(pw!=pwck){
		             $("#pwCheck").css("color","red").html("동일한 비밀번호를 입력하세요.");           
		          }		        
		      };			
			//비밀번호 변경
			function fn_updatePassword(){
				$("#memberModify").attr("action","<%=request.getContextPath()%>/member/memberPasswordUpdate").submit();
			}	
			//정보수정(비밀번호 이외)
			function fn_updateMember(){
				 $("#memberModify").attr("action","<%=request.getContextPath()%>/member/memberUpdate").submit();			
			}
			//회원탈퇴
			function fn_deleteMember(){
		         $("#memberModify").attr("action","<%=request.getContextPath()%>/member/memberDelete").submit();
		     }
			
			//개인정보 클릭시 비밀번호 확인창
			function fn_modify(){
				const url="<%=request.getContextPath()%>/member/memberPasswordCheck";
				const title="passwordCheck";
				const status="left=500px,top=100px, width=300px, height=200px";
				
				open("",title,status);
				
				
			}
			
			
			
			
	</script>
</body>
</html>
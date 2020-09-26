<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/commonLink.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/member/login.css" />
</head>
<body>
	<div class="wrap">
		<%@ include file="/views/common/header.jsp"%>

		<section class="section">

			<!-- 로그인 페이지 -->
			<div class="loginContainer">
				<form id="loginFrm" method="post">
					<p class="loginTitle">LogIn</p>
					<div class="loginLine"></div>

					<input type="text" class="login" name="userId"
						placeholder="아이디(이메일) 입력해주세요"> 
					<input type="password"
						class="login" name="password" placeholder="비밀번호 입력해주세요">

					<div class="saveIdDiv">
						<input type="checkbox" name="saveId" id="saveId" checked>
						<label for="saveId">아이디 저장</label>
					</div>

					<div class=otherBtns>
						<button id="loginButton" onclick="fn_login();">LogIn</button>
						<a  href="#" id="findId">아이디 찾기</a>
						<p class="division">|</p>
						<a  href="#" id="findPw">비밀번호 찾기</a>
						<p class="division">|</p>
						<a href="<%=request.getContextPath()%>/member/memberEnrollChoice" id="newSignUP">회원가입</a>
					</div>

					<div class="loginLine2"></div>

					<div class="loginBtns">
						<a href="#" class="buttonDiv">
							<div id="naverImage"></div>
							<span id="naverLogin">Naver 로그인</span>
						</a>
						<a href="#" class="buttonDiv">
							<div id="kakaoImage"></div>
							<span id="kakaoLogin">Kakao 로그인</span>
						</a>
						<a href="#" class="buttonDiv">
							<div id="googleImage"></div>
							<span id="googleLogin">Google 로그인</span>
						</a>
					</div>

				</form>

			</div>

		</section>
		<%@ include file="/views/common/footer.jsp"%>
		<script>
		function fn_login() {
			$("#loginFrm").attr("action","<%=request.getContextPath() %>/member/login");
		}
		$(document).ready(function(){
	          $("#findId").on("click",function(){
	             const url="<%=request.getContextPath()%>/member/findId";
	             const status="width=500px,height=450px,top=150px,left=150px";
	             open(url,"",status);
	             
	          }),
	          $("#findPw").on("click",function(){
	             const url="<%=request.getContextPath()%>/member/findPassword";
	             const status="width=500px,height=450px,top=150px,left=150px";
	             open(url,"",status);
	          });
	          
	          
	          
	       });
			
		</script>
	</div>
	<script src="<%=request.getContextPath()%>/js/common/header.js"></script>
</body>
</html>
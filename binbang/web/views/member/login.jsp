<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.binbang.member.model.vo.Member" %>
<%@ include file="/views/common/commonLink.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/member/login.css" />
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<!-- <script src="https://nid.naver.com/oauth2.0/authorize?client_id={fmUx4brr6eqieHyPczqT}&response_type=code&redirect_uri={http://localhost:9090/binbang/mainMove}&state={$state}"></script> -->
<%
	
	Member loginMember=(Member)session.getAttribute("loginMember");
	
	Cookie[] cookies=request.getCookies();
	String saveId=null;
	if(cookies!=null){
		for(Cookie c : cookies){
			if(c.getName().equals("saveId")){ 
				saveId=c.getValue();  
			}
		}
	}

%>


	<!-- google login -->
        <script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
        <script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
        <script src="//www.gstatic.com/firebasejs/live/3.0/firebase.js"></script>
        <script src="../firebase/init.js"></script>
        <script src="<%=request.getContextPath()%>/js/etc/google.js"></script>




</head>
<body>
	<div class="wrap">
		<%@ include file="/views/common/header.jsp"%>

		<section class="section">

			<div class="loginContainer">
			
				<form id="loginFrm" method="post" action="<%=request.getContextPath() %>/member/login">
					<p class="loginTitle">LogIn</p>
					<div class="loginLine"></div>

					<input type="text" class="login" name="userId"
						placeholder="아이디(이메일) 입력해주세요" value='<%=saveId!=null?saveId:"" %>'> 
					<input type="password" class="login" name="password" placeholder="비밀번호 입력해주세요">
					<div class="saveIdDiv">
						<input type="checkbox" name="saveId" id="saveId" checked>
						<label for="saveId">아이디 저장</label>
					</div>

					<div class=otherBtns>
						<input type="submit" value="LogIn" id="loginButton">
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
						<a href="#" class="buttonDiv" onclick="loginWithKakao();">
							<div id="kakaoImage"></div>
							<span id="kakaoLogin">Kakao 로그인</span>
						</a>
						<a href="#" class="buttonDiv" onclick="signIn()">
							<div id="googleImage"></div>		
							<span id="googleLogin">Google 로그인</span>
						</a>
						
					</div>
				</form>

			<!--네이버 로그인 버튼 
				<div id="naverIdLogin"></div> -->


			</div>
		</section>
		<%@ include file="/views/common/footer.jsp"%>
		<script>
		
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
		
		
		
		var naverLogin = new naver.LoginWithNaverId(
			{
				clientId: "fmUx4brr6eqieHyPczqT",
				callbackUrl: "http://localhost:9090/binbang/views/member/naverCallback.jsp",
				isPopup:true, /* 팝업을 통한 연동처리 여부 */
				loginButton: {color: "green", type: 3, height: 60} /* 로그인 버튼의 타입을 지정 */
			}
		);
		
		/* 설정정보를 초기화하고 연동을 준비 */
		naverLogin.init();
		
		//카카오
		Kakao.init('3d5c64870d68147d5b1ea344f9d2a634');
		console.log(Kakao.isInitialized());
		
		/* Kakao.Auth.authorize({
			  redirectUri: 'https://localhost:9090'
			}); */
		
		Kakao.Auth.login({
			
			  success: (auth) => {
			  },
			  fail: (err) => {
			    console.error(err)
			  }
			});
		
		loginWithKakao = () => {
		    try {
		      return new Promise((resolve, reject) => {
		        if (!Kakao) {
		          reject('Kakao 인스턴스가 존재하지 않습니다.')
		        }
		        Kakao.Auth.login({
		          success: (auth) => {
		            console.log('정상적으로 로그인 되었습니다.', auth);
		            this.setState({
		              isLogin: true
		            })
		          },
		          fail: (err) => {
		            console.error(err)
		          }
		        })
		      })
		    } catch (err) {
		      console.error(err)
		    }
		  } 

		</script>
	</div>
	<script src="<%=request.getContextPath()%>/js/common/header.js"></script>
</body>
</html>
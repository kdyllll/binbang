<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.binbang.member.model.vo.Member" %>
<%@ include file="/views/common/commonLink.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/member/login.css" />
<%
	
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
						placeholder="아이디(이메일) 입력하세요" value='<%=saveId!=null?saveId:"" %>'> 
					<input type="password" class="login" name="password" placeholder="비밀번호 입력하세요">
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

				</form>

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

		</script>
	</div>
	<script src="<%=request.getContextPath()%>/js/common/header.js"></script>
</body>
</html>
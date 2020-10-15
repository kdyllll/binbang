<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.binbang.member.model.vo.Member" %>	
<%@ include file="/views/common/commonLink.jsp"%>
<%
	Member m = (Member) session.getAttribute("m");
%>

<style>
/* 5-1 비밀번호 확인 */
.section {
	padding: 6% 20%;			
}
.passwordCheck{
	width: 100%;
	display: flex;
	justify-content: center;
}
.passwordCheck .container{
	width: 500px;
	height:150px;
	border: 1.5px solid; 
}

.passTitle{
width: 21%;
padding: 1%;
margin : 4%;
margin-left : 8%;
 /* border-bottom: 1.4px solid; */ 
}

.passLine{
display: flex;	
margin : 3%;
}
.passLine input, .passLine button{
margin : 5%;	
}
.passLine #passInput{
border-bottom: 1px gray solid;	
}

.passwordCheck .checkBtn{
	font-size: 14px;
	cursor: pointer;
	background-color: black;
	color:white;
	width:130px;
	
}
.passwordCheck input{
	width: 100%;
	height: 30px;
	background-color: none;
	outline: none;
	border: none;
	box-sizing: border-box;	
}
</style>


	<div class="wrap">
					
		<form  action="<%=request.getContextPath() %>/mypage/mypagePrivate" method="post" id="memberCheck">		
			<div class="passwordCheck">								
				
				<input type="hidden" value="<%=m.getEmail()%>" name="email" readonly>
				<div class="container">
					<p class="passTitle">비밀번호 확인</p>
					<div class="passLine">							
						<input type="password" placeholder="비밀번호 입력" id="passInput" name="password"> 						
						<button class="checkBtn" id="checkBtn">확인</button>												
					</div>
				</div>
			</div>				
		</form>
		
	</div>

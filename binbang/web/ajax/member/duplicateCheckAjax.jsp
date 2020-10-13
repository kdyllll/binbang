<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/commonLink.jsp"%>


<%
	String email = (String) request.getAttribute("result");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>Email중복확인</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/member/emailDuplicate.css" />

</head>
<body>

	
	<div id="emailCheck">
		<% if (email == null) { %>
		<p class="title">이메일 인증</p>
		<div class="line"></div>

		<div class="line2">
			[<span><%=request.getParameter("email")%></span>]는 사용가능합니다. 
			<input type="button" value="인증하기" id="emailConfirm">
		</div>
		<form id="numberFrm">							
				<input type="text"  name="num" id="num" class="passNumber" placeholder="인증번호 입력"> 				 
				<input type="hidden" name="email" id="email" value="<%=request.getParameter("email")%>"> <!-- 중복이 아닌 email enroll input창에 띄어줌 -->
				<input type="button" id="numConfirm" value="인증확인">			
		</form>				

		
		<form>
			<div id="resend">
				<p id="timer"></p>
				<input type="button" value="재전송" style="display:none;" onclick="resendNum();" id="resendBtn">
			</div>
		</form>

		<% } else { %>
		<p class="title">중복확인</p>
		<div class="line"></div>

		<div class="line1">
			[<span id="duplicated"><%=email%></span>]는 사용중입니다.
		</div>
		
		<div class="popFooter">		
			<form action="<%=request.getContextPath()%>/member/checkEmailDuplicateAjax" method="post">
				<input type="text" name="email" class="passDuplicate" placeholder="Email Retry"> 
				<input type="submit" value="중복검사" onclick="return fn_validate();" id="duplicateRetry">
			</form>
		</div>
		<% } %>
	</div>	


	<script>
/* 1. 중복되는 email일때 반복 logic*/
	function fn_validate(){
		let userId=document.getElementById("email").value;
		if(userId.trim().length==0){
			alert("Email을 입력하세요");
			document.getElementById("email").value="";
			document.getElementById("email").focus();
			return false;
		}
	}

/* 2. email 인증 logic */
  	$("#emailConfirm").click( e => {
		$.ajax({
			url:"<%=request.getContextPath()%>/member/memberEmailConfirm",
			type:"post",
			data:{"email":$("#email").val()},
			dataType:"html",
			success:data =>{
				if($("#email").val().trim().length==0){
					alert("Email을 확인해주세요.");
					return;					
				}else{
					alert("인증번호가 발송되었습니다.");
					sendNumber();							
				}
			},
			error:(request,status,error)=>{
				console.log(request);
				console.log(status);
				console.log(error);
			}
		});
	});	
	


	
	
	
	$("#numConfirm").click(e => {		
		/* 인증번호 확인후 창닫기 */
		$.ajax({
			url:"<%=request.getContextPath()%>/member/duplicateNumberCheck",
			type:"post",
			data:{
				  "num":$("#num").val(),
				  "email":$("#email").val()
				  },
			dataType:"json",
			success:data => {
			/* 인증(msg/email)이 enroll.jsp로 가도록 설정 */
				console.log(data);																
				alert(data["msg"]);
				if(data["result"]=='0'){							
					opener.document.getElementById("hidden").value=data["msg"];					
					opener.document.getElementById("email_").value=data["email"];										
				 	self.close(); 					
				}
			},
			error:(request,status,error)=>{
				console.log(request);
				console.log(status);
				console.log(error);
			}
		});	
	});
	

	
 	
 	/* 재전송 */ 
 	let time = 300;
 	let min = 0;
 	let sec = 0;
 	let x = 0;
 	
 	function resendNum(){
 		clearInterval(x);
 		time=300; 		
 		sendNumber(); 		
 	};
 	
 	
 	function sendNumber(){
 		document.getElementById("resendBtn").style.display="block"; 		
 		x=setInterval(function(){
 			min=parseInt(time/60);
 			sec=time%60;
 			document.getElementById("timer").innerHTML="인증 시간 : "+min+"분"+sec+"초";
 			time--;
 			
 	        if(time<0){
 	           clearInterval(x);
 	           document.getElementById("timer").innerHTML="다시 인증해주세요.";
 	        }
 		},1000); 		
 	};
 	

	
	


	
	


</script>


</body>
</html>
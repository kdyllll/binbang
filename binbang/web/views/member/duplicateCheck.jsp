<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String email=(String)request.getAttribute("result");
%>        
    
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <title>Email중복확인</title>  
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/member/emailDuplicate.css" />
    
  </head>
<body>
		<div id="emailCheck">
		

			<%if(email==null){ %>
				<p class="title">이메일 인증</p>
				<div class="line"></div>
				
				<div class="line1">
				[<span><%=request.getParameter("email")%></span>]는 사용가능합니다. <input type="button" value="인증하기" id="emailConfirm">  
				</div>		
				
				
				<p class="checkTitle">인증번호</p>				
				<div>
					<input type="text" class="passNumber" name="number" id="number" placeholder="인증번호 입력">
					<input type="hidden" readonly="readonly" name="confirmNumber">
					<input type="button" value="인증확인" id="emailComplite">
				</div>
					<input type="button" value="재전송" style="display:none;" id="resendBtn">									
												
				
			<%}else{ %>
			<p class="title">중복확인</p>
			<div class="line"></div>
			
			<div class="line1">
				[<span id="duplicated"><%=email %></span>]는 사용중입니다.				
			</div>
																							
			<form action="<%=request.getContextPath() %>/member/checkEmailDuplicate" method="post">
					
					<input type="text" name="email" class="passDuplicate" placeholder="Email Retry">
					<input type="submit" value="중복검사" onclick="return fn_validate();" id="duplicateRetry">
			</form>
			<%} %>
		</div>


<script>

	/* 이메일 인증 */
$("#emailConfirm").click(e => {
	$.ajax({
		url:"<%=request.getContextPath()%>/member/checkConfirmNumber",
		type:"post",
		data:{"email":$("#email").val()},
		dataType:"html",
		success:data => {
			if($("#email").val().trim().length==0){
				alert("이메일을 확인해주세요.");
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
	
	
	/* email 입력여부 */
	function fn_validate(){
		let userId=document.getElementById("email").value;
		if(userId.trim().length==0){
			alert("Email을 입력하세요");
			document.getElementById("email").value="";
			document.getElementById("email").focus();
			return false;
		}
	}
	


</script>


</body>
</html>
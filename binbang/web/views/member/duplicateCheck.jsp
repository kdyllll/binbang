<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String email=(String)request.getAttribute("result");
%>        
    
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Email중복확인</title>
    <script src="js/jquery/jquery-3.5.1.min.js"></script>
  
  </head>
<body>
		<div id="emailCheck">
			<%if(email==null){ %>
			[<span><%=request.getParameter("email") %></span>]는 사용가능합니다.
			<button type="button" onclick="fn_close();">닫기</button>	
			<%}else{ %>
			[<span id="duplicated"><%=email %></span>]는 사용중입니다.	
				<form action="<%=request.getContextPath() %>/checkIdDuplicate" method="post">
					<input type="text" name="userId" id="userId">
					<input type="submit" value="중복검사" onclick="return fn_validate();">
				</form>
			<%} %>														
		</div>
	
<style>
	div#checkId-container{text-align:center;padding-top:50px;}
	span#duplicated{color:red;font-weight:bolder;}
</style>

<script>
	function fn_close(){
		const email='<%=request.getParameter("email") %>';
		opener.document.getElementById("email_").value=email;
		opener.document.getElementById("password_").focus();
		close();
	}
	function fn_validate(){
		let email=document.getElementById("email").value;
		if(email.trim().length<10){
			alert("Email을 입력해주세요");
			document.getElementById("email").value="";
			document.getElementById("email").focus();
			return false;
		}
	}

</script>


</body>
</html>
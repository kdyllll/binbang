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
  </head>
<body>
		<div id="emailCheck">
			<%if(email==null){ %>
				[<span><%=request.getParameter("email")%></span>]는 사용가능합니다.
				<br><br>	
				<button type="button" onclick="fn_close();">닫기</button>
			<%}else{ %>
			
					[<span id="duplicated"><%=email %></span>]는 사용중입니다.				
				<form action="<%=request.getContextPath() %>/member/checkEmailDuplicate" method="post">
					<input type="text" name="email" id="email">
					<input type="submit" value="중복검사" onclick="return fn_validate();">
				</form>
			<%} %>														
		</div>
	
<style>
	div#emailCheck{text-align:center;padding-top:50px;}
	span#duplicated{color:red;font-weight:bolder;}
</style>

<script>
	/* 닫기 */
	function fn_close(){
		const email='<%=request.getParameter("email") %>';
		opener.document.getElementById("email_").value=email;
		opener.document.getElementById("pwck").focus();
		close();
	}
	
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
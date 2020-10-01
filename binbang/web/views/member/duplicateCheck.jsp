<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>중복확인</title>
    <script src="js/jquery/jquery-3.5.1.min.js"></script>
  
  </head>
<body>
		<div id="emailCheck">
				[<span><%=request.getParameter("email") %></span>]는 사용가능합니다.																
		</div>
	
<style>
	div#emailCheck{text-align:center;padding-top:50px;}	
</style>



</body>
</html>
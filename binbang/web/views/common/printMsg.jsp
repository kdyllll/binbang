<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	 String msg = (String)request.getAttribute("msg");
    	 String loc = (String)request.getAttribute("loc");
    	 String ajaxLoc = (String)request.getAttribute("ajaxLoc");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="hid" method="post">
		<input type="hidden" name="loc" value="<%=ajaxLoc%>">
		</form>
	<script>
		alert('<%=msg%>');		
		document.hid.submit();
		location.replace('<%=request.getContextPath()%><%=loc%>');
	</script>
</body>
</html>
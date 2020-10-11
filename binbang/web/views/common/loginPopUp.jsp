<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="<%=request.getContextPath()%>/loginPopUpEnd">
		아이디 <input type="text" name="userId" required>
		비밀번호 <input type="password" name="password" required>
	<input type="submit" value="로그인">
	</form>
</body>
</html>
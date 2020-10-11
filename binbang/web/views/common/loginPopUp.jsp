<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
</head>
<style>

.loginForm {
	padding:0 80px;
	box-sizing:border-box;
	margin-top:30px;
}
.loginTitle{
    margin: 0 10%;
    font-size:25px;
    color:black;
    text-align: right;
    font-weight:700;
  }
 
/* '로그인'제목과 버튼 사이 선  */
.loginLine{
    width: 100%;
    height: 2px;
    margin: 20px 0;
    background-color: black;
}
/* 밑에 선 */
.loginLine2{
    width: 100%;
    height: 1px;
    margin: 20px 0;
    background-color: black;
}

/* 아이디,비밀번호 입력창 */
.login{
    width:100%;
    height: 50px;
    display: block;
    margin: 10px auto;
    border:0;
    outline:0;
}
#loginButton{
    font-size: 17px;
    width:100%;
    height: 50px;
    margin-bottom: 10px;
    background-color: black;
    color:white;
    border:0;
    outline:0;
    cursor: pointer;
    
}
</style>
<body>
	<form class="loginForm" method="post" action="<%=request.getContextPath()%>/loginPopUpEnd">
		<p class="loginTitle">LogIn</p>
		<div class="loginLine"></div>
		<input type="text" class="login" name="userId" placeholder="아이디(이메일) 입력해주세요"  >
		<input type="password" class="login" name="password" placeholder="비밀번호 입력해주세요">
		<input type="submit"  id="loginButton" value="로그인">
	</form>
</body>
</html>

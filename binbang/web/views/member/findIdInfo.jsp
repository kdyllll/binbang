<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String email = (String) request.getAttribute("email");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>아이디 알려주는 창</title>

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/member/findIdInfo.css" />
<script src="<%=request.getContextPath()%>/js/common/jquery-3.5.1.min.js"></script>

</head>

<body>

	<div class="findIdPopup">

		<p class="popupTitle">아이디 찾기</p>

		<div class="findIdLine"></div>
		<%
			if (email != null) {
		%>
		<p class="resultId"><%=email%></p>
		<button class="finishFindId" onclick="self.close();">확인</button>
		<%
			} else {
		%>
		<p class="resultId">일치하는 정보가 없습니다.</p>
		<button class="finishFindId" onclick="location.href='<%=request.getContextPath()%>/views/member/findId.jsp'">뒤로</button>
		<button class="finishFindId" onclick="self.close();">확인</button>
		<%
			}
		%>
		
	</div>


</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/views/common/commonLink.jsp"%>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/member/myPage.css" />

</head>
<body>
	<div class="wrap">
		<%@ include file="/views/common/header.jsp"%>

		<section class="section">
			<div class="myPageLogo">
				<p>My Page</p>
			</div>

			<form id="memberFrm" method="post">
				<!-- 회원정보 -->
				<div class="lineList">
					<div class="line1">
						<p>회원이름</p>
						<div class="memberName"><%=m.getMemberName()%></div>
					</div>
					<div class="line2">
						<p>이메일</p>
						<div class="memberEmail"><%=m.getEmail()%></div>
					</div>
					<div class="line3">
						<p>전화번호</p>
						<div class="memberPhone"><%=m.getPhone()%></div>
					</div>
					<div class="line4">
						<p>닉네임</p>
						<div class="memeberNickName"><%=m.getNickname()%></div>
					</div>
				</div>
			</form>

			<!-- 회원메뉴 -->
			<div class="nav">
				<div class="line5"></div>
				<ul>
					<li><button id="changeStayed">HOUSE</button></li>
					<li><button id="changePoint">POINT</button></li>
					<li><button id="changeModify">PRIVATE</button></li>
				</ul>
			</div>


			<div id="AllContents"></div>

		</section>

		<%@ include file="/views/common/footer.jsp"%>
	</div>

	<script src="<%=request.getContextPath()%>/js/common/header.js"></script>

	<script>	

	//myPagePCKAjax로 이동
		$("#changeModify").click(e=>{
			$.ajax({
				url:"<%=request.getContextPath()%>/member/myPagePCKAjax",				
				dataType:"html",
				success:data=>{
					$("#AllContents").children().remove();
					$("#AllContents").html(data);					
				},
				error:(request,status,error)=>{
					console.log(request);
					console.log(status);
					console.log(error);
				}
			});												
		});
	
	//myPagePointAjax로 이동
		$("#changePoint").click(e=>{
			$.ajax({
				url:"<%=request.getContextPath()%>/member/mypagePointAjax",
				dataType:"html",
				success:data=>{
					$("#AllContents").children().remove();
					$("#AllContents").html(data);	
				},
				error:(request,status,error)=>{
					console.log(request);
					console.log(status);
					console.log(error);
				}
			});
		});
	
	
	//myPageMainAjax로 이동
		$("#changeStayed").click(e=>{
			$.ajax({
				url:"<%=request.getContextPath()%>/member/mypageStayedAjax",
				dataType:"html",
				success:data=>{
					$("#AllContents").children().remove();
					$("#AllContents").html(data);	
				},
				error:(request,status,error)=>{
					console.log(request);
					console.log(status);
					console.log(error);
				}
			});			
		});
	
	
	
	</script>

</body>
</html>
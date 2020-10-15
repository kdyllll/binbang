<%@page import="com.binbang.booking.model.vo.Booking"%>
<%@page import="com.binbang.house.model.vo.Review"%>
<%@page import="com.binbang.house.model.vo.House"%>
<%@page import="java.util.List"%>
<%@page import="com.binbang.host.model.vo.Host"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/commonLink.jsp"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/host/hostInfoPage.css">
<% 
	Host h = (Host)request.getAttribute("host");
	List<House> list = (List)request.getAttribute("list");
	List<Review> rList =(List)request.getAttribute("reviewList");
	Member loginM = (Member)session.getAttribute("m");
	List<House> myHouse = (List)request.getAttribute("myHouse");
%>
</head>
<body>
	<div class="wrap">
	<%@ include file="/views/common/header.jsp"%>
	<section class="section">
		<aside class="hostInfoCon">
			<div>
				<a class="hostName" href="#"><%=h.getHostName() %></a>
				<img class="hostPic" src="<%=request.getContextPath() %>/upload/host/<%=h.getProfilePic() %>">
			</div>
			<a class="hostCommentMove" href="#hostCommentAll">숙소후기
			<%  if(rList != null) { %>
				<%
					float total = 0;
					for(Review r1 : rList)  {
						total += r1.getHouseGrade();	
				} 
				double avg = Math.round((total/rList.size()) * 10) / 10.0;
				%>
			 (<%=avg %>점)
			 <%} %>
			</a>
			<div class="line"></div>
			<h2><%=h.getHostName() %> 님의인증완료 내역</h2>
			<div class="authenticate">
				<img class="checkPic" src="<%=request.getContextPath() %>/image/host/host_regist/icon/check.png">
				<span>이메일 인증</span>
			</div>
			<div class="authenticate">
				<img  class="checkPic" src="<%=request.getContextPath() %>/image/host/host_regist/icon/check.png">
				<span>전화번호 인증</span>
			</div>
			<form class="reportHost" name="reportHost" >
				<input type="hidden" name="hostNo" value="<%=h.getHostNo()%>">
				<a>신고하기</a>
			</form>
		</aside>
		<aside class="hostHouseInfoCon">
			<div class="hostIntroduction">
				<h2>안녕하세요.<%=h.getHostName() %>입니다</h2>
				<span col="30" row="50" readonly><%=h.getIntro() %></span>
			</div>
			<ul class="hostHouseAllInfo">
			<% if(list != null) { %>
				<%for(int i = 0; i<list.size(); i++) {
					House ho = (House)list.get(i);%>
				<li class="hostHouseOne" id="house<%=i%>">
					<a href="<%=request.getContextPath()%>/house/houseDetailMove?houseNo=<%=ho.getHouseNo()%>&totalPrice=<%=ho.getPriceDay()%>">
					 	<img src="<%=request.getContextPath()%>/upload/house/<%=ho.getHouseMainPic()%>"> 
						<span><%=ho.getHouseName() %></span>
						<div class="hoverAction"></div>
						<span class="houseLoc"><%=ho.getHouseLocation().length() > 7 ? ho.getHouseLocation().substring(0,6) : ho.getHouseLocation() %></span>
					</a>
				</li>
				<%}  
				}%> 
			</ul>
			<button id="addBtn" onclick="moreList();">
				<span>더보기</span>
			</button>			
			<div class="line"></div>
			<div id="hostCommentAll">
				<% int commentCnt = 0;%>
				<% if(rList != null) { 
					commentCnt = rList.size(); %>
					<h2 >전체후기 <%=commentCnt %>개</h2>
					<% 
						for(int i=0; i<rList.size(); i++) {
							Review review = (Review)rList.get(i);
					%>	
					<div style="clear:both; margin-bottom:20px; height:200px;" id="comment<%=i%>">
						<a style="margin-bottom:20px;" href="<%=request.getContextPath()%>/house/houseDetailMove?houseNo=<%=review.getHouseNo()%>">
							<h3 class="houseName"><%=review.getHouseName() %></h3>
						</a>
						<% if(review.getFilePath() == null) { %>
						<img style="width:180px; height:150px; float:left; margin-right:20px;" src="<%=request.getContextPath()%>/upload/review/noimg.gif">
						<%} else { %>
						<img style="width:180px; height:150px; float:left; margin-right:20px;" src="<%=request.getContextPath()%>/upload/review/<%=review.getFilePath()%>">
						<%} %>
						<span style="clear:both;"><%=review.getMemberName().substring(0,2) %>*</span>
						<span class="checkInDate"><%=review.getCommentDate().substring(0,10) %></span>
						<h3 style="margin-top:20px;line-height:20px; "><%=review.getCommentContents()%></h3>
					</div>
				<%} } %>
			</div>
			<button id="addBtn2" onclick="moreList2();">
				<span>더보기</span>
			</button>


		</aside>
	</section>
	<%@ include file="/views/common/footer.jsp"%>
	</div>
	<script>
		//더보기 버튼 구현
		
			let lengthSize = $(".hostHouseOne").length;
			let startCnt = 3;
			if(lengthSize <= startCnt) {
				$("#addBtn").css("display", "none");
			}
		 	for(let i=startCnt; i<lengthSize; i++) {
				$("#house"+i).css("display","none")		
			} 
			function moreList() {
				for(let i=startCnt; i<startCnt + 3; i++) {
					$("#house"+i).css("display","block");
				} 
				startCnt = startCnt + 3;
				if(startCnt > lengthSize) {
					$("#addBtn").css("display", "none");
				}
			}
			let commentSize = $("#hostCommentAll > div").length;
			let startCnt2 = 3;
			if(commentSize <= startCnt2) {
				$("#addBtn2").css("display", "none");
			}
			for(let i=startCnt2; i<commentSize; i++) {
				$("#comment"+i).css("display","none");
			}
			function moreList2() {
				for(let i=startCnt2; i<startCnt2 + 3; i++) {
					$("#comment"+i).css("display","block");
				} 
				startCnt2 = startCnt2 + 3;
				if(startCnt2 > commentSize) {
				 $("#addBtn2").css("display","none");
				}
			}
		

		 $(".reportHost").on("click", e => {
			 let login = "";
			 let loginNo = "";
			 let myHouse = "";
			 let host = "";
		 
			<% if(loginM != null) {%>
				login = '<%=loginM %>';
				loginNo = '<%=loginM.getMemberNo() %>';
			<% } %>
			<% if(myHouse != null ) {%>
			 	myHouse = '<%=myHouse %>';
			<% } %>
			host = '<%=h.getMemberNo() %>'; 
			console.log(myHouse);
			console.log(loginNo);
			if(login == "") {
				alert("로그인한 회원만 이용가능합니다.");
				fn_loginPopUp();
			}  else {
				if(myHouse == "[]") {				
					alert("해당 호스트의 숙소를 이용한적이 없습니다.");
				} else if(loginNo === host) {
					alert("현재 로그인한 사람과 호스트가 일치합니다.");
				} else {
					/* 여기서 신고페이지로 넘어가게 하기 */
					fn_reportPage();
				}
			}	
		});
		 
		 function fn_loginPopUp() {
			 	const url = "<%=request.getContextPath()%>/loginPopUp";
		   		const title = "loginPopUp";
		   		const status = "left=100px, top=100px, width=500px, height=350px";
		   		open("",title,status); 

		   	 	reportHost.target = title;
		   	 	reportHost.action = url;
		   		reportHost.method = "post";

		   	 	reportHost.submit();
		 }
		 //신고하기 팝업창으로 이동
		 function fn_reportPage() {
		   		const url = "<%=request.getContextPath()%>/hostReport";
		   		const title = "hostReport";
		   		const status = "left=500px, top=100px, width=500px, height=500px";
		   		open("",title,status); 

		   	 	reportHost.target = title;
		   	 	reportHost.action = url;
		   		reportHost.method = "post";

		   	 	reportHost.submit();
		 }

	</script>
	<script src="<%=request.getContextPath()%>/js/common/header.js"></script>
</body>
</html>
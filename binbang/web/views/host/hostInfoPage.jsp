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
%>
</head>
<body>
	<div class="wrap">
	<%@ include file="/views/common/header.jsp"%>
	<section class="section">
		<aside class="hostInfoCon">
			<div>
				<a href="#"><%=h.getHostName() %></a>
				<img src="<%=h.getProfilePic()%>">호스트 사진
			</div>
			<p>숙소후기</p>
			<div class="line">선</div>
			<h2><%=h.getHostName() %>님인증완료</h2>
			<div>
				<div>체크사진</div>
				<span>이메일 인증</span>
			</div>
			<div>
				<div>체크사진</div>
				<span>전화번호 인증</span>
			</div>
			<a href="#">신고하기</a>
		</aside>
		<aside class="hostHouseInfoCon">
			<div class="hostIntroduction">
				<h2>안녕하세요.<%=h.getHostName() %>입니다</h2>
				<span col="30" row="50" readonly><%=h.getIntro() %></span>
			</div>
			<ul class="hostHouseAllInfo">
				<%for(House ho : list) { %>
				<li class="hostHouseOne">
					<a href="<%=request.getContextPath()%>/house/houseDetailMove?houseNo=<%=ho.getHouseNo()%>">
						<img src="#">
						<span><%=ho.getHouseNo() %></span>
						<span><%=ho.getHouseName() %></span>
					</a>
				</li>
				<%} %>
				<button id="addBtn" onclick="moreList();"><span>더보기</span></button>
			</ul>
			
			<div class="line">선</div>
			

		</aside>
	</section>
	<%@ include file="/views/common/footer.jsp"%>
	</div>
	<script>
		moreList(); //함수 호출
 
 function moreList() {
  
	 var startNum = $(".hostHouseOne").length; 
	 var addListHtml = "";  
	 console.log("startNum", startNum); //콘솔로그로 startNum에 값이 들어오는지 확인
  
	  $.ajax({
		 url : "/study/getfilmList",
		 type : "post",
		 dataType : "json",
		 data : {"startNum":startNum},
		 
		 success : function(data) {
			 if(data.length < 10){
				 $("#addBtn").remove();   // 더보기 버튼을 div 클래스로 줘야 할 수도 있음
			 }else{
			 var addListHtml ="";
			 if(data.length > 0){
				 
				 for(var i=0; i<data.length;i++) {
					 var idx = Number(startNum)+Number(i)+1;   
					 // 글번호 : startNum 이  10단위로 증가되기 때문에 startNum +i (+1은 i는 0부터 시작하므로 )
					 addListHtml += "<tr>";
					 addListHtml += "<td>"+ idx + "</td>";
					 addListHtml += "<td>"+ data[i].title + "</td>";
					 addListHtml += "<td>"+ data[i].description + "</td>";
					 addListHtml += "</tr>";
				 }
				 $("#listBody").append(addListHtml);
			 }
			 }
		 }
	 });
  
 }

	</script>
	<script src="<%=request.getContextPath()%>/js/common/header.js"></script>
</body>
</html>
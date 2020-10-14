<%@page import="java.util.List"%>
<%@page import="com.binbang.house.model.vo.House"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/views/common/commonLink.jsp"%>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/member/main.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/common/cal.css"
	type="text/css" />

<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>

<%
	List<House> list = (List)request.getAttribute("mainHouse");
%>

</head>
<body>
	<div class="wrap">
		<%@ include file="/views/common/header.jsp"%>
		<div class="banner">
			<form class="searchBox">
				<div class="searchLoc">
					<p>위치</p>
					<input type="text" name="search" id="search" placeholder="여행지를 입력해주세요">
				</div>
				<div class="checkInDate">
					<p>체크인</p>
					<input type="text" class="date" name="checkIn" id="checkIn" value="날짜선택" readonly>
				</div>
				<div class="checkInDate">
					<p>체크아웃</p>
					<input type="text" class="date" name="checkOut" id="checkOut" value="날짜선택" readonly>
				</div>
				<div>
					<p>인원</p>
					<div class="peopleNumCon">
						<input type="hidden" name="peopleNum" id="peopleNum" value="" required>
						<img src="<%=request.getContextPath() %>/image/common/icon/minus.png" id="pMinus">
						<span class="peopleNum">0</span>
						<img src="<%=request.getContextPath() %>/image/common/icon/add.png" id="pAdd">
					</div>
				</div>
				<input type="button" class="searchBtn" value="검색" onclick="fn_search();">
			</form>
		</div>
		
		<section class="section">
			<div class="section2">
				<h2 class="recommendTitle">Recommend</h2>
				<div class="recommend">
				<% if(list.size() > 6) {
					for(int i =0; i < 6; i++) {%>
					<% House h = (House)list.get(i); %> 
					<a href="<%=request.getContextPath()%>/house/houseDetailMove?houseNo=<%=h.getHouseNo() %>&totalPrice=<%=h.getPriceDay()%>">
						<img src="<%=request.getContextPath() %>/upload/house/<%=h.getHouseMainPic() %>" class="recomPic1 recommon">
						<div class="recomContents">
							<p><%=h.getHouseName() %></p>
							<p><%=h.getHouseLocation().length() > 10 ? h.getHouseLocation().substring(0,9) + "..." : h.getHouseLocation() %></p>
						</div>
					</a>
				<%} } else {
					for(House h : list) {%>
					<a href="<%=request.getContextPath()%>/house/houseDetailMove?houseNo=<%=h.getHouseNo() %>&totalPrice=<%=h.getPriceDay()%>">
						<img src="<%=request.getContextPath() %>/upload/house/<%=h.getHouseMainPic() %>" class="recomPic1 recommon">
						<div class="recomContents">
							<p><%=h.getHouseName() %></p>
							<p><%=h.getHouseLocation().length() > 10 ? h.getHouseLocation().substring(0,9) + "..." : h.getHouseLocation() %></p>
						</div>
					</a>
				<%} }%>
				</div>
			</div>
			<div class="section3">
				<ul>
					<li>공지사항</li>
					<li>Lorem ipsum, dolo adipisicing elit. incidunt quas debitis<br />
						궁금한 사항을 검색해보세요
					</li>
					<li><a href="<%=request.getContextPath()%>/notice/noticeList">SHOW
							NOW</a></li>
				</ul>
				<ul>
					<li>ABOUT BINBANG</li>
					<li>Lorem ipsum, dolo adipisicing elit. incidunt quas debitis<br />
						BINBANG에 대한 정보를 자세히 알아보세요.
					</li>
					<li><a href="#">CONTACT US</a></li>
				</ul>
			</div>
		</section>
		<%@ include file="/views/common/footer.jsp"%>
	</div>
	<script src="<%=request.getContextPath()%>/js/common/header.js"></script>
	<script src="<%=request.getContextPath()%>/js/member/main.js"></script>
	<script>
		//달력 datepicker
		$(function() {
			$("#checkIn").datepicker(
					{
						dateFormat : "yy/mm/dd",
						minDate: new Date(),
						dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토" ],
						monthNames : [ "1월", "2월", "3월", "4월", "5월", "6월",
								"7월", "8월", "9월", "10월", "11월", "12월" ],
						onSelect : function(d) {
							 $("#checkIn").val(d);
							var week = new Array("일", "월", "화", "수", "목", "금","토");
						}
					});
			$("#checkOut").datepicker(
					{
						dateFormat : "yy/mm/dd",
						minDate: new Date(),
						dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토" ],
						monthNames : [ "1월", "2월", "3월", "4월", "5월", "6월",
								"7월", "8월", "9월", "10월", "11월", "12월" ],
						onSelect : function(d) {
							 $("#checkOut").val(d);
							var week = new Array("일", "월", "화", "수", "목", "금","토");
						}
					});
		});		
		let cnt = 0;
		

		$("#pAdd").on("click", e => {
			if(cnt<9) {
				cnt++;
				$(".peopleNum").html(cnt);
				$("#peopleNum").val(cnt);
			}
		})
		$("#pMinus").on("click", e => {
			if(cnt > 0) {
				cnt--;
				$(".peopleNum").html(cnt);
				$("#peopleNum").val(cnt);
			}
		})

    	function fn_search(){
			console.log($("#search").val().trim().length);
			if($("#search").val().trim().length==0){
				alert("지역을 입력하세요");
				return;
			}else if($("#checkIn").val().trim()=="날짜선택"||$("#checkOut").val().trim()=="날짜선택"){
				alert("숙박 날짜를 선택하세요");
				return;
			}else if($("#peopleNum").val().trim().length==0||$("#peopleNum").val().trim()=="0"){
				alert("인원을 선택하세요");
				return;
			}else{
    		$(".searchBox").attr("action", "<%=request.getContextPath()%>/house/houseSearchList").submit();
			}
		} 
		
		
		
		
	</script>
</body>
</html>

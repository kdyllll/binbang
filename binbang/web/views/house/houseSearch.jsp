<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/commonLink.jsp"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/house/searchBox.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/house/houseSearch.css" />
<%@ page import="java.util.List,com.binbang.house.model.vo.House"%>
<%
	List<House> list = (List) request.getAttribute("list");
/* House h=(House)request.getAttribute("house"); */
%>
</head>
<body>
	<div class="wrap">
		<%@ include file="/views/common/header.jsp"%>

		<section class="section">

			<div class="section1">
				<!-- 정렬구역 -->

				<form class="btnCon sort">
					<div class="btn">
						<p class="btnText pSort">정렬</p>
						<div class="arrow"></div>
					</div>

					<ul class="box" id="houseSort">
						<li>기본순</li>
						<li>추천순</li>
						<li>가격낮은순</li>
						<li>가격높은순</li>
					</ul>
				</form>

				<form name="priceForm" class="btnCon">
					<div class="btn">
						<p class="btnText">요금</p>
						<div class="arrow"></div>
					</div>

					<ul class="box">
						<li><input type="checkbox" name="price" value="10" id="10"><label
							for="10"> 10만원 이하</label></li>
						<li><input type="checkbox" name="price" value="20" id="20"><label
							for="20"> 10만원 이상 20만원 이하</label></li>
						<li><input type="checkbox" name="price" value="30" id="30"><label
							for="30"> 20만원 이상 30만원 이하</label></li>
						<li><input type="checkbox" name="price" value="40" id="40"><label
							for="40"> 30만원 이상 40만원 이하</label></li>
						<li><input type="checkbox" name="price" value="50" id="50"><label
							for="50"> 40만원 이상 50만원 이하</label></li>
						<li><input type="checkbox" name="price" value="60" id="60"><label
							for="60"> 50만원 이상 60만원 이하</label></li>
						<li><input type="checkbox" name="price" value="70" id="70"><label
							for="70"> 60만원 이상</label></li>
						<li id="priceBtn" class="selectBtn"><div>해당숙소 00개</div></li>
					</ul>
				</form>

				<form name="filterForm" class="btnCon">
					<div class="btn">
						<p class="btnText">필터</p>
						<div class="arrow"></div>
					</div>
					<ul class="box">
						<li><input type="checkbox" id="bbq" name="filter" value="1"><label
							for="bbq"> 바베큐</label></li>
						<li><input type="checkbox" id="breakfast" name="filter"
							value="2"><label for="breakfast"> 조식</label></li>
						<li><input type="checkbox" id="terrace" name="filter"
							value="3"><label for="terrace"> 테라스</label></li>
						<li><input type="checkbox" id="shower" name="filter"
							value="4"><label for="shower"> 샤워룸</label></li>
						<li><input type="checkbox" id="park" name="filter" value="5"><label
							for="park"> 정원</label></li>
						<li><input type="checkbox" id="swimming" name="filter"
							value="6"><label for="swimming"> 수영장</label></li>
						<li><input type="checkbox" id="dog" name="filter" value="7"><label
							for="dog"> 반려동물</label></li>
						<li><input type="checkbox" id="smoking" name="filter"
							value="8"><label for="smoking"> 흡연</label></li>
						<li><input type="checkbox" id="parking" name="filter"
							value="9"><label for="parking"> 주차</label></li>
						<li><input type="checkbox" id="kitchen" name="filter"
							value="10"><label for="kitchen"> 주방</label></li>
						<li><input type="checkbox" id="laundryRoom" name="filter"
							value="11"><label for="laundryRoom"> 세탁실</label></li>
						<li><input type="checkbox" id="wifi" name="filter" value="12"><label
							for="wifi"> 와이파이</label></li>
						<li id="filterBtn" class="selectBtn"><div>해당숙소 00개</div></li>
					</ul>
				</form>

			</div>

			<div class="section2">
				<!-- 지도와 숙소들 영역 -->


			</div>
	</div>


	</section>

	<%@ include file="/views/common/footer.jsp"%>
	</div>

	<script>
		$.ajax({
	        url:"<%=request.getContextPath()%>/house/houseSearchAjax",
	        /* data:{"name" : "다예가 보내주는 정보"}, */
	        type:"post",
	        dataType: "html",
	        success: (data) => {
	     	$(".section2").children().remove();
	     	$(".section2").html(data);
	        },
	        error: (request, status, error) => {
	            console.log(request);
	            console.log(status);
	            console.log(error);
	        }
	      });
		
		//정렬 버튼 누를때
		$("#houseSort > li").on("click",function(e){
			$.ajax({
				url:"<%=request.getContextPath()%>/house/houseSort",
				data:{"key":$(e.target).val()},
				type:"post",
				dataType:"html",
				success: (data)=>{
					$(".section2").children().remove();
			     	$(".section2").html(data);
				},
				error: (request, status, error) => {
		            console.log(request);
		            console.log(status);
		            console.log(error);
		        }
			});
		});
		//금액 검색 누를때
		$("#filterBtn").on("click",function(e){
			var param = $("form[name=priceForm]").serialize();
			$.ajax({
				url:"<%=request.getContextPath()%>/house/priceSort",
				data:param,
				type:"post",
				dataType:"html",
				success: (data)=>{
					$(".section2").children().remove();
			     	$(".section2").html(data);
				},
				error: (request, status, error) => {
		            console.log(request);
		            console.log(status);
		            console.log(error);
		        }
			});
		});
		//필터 검색 누를 때
		$("#priceBtn").on("click",function(e){
			var param = $("form[name=filterForm]").serialize();
			$.ajax({
				url:"<%=request.getContextPath()%>/house/filterSort",
				data:param,
				type:"post",
				dataType:"html",
				success: (data)=>{
					$(".section2").children().remove();
			     	$(".section2").html(data);
				},
				error: (request, status, error) => {
		            console.log(request);
		            console.log(status);
		            console.log(error);
		        }
			});
		});
		
		
	</script>
	<script src="<%=request.getContextPath()%>/js/common/header.js"></script>
	<script src="<%=request.getContextPath()%>/js/house/houseSearch.js"></script>
	<script src="<%=request.getContextPath()%>/js/common/heart.js"></script>


</body>
</html>
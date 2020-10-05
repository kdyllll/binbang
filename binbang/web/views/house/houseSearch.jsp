<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/commonLink.jsp"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/house/searchBox.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/house/houseSearch.css" />
</head>
<body>
	<div class="wrap">
		<%@ include file="/views/common/header.jsp"%>

		<section class="section">

			<div class="section1">
				<!-- 정렬구역 -->

				<form action="" class="btnCon sort">
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

				<form action="" class="btnCon">
					<div class="btn">
						<p class="btnText">요금</p>
						<div class="arrow"></div>
					</div>

					<ul class="box">
						<li><input type="checkbox" name="price" value="10만원 이하"
							id="10"><label for="10"> 10만원 이하</label></li>
						<li><input type="checkbox" name="price"
							value="10만원 이상 20만원 이하" id="20"><label for="20">
								10만원 이상 20만원 이하</label></li>
						<li><input type="checkbox" name="price"
							value="20만원 이상 30만원 이하" id="30"><label for="30">
								20만원 이상 30만원 이하</label></li>
						<li><input type="checkbox" name="price"
							value="30만원 이상 40만원 이하" id="40"><label for="40">
								30만원 이상 40만원 이하</label></li>
						<li><input type="checkbox" name="price"
							value="40만원 이상 50만원 이하" id="50"><label for="50">
								40만원 이상 50만원 이하</label></li>
						<li><input type="checkbox" name="price"
							value="50만원 이상 60만원 이하" id="60"><label for="60">
								50만원 이상 60만원 이하</label></li>
						<li><input type="checkbox" name="price" value="60만원 이상"
							id="70"><label for="70"> 60만원 이상</label></li>
						<li class="selectBtn"><div>해당숙소 00개</div></li>
					</ul>
				</form>

				<form action="" class="btnCon">
					<div class="btn">
						<p class="btnText">필터</p>
						<div class="arrow"></div>
					</div>
					<ul class="box">
						<li><input type="checkbox" name="filter" value="반려동물"
							id="animal"><label for="animal"> 반려동물</label></li>
						<li><input type="checkbox" name="filter" value="흡연가능"
							id="smoke"><label for="smoke"> 흡연가능</label></li>
						<li><input type="checkbox" name="filter" value="주차공간"
							id="park"><label for="park"> 주차공간</label></li>
						<li><input type="checkbox" name="filter" value="주방 사용"
							id="kitchen"><label for="kitchen"> 주방 사용</label></li>
						<li><input type="checkbox" name="filter" value="세탁기 사용"
							id="wash"><label for="wash"> 세탁기 사용</label></li>
						<li><input type="checkbox" name="filter" value="드라이기"
							id="dry"><label for="dry"> 드라이기</label></li>
						<li><input type="checkbox" name="filter" value="에어컨/난방"
							id="aircon"><label for="aircon"> 에어컨/난방</label></li>
						<li><input type="checkbox" name="filter" value="냉장고 사용"
							id="ref"><label for="ref"> 냉장고 사용</label></li>
						<li class="selectBtn"><div>해당숙소 00개</div></li>
					</ul>
				</form>

			</div>

			<div class="section2">
				<!-- 지도와 숙소들 영역 -->
		

			</div>


		</section>

		<%@ include file="/views/common/footer.jsp"%>
	</div>
	
	<script>
		$.ajax({
	        url:"<%=request.getContextPath()%>/ajax/houseSearchAjax",
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
	
	
	</script>
	<script src="<%=request.getContextPath()%>/js/common/header.js"></script>
	<script src="<%=request.getContextPath()%>/js/house/houseSearch.js"></script>
	<script src="<%=request.getContextPath()%>/js/common/heart.js"></script>


</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<header class="header headerColor">
		<a href="<%=request.getContextPath() %>/mainMove" class="logo"></a>
		<div class="searchBox"></div>
		<div class="headerBox displayNone">
			<a href="#" class="infoFilter"> 정보 </a> 
			<a href="#" class="reviewFilter"> 후기 </a> 
			<a href="#" class="photoFilter"> 주변시설 </a>
		</div>
		<div class="headerBtn" id="headerBtn">
		<div class="ham mainHamColor"></div>
		<div class="ham mainHamColor"></div>
		<div class="ham mainHamColor"></div>
		
		
		<script>

	$(document).ready(function(){

		$(".infoFilter").click(function(){

			var offset = $(".infoFilterScroll").offset(); //선택한 태그의 위치를 반환

                //animate()메서드를 이용해서 선택한 태그의 스크롤 위치를 지정해서 0.4초 동안 부드럽게 해당 위치로 이동함 

	        $('html').animate({scrollTop : offset.top}, 300);

		});

	});

	$(document).ready(function(){

		$(".reviewFilter").click(function(){

			var offset = $(".reviewFilterScroll").offset(); //선택한 태그의 위치를 반환

                //animate()메서드를 이용해서 선택한 태그의 스크롤 위치를 지정해서 0.4초 동안 부드럽게 해당 위치로 이동함 

	        $('html').animate({scrollTop : offset.top}, 300);

		});

	});

	$(document).ready(function(){

		$(".photoFilter").click(function(){

			var offset = $(".photoFilterScroll").offset(); //선택한 태그의 위치를 반환

                //animate()메서드를 이용해서 선택한 태그의 스크롤 위치를 지정해서 0.4초 동안 부드럽게 해당 위치로 이동함 

	        $('html').animate({scrollTop : offset.top}, 300);

		});

	});

</script>



	</div>
		<%@ include file="/views/common/nav.jsp"%>
	</header>

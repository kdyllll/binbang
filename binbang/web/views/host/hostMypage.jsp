<%@page import="com.binbang.host.model.vo.Host"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/commonLink.jsp"%>
<%
	Host h = (Host) request.getAttribute("host");
	String loc = (String) request.getAttribute("loc");
	Member m2 = (Member)session.getAttribute("m");
%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/host/hostMypage.css" />
</head>
<style>

</style>
<body>
	<div class="wrap">
		<%@ include file="/views/common/header.jsp"%>
		<section class="section">
			<!-- 호스트정보부분 -->
			<form class="hostInfoContainer"
				action="<%=request.getContextPath()%>/host/hostInfoUpdate"
				method="post">
				<div class="hostInfoImg">
					<img
						src="<%=request.getContextPath()%>/image/host/host_regist/host_img/basic.jpg"
						alt="" /> <input type="file" name="uploadImg" id="uploadImg"
						class="disnone"> <label for="uploadImg" class="disnone">변경</label>
				</div>
				<div class="hostInfoContent">
					<div>
						<p>호스트이름</p>
						<span style="padding-left: 10px;"><%=h.getHostName()%></span>
					</div>
					<div>
						<p>호스트이메일</p>
						<span style="padding-left: 10px;"><%=h.getHostEmail()%></span>
					</div>
					<div>
						<p>소개글</p>
						<textarea name="hostIntro" id="hostIntro" cols="30" rows="10"
							readonly="true"><%=h.getIntro()%></textarea>
					</div>
					<input type="hidden" name="memberNo" value="<%=h.getMemberNo()%>">
					<input type="submit" id="changeInfo" value="수정"
						onclick="return invalidate();" />
				</div>
			</form>
			<ul class="houseRequest">
				<li id="houseManage" class="<%=loc.equals("/host/houseManageAjax") ? "borderTop" : "" %>">숙소관리</li>
				<li id="houseReq" class="<%=loc.equals("/host/houseRequestAjax") ? "borderTop" : "" %>">숙소요청</li>
				<li id="houseReqResult" class="<%=loc.equals("/host/houseRequestResultAjax") ? "borderTop" : "" %>">숙소현황</li>
			</ul>
			<div id="searchRequestContainer">
				<select class="searchTypeR">
					<option value="userEmailR">이메일</option>
					<option value="bookingNameR">예약자이름</option>
				</select>
				
				<div class="search-userEmailR">
					<form method="post">
						<input class="searchTypeEmailReq" type="hidden" name="searchType" value="email"> 
						<input class="searchKeywordEmailReq" type="text" name="searchKeyword" placeholder="이메일" size="25" value="">
						<input type="button" onclick="fn_searchReqEmail();" value="검색">
					</form>
				</div>
				<div class="search-bookingNameR">
					<form method="post">
						<input class="searchTypeGuestReq" type="hidden" name="searchType" value="guest_name"> 
						<input class="searchKeywordGuestReq" type="text" name="searchKeyword" placeholder="이름검색" size="25" value="">
						<input type="button" onclick="fn_searchReqGuest();" value="검색">
					</form>
				</div>
			</div>
			<div id="searchRequestResultContainer">
				<select class="searchTypeRR">
					<option value="userEmailRR">이메일</option>
					<option value="bookingNameRR">예약자이름</option>
				</select>
				
				<div class="search-userEmailRR">
					<form method="post">
						<input class="searchTypeEmail" type="hidden" name="searchType" value="email"> 
						<input class="searchKeywordEmail" type="text" name="searchKeyword" placeholder="이메일" size="25" value="">
						<input type="button" class="searchOneEmail" onclick="fn_searchReqResultEmail();" value="검색">
					</form>
				</div>
				<div class="search-bookingNameRR">
					<form method="post">
						<input class="searchTypeGuest" type="hidden" name="searchType" value="guest_name"> 
						<input class="searchKeywordGuest" type="text" name="searchKeyword" placeholder="이름검색" size="25" value="">
						<input type="button" class="searchOneName" onclick="fn_searchReqResultGuest();" value="검색">
					</form>
				</div>
			</div>
			<form class="myHouse"></form>

		</section>
		<%@ include file="/views/common/footer.jsp"%>
	</div>
	<script>
		let type ="";
		let key = "";
		let url = "<%=request.getContextPath()%><%=loc%>";	
	 	ajaxTest();
       $(".houseRequest > li").on("click", function (e) {
        $(".houseRequest > li").removeClass("borderTop");
        $(e.target).addClass("borderTop");
        let target = $(e.target).html();
        $("div#searchRequestResultContainer").css("display", "none");
        $("div#searchRequestContainer").css("display", "none");
        if (target == "숙소관리") {
          url = "<%=request.getContextPath()%>/host/houseManageAjax";
        } else if (target == "숙소요청") {
        	$("div#searchRequestContainer").css("display", "block");
          url = "<%=request.getContextPath()%>/host/houseRequestAjax";          
        } else {
        	$("div#searchRequestResultContainer").css("display", "block");
          url = "<%=request.getContextPath()%>/host/houseRequestResultAjax";
        }
        ajaxTest();
      });
       //숙소요청 검색
       function fn_searchReqEmail() {
    	   url = "<%=request.getContextPath()%>/host/houseRequestAjax";
    	   type=$(".searchTypeEmailReq").val();
    	   key=$(".searchKeywordEmailReq").val();
    	   ajaxTest();
       }
       function fn_searchReqGuest() {
    	   url = "<%=request.getContextPath()%>/host/houseRequestAjax";
    	   type=$(".searchTypeGuestReq").val();
    	   key=$(".searchKeywordGuestReq").val();
    	   ajaxTest();
       }
       //숙소현황검색
       function fn_searchReqResultEmail() {
    	   url = "<%=request.getContextPath()%>/host/houseRequestResultAjax";
    	   type=$(".searchTypeEmail").val();
    	   key=$(".searchKeywordEmail").val();
    	   ajaxTest();
       }
       
       function fn_searchReqResultGuest() {
    	   url = "<%=request.getContextPath()%>/host/houseRequestResultAjax";
    	   type=$(".searchTypeGuest").val();
    	   key=$(".searchKeywordGuest").val();
    	   ajaxTest();
       }
       
       //ajax
       function ajaxTest() {
    	   $.ajax({
               url:url,
               data:{"searchType" : type, "searchKeyword" : key},
               type:"post",
               dataType: "html",
               success: (data) => {
            	   $(".myHouse").html(data);      

               },
               error: (request, status, error) => {
                   console.log(request);
                   console.log(status);
                   console.log(error);
                 
                 }
             });
       } 
      
   	 $(document).ready(function(){
		let userEmailR = $(".search-userEmailR");
		let bookingNameR = $(".search-bookingNameR");
		let userEmailRR = $(".search-userEmailRR");
		let bookingNameRR = $(".search-bookingNameRR");
		
		$(".searchTypeR").change(function(e) {
			userEmailR.css("display","none");
			bookingNameR.css("display","none");
	
			let v = $(e.target).val();
			console.log(v);
			$(".search-"+v).css("display","inline-block");
		});
		$(".searchTypeRR").change(function(e) {
			userEmailRR.css("display","none");
			bookingNameRR.css("display","none");
			let v = $(e.target).val();
			console.log(v);
			$(".search-"+v).css("display","inline-block");
		});
		$(".searchTypeR").change();
		$(".searchTypeRR").change();

	});  

    </script>

	<script src="<%=request.getContextPath()%>/js/common/header.js"></script>
	<script src="<%=request.getContextPath()%>/js/host/hostMypage.js"></script>
</body>
</html>

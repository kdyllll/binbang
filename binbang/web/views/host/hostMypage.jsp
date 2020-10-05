<%@page import="com.binbang.host.model.vo.Host"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/commonLink.jsp"%>
<%
	Host h = (Host) request.getAttribute("host");
%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/host/hostMypage.css" />
</head>
<body>
	<div class="wrap">
		<%@ include file="/views/common/header.jsp"%>
		<section class="section">
			<!-- 호스트정보부분 -->
			<form class="hostInfoContainer" action="<%=request.getContextPath() %>/host/hostInfoUpdate" method="post">
				<div class="hostInfoImg">
					<img
						src="<%=request.getContextPath()%>/image/host/host_regist/host_img/basic.jpg"
						alt="" /> <input type="file" name="uploadImg" id="uploadImg"
						class="disnone"> <label for="uploadImg" class="disnone">변경</label>
				</div>
				<div class="hostInfoContent">
					<div>
						<p>호스트이름</p>
						<span style="padding-left: 10px;"><%=h.getHostName() %></span>
					</div>
					<div>
						<p>호스트이메일</p>
						<span style="padding-left: 10px;"><%=h.getHostEmail()%></span>
					</div>
					<div>
						<p>소개글</p>
						<textarea name="hostIntro" id="hostIntro" cols="30" rows="10" readonly="true"><%=h.getIntro()%></textarea>
					</div>
					<input type="hidden" name="memberNo" value="<%=h.getMemberNo() %>">
					<input type="submit" id="changeInfo" value="수정" onclick="return invalidate();" />
				</div>
			</form>
			<ul class="houseRequest">
				<li class="borderTop">숙소관리</li>
				<li>숙소요청</li>
				<li>숙소현황</li>
			</ul>
			<form class="myHouse"></form>

		</section>
		<%@ include file="/views/common/footer.jsp"%>
	</div>
	<script>
		let url = "<%=request.getContextPath()%>/house/houseManageAjax";
		ajaxTest();
       $(".houseRequest > li").on("click", function (e) {
        $(".houseRequest > li").removeClass("borderTop");
        $(e.target).addClass("borderTop");
        let target = $(e.target).html();
        if (target == "숙소관리") {
          url = "<%=request.getContextPath()%>/house/houseManageAjax";
        } else if (target == "숙소요청") {
          url = "<%=request.getContextPath()%>/house/houseRequestAjax";
        } else {
          url = "<%=request.getContextPath()%>/house/houseRequestResultAjax";
        }
        ajaxTest();
      });
       
       //ajax
       function ajaxTest() {
    	   $.ajax({
               url:url,
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
    </script>
	<script src="<%=request.getContextPath()%>/js/common/header.js"></script>
	<script src="<%=request.getContextPath()%>/js/host/hostMypage.js"></script>
</body>
</html>

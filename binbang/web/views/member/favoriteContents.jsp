<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/commonLink.jsp"%>

<%@ page import = "com.binbang.member.model.vo.Favorite, com.binbang.member.model.vo.Member" %>
<%@page import="java.util.List"%>	

<% 
	List<Favorite> list = (List) request.getAttribute("list");
	String na = (String)request.getAttribute("folderName"); 
	String no = (String)request.getAttribute("folderNo");  
	String mno = (String)request.getAttribute("memberNo");
%>



<link rel="stylesheet" href="<%=request.getContextPath()%>/css/member/favoriteContents.css" />
</head>
<body>
	<div class="wrap">
		<%@ include file="/views/common/header.jsp"%>


		<!-- 관심숙소content -->
		<section class="section">
		
		<form id="favHouse" method="post">
			<input type="hidden" value="<%=no%>" name="folderNo">
			<div class="line1">
				<input type="text" value="<%=na%>" class="favTitle">
				<div class="listLine"></div>
			</div>			
			<!-- 관심숙소폴더 -->
			<div class="favorite">

				<!-- 버튼 -->
				<div class="btnGroup">
					<input type="button" id="backBtn" value="뒤로가기" class="Btn" onclick="fn_back();">
					<input type="button" id="modifyBtn" value="목록수정" class="Btn">															
				</div>

					<input type="text" value="<%=mno%>" name="memberNo">
				
				<div class="modifyPop ModDisNone">
					<div id="popupContent">
					
						<div class="popupHeader">
							<p class="modifyTitle">목록수정</p>
							<button class="xBtn">x</button>
						</div>

						<div class="popupSection">
							<input id="listName" type="text" placeholder="이름">
						</div>

						<div class="popupFooter">
							<input type="button" id="saveBtn" value="저장" onclick="fn_moifyName();">
							<input type="button" id="deleteBtn" value="목록삭제" onclick="fn_folderDelete();">														
						</div>

					</div>
				</div>

				<div class="favoriteList">
					<% for(Favorite f : list){%>
									<form class="folderContents" method="post">	
											<input type="text" value="<%=f.getHouseNo() %>">	 																						
 											<input type="submit" class="eachList" id="eachList" onclick="fn_toContent();">								
									</form>																											
						<%}%>	
				</div>
			</div>
			
			</form>
		</section>

		<%@ include file="/views/common/footer.jsp"%>
	</div>
	
	<script>
	function fn_back(){					 
		         $("#favHouse").attr("action","<%=request.getContextPath()%>/favorite/favoriteBack").submit();
		    }	
	function fn_folderDelete(){
		 		$("#favHouse").attr("action","<%=request.getContextPath()%>/favorite/deleteFolder").submit();
		}
	
	</script>
	
	<script src="<%=request.getContextPath()%>/js/common/header.js"></script>
	<script src="<%=request.getContextPath()%>/js/member/favorite.js"></script>
</body>
</html>
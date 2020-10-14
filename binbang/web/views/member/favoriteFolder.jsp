<%@page import="java.text.Normalizer.Form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>	
<%@ include file="/views/common/commonLink.jsp"%>
<%@ page import = "com.binbang.member.model.vo.Favorite, com.binbang.member.model.vo.Member" %>
<%@page import="java.util.List"%>	

<% 
	List<Favorite> list = (List) request.getAttribute("list");  			
%>


<link rel="stylesheet" href="<%=request.getContextPath()%>/css/member/favoriteFolder.css" />
</head>
<body>
	<div class="wrap">
		<%@ include file="/views/common/header.jsp"%>
		
		
		<!-- 관심숙소list -->
	<section class="section">
					<form class="folderCreate" method="post">
						<div class="line1">
							<input type="hidden" value="<%=m.getMemberNo()%>" name="memberNo">																																		
							<p>관심숙소</p>				
							<div class="listLine"></div>
						</div>				
						
						<!-- 관심숙소폴더 -->
						<div class="favorite">
							<!-- 목록만들기 팝업 -->
							<input type="button" id="listBuildBtn" value="목록만들기" >				
			
							<div class="listPop listDisNone">										
									<div id="popupContent">						
										<div class="popupHeader">
											<p class="makingTitle">목록만들기</p>
											<button class="xBtn">x</button>
										</div>
											
										<div class="popupSection">
											<input  type="text" id="folderName" placeholder="이름" name="folderName">
											<input type="button" id="checkBtn" value="저장" onclick="fn_createFolder();"> 							
										</div>																									
									</div>											
							</div>
								
						</div>			
					</form>

					<div class="favoriteList">
								<% for(Favorite f : list){%>
										<form class="folderContents" method="post">		
 														<input type="hidden" value="<%=f.getFolderNo() %>" name="folderNo" readonly> 
														<input type="hidden" value="<%=f.getFolderName() %>" name="folderName" readonly>
 														<input type="hidden" value="<%=m.getMemberNo()%>" name="memberNo">															
														<input type="submit" value="<%=f.getFolderName() %>" class="eachList" id="eachList" onclick="fn_toContent();">								
										</form>																											
								<%}%>											
					</div>
		</section>
		<%@ include file="/views/common/footer.jsp"%>
	</div>
	
	<script>
		//목록만들기버튼		
		  //x버튼, 팝업버튼
		  $(document).ready(function () {
			  $("#listBuildBtn").on("click",function(e){
			    	$(".listPop").removeClass("listDisNone");
			 	});
			  $(".xBtn").on("click",function(e){
			      $(".listPop").addClass("listDisNone");
			    });   		    		 		    		    
		  });
		function fn_createFolder(){
			$(".folderCreate").attr("action","<%=request.getContextPath()%>/favorite/favoriteFolderCreate").submit();
		}	
		
		function fn_toContent(){			
			$(".folderContents").attr("action","<%=request.getContextPath() %>/favorite/favoriteContents").submit();									
		}
				
	</script>
	
	
	<script src="<%=request.getContextPath()%>/js/common/header.js"></script>
	<script src="<%=request.getContextPath()%>/js/member/favorite.js"></script>
</body>
</html>
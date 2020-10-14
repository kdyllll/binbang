<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/commonLink.jsp"%>
<%String houseNo=(String)request.getAttribute("houseNo");
	 Member m2=(Member)session.getAttribute("m");

%>
<title>booking</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/house/review.css" />
<style>
.profile {
	border-radius: 50px;
	width: 100px;
	height: 100px;
}
</style>

<body>
	<div class="wrap">
		<%@ include file="/views/common/header.jsp"%>
		<section class="section">
<form action="<%=request.getContextPath()%>/review/reviewEnd?houseNo=<%=houseNo%>" method="post" enctype="multipart/form-data">
			<div class="review">
			
				<div class="Writerating">후기 작성</div>
				<div class="grade">평점</div>
				<div class="gradebox">
					<div class="star-box">
						<div class="star star_left" id="0.5"></div> <div class="star star_right 1" id="1"></div>

						<div class="star star_left" id="1.5"></div> <div class="star star_right 2" id="2"></div>

						<div class="star star_left" id="2.5"></div> <div class="star star_right 3" id="3"></div>

						<div class="star star_left" id="3.5"></div> <div class="star star_right 4" id="4"></div>

						<div class="star star_left" id="4.5"></div> <div class="star star_right 5" id="5"></div>
						<input type="hidden" name="houseGrade" class="a">
						<input type="hidden" name="memberNo" value="<%=m2.getMemberNo()%>">
					</div>
				</div>


				<div class="title1">제목</div>
				<input class="titleWrite" name="commentTitle" type="text" placeholder="제목을 입력하세요">
				
				<div class="file">첨부파일</div>

				<input type="file" name="upload" id="upload" multiple>
				<div id="imgContainer"></div>
				
				

				<div class="contents">내용</div>
				<textarea class="contentsWrite" name="commentContents" rows="10" cols="40" placeholder="내용을 입력하세요"></textarea>

				<div class="enrollment">
				<form>
					  <input type="submit" value="등록하기" onclick="uploadBack();">
				</form>
				</div>
			</div>
				</form>
		</section>
	
		<script>
		
		
         $("#upload").change(e =>{
               let reader=new FileReader();
               reader.onload=e=>{
                  let a =$("<img>").attr({
                     "src":e.target.result,
                     "width": "100px",
                     "height" : "100px"
                  });
                  $("#imgContainer").html(a);
               }
               reader.readAsDataURL($(e.target)[0].files[0]);
            });
         
         $(".star").on("click",e=>{
             let grade=$(e.target).attr("id");
             $(".a").val(grade);
         });
         
         function uploadBack() {
        	<%--  const url = "<%=request.getContextPath()%>/views/house/houseDetail";
        	 open("");
        	 upload.action = url;
        	 upload.method = "post";	
        	 upload.submit(); --%>
        	 location.href = "/views/house/houseDetail.jsp";
         }
         
            </script>
		
		

		<%@ include file="/views/common/footer.jsp"%>
	</div>
	
	<script src="<%=request.getContextPath()%>/js/common/header.js"></script>
	<script src="<%=request.getContextPath()%>/js/house/review.js"></script>
</body>
</html>
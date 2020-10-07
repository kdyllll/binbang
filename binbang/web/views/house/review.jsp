<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/commonLink.jsp"%>
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
<form action="<%=request.getContextPath()%>/review/reviewEnd" method="post" >
		<section class="section">
			<div class="review">
			
				<div class="Writerating">후기 작성</div>
				<div class="grade">평점</div>
				<div class="gradebox">
					<div class="star-box">
						<input class="star star_left 0.5"> <input class="star star_right 1" >

						<input class="star star_left 1.5"> <input class="star star_right 2">

						<input class="star star_left 2.5"> <input class="star star_right 3">

						<input class="star star_left 3.5"> <input class="star star_right 4">

						<input class="star star_left 4.5"> <input class="star star_right 5">
					</div>
				</div>


				<div class="title1">제목</div>
				<input class="titleWrite" type="text" placeholder="제목을 입력하세요">
				
				<div class="file">첨부파일</div>

				<input type="file" id="upload" multiple>
				<div id="imgContainer"></div>
				
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
         
            </script>

				<div class="contents">내용</div>
				<textarea class="contentsWrite" rows="10" cols="40" placeholder="내용을 입력하세요"></textarea>

				<div class="enrollment">
					  <input type="submit" value="등록하기" onclick=>

				</div>
			</div>
		</section>
		</form>

		<%@ include file="/views/common/footer.jsp"%>
	</div>
	<script src="<%=request.getContextPath()%>/js/common/header.js"></script>
	<script src="<%=request.getContextPath()%>/js/house/review.js"></script>
</body>
</html>
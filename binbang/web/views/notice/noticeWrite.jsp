<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/commonLink.jsp" %>
   <script src="//cdn.ckeditor.com/4.15.0/standard/ckeditor.js"></script>
   <link rel="stylesheet" href="<%=request.getContextPath() %>/css/notice/noticeWrite.css" />
  </head>
<body>
<div class="wrap">
<%@ include file="/views/common/header.jsp"%>

      <section class="section">
        <p class="title">게시글 등록</p>
        <div class="line"></div>

        <div class="enrollNotice">
         <form action="<%=request.getContextPath() %>/notice/noticeWriteEnd" >
          <p>게시글 제목</p>

          <div id="noticeCategoryDiv">
            <select class="noticeCategory" name="noticeCategory">
              <option value="중요" selected disabled hidden>분류</option> 
              <option value="중요">중요</option> 
              <option value="일반">일반</option>  
            </select>
            
            <input class="noticeTitle" type="text" name="noticeTitle" placeholder="게시글 제목을 입력해주세요"><br>
          </div>


       		<p>게시글 내용</p><br>
          <textarea id="noticeContent" name="noticeContent"></textarea>
		
			<div id="btnDiv"><input type="submit" class="enroll" value="등록하기"></div>
         
	   	</form>
	    </div>
	
		
        <div class="line"></div>


      </section>
      
      <%@ include file="/views/common/footer.jsp"%>
   
    </div>
   <script>
       CKEDITOR.replace( 'noticeContent' ); 
      
   
    
      <%--  var content=CKEDITOR.instances.noticeContent.getData();
      $(".enroll").click(e => {
      $.ajax({
 		url:"<%=request.getContextPath()%>/notice/noticeWriteEnd",
 		type:"post",
 		dataType:"html",
 		data:{"noticeContent":content},
 		success:data => {
 			console.log(data);
 		}
 	}); 
      });  --%>
    
      <%-- $.ajax({
		url:"<%=request.getContextPath()%>/notice/noticeDetailView"
	}); 
      
      var formId = '<?=$getFormId?>';    //해당 폼 id 값 가져온다
      console.log("formId:"+formId);
      $.get("appr-form/form_"+formId+".html").done(function (data) {    //id값이 포함된 html형식 가져오면 해당내용 셋팅
       CKEDITOR.instances["noticeContent"].setData(data);
      });
       --%>
    
   </script>
   
</body>
</html>
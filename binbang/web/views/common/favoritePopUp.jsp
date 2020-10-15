<%@page import="com.binbang.member.model.vo.Favorite"%>
<%@page import="java.util.List"%>
<%@page import="com.binbang.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>favorite</title>
<script
   src="<%=request.getContextPath()%>/js/common/jquery-3.5.1.min.js"></script>
<%
   String houseNo = (String) request.getAttribute("houseNo");
   List<Favorite> favorite = (List) request.getAttribute("favorite");
%>

</head>
<style>
.favPop {
   padding: 5%;
}
/* header */
.headerLine {
   width: 100%;
   height: 2px;
   background-color: black;
}

/* first content */
.popContent {
   display: flex;
   flex-direction: column;
   align-items: center;
   border: none;
}

.favLine {
   width: 100%;
   height: 1px;
   background-color: gray;
}

.firstContent {
   width: 100%;
}

.makeFolder{
   display:flex;
   flex-direction:column;
   align-items:center;
   height:0px;
}
.showFolder{
   display:flex;
   align-items:center;
}
.show {
   height: 50px;
}

#plusBtn {
   margin-left: 50px;
   margin-top: 20px;
   margin-right: 300px;
   width: 300px;
   height: 40px;
   font-size: 15px;
   color: gray;
   background-color: white;
   cursor: pointer;
   border: none;
   outline: none;
}

.folderName {
   margin-right: 110px;
   margin-left:30px;
   border: none;
   outline: none;
   text-aligh: center;
}

#folderPlusBtn {
   margin: 10px 20px;
   float: right;
   width: 70px;
   height: 30px;
   background-color: rgba(0, 0, 0, 0.7);
   color: white;
   border: none;
   outline: none;
   cursor: pointer;
}

.folderList{
   width:100%;
   background-color:white;
}
/* second content */
.favoriteForm {
   width: 100%;
}

.folder {
   display: flex;
   justify-content: space-between;
   margin: 20px 0;
}

.heartCommon {
   /* 관심숙소 버튼 */
   width: 23px;
   height: 23px;
   margin-right: 20px;
   cursor: pointer;

}

.heart {

   background-image: url("<%=request.getContextPath()%>/image/common/icon/heart0.png");
   background-size: cover;
}

.fav {

   background-image: url("<%=request.getContextPath()%>/image/common/icon/heart1.png");
   background-size: cover;
}

.folderTitle {
   margin-left:20px;
   margin-right: 180px;
   border: none;
   outline: none;
}
/* bottom */
#closeBtn {
   margin: 10px 0;
   float: right;
   width: 70px;
   height: 30px;
   background-color: black;
   color: white;
   border: none;
   outline: none;
   cursor: pointer;
}
</style>
<body>

   <div class="favPop">
      <div class="headerLine"></div>

      <div class="popContent">
         <div class="firstContent">
            <div id="plusBtn">+ 폴더만들기</div>
         
               <form class="makeFolder" method="post">
                  <div class="favLine"></div>
                  <div class="showFolder">
                     <input type="text" name="folderName" class="folderName" placeholder="폴더 명을 입력하세요."> 
                     <input type="hidden" name="houseNo" value="<%=houseNo%>">
                     <input type="button" value="추가" id="folderPlusBtn" onclick="fn_folderAdd();"> 
                  </div>
               </form>
      
         </div>
         <div class="favLine"></div>
         <div class="folderList">
         <form class="favoriteForm" method="post" action="<%=request.getContextPath()%>/favorite/favConPopUp">
            <input type="hidden" class="houseNo" name="houseNo" value="<%=houseNo%>">
            
            <%
               for (Favorite f : favorite) {
            %>
            <div class="secondContent">
               <div class="folder">
                  <input type="text" class="folderTitle" value="<%=f.getFolderName()%>" readonly>               
                  <input type="hidden" class="check 0" value="<%=f.getFolderNo()%>">
                  <%boolean result=false;
                     for(Object o:f.getHouseList()){
                    	 String hNo=(String)o;
                    	 if(hNo.equals(houseNo)){
                    		 result=true;
                    	 }                 	 
                     }   
                     if(result){%>   
                  <div class="heartCommon fav"></div> 
                  <%}else{ %>   
                  <div class="heartCommon heart"></div>     
                  <%} %>                              
               </div>
               <div class="favLine"></div>
            </div>
            <%
               }
            %>
            <input type="submit" onclick="fn_check();" value="확인" id="closeBtn">
         </form>
         </div>

      </div>
      
   </div>

   <script>

   $("#plusBtn").on("click", e => {
      $(".makeFolder").toggleClass("show");
      $("#plusBtn").attr("style","color:black;"); 
   });
   
   function fn_folderAdd(e){
      if($(".folderName").val().trim().length==0){
            alert("폴더 이름을 입력하세요.");   
            return;
         }else{  
            $(".makeFolder").attr("action", "<%=request.getContextPath()%>/favorite/favFolderPopUpAdd").submit();
         }      
   }
   
   $(".heartCommon").on("click",function(e){
       $(e.target).toggleClass("heart");
       $(e.target).toggleClass("fav");
       console.log($(e.target).prev(".check"));
       $(e.target).prev(".check").toggleClass("0");
       $(e.target).prev(".check").toggleClass("1");
   });
   
   function fn_check(){
      $(".1").attr("name","folderNo");
   
   }
   
   </script>
</body>
</html>
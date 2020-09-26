

//목록만들기js
//목록만들기버튼
$(document).ready(function () {
  //x버튼, 팝업버튼
  $("#listBuildBtn").on("click",function(e){
    $(".listPop").removeClass("listDisNone");
  });
  $(".xBtn").on("click",function(e){
      $(".listPop").addClass("listDisNone");
    });   
    
    //목록추가기능
    $("#checkBtn").click( e =>{
      $(".listPop").addClass("listDisNone");
      var addDiv='<div class="eachList">'+'<div class="recomPic1 recommon"></div>'
      + '<div class="favoriteContents"></div>' +'</div>';
      var lastDiv=$("div[class=favoriteList]");
      lastDiv.append(addDiv);
    })
  });
  
  //목록파일js
  //목록수정버튼
  $(document).ready(function () {
    //x버튼, 팝업버튼
    $("#modifyBtn").on("click",function(e){
      $(".modifyPop").removeClass("ModDisNone");
    });
    $(".xBtn").on("click",function(e){
        $(".modifyPop").addClass("ModDisNone");
      });
    
  });



  //하트버튼
  $(".heartButton").on("click",function(e){
      $(e.target).toggleClass("heart");
      $(e.target).toggleClass("fav");
  });
  

  // 경고창
  $("#deleteBtn").click(e =>{
    alert("정말 삭제하시겠습니까?")
    })
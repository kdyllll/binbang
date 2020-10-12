

//목록만들기js
  
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
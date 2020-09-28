$(document).ready(function () {
  $("#changeInfo").on("click", function (e) {
    let condition = $(e.target).val();
    if (condition == "수정") {
      $(e.target).val("완료");
      $(e.target).css("color", "black");
      $("#hostNameChn").focus();
      $(".hostInfoImg > label").removeClass("disnone");
    } else if (condition == "완료") {
      $(e.target).val("수정");
      $(".hostInfoImg > label").addClass("disnone");
    }
  });

  $("#uploadImg").on("change", (e) => {
    let reader = new FileReader();
    reader.onload = (e) => {
      $(".hostInfoImg > img").attr({
        src: e.target.result,
      });
    };
    reader.readAsDataURL($(e.target)[0].files[0]);
  });
});

// 정보 넘기기 막기.
function invalidate() {
  if ($("#changeInfo").val() == "수정") return false;
  else return true;
}

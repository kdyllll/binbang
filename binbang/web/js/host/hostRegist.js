$(document).ready(function () {
  let file = $("#profileFile");
  let file2 = $("#idFile");
  file.on("change", function (e) {
    let reader = new FileReader();
    reader.onload = (e) => {
      let img = $("<img>").attr("src", e.target.result);
      $(".hostImg").html("");
      $(".hostImg").append(img);
    };
    $("#uploadProfile").html($(e.target)[0].files[0].name);
    reader.readAsDataURL($(e.target)[0].files[0]);
  });
  file2.on("change", function (e) {
	   $("#uploadId").html($(e.target)[0].files[0].name);
  });
});

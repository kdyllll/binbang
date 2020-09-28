$(document).ready(function () {
  let file = $("#profileFile");

  file.on("change", function (e) {
    console.log($(e.target));
    let reader = new FileReader();
    reader.onload = (e) => {
      let img = $("<img>").attr("src", e.target.result);
      $(".hostImg").html("");
      $(".hostImg").append(img);
    };
    reader.readAsDataURL($(e.target)[0].files[0]);
  });
});

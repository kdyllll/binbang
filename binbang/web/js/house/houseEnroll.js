$(".addPlace").on("click", function (e) {
    $(e.target).siblings("div").removeClass("disnone");
    $(e.target).addClass("disnone");
});
$(".deletePlace").on("click", function (e) {
    $(e.target).parent().addClass("disnone");
    $(e.target).parent().siblings(".addPlace").removeClass("disnone");
});
$("li a").click(function () {
    var url = $(this).attr("methodPath");
    if (!url) {
        return;
    }
    // 设置选中
    $("li a.currentLink").removeClass("currentLink").css("color", "#443b3bd9");
    $(this).addClass("currentLink").css("color", "#a417def5");
    // 获取html页面
    $.post(url, {}, function (page) {
        $("div.mainContent").html(page);
    });
});




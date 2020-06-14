
function showSettings() {
    $("div.settings ul").show().mouseout(function () {
        hideSettings();
    });
}

function hideSettings() {
    $("div.settings ul").hide();
}

$("#settings").mouseover(function () {
    showSettings();
});

function getMethodPath(methodPath) {
    $.post(methodPath, {}, function (page) {
        $("div.main").html(page);
    })
}

$("#search").change(function () {
    $(this).parent().find("ul").remove();
    var searchContent = $(this).val();
    if (!searchContent) {
        return;
    }
    $.post("/search", {"key":searchContent}, function (ul) {
        if (!ul) {
            return;
        }
        $("div.search").append(ul);
        $("div.search ul li").click(function () {
            var methodPath = $(this).attr("methodPath");
            $(this).parent().remove();
            getMethodPath(methodPath);
        });
    })
});

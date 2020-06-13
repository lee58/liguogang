
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

$("#search").change(function () {
    var searchContent = $(this).val();
    if (!searchContent) {
        return;
    }
    $.post("/search", {"key":searchContent}, function (ul) {
        $("div.search").append(ul ? ul : "");
    })
});

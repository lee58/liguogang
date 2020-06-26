<style>
    #copyFile div input {
        display: block;
    }
</style>
<div id="copyFile">
    <div>
        <label>请输入需提取文件的目录，多个目录用英文逗号分隔</label>
        <input id="directoryList">
    </div>
    <div>
        <label>请输入需提取文件的扩展名，多个用英文逗号分隔</label>
        <input id="Suffixes">
    </div>
    <div>
        <label>请输入需提取目标目录</label>
        <input id="baseDirectory">
    </div>
    <button id="confirmBtn">确认</button>
</div>
<script>
    $("#confirmBtn").click(function () {
        var directoryList = $("#directoryList").val();
        if (! directoryList) {
           return false;
        }
        var Suffixes = $("#Suffixes").val();
        if (! Suffixes) {
            return false;
        }
        var baseDirectory = $("#baseDirectory").val();
        if (! baseDirectory) {
            return false;
        }
        $.post("/takeDir2BaseDir", {
            "directoryList": directoryList,
            "Suffixes": Suffixes,
            "baseDirectory": baseDirectory
        }, function (data) {
            alert("success");
        });
    });
</script>
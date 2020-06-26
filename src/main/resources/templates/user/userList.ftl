<style>
    #userList table,th,tr,td{
        border: 1px solid;
    }
    #timeAxis {
        display: none;
    }
    #timeDesc .vLine {
        border-left: solid 2px #191717;
        height: 20px;
        margin: 10px;
        margin-left: 30%;
    }
    #timeDesc div .time{
        display: inline-block;
        width: 10%;
    }
    #timeDesc div .content{
        display: inline-block;
        width: 50%;
        text-align: left;
    }
    #timeDesc {
        text-align: center;
    }
    #userDetail .addBtn {
        margin: 10px 0 0 35px;
        display: block;
    }

</style>

<div id="userList">
    <table>
        <thead>
            <th>用户名</th>
            <th>操作</th>
        </thead>
        <tbody>
            <#if userList??>
                <#list userList as user>
                    <tr>
                        <td>${user.name!}</td>
                        <td>
                            <button onclick="timeAxis(this, ${user.id!}, 'timeAxis')">时间轴</button>
                            <button onclick="source(this, ${user.id!})">资料</button>
                        </td>
                    </tr>
                </#list>
            </#if>

        </tbody>
    </table>
</div>
<div id="timeAxis">
    <div id="userDetail">
        <div>
            <label>用户名：</label>
            <span>李国刚</span>
        </div>
        <div>
            <label></label>
            <span class="addBtn">
                <button onclick="addBtn()">新增</button>
            </span>
        </div>
    </div>
    <div id="timeDesc">
        <div>
            <span class="time">2020-06-26</span>
            <span class="content">这是内容内容这是内容这啊啊啊是内容内容这是内容内容这是内容内容这是内容内容这是内容内容这是内容内容这是内容内容这是内容内容这是内容内容这是内容内容这是内容内容</span>
        </div>
        <div class="vLine"></div>
        <div>
            <span class="time">2020-06-26</span>
            <span class="content">这是内容内容这是内容这是内啊啊啊容内容这是内容内容这是内容内容这是内容内容这是内容内容这是内容内容这是内容内容这是内容内容这是内容内容这是内容内容这是内容内容</span>
        </div>
    </div>
</div>
<script>
    var divArr = ["userList","timeAxis"];
    function timeAxis(obj, userId, divId) {
        showDivByDivId(divId);

    }
    function showDivByDivId(divId) {
        divArr.forEach(function (id) {
            if (id == divId) {
                $("#"+id).show();
            }else {
                $("#"+id).hide();
            }
        });
    }
    function addBtn() {
        var dialog = prompt("请输入新增内容");
        if (! dialog) {
            return;
        }
        var time = new Date();
        var div = '<div>' +
                        '<span class="time">'+dateFormat("YYYY-mm-dd", time)+'</span>' +
                        '<span class="content">'+dialog+'</span>' +
                    '</div>';
        var vLine = '<div class="vLine"></div>';
        var first = $("#timeDesc div:eq(0)");
        if (first) {
            first.prepend(vLine).prepend(div);
        };
    }
    function dateFormat(fmt, date) {
        let ret;
        const opt = {
            "Y+": date.getFullYear().toString(),        // 年
            "m+": (date.getMonth() + 1).toString(),     // 月
            "d+": date.getDate().toString(),            // 日
            "H+": date.getHours().toString(),           // 时
            "M+": date.getMinutes().toString(),         // 分
            "S+": date.getSeconds().toString()          // 秒
            // 有其他格式化字符需求可以继续添加，必须转化成字符串
        };
        for (let k in opt) {
            ret = new RegExp("(" + k + ")").exec(fmt);
            if (ret) {
                fmt = fmt.replace(ret[1], (ret[1].length == 1) ? (opt[k]) : (opt[k].padStart(ret[1].length, "0")))
            };
        };
        return fmt;
    }
</script>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>日历</title>
    <style type="text/css">
        body.calendar{
            text-align: center;
        }
        .content div{
            margin: 0 auto;
        }
        .content table{
            border: solid 1px;
        }
        .content tr{
            border: solid 1px
        }
        .content td{
            border: solid 1px;
            padding: 5px;
            margin: 3px;
        }
        .content select{
            width: 100px
        }
        /* 蓝色粉色红色=休班夜班白班 */
        .content .night{
            background-color: LightPink
        }
        .content .white{
            background-color: OrangeRed
        }
        .content .rest{
            background-color: DeepSkyBlue
        }
    </style>
</head>
<body class="calendar">
<div class="content">
    <table>
        <thead>
        <tr>
            <th colspan="3">
                <select id="year" onchange="resetTable()">
                    <option value="2019">2019年</option>
                    <option value="2020">2020年</option>
                    <option value="2021">2021年</option>
                    <option value="2022">2022年</option>
                    <option value="2023">2023年</option>
                </select>
            </th>
            <th></th>
            <th colspan="3">
                <select id="month" onchange="resetTable()">
                    <option value="1">1月</option>
                    <option value="2">2月</option>
                    <option value="3">3月</option>
                    <option value="4">4月</option>
                    <option value="5">5月</option>
                    <option value="6">6月</option>
                    <option value="7">7月</option>
                    <option value="8">8月</option>
                    <option value="9">9月</option>
                    <option value="10">10月</option>
                    <option value="11">11月</option>
                    <option value="12">12月</option>
                </select>
            </th>
        </tr>
        <tr>
            <th>周日</th>
            <th>周一</th>
            <th>周二</th>
            <th>周三</th>
            <th>周四</th>
            <th>周五</th>
            <th>周六</th>
        </tr>
        </thead>
        <tbody id="tbody">

        </tbody>
    </table>
</div>
<script type="text/javascript">
    $(function() {
        resetTable();
    });

    function getDaysInOneMonth(year, month){
        month = parseInt(month, 10);
        var d= new Date(year, month, 0);
        return d.getDate();
    }
    function resetTable() {
        var year = $("#year").val();
        var month = $("#month").val();
        //该年该月的天数
        var day = getDaysInOneMonth(year, month);
        // console.log("year:"+year+" month:"+month+" day:"+day);
        var firstDayOfMonth = new Date(year, month-1, 1);
        //该月第一天是周几？0表示周日，1表示周一……6表示周六
        var dayWeek = firstDayOfMonth.getDay();
        // console.log("dayWeek:"+dayWeek);
        var trStr = "";
        if (dayWeek == 0) {
            trStr = '<tr>'+
                '<td>1</td>'+
                '<td>2</td>'+
                '<td>3</td>'+
                '<td>4</td>'+
                '<td>5</td>'+
                '<td>6</td>'+
                '<td>7</td>'+
                '</tr>';
        }
        if (dayWeek == 1) {
            trStr = '<tr>'+
                '<td></td>'+
                '<td>1</td>'+
                '<td>2</td>'+
                '<td>3</td>'+
                '<td>4</td>'+
                '<td>5</td>'+
                '<td>6</td>'+
                '</tr>';
        }
        if (dayWeek == 2) {
            trStr = '<tr>'+
                '<td></td>'+
                '<td></td>'+
                '<td>1</td>'+
                '<td>2</td>'+
                '<td>3</td>'+
                '<td>4</td>'+
                '<td>5</td>'+
                '</tr>';
        }
        if (dayWeek == 3) {
            trStr = '<tr>'+
                '<td></td>'+
                '<td></td>'+
                '<td></td>'+
                '<td>1</td>'+
                '<td>2</td>'+
                '<td>3</td>'+
                '<td>4</td>'+
                '</tr>';
        }
        if (dayWeek == 4) {
            trStr = '<tr>'+
                '<td></td>'+
                '<td></td>'+
                '<td></td>'+
                '<td></td>'+
                '<td>1</td>'+
                '<td>2</td>'+
                '<td>3</td>'+
                '</tr>';
        }
        if (dayWeek == 5) {
            trStr = '<tr>'+
                '<td></td>'+
                '<td></td>'+
                '<td></td>'+
                '<td></td>'+
                '<td></td>'+
                '<td>1</td>'+
                '<td>2</td>'+
                '</tr>';
        }
        if (dayWeek == 6) {
            trStr = '<tr>'+
                '<td></td>'+
                '<td></td>'+
                '<td></td>'+
                '<td></td>'+
                '<td></td>'+
                '<td></td>'+
                '<td>1</td>'+
                '</tr>';
        }
        for (var i=(8-dayWeek); i<=day; i++) {

            trStr += '<tr>'+
                '<td>'+i+'</td>';
            if (i+1 <= day) {
                trStr += '<td>'+(i+1)+'</td>';
            }
            if (i+2 <= day) {
                trStr += '<td>'+(i+2)+'</td>';
            }
            if (i+3 <= day) {
                trStr += '<td>'+(i+3)+'</td>';
            }
            if (i+4 <= day) {
                trStr += '<td>'+(i+4)+'</td>';
            }
            if (i+5 <= day) {
                trStr += '<td>'+(i+5)+'</td>';
            }
            if (i+6 <= day) {
                trStr += '<td>'+(i+6)+'</td>';
            }
            trStr += '</tr>';
            i = i+6;
        }
        $("#tbody").html(trStr);
        //设置颜色
        setTdColor(year, month);
    }

    function setTdColor(year, month) {
        var time1 = Date.parse(new Date("2018-12-31"));
        var td;
        var tdText;
        var day;
        var time2;
        var nDays;
        $.each($("#tbody").find("tr td"), function() {
            td = $(this);
            day = td.html();
            if (day) {
                time2 = Date.parse(new Date(year, month-1, day));
                nDays = Math.abs(parseInt((time2 - time1)/1000/3600/24));
                // console.log("nDays"+nDays);
                if (nDays % 3 == 0) {
                    td.addClass("night");
                }
                if (nDays % 3 == 1) {
                    td.addClass("white");
                }
                if (nDays % 3 == 2) {
                    td.addClass("rest");
                }
            }
        });
    }

</script>
</body>
</html>
<style>
    div.vehicleInsurance div {
        margin: 5px 0;
    }
    div.expression span {
        display: block;
        width: 100%;
        margin: 5px 0;
    }
    div.vehicleInsurance .items {
        margin: 15px 0;
    }
    div.items div label {
        width: 88px;
        display: inline-block;
        text-align: right;
    }
    div.vehicleInsurance .result {
        margin-top: 12px;
    }
    div.result span {
        color: red;
    }
</style>
<div class="vehicleInsurance">
    <h2>车险</h2>
    <div class="expression">
        <span>优惠价 = （报价总计 - 车船税） ÷ 1.06 x 政策 x 优惠系数</span>
        <span>客户需交费 = 报价总计 - 客户的优惠价</span>
    </div>
    <div class="items">
        <div>
            <label>报价总计：</label>
            <input id="totalOffer">
            <text></text>
        </div>
        <div>
            <label>车船税：</label>
            <input id="tax">
            <text></text>
        </div>
        <div>
            <label>固定系数：</label>
            <input id="fixed" value="1.06">
            <text></text>
        </div>
        <div>
            <label>政策：</label>
            <input id="policy">
            <text></text>
        </div>
        <div>
            <label>优惠系数：</label>
            <input id="coefficient">
            <text></text>
        </div>
        <div class="result">
            <div>
                <label>优惠价 &yen;：</label>
                <span id="specialPrice"></span>
            </div>
            <div>
                <label>需交费 &yen;：</label>
                <span id="pay"></span>
            </div>
        </div>

    </div>

</div>
<script>
    $(function () {
        $("div.items div input").blur(a);
    });

    function a() {
        console.log(1);
        // 报价总计
        var totalOffer =  getVal("#totalOffer");
        if (!totalOffer) return;
        // 车船税
        var tax = getVal("#tax");
        if (!tax) return;
        // 固定系数
        var fixed = getVal("#fixed");
        if (!fixed) return;
        // 政策
        var policy = getVal("#policy");
        if (!policy) return;
        // 优惠系数
        var coefficient = getVal("#coefficient");
        if (!coefficient) return;
        var specialPrice = (totalOffer - tax) / fixed * policy * coefficient;
        $("#specialPrice").html(specialPrice.toFixed(2));
        var pay = totalOffer - specialPrice;
        $("#pay").html(pay.toFixed(2));
    }


    function getVal(id) {
        var regExp = /^\d+(\.\d+)?$/;
        var val = $(id).val();
        if (!val) {
            $(id).focus().next().text("x").css("color", "red");
            return ;
        }
        if (!regExp.test(val)) {
            $(id).focus().next().text("x").css("color", "red");
            return;
        }
        $(id).next().text("√").css("color", "green");;
        return parseFloat(val);
    }
</script>
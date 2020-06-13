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
        <span>优惠价 = （报价总计 - 车船税） ÷ 1.06 x 优惠系数</span>
        <span>客户需交费 = 报价总计 - 客户的优惠价</span>
    </div>
    <div class="items">
        <div>
            <label>报价总计：</label>
            <input>
        </div>
        <div>
            <label>车船税：</label>
            <input>
        </div>
        <div>
            <label>固定系数：</label>
            <input>
        </div>
        <div>
            <label>政策：</label>
            <input>
        </div>
        <div>
            <label>优惠系数：</label>
            <input>
        </div>
        <div class="result">
            <div>
                <label>优惠价 &yen;：</label>
                <span id="specialPrice">11</span>
            </div>
            <div>
                <label>需交费 &yen;：</label>
                <span id="pay">22</span>
            </div>
        </div>

    </div>

</div>
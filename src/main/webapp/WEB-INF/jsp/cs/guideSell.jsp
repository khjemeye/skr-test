<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include/taglib_prefix.jsp"%>
<%@ include file="/include/top.jsp"%>

<%@ include file="/include/headerMenu.jsp"%>

<!-- header -->
<div id="header" class="row header fixed">

    <!-- titlebar -->
    <div class="column titlebar no-padding">
        <div class="titlebar-left">
            <button class="menu-icon" type="button" onClick="winback();"></button>
        </div>
        <div id="logo" class="titlebar-center submenu">
            <a href="javascript:void(0);" title="중고차 판매절차">중고차 판매절차</a>
        </div>
        <div class="titlebar-right">
            <button class="menu-icon hamburger" type="button" onClick="openNav();"></button>
        </div>
    </div>
    <!-- //titlebar -->

</div>
<!-- header -->

<%@ include file="/include/headerSubmenu.jsp"%>


<!-- container -->
<div class="container">


    <div class="row customer-txt guide02">
        <div class="column">
            <p class="tit">판매절차</p>
            <p>
                내차 팔기 전 읽어보시면 내차를 최고가로 파실 수 있습니다.
            </p>
            <ul class="cs_a_step">
                <li class="li9">
                    <b>
                        <i>STEP 1</i>
                        <em>판매시기 결정</em>
                    </b>
                </li>
                <li class="li6">
                    <b>
                        <i>STEP 2</i>
                        <em>판매가격 산정</em>
                    </b>
                </li>
                <li class="li10">
                    <b>
                        <i>STEP 3</i>
                        <em>내차팔기</em>
                    </b>
                </li>
                <li class="li8">
                    <b>
                        <i>STEP 4</i>
                        <em>계약/이전</em>
                    </b>
                </li>
            </ul>
        </div>
    </div>
    <div class="row">
        <div class="column sub-nav col5 fuc_subtap">
            <ul>
                <li class="on" id="gtab1">
                    <a href="javascript:;" title="Step1">Step1</a>
                </li>
                <li id="gtab2">
                    <a href="javascript:;" title="Step2">Step2</a>
                </li>
                <li id="gtab3">
                    <a href="javascript:;" title="Step3">Step3</a>
                </li>
                <li id="gtab4">
                    <a href="javascript:;" title="Step4">Step4</a>
                </li>
                <li id="gtab5">
                    <a href="javascript:;" title="Tip">Tip</a>
                </li>
            </ul>
        </div>
    </div>
    <div class="row guide01">
        <div class="column">
            <div id="l_gtab1" class="tab_layer">
                <div class="title_wrap">
                    <h2>Step 1. 판매시기 결정</h2>
                    <p class="h2_txt">급전이 필요해서 급하게 파는 경우가 아니라면 차량의 판매시기를 가장 최적기에 팔 수 있도록 계획하시는 것이 좋습니다.</p>
                </div>
                <ul class="guide-step type-list">
                    <li><span>1.</span><strong>연말 연초는 거래를 피하자</strong>
                        <p>차량거래가 활성화 되는 시기는 설 명절 및 신학기 시점(2~3월)과 하계휴가 전(6~7월) 그리고 추석대목 및 연도 변경전(10~11월) 시점입니다. <br>아무래도 거래가 활발한 시기에 차를 파시는 것이 유리합니다.</p>
                    </li>
                    <li><span>2.</span><strong>보증기간 내에 차를 팔자</strong>
                        <p>보증수리기간이 종료가 임박했다면 넘기지 않는 것이 좋습니다. 무상보증기간(주요부품 3년 6만Km 이내)이 종료되면 가격이 떨어집니다.<br>
보증기간 내에 차를 팔게 되면 그렇지 않을 때보다 더 높은 가격을 받으실 수 있습니다.</p>
                    </li>
                    <li><span>3.</span><strong>동급차량의 신차가 출시되기 전에 처리하자.</strong>
                        <p>신차가 출시되면 구형모델로 취급되므로 중고차 가치가 떨어집니다. 그러므로 신차가 출시 되기전 최소한 3개월 이전에 처분 하시는 것이 좋습니다.</p>
                    </li>
                </ul>
            </div>
            <div id="l_gtab2" class="tab_layer" style="display:none">
                <div class="title_wrap">
                    <h2>Step 2. 판매가격 산정</h2>
                    <p class="h2_txt">내차의 실거래가를 확인한 후 판매가격을 산정하세요.</p>
                </div>
                <ul class="guide-step type-list">
                    <li><span>1.</span><strong>온라인에서 판매되고 있는 가격(소비자가)을 확인하자.</strong>
                        <p>부산오토필드에서 내가 처분하려는 모델과 같은 모델의 연식과 주행거리가 비슷한 차량의 판매가격을 먼저 확인하시기 바랍니다.<br>
                        중고차 시세는 지역별, 딜러별, 차량의 상태에 따라 시세가 다소 높거나, 낮을 수도 있으며, 그 달의 시세 변화에 따라 시세 차이가 날 수도 있습니다.</p>
                    </li>
                    <li><span>2.</span><strong>내가 판매할 가격을 결정하자.</strong>
                        <p>온라인에서 거래되는 실 거래가격은 차를 파는 나의 입장에서 다 받으면 좋지만 현실은 그렇지 못합니다. 차를 파는 사람은 자신이 생각한 최대의 금액을 생각할 것이고, 구입하는 당사자는 최소의 비용으로 구입하려고 할 것이기 때문입니다.</p>
                        <p>또한, 직거래일 경우를 제외하고는 딜러가 차를 매입해판다면 차가 상품화되는 과정(수리비, 주차비, 광고비 등)을 거치기 때문에 당연히 딜러가 매입하는 가격은 차량에 따라 다르지만 평균 5~10%정도의 감가가 이루어집니다.<br>
위 가격에서 중고차 딜러의 마진을 고려하여 적정한 판매가격을 예상하시기 바랍니다.</p>
                    </li>
                </ul>
            </div>
            <div id="l_gtab3" class="tab_layer" style="display:none">
                <div class="title_wrap">
                    <h2>Step 3. 내차팔기</h2>
                    <p class="h2_txt">시간적 여유를 고려해서 누구에게 판매할것인지 결정하세요.</p>
                </div>
                <ul class="guide-step type-list">
                    <li><span>1.</span><strong>시간적인 여유가 충분하다면 개인 직거래를 통한 판매가 유리합니다.</strong>
                        <p>직거래를 하면 조금이라도 좋은 가격을 받을 수 있습니다.
커뮤니티 사이트를 이용하거나 중고차사이트 직거래 장터를 이용할 수 있습니다.</p>
                    </li>
                    <li><span>2.</span><strong>시간적인 여유가 없다면 매매상사에 판매하는 것이 편리합니다.</strong>
                        <p>중고차 사이트에 내차팔기 문의하여 가격대를 확인한 후 합리적인 가격을 제시한 곳을 선택하세요.<br>
일단 제시한 가격은 실물을 보지 않고 일반적인 기준을 제시한 것이므로 차량인수를 위해 딜러가 현장 방문시 차량의 상태에 따라서 가격은 더 깍일 수 있습니다.</p>
                        <p>또한 내 차량을 상사에 위탁해서 파는 방법이 있는데 차량을 운행하면서 차량을 팔 수 있고, 차량의 판매시 더 많은 금액을 받을 수 있는 장점이 있습니다.
하지만 위탁판매는 차량을 바로 볼 수 없기 때문에 차량의 판매가 더딘것이 단점입니다.</p>
                    </li>
                    <li><span>3.</span><strong>불필요한 정비를 하지 않는다.</strong>
                        <p>판매전에 미리 수리를 해서 비용을 들이는 비용보다 중고차 가격을 더 인정받기 쉽지는 않습니다.</p>
                    </li>
                    <li><span>4.</span><strong>수출되는 일부 차량은 가격을 더 받을 수 있습니다.</strong>
                        <p>해외로 수출되는 중고차를 매집하는 중고차수출 업체의 일부 매집 차량은 매매상사에 매입하는 시세보다 높은 가격을 제시하는 곳도 있습니다.
수출업체의 홈페이지를 통하여 내차가 수출 가능한지 확인하시고 매입가격도 체크해보세요.</p>
                    </li>
                </ul>
            </div>
            <div id="l_gtab4" class="tab_layer" style="display:none">
                <div class="title_wrap">
                    <h2>Step 4. 계약/이전</h2>
                    <p class="h2_txt">차량 판매에 있어서 가장 중요한 부분으로 꼼꼼하게 확인하세요</p>
                </div>
                <ul class="guide-step type-list">
                    <li><span>1.</span><strong>계약서 작성시 유의사항</strong><br>
                        <p><strong>계약서 작성요령</strong><br>
                        계약서 작성시에는 차량 구매 후 발생 가능한 문제외 A/S에 대한 책임부분도 쌍방 합의로 작성하는 것이 바람직하며, 매매상사의 담당자, 차량 매도인의 연락처 등을 기재해 놓는 것이 좋습니다.<br>
                        또한, 구매 당시 주행거리, 사고 유무 등 차량 상태와 책임소재도 꼭 기재해 두는 것이 좋습니다.</p>

                        <p><strong>개인 간 거래와 매매업자와의 거래는 계약서 양식이 다릅니다.</strong><br>
                        매매상사를 이용할 경우 반드시 관인매매계약서를 작성해야 하며, 개인간 직접거래일 경우 자동차 등록 관청에 있는 자동차양도증명서를 작성해야 합니다.<br><br>
                        <img src="/images/icon/service_img04.png"></p>
                    </li>
                    <li><span>2.</span><strong>명의 변경시 유의사항</strong>
                        <p>구매자에게 명의 이전이 되기 전까지는 공식적으로 차량의 소유주가 판매자로 등록되어 있으므로 사고나 과속, 주정차 등으로 과태료가 발생하면 난감할 수 있습니다.<br>
또한, 명의 이전이 완료되어야 기존 차량에 대한 보험 해지 및 자동차세 선납분을 환급받을 수 있습니다.
따라서 명의 이전까지 확실하게 마무리를 해야 판매가 완료되는 것입니다.</p>
                        <p><strong>차량 인도 후 책임은 구매자에게 있음을 명시하세요.</strong><br>
명의 이전이 완료되기 전까지는 소유권이 판매자에게 남아 있어 사고나 속도위반 등의 책임이 전가될 수 있습니다.<br>구매자에게 차량을 인도할 때 계약서나 인도증에 인도한 날짜와 시간, 민형사상의 모든 책임을 명시하는 것이 좋습니다.</p>
                        <p><strong>체납된 과태료나 세금이 있는지 확인하세요.</strong><br>
체납된 과태료나 세금은 있다면 명의이전이 되지 않기 때문에 미리 확인하여 납부하는 것이 좋습니다. 자동차 등록원부를 통해 내용을 확인할 수 있으며, 민원사이트(http://www.minwon.go.kr)에서 무료로 발급받을 수 있습니다.</p>
                        <p><strong>명의 이전된 차량등록증을 팩스나 이메일로 받아보세요.</strong><br>
법적으로 차량 인수 후 15일 이내에 차량 소유권 이전등록하게 되어 있습니다. <br>
명의 이전등록이 완료되면 확인을 위해 새로 교부된 차량등록증을 팩스나 이메일로 받아보는 것이 좋습니다.<br>중고차 판매 딜러나 상사에 차량을 판매했을 때 간혹 명의 이전을 미루는 경우가 있습니다.</p>
                        <p><strong>양도인 (판매자) 강제이전</strong><br>
양수인(구매자)이 이전하지 않고 있을 때 강제이전 절차를 통해 소유권을 변경할 수 있습니다.<br>
원칙적으로 자동차의 소유권 변동사항이 있는 경우 양수인이 이전등록을 이행해야 할 의무가 있습니다.<br>
단, 양수인이 이를 이행하지 않을 때 자동차관리법에는 양도인이 이전등록을 강제신청할 수 있습니다.</p>
                    </li>
                </ul>
            </div>
            <div id="l_gtab5" class="tab_layer" style="display:none">
                <div class="title_wrap">
                    <h2>판매시 체크 TIP</h2>
                </div>
                <ul class="guide-step">
                    <li class="bg color3"><span>1.</span><strong>중고차 구매자 확인</strong>
                        중고차 판매자가 어떤 사람인지 확인하여 명의이전이 확실한가, 안전하게 제약할 수 있는가를 고려하세요.
                    </li>
                    <li><span>2.</span><strong>구매전 계약금 송금주의</strong>
                        차를 확인하기 전 계약금을 건네는 것은 삼가하세요.<br> 부득이하게 계약이 파기되는 경우, 계약금 환불 및 위약금으로 인하여 피해를 입을 수도 있습니다.
                    </li>
                    <li class="bg" style="background-image:url(/images/icon/guide_04.png)"><span>3.</span><strong>전문가에게 진단받기</strong>
                        중고차의 구매 특성상 구매 전에는 중고차를 꼼꼼하게 진단을 받는 것이 좋습니다.
                        현재의 중고차 상태를 파악하는 것은 매우 중요합니다.
                    </li>
                    <li><span>4.</span><strong>적당한 가격이 맞는지 절충해 보아야 합니다.</strong>
                        요즘은 인터넷만 이용하더라도 중고차의 시세를 쉽게 알아볼 수가 있습니다. 때문에
                        중고차 전문가가 아니더라도 가격 절충이 가능합니다.
                    </li>
                    <li class="color1"><span>5.</span><strong>원부 조회는 반드시 해야 합니다.</strong>
                        계약전에는 반드시 차량 등록 조회를 해야합니다.
    과태료, 저당, 체납 등이 있을 경우에는 이전등록이 되지 않습니다.
                    </li>
                    <li class="bg color3"><span>6.</span><strong> 꼼꼼하게 계약서를 작성해야 합니다.</strong>
                        위의 순서대로 진행이 되었다면, 계약서를 작성하도록 합니다.
    계약서 사본은 반드시 챙겨두셔야 합니다.
                    </li>
                    <li class="color1"><span>7.</span><strong>자동차세는 일할 계산합니다.</strong>
                        자동차세는 매매일자를 기준으로 자동차세를 분할 납부하도록 합니다.<br>
    매매일자를 기준으로 하여, 매도자, 매수자가 자동차세를 분할하여 납부하도록 합니다.
                    </li>
                    <li class="bg" style="background-image:url(/images/icon/guide_05.png)"><span>8.</span><strong>반드시 보험가입을 해야합니다.</strong>
                        중고차를 계약했다면 반드시 자동차 보험에도 동시에 가입을 해야합니다.<br>
    명의 이전을 할때, 보험가입 증명서는 필수입니다.
                    </li>
                    <li><span>9.</span><strong>명의이전 완료를 확인하세요.</strong>
                        명의 이전은 곧바로 하는 것이 중요합니다.<br>
    15일 이내에 명의 이전을 해야합니다.<br>
    이를 지키지 않을시에는 최고 50만원까지의 과태료가 부과됨을 알려드립니다.
                    </li>
                </ul>
            </div>
        </div>
    </div>

    <%@ include file="/include/footer.jsp"%>
</div>
<!--// container -->


<script type="text/javascript" src="/js/jquery.bxslider.min.js"></script>
<script type="text/javascript">
<!--
$(document).ready(function(){

    $('.slider-inner').bxSlider();

});
// -->
</script>

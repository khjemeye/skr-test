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
            <a href="javascript:void(0);" title="중고차 구매절차">중고차 구매절차</a>
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
            <p class="tit">구매절차</p>
            <p>
                차량을 구매하기 전에 빠진 사항이 없는지 한번 체크해보세요.
            </p>
            <ul class="cs_a_step">
                <li class="li5">
                    <b>
                        <i>STEP 1</i>
                        <em>차량 선정</em>
                    </b>
                </li>
                <li class="li6">
                    <b>
                        <i>STEP 2</i>
                        <em>구매가격 결정</em>
                    </b>
                </li>
                <li class="li7">
                    <b>
                        <i>STEP 3</i>
                        <em>구매차량 선택</em>
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
                    <h2>Step 1. 차량 선정</h2>
                    <p class="h2_txt">나의 목적에 맞는 차량을 선택하세요.</p>
                </div>
                <ul class="guide-step type-list">
                    <li><span>1.</span><strong>중고차 구입목적</strong>
                        <p>대부분의 사람들이 자신들의 예산에 맞춰 중고차가격을 정해놓고, 싸고 좋은차만을 고집하려 합니다.<br>
                            하지만 싸면서 좋은차는 없습니다. 무조건 예산에만 맞추려면, 사고이력이 있거나, 주행거리가 맣은 차량을 구매해야 하고, 그렇게되면 구매후에 몇개월간 수리비용이 훨씬 더 많이 드는 경우도 있습니다. <br>
                            이럴때는 차종을 바꿔서 한단계 낮은 등급의(배기량) 차량으로 사고가 적고, 주행거리가 짧은 차량으로 눈을 낮추는 것이 현명합니다.</p>
                        <p>중고차를 선택하는 첫번째목적을 새 차를 사기가 부담스럽기 때문인데, 시세보다 저렴한 차량을 사고나서 돈이 더 많이 든다면 중고차를 사는 목적이 무의미해 지기때문입니다.</p>
                    </li>
                    <li><span>2.</span><strong>차량구매 후 유지비 부담을 생각</strong>
                        <p>중고차 구매시 차량의 유류비, 각종 세금, 보험료, 수리비 등의 관리비용을 생각하지 않고 구매하신다면 추후 많은 부담이 가해질 수 있습니다.</p>
                    </li>
                    <li><span>3.</span><strong>다시 판매할 계획이 있다면 인기차량을 선택</strong>
                        <p>구매한 중고차를 타다가 다시 판매할 계획이 있다면, 신차시장과 중고차시장 모두에게 꾸준히 인기가 높은 모델을 선택하는 것이 현명한 방법입니다. <br>
                            중고차는 시간이 지날수록 가격이 떨어지기 마련인데, 인기차량의 경우 그 감가율이 작아 다시 판매 할 때에도 도움이 되기 때문입니다.</p>
                    </li>
                </ul>
            </div>
            <div id="l_gtab2" class="tab_layer" style="display:none">
                <div class="title_wrap">
                    <h2>Step 2. 구매가격 결정</h2>
                    <p class="h2_txt">중고차 구매비용에는 차량 대금 외에 등록비용과 보험료가 포함됩니다.</p>
                </div>
                <ul class="guide-step type-list">
                    <li><span>1.</span><strong>차량대금 계산</strong>
                        <p>차량구입 예산의 80%정도를 차량대금으로 생각하시고 예산이 조금 부족한데 꼭 차량이 필요하다면 카드 할부나 중고차 대출상품을 이용하는 것도 하나의 방법이 될 수 있지만, 여러 상품의 조건을 꼼꼼히 비교해서 따져보고 결정하세요.</p>
                        <p>중고차를 선택하는 첫번째목적을 새 차를 사기가 부담스럽기 때문인데, 시세보다 저렴한 차량을 사고나서 돈이 더 많이 든다면 중고차를 사는 목적이 무의미해 지기때문입니다.</p>
                    </li>
                    <li><span>2.</span><strong>이전등록비용 계산</strong>
                        <p>중고차 구매시 차량가격 이외에 등록세, 취득세, 공채매입비 등의 이전 등록비가 발생합니다.<br>
                            또한, 번호판 교체시에는 증지대, 인지대, 번호판교체 비용이 추가됩니다.
                            총 이전 등록비는 차량가격의 8~9%(승용차 기준)정도가 소요됩니다. <br>
                            연식과 차종에 따라서 차이가 있으니 미리 확인하는 것이 좋습니다.</p>
                    </li>
                    <li><span>3.</span><strong>보험료 계산</strong>
                        <p>보험료는 운전자의 나이와 보험가입경력, 구매 차량, 보험 가입조건에 따라 달라집니다.<br>
                            구매전, 현재 차량을 갖고 계시다면 보험승계처리 하실 수 있습니다.</p>
                    </li>
                </ul>
            </div>
            <div id="l_gtab3" class="tab_layer" style="display:none">
                <div class="title_wrap">
                    <h2>Step 3. 구매차량선택</h2>
                    <p class="h2_txt">체크사항과 차량상태 확인으로 좋은차를 선택하세요.</p>
                </div>
                <ul class="guide-step type-list">
                    <li><span>1.</span><strong>좋은차 선택하는 요령입니다.</strong>
                        <p><strong>시세보다 많이 저렴한 차량은 반드시 검증</strong><br>
                            대부분의 사람들은 다른 차에 비해 월등히 싼 차가 있다면 눈이 가는법!<br>
                            하지만 이유없이 저렴한 중고차는 없습니다.<br>
                            개인이나 딜러가 급매로 내어 놓거나 차량에 하자가 있어 평균시세 이하의 가격으로 나온 차가 아니라면 소비자를 유인하는 허위 또는 미끼매물일 가능성이 높습니다.<br>
                            이런 차들에 현혹되지 맙시다.</p>
                        <p><strong>주행거리가 짧은 차를 구매</strong><br>
                            차량은 사용하면 할수록 내구성이 떨어져서 고장이 날 확률이 늘어나게 됩니다. 즉, 주행거리가 짧을 수록 차량상태가 좋다는 말입니다.<br>
                            따라서, 일반적인 차량보다 조금은 가격이 비싸더라도 주행거리가 짧은 차량을 구매하시는 것이 구매 이후 수리비를 낮추고 성능이 양호한 차량을 구매하시는 좋은 방법입니다.</p>
                        <p><strong>정비기록이 잘 관리되어 있는 차를 구매</strong><br>
                            중고차는 운전자의 습관에 따라 많은 차이가 납니다. 또한 정확한 시기에 제대로 관리된 차량은 보지 않아도 차량의 상태를 짐작할 수 있습니다.</p>
                        <p><strong>사고이력조회, 종사원 확인, 제시차량 확인 등 검증수단을 이용</strong><br>
                            중고차 구매시 보험개발원의 사고이력조회서비스 및 중고자동차매매연합회(
                            <a href="http://kuca.kr" target="_blank">kuca.kr</a>
                            )의 제시차량, 정보조회, 종사원확인 서비스를 통하여 허위매물 및 정식종사원 확인 후 거래를 할 수 있도록 합니다.</p>
                    </li>
                    <li><span>2.</span><strong>차량상태를 확인하세요.</strong>
                        <p>보이는 외관만으로 모든 걸 결정하지 마십시오!<br>
                            차량외관은 수리를 통해 얼마든지 변화가 가능하답니다. 겉도 중요하지만 역시 내용이 중요합니다.</p>
                        <p><strong>내용을 중요하게 생각하십시오!</strong><br>
                            "중고차를 잘 샀다"라고 하는 경우는 구입 후 잔고장 없이 사용하는 것임을 숙지합시다.!<br>
                            ( 예를 들어 자동변속차량의 경우는 외관보다는 "오토미션"이 양호한지부터 살피세요.)</p>
                        <p><strong>혹시 사고차량이라면?</strong><br>
                            본닛, 도어, 휀더 등 단순교환 차량은 사고차량이 아닐 수 있습니다.<br>
                            자체가 손상이 안된 차량은 주행상 아무 문제가 없다는 것을 상기하십시오.</p>
                        <p><strong>사고차량 선별 노하우</strong><br>
                            1) 엄지손가락을 이용하여 본닛을 열고, 좌, 우측 내부 표면의 "칠"처리 부분을 만져보십시오. (육안으로 상태를 보는 것보다 더 정확할 수 있습니다.)<br>
                            <br>
                            <span class="text-red">[칠선별]<br>
                            - 처리부분의 느낌이 거칠면 재칠작업이 가미된 것으로 추정<br>
                            - 느낌이 부드럽다면 본래 출고시 색이 유지된 것으로 추정<br>
                            </span><br>
                            2) 각 접합부의 볼트조립과 실링상태는 차량 제조공정에서 자동으로 균일하게 출시되는 것이므로, 볼트의 풀림 여부를 확인해보고, 실링상태가 불규칙한 균열을 보이는 차량은 사고 후 수리를 하였을 수도 있습니다.<br>
                            <br>
                            <img src="/images/icon/guide_06.jpg"></p>
                    </li>
                </ul>
            </div>
            <div id="l_gtab4" class="tab_layer" style="display:none">
                <div class="title_wrap">
                    <h2>Step 4. 계약/이전</h2>
                    <p class="h2_txt">차량 구매에 있어서 가장 중요한 부분으로 꼼꼼하게 확인하세요</p>
                </div>
                <ul class="guide-step type-list">
                    <li><span>1.</span><strong>계약서 작성시 유의사항</strong><br>
                        <p><strong>계약서 작성요령</strong><br>
                            계약서 작성시에는 차량 구매 후 발생 가능한 문제외 A/S에 대한 책임부분도 쌍방 합의로 작성하는 것이 바람직하며, 매매상사의 담당자, 차량 매도인의 연락처 등을 기재해 놓는 것이 좋습니다.<br>
                            또한, 구매 당시 주행거리, 사고 유무 등 차량 상태와 책임소재도 꼭 기재해 두는 것이 좋습니다.</p>
                        <p><strong>개인 간 거래와 매매업자와의 거래는 계약서 양식이 다릅니다.</strong><br>
                            매매상사를 이용할 경우 반드시 관인매매계약서를 작성해야 하며, 개인간 직접거래일 경우 자동차 등록 관청에 있는 자동차양도증명서를 작성해야 합니다.<br>
                            <br>
                            <img src="/images/icon/service_img04.png"></p>
                    </li>
                    <li><span>2.</span><strong>명의 변경시 유의사항</strong>
                        <p>구매자에게 명의 이전이 되기 전까지는 공식적으로 차량의 소유주가 판매자로 등록되어 있으므로 사고나 과속, 주정차 등으로 과태료가 발생하면 난감할 수 있습니다.<br>
                            또한, 명의 이전이 완료되어야 기존 차량에 대한 보험 해지 및 자동차세 선납분을 환급받을 수 있습니다.
                            따라서 명의 이전까지 확실하게 마무리를 해야 판매가 완료되는 것입니다.</p>
                        <p><strong>차량 인도 후 책임은 구매자에게 있음을 명시하세요.</strong><br>
                            명의 이전이 완료되기 전까지는 소유권이 판매자에게 남아 있어 사고나 속도위반 등의 책임이 전가될 수 있습니다.<br>
                            구매자에게 차량을 인도할 때 계약서나 인도증에 인도한 날짜와 시간, 민형사상의 모든 책임을 명시하는 것이 좋습니다.</p>
                        <p><strong>체납된 과태료나 세금이 있는지 확인하세요.</strong><br>
                            체납된 과태료나 세금은 있다면 명의이전이 되지 않기 때문에 미리 확인하여 납부하는 것이 좋습니다. 자동차 등록원부를 통해 내용을 확인할 수 있으며, 민원사이트(http://www.minwon.go.kr)에서 무료로 발급받을 수 있습니다.</p>
                        <p><strong>명의 이전된 차량등록증을 팩스나 이메일로 받아보세요.</strong><br>
                            법적으로 차량 인수 후 15일 이내에 차량 소유권 이전등록하게 되어 있습니다. <br>
                            명의 이전등록이 완료되면 확인을 위해 새로 교부된 차량등록증을 팩스나 이메일로 받아보는 것이 좋습니다.<br>
                            중고차 판매 딜러나 상사에 차량을 판매했을 때 간혹 명의 이전을 미루는 경우가 있습니다.</p>
                        <p><strong>양도인 (판매자) 강제이전</strong><br>
                            양수인(구매자)이 이전하지 않고 있을 때 강제이전 절차를 통해 소유권을 변경할 수 있습니다.<br>
                            원칙적으로 자동차의 소유권 변동사항이 있는 경우 양수인이 이전등록을 이행해야 할 의무가 있습니다.<br>
                            단, 양수인이 이를 이행하지 않을 때 자동차관리법에는 양도인이 이전등록을 강제신청할 수 있습니다.</p>
                    </li>
                    <li><span>3.</span><strong>이전등록비용 계산하기</strong>
                        <p>이전등록비(차량가격의 8~9%(승용차 기준)정도 소요 = 등록세 + 취득세 + 공채매입비<br><br>
                        <img src="/images/icon/service_img03.png" width="100%"></p>
                        <p><strong>이전등록비용 구성</strong><br>
                            등록세 = 과세표준 금액 X 요율(최대 5%)
                            취득세 = 과세표준 금액 X 요율(2%)
                            공채과입비 = 과세표준 금액 X 요율(최대 6%)
                            *과세표준 금액 = 차대금(중고차 가격) X 내용연수 잔가율</p>
                        <p><strong>등록세 취득세 요율표</strong></p>
                        <table class="t_normal font12">
                            <thead>
                                <tr>
                                    <th rowspan="2">구분</th>
                                    <th rowspan="2">차량종류</th>
                                    <th colspan="3">신규/이전</th>
                                </tr>
                                <tr>
                                    <th>등록세</th>
                                    <th>취득세</th>
                                    <th>계</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <th rowspan="4">비영업용<br>
                                        (자가용)</th>
                                    <td>승용차</td>
                                    <td><strong>5%</strong></td>
                                    <td><strong>2%</strong></td>
                                    <td><strong>7%</strong></td>
                                </tr>
                                <tr>
                                    <td>7인~10인 승합</td>
                                    <td>4.32%</td>
                                    <td>2%</td>
                                    <td>6.32%</td>
                                </tr>
                                <tr>
                                    <td>0.6톤 미만</td>
                                    <td>2%</td>
                                    <td>2%</td>
                                    <td>4%</td>
                                </tr>
                                <tr>
                                    <td>승합, 화물(0.6톤 이상)</td>
                                    <td>3%</td>
                                    <td>2%</td>
                                    <td>5%</td>
                                </tr>
                                <tr>
                                    <th>영업용</th>
                                    <td>승용/승합/화물</td>
                                    <td>2%</td>
                                    <td>2%</td>
                                    <td>4%</td>
                                </tr>
                                <tr>
                                    <th>기타</th>
                                    <td colspan="4">저당권 설정등록 : 0.2%, 기타 등록세 (정액세) : 7,500원</td>
                                </tr>
                            </tbody>
                        </table>
                        <p>* 단 800cc 미만의 경차(비영업용)는 등록세, 취득세 면제</p>
                        <p><strong>장애인/국가유공자 면세 혜택</strong><br>
                            장애인, 국가유공자는 자동차 등록세/취득세/채권/자동차세 등이 면세됩니다. 급수에 따라 조금씩 면세내용이 달라지므로 자세한 내용은 구청이나 자동차등록과에 문의하세요.</p>
                        <h4 class="title">장애 1~3급</h4>
                        <table border="0" cellpadding="0" cellspacing="0" class="t_normal font12">
                            <colgroup>
                                <col style="width:90px;" />
                                <col />
                                <col />
                            </colgroup>
                            <thead>
                                <tr>
                                    <th>구분</th>
                                    <th>세금 기준가</th>
                                    <th>장애 1~3급</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <th>특별소비세</th>
                                    <td class="center">공장도가격의 10%(2,000cc이하는 5%)</td>
                                    <td class="center">전차종 면제</td>
                                </tr>
                                <tr>
                                    <th>교육세</th>
                                    <td class="center">특별소비세의 30%</td>
                                    <td class="center">-</td>
                                </tr>
                                <tr>
                                    <th>취득세</th>
                                    <td class="center">취득가액의 2%</td>
                                    <td rowspan="3" class="center">2,000cc미만 면제</td>
                                </tr>
                                <tr>
                                    <th>등록세</th>
                                    <td class="center">취득가액의 5%(경자동차는 2%)</td>
                                    </tr>
                                <tr>
                                    <th>자동차세</th>
                                    <td class="center">차종과 배기량에 따라 다름</td>
                                    </tr>
                                <tr>
                                    <th>면허세</th>
                                    <td class="center">배기량에 따라 다름</td>
                                    <td class="center">-</td>
                                </tr>
                            </tbody>
                        </table>
                        <h4 class="title">시각장애 1~4급</h4>
                        <table border="0" cellpadding="0" cellspacing="0" class="t_normal font12">
                            <colgroup>
                                <col style="width:90px;" />
                                <col />
                                <col />
                            </colgroup>
                            <thead>
                                <tr>
                                    <th>구분</th>
                                    <th>세금 기준가</th>
                                    <th>시각장애 1~4급</th>
                                </tr>
                          </thead>
                            <tbody>
                                <tr>
                                    <th>특별소비세</th>
                                    <td class="center">공장도가격의 10%(2,000cc이하는 5%)</td>
                                    <td class="center">1~3급 면제, 4급 면제안됨</td>
                                </tr>
                                <tr>
                                    <th>교육세</th>
                                    <td class="center">특별소비세의 30%</td>
                                    <td class="center">-</td>
                                </tr>
                                <tr>
                                    <th>취득세</th>
                                    <td class="center">취득가액의 2%</td>
                                    <td rowspan="3" class="center">2,000cc미만 면제</td>
                                </tr>
                                <tr>
                                    <th>등록세</th>
                                    <td class="center">취득가액의 5%(경자동차는 2%)</td>
                              </tr>
                                <tr>
                                    <th>자동차세</th>
                                    <td class="center">차종과 배기량에 따라 다름</td>
                              </tr>
                                <tr>
                                    <th>면허세</th>
                                    <td class="center">배기량에 따라 다름</td>
                                    <td class="center">-</td>
                                </tr>
                            </tbody>
                    </table>
                        <p>*장애인 4~6급도 LPG차량을 구매할 수 는 있지만 면세가 없습니다.<br>
                            *4~7급 장애인, 국가유공자훈장 1~7급(장애없음) : 배기량 관계없이 공채면세, LPG 승용차 구매가능<br>
                            * RV차량 7~9인승, 화물차량 : 특별소비세 / 등록비 / 자동차세는 면세, 고속도로 통행료 / 주차료 50% 감면</p>
                    </li>
                </ul>
            </div>
            <div id="l_gtab5" class="tab_layer" style="display:none">
                <div class="title_wrap">
                    <h2>구매시 체크 TIP</h2>
                </div>
                <ul class="guide-step">
                    <li class="bg" style="background-image:url(/images/icon/guide_02.png)"><span>1.</span><strong>중고차 판매자 확인</strong>
                        중고차 판매자가 어떤 사람인지 확인하여 명의이전이 확실한가, 안전하게 계약할 수 있는가를 고려하세요.
                    </li>
                    <li class="bg color2"><span>2.</span><strong>구매전 계약금 송금주의</strong>
                        차를 확인하기 전 계약금을 건네는 것은 삼가하세요.<br> 부득이하게 계약이 파기되는 경우, 계약금 환불 및 위약금으로 인하여 피해를 입을 수도 있습니다.
                    </li>
                    <li><span>3.</span><strong>전문가에게 진단받기</strong>
                        중고차의 구매 특성상 구매 전에는 중고차를 꼼꼼하게 진단을 받는 것이 좋습니다.
                        현재의 중고차 상태를 파악하는 것은 매우 중요합니다.
                    </li>
                    <li><span>4.</span><strong>적당한 가격이 맞는지 절충해 보아야 합니다.</strong>
                        요즘은 인터넷만 이용하더라도 중고차의 시세를 쉽게 알아볼 수가 있습니다. 때문에
                        중고차 전문가가 아니더라도 가격 절충이 가능합니다.
                    </li>
                    <li class="bg" style="background-image:url(/images/icon/guide_03.png)"><span>5.</span><strong>원부 조회는 반드시 해야 합니다.</strong>
                        계약전에는 반드시 차량 등록 조회를 해야합니다.
    과태료, 저당, 체납 등이 있을 경우에는 이전등록이 되지 않습니다.
                    </li>
                    <li class="color1"><span>6.</span><strong> 꼼꼼하게 계약서를 작성해야 합니다.</strong>
                        위의 순서대로 진행이 되었다면, 계약서를 작성하도록 합니다.
    계약서 사본은 반드시 챙겨두셔야 합니다.
                    </li>
                    <li class="color1"><span>7.</span><strong>자동차세는 일할 계산합니다.</strong>
                        자동차세는 매매일자를 기준으로 자동차세를 분할 납부하도록 합니다.<br>
    매매일자를 기준으로 하여, 매도자, 매수자가 자동차세를 분할하여 납부하도록 합니다.
                    </li>
                    <li><span>8.</span><strong>반드시 보험가입을 해야합니다.</strong>
                        중고차를 계약했다면 반드시 자동차 보험에도 동시에 가입을 해야합니다.<br>
    명의 이전을 할때, 보험가입 증명서는 필수입니다.
                    </li>
                    <li class="color1"><span>9.</span><strong>명의이전 완료를 확인하세요.</strong>
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


<script type="text/javascript" src="/js/jquery.bxslider.min.js"></script>
<script type="text/javascript">
<!--
$(document).ready(function(){

    $('.slider-inner').bxSlider();

});
// -->
</script>

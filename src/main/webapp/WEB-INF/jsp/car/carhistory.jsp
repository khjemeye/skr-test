<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/include/top.jsp"%>

<link rel="stylesheet" type="text/css" href="/css/carhistory.css"/>

<div class='mainwrap'>

    <div class='maincont' id='printContent1'>

        <div class='pgcon'>
            <h1>중고차 사고이력정보 보고서 </h1>
            <div class="header">
                <div class="img"><img src="/images/carhistory/report_img01.png" alt="차종"/>
                </div>
                <div class="left"><span class="DT_r005">-</span> <br> <span class="DT_r002">-</span></div>
                <div class="right">정보조회일자 : <strong id="caDateLayer">-</strong></div>
            </div>

            <h2>중고차 사고이력 정보요약 <span> (내차피해 *회, 0원은 미확정금액입니다.)</span> </h2>
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="t_normal">
                <colgroup>
                    <col width="168px" />
                    <col width="242px" />
                    <col width="168px" />
                    <col />
                </colgroup>
                <tbody>
                <tr>
                    <td>제조사</td>
                    <td><strong class="DT_r101">-</strong></td>
                    <td>전손 보험사고</td>
                    <td><strong class="DT_r405">-</strong></td>
                </tr>
                <tr>
                    <td>연식</td>
                    <td><strong class="DT_r004">-</strong></td>
                    <td>도난 보험사고</td>
                    <td><strong class="DT_r409">-</strong></td>
                </tr>
                <tr>
                    <td>용도 변경 이력</td>
                    <td><strong class="DT_RYONG">-</strong></td>
                    <td>침수 보험사고</td>
                    <td><strong class="DT_r407">-</strong></td>
                </tr>
                <tr>
                    <td>소유자변경</td>
                    <td><strong class="DT_r204">-</strong></td>
                    <td>내차 피해</td>
                    <td><strong><span class="DT_r401">-</span>회, <span class="DT_r402">-</span></strong></td>
                </tr>
                <tr>
                    <td>차량번호 변경</td>
                    <td><strong class="re_orange DT_RCARNUM">-</strong></td>
                    <td>상대 차 피해</td>
                    <td><strong><span class="DT_r403">-</span>회, <span class="DT_r404">-</span></strong></td>
                </tr>
                </tbody>
            </table>
            <div class="explain">
                <img src="/images/carhistory/report_img02.png"/> <span class="re_bold">자동차보험 사고기록</span>이 없었다고 해서 반드시 <span class="re_bold">무사고</span>라고 할 수는 없습니다. </div>


            <h2>자동차 일반 사양 정보</h2>
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="t_normal">
                <tbody>
                <tr>
                    <td width="210px">자동차명</td>
                    <td><strong class="DT_r005">-</strong></td>
                </tr>
                <tr>
                    <td>배기량</td>
                    <td><strong class="DT_r104">-</strong></td>
                </tr>
                <tr>
                    <td>사용연료</td>
                    <td><strong class="DT_r106">-</strong></td>
                </tr>
                <tr>
                    <td>차체형상</td>
                    <td><strong class="DT_r007">-</strong></td>
                </tr>
                <tr>
                    <td>용도 및 차종</td>
                    <td><strong class="DT_r103">-</strong></td>
                </tr>
                <tr>
                    <td>최초 보험 가입일자</td>
                    <td><strong class="DT_r105">-</strong></td>
                </tr>
                </tbody>
            </table>
            <div class="explain"></div>

            <h2>자동차 용도변경 정보</h2>
            <div class="h2_explain">
                과거 자동차번호 변경기록을 모두 검색하여 제공하는 것으로 대여용(렌트카), 영업용(택시 등)으로 사용된 적이 있는지 확인할 수 있습니다.
            </div>
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="t_normal">
                <tbody>
                <tr>
                    <td width="250">대여용도 사용이력(렌터카)</td>
                    <td><strong class="DT_r303">-</strong></td>
                </tr>
                <tr>
                    <td>영업용도 사용이력</td>
                    <td><strong class="DT_r302">-</strong></td>
                </tr>
                <tr>
                    <td>관용용도 사용이력</td>
                    <td class="DT_r301"><strong>-</strong></td>
                </tr>
                </tbody>
            </table>
            <div class="explain"></div>

            <h2>자동차 번호/소유자 변경이력 정보</h2>
            <div class="h2_explain">
                - 소유자 변경이력은 자료수집 방법상 오류가 발생할 수 있으니, 의심되는 사항이 있으시면 전화 주시기 바랍니다.<br/>
                - 자동차번호. 소유자 변경이력은 보고서 상의 제약에 따라 최근부터 4회 까지만 제공되기 때문에 요약 정보의 횟수와 상이 할 수 있습니다.
            </div>
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="t_normal">
                <colgroup>
                    <col width="25%" />
                    <col width="25%" />
                    <col width="25%" />
                    <col width="25%" />
                </colgroup>
                <tbody id="ownerChangeWrap">
                </tbody>
            </table>
            <div class="explain"></div>


            <h2>자동차 특수 사고 이력 정보 </h2>

            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="t_icon">
                <tbody>
                <tr>
                    <td><div id="spAccWrap1" class="icon icon1">
                        -
                    </div>
                        전손 보험사고</td>
                    <td><div id="spAccWrap2" class="icon icon2">
                        -
                    </div>
                        도난 보험사고</td>
                    <td><div id="spAccWrap3" class="icon icon3">
                        -
                    </div>
                        침수 보험사고<span id="spAccWrap3Memo"></span></td>
                </tr>
                </tbody>
            </table>


            <h2>보험사고이력 상세 정보</h2>
            <div class="h2_explain big"> <strong class="DT_r002">19거1004</strong> 차량이 자기차량손해담보에 가입하지 않은 동안에는 내 보험으로 처리한 <span style="color:#27a4ba;">사고이력정보의 제공이 불가능</span>합니다. <span id="noMembersWrap"></span></div>
            <div class="h2_explain">
                - 보험금 및 수리(견적)비 출처에 따라서 '가입한 보험사에서 지급된 경우(내차 보험)'와 '다른 차량 보험에서 지급된 경우(상대 보험)'로 나뉘어 제공됩니다. <br/>
                - 자동차사고로 상대 차량 또는 재물에 발생한 손해를 내 보험금에서 지급된 경우의 정보를 제공합니다.
            </div>
            <div class="h2_explain big">
                ▪  내차 보험 : 내보험으로 처리한 내 차 사고 (대인사고 제외)<br/>
                ▪  상대 보험 : 다른 차량 보험으로 처리한 내 차 사고 (대인사고 제외)<br/>
                ▪  상대 차 피해 : 내 보험으로 처리한 상대 차 사고 (대인사고 제외)<br/>
            </div>
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="t_normal_header">
                <tbody>
                <tr>
                    <td rowspan="2" style="width:145px;">사고일자</td>
                    <td colspan="2">내차피해</td>
                    <td rowspan="2">상대 차 피해</td>
                </tr>
                <tr>
                    <td style="width:216px;">내차 보험</td>
                    <td style="width:216px;">상대 보험</td>
                </tr>
                </tbody>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="t_normal">
                <colgroup>
                    <col width="145" />
                    <col width="216" />
                    <col width="216" />
                    <col />
                </colgroup>
                <tbody id="accListWrap">
                </tbody>
            </table>
            <div class="h2_explain">쌍방과실로 해당 자동차의 손상.수리기록이 내차 보험과 상대 보험에서 동시에 처리된 경우에는 '내차 보험'에만 표시되고 '상대 보험'에서는 생략됩니다.
            </div>
            <ul class="ul">
                <li>카히스토리 사료수집 방법상 오류가 발생 할 수 있으나, 의심되는 사항이 있으시면 전화주시기 바랍니다.</li>
                <li>위 ‘수리(견적)비용’은 보험사가 지급하는 보험금 중에서 대차료, 휴차료 등 간접손해와 과실상계액 등을 제외한 수리 및 견적(부품/공임/도장) 비용으로 실제 지급된 보험금과 차이가 있습니다.</li>
                <li>보험사고 이력은 최근 10건의 사고만 표시됩니다.</li>
            </ul>

            <div class="explain">
            </div>

            <div class="explain_bg">
                <ul>
                    <li>본 중고차 사고이력정보는 정보조회일자를 기준으로 작성된 것입니다.</li>
                    <li>본 정보는 자동차 일반정보로서 조회 차량을 확인하기 위하여 참고로 제공하는 것이며, 일부 차량의 경우, 정보의 누락이나 오류가 있을 수 있습니다.</li>
                    <li>침수사고에는 경미한 부분침수도 포함되며, 자료의 누락으로 “이력 없음” 으로 표시되는 경우가 있습니다.</li>
                    <li>카히스토리 자료수집 방법상 오류가 발생할 수 있으니 의심되는 사항이 있으시면 전화 주시기 바랍니다.</li>
                    <li>수리비용은 보험사에서 지급되는 보험금 산정을 위하여 책정된 차량 수리 관련 항목만의 비용으로 실제 지급받은 보험금과 차이가 있을 수 있습니다.</li>
                </ul>
            </div>

            <div class="h2_explain">중고차 사고이력정보 서비스는 자동차 보험을 취급하는 14개 손해보험사의 자동차 보험수리 지급기록(1996년 이후)에 근거하여 제공하고 있습니다. 따라서 다음과 같은 경우는 중고차 이력정보 서비스를 제공할 수 없습니다.</div>

            <div class="explain_bg">
                <ol>
                    <li>
                        사고가 있었다 하더라도 보험회사에서 사고신고를 하지 않고 자비로 처리한 경우<br/>
                        - 사고신고를 하였더라도 면책, 취소 등의 사유로 지급되지 않은 경우<br/>
                        - 사고신고 후 자비로 처리한 경우
                    </li>
                    <li>
                        사고가 있었다 하더라도 종합보험, 즉 자기차량담보나 대물배상담보에 자동차 보험에 가입하지 않아서 자동차 보험으로
                        수리비용을 청구하지 못한 경우<br/>
                        (단, 이 경우에도 타인 자동차 보험에서 보상받은 경우에는 사고정보제공 가능)
                    </li>
                    <li>
                        자동차보험이 아닌 운수 공제(택시공제, 화물공제, 버스공제 등)에 가입되어 운수공제로 부터 자동차의 피해에 대한 손해를
                        보상받은 경우 등 <br/><br/> 본 중고차 사고이력 정보는 중고차 품질확인은 위한 보조정보이며 결정적 판단자료로 사용되어서는 아니됩니다.<br/>
                        따라서 정밀한 중고차 품질확인을 윈하시면 차량진단 전문업체의 진단을 받아보시기 바랍니다.
                    </li>
                </ol>
            </div>

            <div class="explain"></div>

            <h2 class="bg">용어설명</h2>
            <div class="explain_line">
                <ul class="ul2">
                    <li>
                        <span class="re_bold">수리(견적)비용</span><br />
                        자동차사고로 자동차가 손상된 경우 보험회사가 지급하는 보험금중에서 자동차 운반비, 대차료(렌트비용), 휴차료 등의 간접손해와 과실상계액 등을 제외한, 자동차를 수리하는데 소요되는 비용 또는 견적으로 부품비용, 공임 및 도장료로 이루어집니다.
                    </li>
                    <li>
                        <span class="re_bold">자동차보험사고 특수이력</span><br/>
                        자동차보험에서 보험금이 지급된 자동차사고기록 중에서 자동차품질에 특별히 영향을 미칠 가능성이 있는 사고
                    </li>
                    <li>
                        <span class="re_bold">전손 보험사고</span><br/>
                        손상된 자동차의 수리비용이 보험회사에서 적정하다고 인정한 자동차가치를 초과한 경우(추정전손) 및 손상된 자동차의 수리가 불가능하거나 수리를 하더라도 자동차로서의 기능을 다할 수 없는 경우  (절대전손)로 자동차보험에서 보상처리 받은 사고
                    </li>
                    <li>
                        <span class="re_bold">도난 보험사고</span><br/>
                        자동차를 도난 당하여 경찰서에 신고한지 30일이 지나도록 도난 당한 자동차를 찾지 못하여 자동차 보험에서 보상처리 받은 사고
                    </li>
                    <li>
                        <span class="re_bold">침수 보험사고</span><br/>
                        자동차를 운행하던 중 자동차 내부로 물이 들어와 시동이 꺼지거나, 주차 중 엔진 등에 물이 들어가 운행이 불가능하게 되어 자동차에 손해가 발생한 경우<br/>
                    </li>
                    <li>
                        <span class="re_bold">미가입기간</span><br/>
                        자기차량손해담보 미가입기간으로 해당기간에 대해서는 자기차량손해담보에 의해 지급된 자동차수리비 정보를 제공할 수 없는 기간 <br/>
                    </li>
                </ul>
            </div>



            <div style="float:left;width:100%;text-align:center;font-size:16px;color:#747474;vertical-align:middle;margin:0px 0 10px;font-weight:700;">
            </div>



            <hr style="width:80px;border-top:3px solid #323232;margin:0 0 0px;" />
            <div style="float:left;width:100%;margin:0px 0px 30px;font-size:14px;padding:0px;color:#272727;">
                <p>중고차사고이력정보서비스는 중고차 거래의 활성화와 중고차 매매시장의 투명성을 높이기 위하여, 보험개발원에서 보유하고 있거나
                    수집한 1996년 이후의 자동차관련 정보를 기초로 제공되는 온라인 서비스입니다.</p>
                <p>본 정보는 중고차품질확인을 위한 보조정보로서 자동차와 관련된 모든 사고의 발생 여부나 품질확인을 위한 결정적인 판단자료로
                    사용 되어서는 아니 됩니다.</p>
                <p>따라서 본 정보의 확대해석이나 오 · 남용으로 발생하는 사항에 대해서 보험개발원은 어떤 책임도 부담하지 아니합니다.<br/>
                </p>
            </div>


            <div class="footer_text">보험개발원(www.kidi.or.kr)은 보험입법 제 176조에 의하여 설립된 보험요율산출기관이며, <br />
                중고차사고이력정보서비스(www.carhistory.or.kr)는 보험업법시행령 제86조 제1호 근거하여 제공합니다. </div>


            <div class="footer_logo">
                <div class="date" id="caDate2Layer">-</div>
                <span class="logo">보험개발원</span>
            </div>

        </div>

    </div>

    <div class="btn_box"><a href="javascript:;" class="cardarkbt" onClick="javascript:printLayer('printContent1')">출력하기</a></div>

    <div style="float:left;width:100%;height:60px;">&nbsp;</div>

</div>
<!-- // end : 컨텐츠 //-->
<script type="text/javascript">
    function getDateFormat(text) {
        return text.substring(0, 4) + "년 " + text.substring(4, 6) + "월 " + text.substring(6, 8) + "일";
    }
    function getDateFormatD(text) {
        return text.substring(0, 4) + "-" + text.substring(4, 6) + "-" + text.substring(6, 8) + "";
    }
    function getCarGubunName(key) {
        var text = "";
        switch(key) {
            case "1":
                text = "승용";
                break;
            case "2":
                text = "승합";
                break;
            case "3":
                text = "화물";
                break;
            case "4":
                text = "특수";
                break;
        }
        return text;
    }

    function getCarYongName(key) {
        var text = "";
        switch(key) {
            case "1":
                text = "관용";
                break;
            case "2":
                text = "자가용";
                break;
            case "3":
                text = "영업용";
                break;
            case "4":
                text = "개인택시";
                break;
            case "5":
                text = "렌터카";
                break;
        }
        return text;
    }

    function getInfoChangeName(key) {
        var text = "";
        switch(key) {
            case "01":
                text = "최초등록";
                break;
            case "02":
                text = "차량번호변경";
                break;
            case "04":
                text = "소유자변경";
                break;
        }
        return text;
    }

    function getAccGubunName(key) {
        var text = "";
        switch(key) {
            case "1":
                text = "내차보험으로 처리한 내차 사고";
                break;
            case "2":
                text = "타차보험으로 처리된 내차 사고";
                break;
            case "3":
                text = "대물가해";
                break;
        }
        return text;
    }

    function setDTR(xml, key, camList) {
        var text = $(xml).find("r" + key).text();
        //console.log(text);
        if(key == "101") { // 제조사
            for(var i = 0; i < camList.length; i ++) {
                if(camList[i].accmCode == text) {
                    text = camList[i].accmName;
                    break;
                }
            }
        }
        if(key == "103") { // 차종
            text = getCarGubunName(text);
        }

        if(key == "104") { // 배기량
            text = SetComma(text) + "cc";
        }

        if(key == "402" || key == "404") { // SetComma
            text = SetComma(text) + "";
        }

        if(key == "105") { // 날짜형태
            text = getDateFormat(text);
        }

        if(key == "409" || key == "405") { // 색상 및 건수
            //alert(text);
            text = SetComma(text) + "건";
            if(text - 0 > 0) {
                $(".DT_r" + key).addClass("re_orange");
            }
        }

        if(key == "204") { // 색상 및 회수
            //alert(text);
            text = SetComma(text) + "회";
            if(text - 0 > 0) {
                $(".DT_r" + key).addClass("re_orange");
            }
        }

        if(key == "301" || key == "302" || key == "303") { // 사용이력 있음 / 없음 처리
            if(text == "Y") text = "사용이력 있음";
            else text = "없음";
        }

        $(".DT_r" + key).text(text);
    }
    $(document).ready(function() {
        var p_url = "/car/popCarAccidentAjax.do";
        var p_data = { "cNo" : "${cNo}" };

        $.ajax({
            type:"get",
            dataType:"json",
            url:p_url,
            data: p_data,
            cache:false,
            async:false,
            success:function(returnData) {
                if(returnData.success == true) {
                    var row = returnData.data;
                    var camList = returnData.camList;
                    var xml = row.caData;
                    var caDate = row.caRegdate;
                    $("#caDateLayer").html(caDate);
                    $("#caDate2Layer").html(caDate);

                    //console.log(caDate);
                    setDTR(xml, "002");
                    setDTR(xml, "004");
                    setDTR(xml, "101", camList);
                    setDTR(xml, "102");
                    setDTR(xml, "103");
                    setDTR(xml, "104");
                    setDTR(xml, "005");
                    setDTR(xml, "105");
                    setDTR(xml, "106");
                    setDTR(xml, "107");
                    setDTR(xml, "401");
                    setDTR(xml, "402");
                    setDTR(xml, "403");
                    setDTR(xml, "404");
                    setDTR(xml, "409");
                    setDTR(xml, "410-01");
                    setDTR(xml, "405");
                    setDTR(xml, "406-01");

                    var r407 = $(xml).find("r407").text() - 0;
                    if($(xml).find("r407").text() - 0 > 0) {
                        $(".DT_r407").addClass("re_orange");
                        $(".DT_r407").text("침수 전(분)손 " + r407 + "건");
                    } else {
                        $(".DT_r407").text("0건");
                    }
                    setDTR(xml, "408-01");

                    setDTR(xml, "201");
                    setDTR(xml, "204");
                    setDTR(xml, "510");
                    setDTR(xml, "501");

                    setDTR(xml, "301");
                    setDTR(xml, "302");
                    setDTR(xml, "303");

                    var yongCnt = 0;
                    var r103 = $(xml).find("r103").text() - 0;
                    $(xml).find("r202-05").each(function() {
                        var key = $(this).text() - 0;
                        // 현재의 용도와 비교
                        if(key != r103) yongCnt ++;
                    });
                    // 용도변경이력
                    if(yongCnt > 0) {
                        $(".DT_RYONG").addClass("re_orange");
                        $(".DT_RYONG").text("있음");
                    } else {
                        $(".DT_RYONG").text("없음");
                    }

                    var carnumCnt = 0;
                    $(xml).find("r202-01").each(function() {
                        var key = $(this).text() - 0;
                        // 현재의 용도와 비교
                        if(key == 1) carnumCnt ++;
                    });
                    // 차량번호 변경 이력
                    if(carnumCnt > 0) {
                        $(".DT_RCARNUM").addClass("re_orange");
                        $(".DT_RCARNUM").text("있음");
                    } else {
                        $(".DT_RCARNUM").text("없음");
                    }

                    // 차량정보변경이력
                    var arr202_01 = new Array();
                    var arr202_02 = new Array();
                    var arr202_03 = new Array();
                    var arr202_04 = new Array();
                    var arr202_05 = new Array();
                    $(xml).find("r202-01").each(function() {
                        arr202_01.push($(this).text());
                    });
                    $(xml).find("r202-02").each(function() {
                        arr202_02.push($(this).text());
                    });
                    $(xml).find("r202-03").each(function() {
                        arr202_03.push($(this).text());
                    });
                    $(xml).find("r202-04").each(function() {
                        arr202_04.push($(this).text());
                    });
                    $(xml).find("r202-05").each(function() {
                        arr202_05.push($(this).text());
                    });

                    var r203 = '';
                    $(xml).find("r203").each(function() {
                        r203 = $(this).text();
                    });

                    // 소유자변경이력
                    var arr205_01 = new Array();
                    var arr205_02 = new Array();
                    $(xml).find("r205-01").each(function() {
                        arr205_01.push($(this).text());
                    });
                    $(xml).find("r205-02").each(function() {
                        arr205_02.push($(this).text());
                    });

                    // 자차미가입기간횟수
                    var arr511_01 = new Array();
                    $(xml).find("r511-01").each(function() {
                        arr511_01.push($(this).text());
                    });

                    // 사고이력
                    var arr502_01 = new Array();
                    var arr502_02 = new Array();
                    var arr502_03 = new Array();
                    var arr502_04 = new Array();
                    var arr502_05 = new Array();
                    var arr502_06 = new Array();
                    var arr502_07 = new Array();
                    var arr502_08 = new Array();
                    var arr502_15 = new Array();
                    $(xml).find("r502-01").each(function() {
                        arr502_01.push($(this).text());
                    });
                    $(xml).find("r502-02").each(function() {
                        arr502_02.push($(this).text());
                    });
                    $(xml).find("r502-03").each(function() {
                        arr502_03.push($(this).text());
                    });
                    $(xml).find("r502-04").each(function() {
                        arr502_04.push($(this).text());
                    });
                    $(xml).find("r502-05").each(function() {
                        arr502_05.push($(this).text());
                    });
                    $(xml).find("r502-06").each(function() {
                        arr502_06.push($(this).text());
                    });
                    $(xml).find("r502-07").each(function() {
                        arr502_07.push($(this).text());
                    });
                    $(xml).find("r502-08").each(function() {
                        arr502_08.push($(this).text());
                    });
                    $(xml).find("r502-15").each(function() {
                        arr502_15.push($(this).text());
                    });

                    //ownerChangeWrap 소유자변경되었거나 차량번호가 변경된 이력
                    for(var i = 0; i < arr205_01.length; i ++) {
                        if(arr205_01[i] == "04") {
                            var tStr = "";
                            tStr += "<tr>";
                            tStr += "<td>" + getDateFormat(arr205_02[i]) + "</td>";
                            tStr += "<td>" + "소유자변경" + "</td>";
                            tStr += "<td class='bg_white'>" + "&nbsp;" + "</td>";
                            tStr += "<td>"  + "&nbsp;" + "</td>";
                            tStr += "</tr>";

                            $("#ownerChangeWrap").append(tStr);
                        }
                    }
                    for(var i = 0; i < arr202_01.length; i ++) {
                        if(arr202_01[i] == "01" || arr202_01[i] == "02") {
                            var tStr = "";
                            tStr += "<tr>";
                            if (arr202_01[i] == "01") {
                                tStr += "<td>" + getDateFormat(r203) + "</td>";
                            } else {
                                tStr += "<td>" + getDateFormat(arr202_02[i]) + "</td>";
                            }

                            tStr += "<td>" + getInfoChangeName(arr202_01[i]) + "</td>";
                            tStr += "<td class='bg_white'>" + arr202_03[i] + "</td>";
                            tStr += "<td>" + getCarYongName(arr202_05[i]) + " "  + getCarGubunName(arr202_04[i]) + "</td>";
                            tStr += "</tr>";

                            $("#ownerChangeWrap").append(tStr);
                        }
                    }

                    if($("#ownerChangeWrap").text() == "") $("#ownerChangeWrap").append("<tr><td colspan='4'>변경 이력이 없습니다.</td></tr>");

                    // 전손여부
                    var r405 = $(xml).find("r405").text() - 0;
                    if(r405 > 0) {
                        $("#spAccWrap1").addClsas("on");
                        $("#spAccWrap1").text(getDateFormatD($(xml).find("r406-01").text()));
                    } else {
                        $("#spAccWrap1").removeClass("on");
                        $("#spAccWrap1").text("이력없음");
                    }

                    // 도난여부
                    var r409 = $(xml).find("r409").text() - 0;
                    if(r409 > 0) {
                        $("#spAccWrap2").addClass("on");
                        $("#spAccWrap2").text(getDateFormatD($(xml).find("r410-01").text()));
                    } else {
                        $("#spAccWrap2").removeClass("on");
                        $("#spAccWrap2").text("이력없음");
                    }

                    // 침수여부
                    if(r407 > 0) {
                        $("#spAccWrap3").addClass("on");
                        $("#spAccWrap3").text(getDateFormatD($(xml).find("r408-01").text()));
                        $("#spAccWrap3Memo").text("(전손/분손)");
                    } else {
                        $("#spAccWrap3").removeClass("on");
                        $("#spAccWrap3").text("이력없음");
                    }


                    // 미 가입기간이 있는지 확인
                    if(arr511_01.length > 0) {
                        $(xml).find("r511-01").each(function() {
                            var txt = $(this).text();
                            // 2009년 03월 ~ 2010년 03월
                            $("#noMembersWrap").append("미가입기간 : " + txt);
                        });
                    }

                    // 사고이력 내용 생성
                    for(var i = 0; i < arr502_01.length; i ++) {
                        var priceArr = new Array();
                        var price = '-';
                        if (arr502_15[i] != '0' && arr502_15[i] != '') {
                            price = '수리(견적)비용 : ' + SetComma(arr502_15[i]) + "원";
                            priceArr.push(price);
                            priceArr.push("부품 : " + SetComma(arr502_06[i]) + "원");
                            priceArr.push("공임 : " + SetComma(arr502_07[i]) + "원");
                            priceArr.push("도장 : " + SetComma(arr502_08[i]) + "원");
                        } else if ((arr502_03[i] != '0' && arr502_03[i] != '') && arr502_04[i] == '0') {
                            price = '지급보험금 : ' + SetComma(arr502_03[i]) + "원";
                            priceArr.push(price);
                        } else if ((arr502_03[i] != '0' && arr502_03[i] != '') && (arr502_04[i] != '0' && arr502_04[i] != '')) {
                            price = '지급보험금 : ' + SetComma(arr502_03[i]) + "원+미확정";
                            priceArr.push(price);
                        } else if ((arr502_04[i] != '0' && arr502_04[i] != '') && arr502_03[i] == '0') {
                            price = '지급보험금 : 미확정';
                            priceArr.push(price);
                        }

                        var aGubun = arr502_01[i] - 0;
                        var tStr = "";
                        tStr += "<tr>";
                        tStr += "<td>" + getDateFormatD(arr502_02[i]) + "</td>";
                        tStr += "<td>";
                        if(aGubun == 1) tStr += priceArr.join("<br />");
                        else tStr += "&nbsp;";
                        tStr += "</td>";
                        tStr += "<td class='bg_white'>";
                        if(aGubun == 2) tStr += priceArr.join("<br />");
                        else tStr += "&nbsp;";
                        tStr += "</td>";
                        tStr += "<td class='bg'>";
                        if(aGubun == 3) tStr += priceArr.join("<br />");
                        else tStr += "&nbsp;";
                        tStr += "</td>";
                        tStr += "</tr>";

                        $("#accListWrap").append(tStr);
                    }
                } else {
                    $("body").empty();
                    if(returnData.commonMsg) {
                        alert(returnData.commonMsg);
                    } else {
                        alert("조회중에 오류가 발생했습니다.");
                    }

                    selfclose();
                }
            }
        });
    });


    function SetComma(numstr)
    {
        numstr = String(numstr);
        var re0 = /^(-?\d+)(\d{3})($|\..*$)/;
        if (re0.test(numstr))
            return numstr.replace(re0,
                function(str,p1,p2,p3) {
                    return SetComma(p1) + ',' + p2 + p3;
                }
            );
        else
            return numstr;
    }
    // 문자를 숫자로 정리한다.
    function DelComma(numstr) {
        numstr = String(numstr);
        if (numstr == '') return '0';
        else if (numstr == '-') return '0';
        else if (numstr == '0-') return '-0';
        numstr = numstr.replace(/[^\d\.-]/g,'');
        numstr = String(numstr.match(/^-?\d*\.?\d*/));
        numstr = numstr.replace(/^(-?)(\d*)(.*)/,
            function(str,p1,p2,p3) {
                p2 = (p2>0) ? String(p2.match(/[1-9]\d*$/)) : '0';
                //    p2 = (p2>0) ? String(parseInt(p2,10)) : '0';
                return p1 + p2 + p3;
            }
        );
        return numstr;
    }

    var contentId = "";

    function printLayer(contentId) {
        contentId = contentId;
        window.print();
    }

    window.onbeforeprint = function(){
        var initbody = document.body.innerHtml;
        document.body.innerHtml = $("#"+contentId).html();
    };
    window.onafterprint = function(){
        document.body.innerHTML = initbody;
    };

</script>

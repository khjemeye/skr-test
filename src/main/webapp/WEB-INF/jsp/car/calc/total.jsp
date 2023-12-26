<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.autofield.web.CommonUtil" %>
<%@ include file="/include/taglib_prefix.jsp"%>

<!-- header -->
<SCRIPT LANGUAGE="JavaScript">
function calTotPurcCost() {
    // 지하철 지역 공채매입 비율
    var $che1Percent = ${che1Percent};
    // 기타 지역 공채매입 비율
    var $che2Percent = ${che2Percent};

    /*
    // 증지대
    var $stampPrice1 = ${stampPrice1};
    // 인지대
    var $stampPrice2 = ${stampPrice2};

    // 번호판 교체비
    var $platePrice = ${platePrice};
    // 이전등록대행비
    //var $movePrice = 100000;
    */

    var $carPrice = DelComma($("#salePrice").val()) * 10000;
    $("#salePrice").val(SetComma(DelComma($("#salePrice").val())));
    var $chePercent = 0;

    // JITIN3 김동진 : 지역선택 콤보박스가 없으니 일단 서울/인천/대전/부산지역기준으로
    // jitin3 김동진 2020-06-26 : 퍼블리싱 바뀌어 재오픈
    if($("#position").val() == 1) $chePercent = $che1Percent;
    else $chePercent = $che2Percent;

    //$chePercent = $che1Percent;

    var $taxPrice1 = Math.round($carPrice * $("#regRate").val() / 100); //등록세
    var $taxPrice2 = Math.round($carPrice * 2 / 100); //취득세
    var $taxPrice = $taxPrice1 + $taxPrice2;  //취등록세
    var $chePrice = Math.round($carPrice * $chePercent / 100);
    //var $stampPrice = $stampPrice1 + $stampPrice2;

    /*
    if(!$("input:checkbox[id='moveFlag']").is(":checked")) {
        $movePrice = 0;
    }
    */

    var $taxPrice1Str = commaSplit($taxPrice1) + " 원";
    var $taxPrice2Str = commaSplit($taxPrice2) + " 원";
    var $taxPriceStr = commaSplit($taxPrice) + " 원";
    var $chePriceStr = commaSplit($chePrice) + " 원";

    <c:if test="${carViewVO.currRecord.bgNo eq 1}">
        $taxPrice = 0;
        $chePrice = 0;
        $taxPrice1Str = "면제";
        $taxPrice2Str = "면제";
        $taxPriceStr = "면제";
        $chePriceStr = "면제";
    </c:if>

    //var $sumPrice = $taxPrice + $chePrice + $stampPrice + $platePrice + $movePrice;
    var $sumPrice = $taxPrice + $chePrice + DelComma($("#stampPrice1").val()) * 1 + DelComma($("#stampPrice2").val()) * 1 + DelComma($("#platePrice").val()) * 1 + DelComma($("#qualityInsuPrice").val()) * 1 + DelComma($("#moveFeePrice").val()) * 1;

    var $totalPrice = $carPrice + $sumPrice + DelComma($("#dealerFeePrice").val()) * 1;

    $("#sumPrice").html(commaSplit($sumPrice) + "원");
    $("#taxPrice").html($taxPriceStr);
    //$("#taxPrice2").html($taxPrice2Str);
    $("#chePrice").html($chePriceStr);
    /*
    $("#stampPrice1").html(commaSplit($stampPrice1) + "원");
    $("#stampPrice2").html(commaSplit($stampPrice2) + "원");
    $("#platePrice").html(commaSplit($platePrice) + "원");
    $("#movePrice").html(commaSplit($movePrice) + "원");
    */
    $("#stampPrice1").val(SetComma(DelComma($("#stampPrice1").val())));
    $("#stampPrice2").val(SetComma(DelComma($("#stampPrice2").val())));
    $("#qualityInsuPrice").val(SetComma(DelComma($("#qualityInsuPrice").val())));
    $("#platePrice").val(SetComma(DelComma($("#platePrice").val())));
    $("#moveFeePrice").val(SetComma(DelComma($("#moveFeePrice").val())));
    $("#dealerFeePrice").val(SetComma(DelComma($("#dealerFeePrice").val())));

    //$("#sumPrice2").html(commaSplit($sumPrice) + "원");

    $("#totalPrice").html(commaSplit($totalPrice) + "원");
}
	$(function() {
		calTotPurcCost();
	});

	function toggleMovePrice(){
		$('.fuc_toggle').toggleClass('open');
		$('.fuc_wrap').slideToggle();
	}

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

</SCRIPT>
<div id="header" class="row header fixed tab">
    <!-- titlebar -->
    <div class="column titlebar no-padding">
        <div id="logo" class="titlebar-center">
            <a href="#" title="비용계산기">비용계산기</a>
        </div>
        <div class="titlebar-right">
            <button class="menu-icon icon-close" type="button" onClick="selfclose();"></button>
        </div>
    </div>
    <!-- //titlebar -->
    <!-- sub navigation -->
    <div class="column sub-nav">
        <ul>
            <li class="active"><a href="/car/calc/total.do?c_no=${carViewVO.currRecord.cNo}" title="총 구매비용">총 구매비용</a></li>
            <li><a href="/car/calc/month.do?c_no=${carViewVO.currRecord.cNo}" title="할부계산">할부계산</a></li>
            <li><a href="/car/calc/tax.do?c_no=${carViewVO.currRecord.cNo}" title="자동차세">자동차세</a></li>
        </ul>
    </div>
    <!-- //sub navigation -->
</div>
<!-- //header -->
<!-- container -->
<div class="container">
    <div class="row calc-area">
        <div class="menu-list column padd0">
            <ul class="article-list default-list">
                <li><span class="article-name">차량가격</span>
                    <span class="right"><input name="salePrice" id="salePrice" value="${CommonUtil.numberFormat(salePrice/10000,0)}" type="text" style="width: 70px"> 만원
                        <button type="button" class="button" onclick="calTotPurcCost();">적용</button></span>
                    <div class="ex-text" style="text-align: right;">판매가격 변경 후 적용 버튼 클릭 시 해당 결과 확인가능</div></li>
                <li><span class="article-name">거주지 선택</span> <span class="right"> <select name="position" id="position" style="width: 240px;" onChange="calTotPurcCost();">
                            <option value="1">서울/인천/대전/부산</option>
                            <option value="2">기타지역</option>
                    </select>
                </span></li>
                <li><span class="article-name">이전등록비용 총합</span> <span class="right" id="sumPrice">-</span>
                    <button type="button" class="btn_toggle fuc_toggle" onclick="toggleMovePrice();">비용 내역</button>
                    <table border="0" cellpadding="0" cellspacing="0" class="t_normal fuc_wrap">
                        <colgroup>
                            <col style="width: 110px;">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th class="color">취등록세 <div class="tip"><span>?</span><i>승용:7%, 승합:5%, 영업:4%</i></div></th>
                                <td>( <select name="regRate" id="regRate" style="width: 70px;" onChange="calTotPurcCost();">
                                        <option value="7">7%</option>
                                        <option value="5">5%</option>
                                        <option value="4">4%</option>
                                </select> ) <span id="taxPrice" style="font-weight: bold;">695,000 원</span>
                                </td>
                            </tr>
                            <tr>
                                <th class="color">공채매입비 <div class="tip"><span>?</span><i>지하철:1.62%, 기타지역:1.08%<br>할인율은 세율 기준이며, 지역마다 일별로도 차이가 있습니다.</i></div></th>
                                <td id="chePrice">225,180 원</td>
                            </tr>
                            <tr>
                                <th class="color">증지대</th>
                                <td><input name="stampPrice1" id="stampPrice1" value="3,000" type="text" style="width: 120px;" onKeyUp="calTotPurcCost();"> 원</td>
                            </tr>
                            <tr>
                                <th class="color">인지대</th>
                                <td><input name="stampPrice2" id="stampPrice2" value="1,000" type="text" style="width: 120px;" onKeyUp="calTotPurcCost();"> 원</td>
                            </tr>
                            <tr>
                                <th class="color">성능보험료</th>
                                <td><input name="qualityInsuPrice" id="qualityInsuPrice" value="0" type="text" style="width: 120px;" onKeyUp="calTotPurcCost();"> 원</td>
                            </tr>
                            <tr>
                                <th class="color">번호판 교체비<br>(부대비용포함)</th>
                                <td><input name="platePrice" id="platePrice" value="40,000" type="text" style="width: 120px;" onKeyUp="calTotPurcCost();"> 원</td>
                            </tr>
                            <tr>
                                <th class="color">이전등록대행</th>
                                <td><input name="moveFeePrice" id="moveFeePrice" value="0" type="text" style="width: 120px;" onKeyUp="calTotPurcCost();"> 원</td>
                            </tr>
                        </tbody>
                    </table></li>
                <li><span class="article-name" style="white-space:nowrap">딜러수수료</span> <span class="right"><input name="dealerFeePrice" id="dealerFeePrice" value="0" type="text" onKeyUp="calTotPurcCost();">원</span></li>
                <li class="total"><span class="article-name">총 구입비용</span> <span class="right" id="totalPrice">19,020,100원</span></li>
            </ul>
        </div>
        <!-- //detail list -->
    </div>
    <div class="row ex-box bg">
        <div class="column">
            <ul>
                <li>위 금액은 참고자료로 계산결과는 실제 구매비용과 다소 차이가 있을 수 있습니다.</li>
                <li>정확한 금액은 해당 지역 차량 등록과에 문의하세요.</li>
                <li>실제 거래신고 금액이 과세표준금액보다 많으면 이전 등록비가 상승할 수 있습니다.</li>
                <li>실제 이전등록비는 5만원 가량의 여유금액을 준비하는 것이 좋습니다.</li>
                <li>공채할인율은 등록지역마다 편차가 존재하며, 동일지역도 일 기준으로 변동될 수 있습니다.</li>
            </ul>
        </div>
    </div>
</div>
<!-- //container -->

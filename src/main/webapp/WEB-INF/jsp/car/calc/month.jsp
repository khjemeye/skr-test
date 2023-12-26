<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.autofield.web.CommonUtil" %>
<%@ include file="/include/taglib_prefix.jsp"%>
<!-- header -->
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
			<li>
				<a href="/car/calc/total.do?c_no=${carViewVO.currRecord.cNo}" title="총 구매비용">총 구매비용</a>
			</li>
			<li class="active">
				<a href="/car/calc/month.do?c_no=${carViewVO.currRecord.cNo}" title="할부계산">할부계산</a>
			</li>
			<li>
				<a href="/car/calc/tax.do?c_no=${carViewVO.currRecord.cNo}" title="자동차세">자동차세</a>
			</li>
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
				<li>
					<span class="article-name">차량가격</span>
					<span class="right"><input name="salePrice" id="salePrice" value="${CommonUtil.numberFormat(salePrice/10000, 0)}" type="text" style="width:70px"> 만원 <button type="button" class="button" onclick="cal();">적용</button></span>
                    <div class="ex-text" style="text-align:right;">판매가격 변경 후 적용 버튼 클릭 시 해당 결과 확인가능</div>
				</li>
				<li id="iza" class="slider-item">
					<span class="article-name">할부이자율 <button type="button" class="btn-mini" onclick="removeReadOnly('iza');">직접입력</button></span>
					<span class="right"><input type="number" min="0" value="7.5"  readonly>%</span>
					<div class="slider-area"></div>
				</li>
				<li id="own" class="slider-item">
					<span class="article-name">보유금액 <button type="button" class="btn-mini" onclick="removeReadOnly('own');">직접입력</button></span>
					<span class="right"><input type="number" min="0" value="1000"  readonly>만원</span>
					<div class="slider-area"></div>
				</li>
				<li id="pariod" class="slider-item">
					<span class="article-name">할부기간 <button type="button" class="btn-mini" onclick="removeReadOnly('pariod');">직접입력</button></span>
					<span class="right"><input type="number" min="0" value="36" readonly>개월</span>
					<div class="slider-area"></div>
				</li>
				<li class="total">
					<span class="article-name">총 할부금</span>
					<span id="installPrice" class="right">-</span>
				</li>
				<li class="total">
					<span class="article-name">월 할부금</span>
					<span id="monthPrice" class="right">-</span>
				</li>
			</ul>

		</div>
		<!-- //detail list -->
	</div>

	<div class="row ex-box bg">
		<div class="column">
			<ul>
				<li>
				    대출시 이용 또는 할부차량의 경우 대략적인 금액을 확인 하실 수 있습니다.
				</li>
				<li>
					위 자료는 참고 자료이며, 정확한 금액은 금융기관으로  문의하세요.
				</li>
			</ul>
		</div>
	</div>

</div>
<!-- //container -->

<script>
function removeReadOnly(id){
	jQuery("#" + id + " input").attr("readonly", false);
}

function cal() {
	var $carPrice = DelComma($("#salePrice").val()) * 10000;
	var $installSelect = $("#pariod input").val();
	var $installRate = $("#iza input").val();

	var $ownPrice = $("#own input").val() * 10000;
	var $sourcePrice = $carPrice - $ownPrice;
	var $susuPrice = (Math.round($sourcePrice * $installRate / 100));

	var $realInstallPrice = Math.round(($sourcePrice * (($installRate * 0.01)/12)) * (Math.pow((1+ ($installRate * 0.01)/12), $installSelect ))/(Math.pow((1+($installRate * 0.01)/12), $installSelect)-1));
	var $realSusuPrice = Math.round(((($sourcePrice * (($installRate * 0.01)/12)) * (Math.pow((1+($installRate * 0.01)/12), $installSelect ))/(Math.pow((1+($installRate * 0.01)/12), $installSelect)-1)) *$installSelect ) - $sourcePrice);

	var $installPrice = $sourcePrice + $realSusuPrice;

	$("#installPrice").html(commaSplit($installPrice));

	var $monthPrice = Math.round($installPrice / $installSelect);
	var $monthPriceStr = commaSplit($monthPrice);

	$("#monthPrice").html($monthPriceStr + "원");
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

$(document).ready(function() {

  // 이자율
  $('#iza .slider-area').slider({
	range: "min",
	value: 7,
	min: 1,
	max: 100,
      slide: function( event, ui ) {
        $( "#iza .right input" ).val( ui.value);
	    cal();
      }
    });

	// 보유금액
	$('#own .slider-area').slider({
	range: "min",
	value: ${salePrice /100000},
	min: 10,
	max: ${salePrice/10000},
      slide: function( event, ui ) {
        $( "#own .right input" ).val( ui.value);
        cal();
      }
    });

	// 할부기간
	$('#pariod .slider-area').slider({
	range: "min",
	value: 36,
	min: 1,
	max: 64,
      slide: function( event, ui ) {
        $( "#pariod .right input" ).val( ui.value);
	    cal();
      }
    });

    $( "#iza .right input" ).val($( "#iza .slider-area" ).slider( "value" ));
	$( "#own .right input" ).val($( "#own .slider-area" ).slider( "value" ));
	$( "#pariod .right input" ).val($( "#pariod .slider-area" ).slider( "value" ));

	cal();

	$("#iza input").change(function(){
		cal();
	});

	$("#own input").change(function(){
		$("#ownPrice").val(this.value);
		cal();
	});

	$("#pariod input").change(function(){
		cal();
	});

});
</script>

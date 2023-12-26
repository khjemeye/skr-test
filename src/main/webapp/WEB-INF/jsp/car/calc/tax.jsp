<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
			<li>
				<a href="/car/calc/month.do?c_no=${carViewVO.currRecord.cNo}" title="할부계산">할부계산</a>
			</li>
			<li class="active">
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
					<span class="article-name">자동차 구분</span>
					<span class="right">
					<select name="carGubun" onchange="carGubunChange(this.value);" style="width:150px;">
							<option value="1">일반승용차</option>
							<option value="2">승합차/버스</option>
							<option value="3">화물/특장자동차</option>
						</select></span>
				</li>
				<li class="fuc_case2">
					<span class="article-name">용도</span>
					<span class="right"><input name="yong" id="yong[1]" type="radio" value="N"  onclick="cal()" checked><label for="yong[1]">비영업용</label>
						<input name="yong" id="yong[2]" type="radio" value="Y" onclick="cal()"><label for="yong[2]">영업용</label></span>
				</li>
				<li id="own" class="fuc_case2">
					<span class="article-name">등록구분</span>
					<span class="right">
						<input name="makeM" id="makeM[0]" type="radio" value="1" onclick="cal()" checked=""><label for="makeM[0]" class="block">1/1 ~ 6/30 등록차량</label>
						<input name="makeM" id="makeM[1]" type="radio" value="2" onclick="cal()"><label for="makeM[1]" class="block">7/1 ~ 12/31 등록차량</label>
					</span>
				</li>
				<li class="fuc_case2">
					<span class="article-name">연식</span>
					<span class="right">
						<select name="prod_year" id="prod_year" style="width:100px;"></select>
					</span>
				</li>
				<li class="fuc_case2">
					<span class="article-name">배기량</span>
					<span class="right"><input type="number" id="baegi" name="baegi" value="${carViewVO.currRecord.cDisplacement}"> cc</span>
				</li>
				<li class="fuc_case2">
					<span class="article-name">일할여부 계산</span>
					<span class="right">
						<input name="percent" id="percent1" type="radio" value="Y" checked=""><label for="percent1">예</label>
						<input name="percent" id="percent2" type="radio" value="N"><label for="percent2">아니오</label>
					</span>
				</li>

				<li class="fuc_case2 percentResultLayer">
					<input type="hidden" id="moveDate"/>
					<span class="article-name">차량양도일</span>
					<span class="right">
					<span class="date_picker" id="move_date" onclick="showLayerPopup('pop-year');">선택</span>
				</span>
				</li>
				<li class="fuc_case2 percentResultLayer">
					<span class="article-name">양도/양수인</span>
					<span class="right">
					<input name="agent" id="agent1" type="radio" value="Y" onclick="cal();"><label for="agent1">양도인</label>
					<input name="agent" id="agent2" type="radio" value="N" checked="" onclick="cal();"><label for="agent2">양수인</label>
				</span>
				</li>

			</ul>
			<div class="button-group fuc_case2">
				<button type="button" class="button color-blackdark" onClick="cal()">계산하기</button>
			</div>


		</div>
		<!-- //detail list -->
	</div>
	<div class="row" id="bigLayer_1">
		<div class="column">
			<h4 class="title">계산결과</h4>
			<div class="ex-text" id="resultComment">(과세년도 : ${nowYear}년 / cc당 세액 : - 원)</div>
			<table border="0" cellpadding="0" cellspacing="0" class="t_normal calc">
				<tbody>
				<tr>
					<th>자동차세</th>
					<th>교육세</th>
					<th>차령</th>
					<th>경감율</th>
				</tr>
				<tr>
					<th colspan="4" class="cal_th">1년분</th>
				</tr>
				<tr>
					<td><strong id="yearCarTaxPrice">-</strong>원</td>
					<td><strong id="yearEduTaxPrice">-</strong>원</td>
					<td><strong id="yearCarOld">-</strong> 년</td>
					<td><strong id="yearPercent">-</strong> %</td>
				</tr>
				<tr>
					<td>합계</td>
					<td colspan="3" class="text-price"><strong id="yearTotalPrice">-</strong> 원</td>
				</tr>
				<tr>
					<th colspan="4" class="cal_th">1기분 (6월)</th>
				</tr>
				<tr>
					<td><strong id="yearCarTaxPrice1">-</strong>원</td>
					<td><strong id="yearEduTaxPrice1">-</strong>원</td>
					<td><strong id="yearCarOld1">-</strong> 년</td>
					<td><strong id="yearPercent1">-</strong> %</td>
				</tr>
				<tr>
					<td>합계</td>
					<td colspan="3" class="text-price"><strong id="yearTotalPrice1">-</strong> 원</td>
				</tr>
				<tr>
					<th colspan="4" class="cal_th">2기분 (12월)</th>
				</tr>
				<tr>
					<td><strong id="yearCarTaxPrice2">-</strong>원</td>
					<td><strong id="yearEduTaxPrice2">-</strong>원</td>
					<td><strong id="yearCarOld2">-</strong> 년</td>
					<td><strong id="yearPercent2">-</strong> %</td>
				</tr>
				<tr>
					<td>합계</td>
					<td colspan="3" class="text-price"><strong id="yearTotalPrice2">-</strong> 원</td>
				</tr>
				<tr class="percentResultLayer">
					<th colspan="4" class="cal_th" id="detailMent">일할계산 ( 자동차 보유일 수 : )</th>
				</tr>
				<tr class="percentResultLayer">
					<td><strong id="yearCarTaxPriceDay">-</strong>원</td>
					<td><strong id="yearEduTaxPriceDay">-</strong>원</td>
					<td><strong id="yearCarOldDay">-</strong> 년</td>
					<td><strong id="yearPercentDay">-</strong> %</td>
				</tr>
				<tr class="percentResultLayer">
					<td>합계</td>
					<td colspan="3" class="text-price"><strong id="yearTotalPriceDay">-</strong> 원</td>
				</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="row" id="bigLayer_2" style="display:none;">
		<div class="column">
			<h4 class="title">1년분 자동차세</h4>
			<table border="0" cellpadding="0" cellspacing="0" class="t_normal">
				<tbody>
				<tr>
					<th class="t">구분</th>
					<th class="t">영업용</th>
					<th class="t">비영업용</th>
				</tr>
				<tr>
					<td align="center">고속버스</td>
					<td align="center">100,000원</td>
					<td align="center">-</td>
				</tr>
				<tr>
					<td align="center">대형전세버스</td>
					<td align="center">70,000원</td>
					<td align="center">-</td>
				</tr>
				<tr>
					<td align="center">소형전세버스</td>
					<td align="center">50,000원</td>
					<td align="center">-</td>
				</tr>
				<tr>
					<td align="center">대형일반버스</td>
					<td align="center">42,000원</td>
					<td align="center">115,000원</td>
				</tr>
				<tr>
					<td align="center">소형일반버스</td>
					<td align="center">25,000원</td>
					<td align="center">65,000원</td>
				</tr>
				</tbody>
			</table>
			<div class="txt_info error">단, 10인승 이하의 승합차는 일반승용차의 세율이 적용됩니다.</div>
			<br>
		</div>
	</div>
	<div class="row" id="bigLayer_3" style="display:none;">
		<div class="column">
			<h4 class="title">화물차 1년분 자동차세</h4>
			<table border="0" cellpadding="0" cellspacing="0" class="t_normal">
				<tbody>
				<tr>
					<th class="t">구분</th>
					<th class="t">영업용</th>
					<th class="t">비영업용</th>
				</tr>
				<tr>
					<td align="center">1톤 이하</td>
					<td align="center">6,600원</td>
					<td align="center">28,500원</td>
				</tr>
				<tr>
					<td align="center">2톤 이하</td>
					<td align="center">9,600원</td>
					<td align="center">34,500원</td>
				</tr>
				<tr>
					<td align="center">3톤 이하</td>
					<td align="center">13,500원</td>
					<td align="center">48,000원</td>
				</tr>
				<tr>
					<td align="center">4톤 이하</td>
					<td align="center">18,000원</td>
					<td align="center">63,000원</td>
				</tr>
				<tr>
					<td align="center">5톤 이하</td>
					<td align="center">22,500원</td>
					<td align="center">79,500원</td>
				</tr>
				<tr>
					<td align="center">8톤 이하</td>
					<td align="center">36,000원</td>
					<td align="center">130,000원</td>
				</tr>
				<tr>
					<td align="center">10톤 이하</td>
					<td align="center">45,000원</td>
					<td align="center">157,500원</td>
				</tr>
				</tbody>
			</table>
			<h4 class="title">특장차 1년분 자동차세</h4>
			<table border="0" cellpadding="0" cellspacing="0" class="t_normal">
				<tbody>
				<tr>
					<th class="t">구분</th>
					<th class="t">영업용</th>
					<th class="t">비영업용</th>
				</tr>
				<tr>
					<td align="center">4톤 초과 (대형)</td>
					<td align="center">36,000원</td>
					<td align="center">157,500원</td>
				</tr>
				<tr>
					<td align="center">4톤 이하 (소형)</td>
					<td align="center">13,500원</td>
					<td align="center">58,500원</td>
				</tr>
				</tbody>
			</table>
		</div>
	</div>

	<div class="row ex-box bg">
		<div class="column">
			<ul>
				<li>
					위 금액은 참고 자료이므로 정확한 금액은 해당지역 세무담당 부서에 문의 하세요.
				</li>
			</ul>
		</div>
	</div>

</div>
<!-- //container -->

<!-- 년월 선택 -->
<div class="modal-popup ty02 pop-year">
	<div class="pop-content padd0">
		<div class="js-inline-picker">2048-10</div>
		<script>
			<!--
			new Picker(document.querySelector('.js-inline-picker'), {
				controls: false,
				inline: true,
				format: 'YYYY, MM, DD',
				date: '2019, 10',
				headers: true,
				text: {
					year: '년',
					month: '월',
					day: '일',
				},
			});
			//-->
		</script>
		<div class="button-group col2-square row">
			<button type="button" class="button color-black" onClick="closeMoveDatePopup()">취소</button>
			<button type="button" class="button color-red" onClick="setMoveDate()">선택</button>
		</div>
	</div>
</div>
<!-- //년월 선택 -->

<script>
function carGubunChange(no) {
	if(no == 1) {
		$("#bigLayer_2, #bigLayer_3").hide();
		$("#bigLayer_1, .fuc_case2").show();
	}
	if(no == 2) {
		$("#bigLayer_1, #bigLayer_3, .fuc_case2").hide();
		$("#bigLayer_2").show();
	}
	if(no == 3) {
		$("#bigLayer_2, #bigLayer_1, .fuc_case2").hide();
		$("#bigLayer_3").show();
	}
}

function initRegMonth(){
	<c:if test="${not empty carViewVO.currRecord.cFirstdate}">
	var prodDate = '${carViewVO.currRecord.cFirstdate}';
	var makeMonthVal = (prodDate.substring(5,7) * 1) <= 6 ? 1 : 2;
	$('input:radio[name=makeM]:input[value=' + makeMonthVal + ']').attr("checked", true);
	</c:if>
}

function initProdYear(){
	var data = [];
	var year = ${nowYear};

	for(var i=year; i>=1991; i--){
		data.push(i);
	}

	jQuery.each(data, function(i, obj){
		var selected = "";

		<c:if test="${not empty carViewVO.currRecord.cYear}">
		if($("#prod_year").val()){
			if(obj == ${carViewVO.currRecord.cYear}){
				selected = "selected='selected'";
			}
		}
		</c:if>

		$("#prod_year").append('<option value="' + obj + '" ' + selected + '>' + obj + ' 년</option>');
	});
}

function cal() {
	var nowYear = ${nowYear};
	var nowMonth = ${nowMonth};

	var $nowM = (nowMonth <= 6) ? 1 : 2;
	var $pYear = $("#prod_year").val() - 0;
	var $baegi = $("#baegi").val() - 0;
	var $yong = $("[name=yong]:checked").val();
	var $makeM = $("[name=makeM]:checked").val() - 0;
	var $perBaegi = 0;

	if($yong == "Y") {
		if($baegi <= 1000) {
			$perBaegi = 18;
		} else if($baegi <= 1500) {
			$perBaegi = 18;
		} else if($baegi <= 2000) {
			$perBaegi = 19;
		} else if($baegi <= 2500) {
			$perBaegi = 19;
		} else {
			$perBaegi = 24;
		}
	} else {
		if($baegi <= 1000) {
			$perBaegi = 80;
		} else if($baegi <= 1600) {
			$perBaegi = 140;
		} else {
			$perBaegi = 200;
		}
	}

	var cardiff1 = nowYear - $pYear + 1;
	var cardiff2 = nowYear - $pYear + 1;
	if($makeM == 2) {
		cardiff1 -= 1;
	}

	var $perYear = 100;
	$mYear = ${nowYear} - $pYear;
	if($nowM == 2) {
		if($makeM == 2) {
			$mYear += 1;
		}
	}

	$perYear = checkYearPer($mYear);

	var carPer1 = checkYearPer(cardiff1);
	var carPer2 = checkYearPer(cardiff2);

	$mYear = cardiff1;
	$perYear = carPer1;

	var carTaxPrice1 = Math.round(($baegi * $perBaegi / 100) * carPer1 / 10 / 2) * 10;
	var carTaxPrice2 = Math.round(($baegi * $perBaegi / 100) * carPer2 / 10 / 2) * 10;

	var eduTaxPrice1 = Math.round(carTaxPrice1 / 100 * 30 / 10) * 10;
	var eduTaxPrice2 = Math.round(carTaxPrice2 / 100 * 30 / 10) * 10;

	var totalTaxPrice1 = carTaxPrice1 + eduTaxPrice1;
	var totalTaxPrice2 = carTaxPrice2 + eduTaxPrice2;

	/*
	var $carTaxPrice = Math.round($baegi * $perBaegi / 100 * $perYear / 10) * 10;
	var $eduTaxPrice = Math.round($carTaxPrice / 100 * 30 / 10) * 10;
	var $totalTaxPrice = $carTaxPrice + $eduTaxPrice;
	*/
	var carTaxPrice = carTaxPrice1 + carTaxPrice2;
	var eduTaxPrice = eduTaxPrice1 + eduTaxPrice2;
	var totalTaxPrice = totalTaxPrice1 + totalTaxPrice2;

	//console.log(carPer1 + " " + carPer2);


	$("#resultComment").html("(과세년도 : ${nowYear}년 / cc당 세액 : " + $perBaegi + "원)");

	$("#yearTotalPrice").html(commaSplit(totalTaxPrice));
	$("#yearCarTaxPrice").html(commaSplit(carTaxPrice));
	$("#yearEduTaxPrice").html(commaSplit(eduTaxPrice));
	$("#yearCarOld").html($mYear);
	$("#yearPercent").html($perYear);

	$("#yearTotalPrice1").html(commaSplit(totalTaxPrice1));
	$("#yearCarTaxPrice1").html(commaSplit(carTaxPrice1));
	$("#yearEduTaxPrice1").html(commaSplit(eduTaxPrice1));
	$("#yearCarOld1").html(cardiff1);
	$("#yearPercent1").html(carPer1);

	$("#yearTotalPrice2").html(commaSplit(totalTaxPrice2));
	$("#yearCarTaxPrice2").html(commaSplit(carTaxPrice2));
	$("#yearEduTaxPrice2").html(commaSplit(eduTaxPrice2));
	$("#yearCarOld2").html(cardiff2);
	$("#yearPercent2").html(carPer2);

	if($("input[name='percent']:checked").val() === 'Y') { // 일할계산여부
		var moveDate = $("#moveDate").val();

		if(!moveDate){
			moveDate = getNowDateText();
		}

		var stdSDate = "";
		var stdEDate = "";

		if($makeM == 1){
			stdSDate = nowYear + "-01-01";
			stdEDate = nowYear + "-06-30";
		}else {
			stdSDate = nowYear + "-07-01";
			stdEDate = nowYear + "-12-31";
		}

		var dayCount = 0;
		var sellerFlag = $("[name=agent]:checked").val();

		if(sellerFlag === 'Y'){ // 양도인
			dayCount = diffDateFormat(stdSDate, moveDate);
		} else { // 양수인
			dayCount = diffDateFormat(moveDate, stdEDate);
		}

		$("#detailMent").text("일할계산 ( 자동차 보유일 수 : " + dayCount + "일 )");

		var carTaxPriceDay = Math.round(totalTaxPrice * dayCount / 365 / 10) * 10;
		var eduTaxPriceDay = Math.round(carTaxPriceDay * 0.3 / 10) * 10;
		var totalTaxPriceDay = carTaxPriceDay + eduTaxPriceDay;

		$("#yearTotalPriceDay").html(commaSplit(totalTaxPriceDay));
		$("#yearCarTaxPriceDay").html(commaSplit(carTaxPriceDay));
		$("#yearEduTaxPriceDay").html(commaSplit(eduTaxPriceDay));
		$("#yearCarOldDay").html(cardiff2);
		$("#yearPercentDay").html(carPer2);
	}
}

function checkYearPer($mYear) {
	var $perYear = 100;
	if($mYear < 3) {
		$perYear = 100;
	} else if($mYear == 3) {
		$perYear = 95;
	} else if($mYear == 4) {
		$perYear = 90;
	} else if($mYear == 5) {
		$perYear = 85;
	} else if($mYear == 6) {
		$perYear = 80;
	} else if($mYear == 7) {
		$perYear = 75;
	} else if($mYear == 8) {
		$perYear = 70;
	} else if($mYear == 9) {
		$perYear = 65;
	} else if($mYear == 10) {
		$perYear = 60;
	} else if($mYear == 11) {
		$perYear = 55;
	} else if($mYear >= 12) {
		$perYear = 50;
	}
	return $perYear;
}

function diffDateFormat(str1, str2) {
	var d1 = new Date(str1);
	var d2 = new Date(str2);

	return Math.floor(d2.valueOf()/(24*60*60*1000) - d1.valueOf()/(24*60*60*1000));
}

function closeMoveDatePopup() {
	closeLayerPopup();
}

function getNowDateText() {
	var currentDate = new Date();

	// year
	var yyyy = '' + currentDate.getFullYear();

	// month
	var mm = ('0' + (currentDate.getMonth() + 1));
	mm = mm.substr(mm.length - 2);

	// day
	var dd = ('0' + currentDate.getDate());
	dd = dd.substr(dd.length - 2);

	return yyyy + "-" + mm + "-" + dd;
}

function setMoveDate() {
	var year = $(".picker-years .picker-list .picker-item.picker-picked").text();
	var month = $(".picker-months .picker-list .picker-item.picker-picked").text();
	var day = $(".picker-days .picker-list .picker-item.picker-picked").text();

	var date = year + "-" + month + "-" + day;
	$("#moveDate").val(date);
	$("#move_date").text(date);

	closeLayerPopup();
	cal();
}

$(function() {
	// var detailFlag = $("[name=percent]:checked").val();
	// if(detailFlag == 1) {
	// 	$(".detailResultLayer").show();
	// } else {
	// 	$(".detailResultLayer").hide();
	// }

	$('input[name="percent"]').change(function(){
		if($("input[name='percent']:checked").val() === 'Y'){
			$(".percentResultLayer").show();
		}else{
			$(".percentResultLayer").hide();
		}

		cal();
	});

	$("#moveDate").val(getNowDateText());
	$("#move_date").text(getNowDateText());

	initRegMonth();
	initProdYear();
	cal();
});
</script>

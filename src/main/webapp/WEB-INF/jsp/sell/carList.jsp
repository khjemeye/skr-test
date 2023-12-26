<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include/taglib_prefix.jsp"%>
<%@ include file="/include/top.jsp"%>
<%@ include file="/include/headerMenu.jsp"%>

<script src="/js/src/react.min.js"></script>
<script src="/js/src/react-dom.min.js"></script>

<!-- header -->
<div id="header" class="row header fixed">

    <!-- titlebar -->
    <div class="column titlebar no-padding">
        <div class="titlebar-left">
            <button class="menu-icon" type="button" onClick="winback();"></button>
        </div>
        <div id="logo" class="titlebar-center">
            <a href="#" title="내차팔기">내차팔기</a>
        </div>
        <div class="titlebar-right">
            <button class="menu-icon hamburger" type="button" onClick="openNav();"></button>
        </div>
    </div>
    <!-- //titlebar -->

</div>
<!-- //header -->

<!-- container -->
<div class="container">
    <div class="row mycarsell-title">
        <div class="column">
            <div class="title_wrap">
                <span class="h2_txt">소중한 고객님의 차량을 차량번호만으로 부산오토필드에서 최고가격으로 판매하세요.</span>
            </div>
            <div class="search">
                <!-- 검색폼 -->
                <input type="text" id="carNum" placeholder="차량번호 입력">
                <div>
                    <input type="number" id="carKm" name="carKm" placeholder="주행거리 입력" style="margin-right:8px;"> km
                </div>
				<div>
                    <input type="number" id="maPhone" name="maPhone" placeholder="‘-’없이 연락처 번호만 입력" maxlength="11" oninput="removeAlphabet(this); numberMaxLength(this);">
                    <button type="button" class="button color-black" onclick="requestAuthCode();">인증하기</button>
                </div>
                <div>
                    <input type="number" id="maKey" name="maKey" placeholder="인증번호">
                </div>
				<div>
                    <input type="password" id="maPw" name="maPw" placeholder="비밀번호">
                </div>
                <!-- //검색폼 -->
            </div>
            <button type="button" class="button full" onclick="searchCarInfo();">내차팔기</button>
        </div>
    </div>

    <div class="step2-wrap" style="display:none;">
        <div class="divide"></div>
        <div class="title_wrap">
            <h2 class="title-icon-sell1">내차정보 확인</h2>
            <div class="h2_txt">※ 내차팔기 신청은 1개월 ${maxRequestCount}번까지만 신청가능합니다.</div>
        </div>
        <div class="row">
            <div class="column">
                <input type="hidden" id="conStatusCd" name="conStatusCd" value="INPUT" />
                <input type="hidden" id="conCarname" name="conCarname" />
                <input type="hidden" id="conKm" name="conKm" />
                <input type="hidden" id="conCarnum" name="conCarnum" />
                <input type="hidden" id="conBmNo" name="conBmNo" />
                <input type="hidden" id="conBoNo" name="conBoNo" />
                <input type="hidden" id="conBsNo" name="conBsNo" />

                <input type="hidden" id="conBdNo" name="conBdNo" />
                <input type="hidden" id="conFirstdate" name="conFirstdate" />
                <input type="hidden" id="conYear" name="conYear" />
                <input type="hidden" id="conBcNo" name="conBcNo" />
                <input type="hidden" id="conFuel" name="conFuel" />

                <input type="hidden" id="conHp" name="conHp" />
                <input type="hidden" id="conArea" name="conArea" />
                <input type="hidden" id="conGugun" name="conGugun" />
                <input type="hidden" id="conMemo" name="conMemo" />
                <input type="hidden" id="conAbNo" name="conAbNo" />

                <table border="0" cellpadding="0" cellspacing="0" class="t_normal">
                    <colgroup>
                        <col style="width:90px;">
                        <col>
                    </colgroup>
                    <tbody>
                        <tr>
                            <th class="color">차량명</th>
                            <td id="sellCarName"></td>
                        </tr>
                        <tr>
                            <th class="color">연식</th>
                            <td id="sellCarProdDate"></td>
                        </tr>
                        <tr>
                            <th class="color">색상</th>
                            <td id="sellCarColor"></td>
                        </tr>
                        <tr>
                            <th class="color">연료</th>
                            <td id="sellCarFuel"></td>
                        </tr>
                    </tbody>
                </table>
                <dl class="agreeChk">
                    <dt class="title">
                        <i class="formWrap">
                            <input type="checkbox" id="chkAll">
                            <label for="chkAll"><strong>전체동의</strong></label>
                        </i>
                    </dt>
                    <dd>
                        <input type="checkbox" id="chk2">
                        <label for="chk2">개인정보 수집 및 이용에 동의합니다. <u class="basic_txt">(필수)</u></label>
                        <a href="javascript:openPopup('agree', 2);" class="btn_link">약관보기</a>
                        <input type="checkbox" id="chk1">
                        <label for="chk1">개인정보 제3자 정보제공에 동의합니다 <u class="basic_txt">(필수)</u></label>
                        <a href="javascript:openPopup('agree', 3);" class="btn_link">약관보기</a>
                    </dd>
                </dl>
            </div>
        </div>
        <div class="button-group">
            <button type="button" class="button color-red" onclick="requestSell();">내차팔기 신청</button>
        </div>
    </div>

    <div class="divide"></div>
    <div id="sellList"></div>

    <%@ include file="/include/footer.jsp"%>

    <button type="button" class="btn-top"><span>Top</span></button>
</div>
<!-- //container -->


<script>
$(document).ready(function() {
    //faq
    $(".sell_faq .q").click(function () {
        $(this).parent('li').toggleClass('active');
        $(this).parent('li').siblings().removeClass('active');
    });

    $("#chkAll").change(function(){
        $("#chk1").prop("checked", $("#chkAll").is(":checked"));
        $("#chk2").prop("checked", $("#chkAll").is(":checked"));
    });
});

function convertProdDate(year, firstDate){
    var prodDate = "";

    if(firstDate && firstDate.length == 10){
        prodDate = firstDate.substr(0, 4) + "년" + firstDate.substr(5, 2) + "월식";
    }

    if(year){
        prodDate = prodDate + "(" + year + "년형)";
    }

    return prodDate;
}

function requestAuthCode(){
    if(!validateMaCheckForm1()) {
        return;
    }

    jQuery.ajax({
        type: "GET",
        url: "/sell/insertOrUpdateMobileAuth.do" ,
        data: {
            carNum: $("#carNum").val(),
            maPhone: $("#maPhone").val()
        },
        dataType: "JSON",
        success: function(json){
            if(json.retStatus == 1){
                alert("[" + json.maPhone + "]으로 인증번호를 전송하였습니다.");

            }else if(json.message){
                alert(json.message);
            }
        },
        error:function(){
            alert( 'error' );
        }
    });
}

function searchCarInfo(){
    if(!validateMaCheckForm1()) {
        return;
    }
    if(!validateMaCheckForm2()) {
        return;
    }
    if(!validateMaCheckForm3()) {
        return;
    }

    jQuery.ajax({
        type: "GET",
        url: "/sell/selectUserCarInfoAjax.do",
        data: {
            carNum: $("#carNum").val(),
            maPhone: $("#maPhone").val(),
            maKey: $("#maKey").val()
        },
        dataType: "JSON",
        success: function(json){
            if(json.retStatus == 1){
                var abResult = json.AB_SERVICE.AB_RESULT;

                if(abResult != "OK" && abResult != "OW") {
                    alert(json.AB_SERVICE.AB_MSG);
                    return;
                }

                var abService = json.AB_SERVICE;

                /*
                if(abService.AB_CARNAME != null && abService.AB_CARNAME != "") {
                    $("#conCarname").val(abService.AB_CARNAME);
                    $("#sellCarName").text(abService.AB_REGNAME);
                } else {
                    $("#conCarname").val(abService.AB_REGNAME);
                    $("#sellCarName").text(abService.AB_REGNAME);
                }
                */
                // 2020-02-11 : 짧은이름만 사용
                $("#conCarname").val(abService.AB_REGNAME);
                $("#sellCarName").text(abService.AB_REGNAME);

                $("#sellCarColor").text(abService.AB_COLOR);
                $("#sellCarFuel").text("-");
                $("#sellCarProdDate").text(convertProdDate(abService.AB_YEAR, abService.AB_FIRSTDATE));

                $("#conBmNo").val(abService.AB_BM_NO);
                $("#conBoNo").val(abService.AB_BO_NO);
                $("#conBsNo").val(abService.AB_BS_NO);
                $("#conBdNo").val(abService.AB_BD_NO);
                $("#conFirstdate").val(abService.AB_FIRSTDATE);
                $("#conYear").val(abService.AB_YEAR);
                $("#conBcNo").val(abService.AB_BC_NO);
                $("#conAbNo").val(abService.AB_NO);
                $("#conCarnum").val($("#carNum").val());
                $("#conKm").val($("#carKm").val());
                $("#conHp").val($("#maPhone").val());
                $("#conArea").val(" ");
                $("#conGugun").val(" ");
                $("#conMemo").val(" ");
// 					$("#conFuel").val();

                step2();

            }else if(json.message){
                alert(json.message);

            }else{
                alert("조회된 차량이 없습니다.");
            }
        },
        error:function(){
            alert( 'error' );
        }
    });
}

function checkDigitOnly(digitChar) {
    if (digitChar == null) return false;
    for (var i = 0; i < digitChar.length; i++) {
        var c = digitChar.charCodeAt(i);
        if (!(0x30 <= c && c <= 0x39)) {
            return false;
        }
    }
    return true;
}

function validateMaCheckForm1() {
    /* 필수항목 값 입력검증 */
    var carNumObj = $("#carNum");
    if (carNumObj.val() == "") {
        alert("차량번호를 입력해주세요.");
        carNumObj.focus();
        return false;
    }
    
    var carKmObj = $("#carKm");
    if (carKmObj.val() == "") {
    	alert("주행거리를 입력해주세요.");
        carKmObj.focus();
        return false;
    }
    
    if(carNumObj.val().length < 7) {
        alert('차량번호를 정확히 입력해주세요.');
        return false;
    }

    if (carNumObj.val() == "") {
        alert("차량번호를 입력하세요.");
        return false;
    }

    var rightNum = carNumObj.val().substr(carNumObj.val().length - 4);
    if (!checkDigitOnly(rightNum)) {
        alert("차량정보를 찾을 수 없습니다.\n정확한 차량번호를 확인하신 후\n다시 시도해 주시기 바랍니다.");
        return false;
    }
    if (carNumObj.val().length < 7 || carNumObj.val().length > 9) {
        alert("차량정보를 찾을 수 없습니다.\n정확한 차량번호를 확인하신 후\n다시 시도해 주시기 바랍니다.");
        return false;
    }

    var maPhoneObj = $("#maPhone");
    if (maPhoneObj.val() == "") {
        alert("연락처를 입력해주세요.");
        maPhoneObj.focus();
        return false;
    }

    return true;
}

function validateMaCheckForm2() {
    var maKeyObj = $("#maKey");
    if (maKeyObj.val() == "") {
        alert("인증번호를 입력해주세요.");
        maKeyObj.focus();
        return false;
    }

    return true;
}

function validateMaCheckForm3() {
    var maKeyObj = $("#maPw");
    if (maKeyObj.val() == "") {
        alert("비밀번호를 입력해주세요.");
        maKeyObj.focus();
        return false;
    }
    if(maKeyObj.val().length < 4) {
    	alert("비밀번호를 4자 이상 입력해주세요.");
        maKeyObj.focus();
        return false;
    }

    return true;
}

function validateCarInfoForm() {
    /* 필수항목 값 입력검증 */
    if ($("input:checkbox[id='chk2']").is(":checked") == false) {
        alert("개인정보 수집 및 이용에 동의해 주세요.");
        return false;

    }
    if ($("input:checkbox[id='chk1']").is(":checked") == false) {
        alert("기본정보 제3자 정보제공에 동의해 주세요.");
        return false;
    }

    return true;
}

function requestSell(){
    if(!validateMaCheckForm1()) {
        return;
    }
    if(!validateMaCheckForm2()) {
        return;
    }
    if(!validateMaCheckForm3()) {
        return;
    }
    if(!validateCarInfoForm()) {
        return;
    }

    if(confirm("접수하시겠습니까?")){
        var data = {
            conAbNo: $("#conAbNo").val(),
            conBmNo: $("#conBmNo").val(),
            conBoNo: $("#conBoNo").val(),
            conBsNo: $("#conBsNo").val(),
            conBdNo: $("#conBdNo").val(),
            conBcNo: $("#conBcNo").val(),
            conCarnum: $("#conCarnum").val(),
            conKm: $("#conKm").val(),
            conYear: $("#conYear").val(),
            conCarname: $("#conCarname").val(),
            conFirstdate: $("#conFirstdate").val(),
            conFuel: $("#conFuel").val(),
            conStatusCd: $("#conStatusCd").val(),
            conHp: $("#conHp").val(),
            pw: $("#maPw").val(),
            conArea: $("#conArea").val(),
            conGugun: $("#conGugun").val(),
            conMemo: " "
        }

        jQuery.ajax({
            type: "POST",
            url: "/sell/insertConsultInfo.do",
            data: data,
            dataType: "JSON",
            success: function(json){
                if(json.message){
                    alert(json.message);
                }

                location.reload();
            },
            error:function(){
                alert( 'error' );
            }
        });
    }
}

//탭이동
function step2(){
    var winH = $('.mycarsell-title').outerHeight();
    $(".step2-wrap").fadeIn();
    $("html, body").animate({scrollTop: winH}, 200);
}
function removeAlphabet(object) {
    object.value = object.value.replace(/[^0-9]/g,"");
}

function removeSpecialChar(object){
    // 특수문자 정규식 변수(공백 미포함)
    var replaceChar = /[~!@\#$%^&*\()\-=+_'\;<>\/.\`:\"\\,\[\]?|{}]/gi;
    object.value = object.value.replace(replaceChar,"");
}

//number type input의 maxlength 체크
function numberMaxLength(object) {
    if (object.value.length > object.maxLength) {
        object.value = object.value.slice(0, object.maxLength);
    }
}
</script>

<script for="window" event="onload" src="/js/build/sell/SellList.js"></script>

<script>
var click_conNo = 0;
//비밀번호 열기
$(document).ready(function() { 
	$(document).on("click", ".qa-list li a", function() {
		$('.inputFormWrap').hide().empty(); // form 초기화
		var key = $(this).parents("li").attr("class");
		click_conNo = key.replace("liClass_", "") - 0;

		var $obj = $(this).next('.inputFormWrap');
		$obj.append("<input type='password' id='mySellPasswd' placeholder='비밀번호 입력'>");
		$obj.append("<button type='button' id='btnMySellPasswd' class='button color-green'>검색</button>");
		$obj.append("<div class='txt_info error' id='layerMySellPasswd' style='display:none;'>일치하는 비밀번호가 없습니다.</div>");
		$obj.append("<button type='button' class='btn-delete'>닫기</button>");
		$obj.fadeIn();
		$("#mySellPasswd").focus();
	});
	$(document).on("click", '.qa-list li .inputFormWrap .btn-delete', function() {
		$(this).parents('.inputFormWrap').hide();
		click_conNo = 0;
	});
	
	$(document).on("click", "#btnMySellPasswd", function() {
		var conNo = click_conNo;
		var pw = $("#mySellPasswd").val();
		if(pw.length < 4) {
			alert("비밀번호를 정확히 입력하세요.");
			return;
		}
		
		var data = { "conNo" : conNo, "pw" : pw }; // queryString 형태로 보내면 400 Error 
		commonAjax(data , "/sell/checkPw.do" , callback = function(returnData) {
			if(returnData.success == true) {
				//resetContents();
				$("#layerMySellPasswd").hide();
				location.href = "consultView.do";
			} else {
				$("#layerMySellPasswd").show();
			}

		}, true );	
		
	});
});

</script>
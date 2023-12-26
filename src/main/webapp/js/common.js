// 매물리스트 > 판매자 정보 오픈
function showDealerInfo($this){

  var dealer = $this.parents('.content-inner').parent().find('.content-meta');
  if(dealer.hasClass('on')){
    dealer.slideDown('slow');
  }else{
    dealer.slideUp('slow');
  }
  dealer.toggleClass('on');
}

/* 팝업띄움 */
var old_appScrollPos = -1;
function showLayerPopup(num) {
	old_appScrollPos = $(window).scrollTop();

	$('body').append("<div class='block-ui'></div>");
	$('.block-ui').fadeIn(200);
	$('.'+ num).fadeIn(200);
	$('html, body').css({'overflow': 'hidden', 'height': '100%'});
	$('.block-ui').on('scroll touchmove mousewheel', function(e) {
		e.preventDefault();
		e.stopPropagation();
		return false;
	});
	$('.block-ui').click(function(){
		closeLayerPopup();
	});
}
function closeLayerPopup() {
	$('.block-ui').fadeOut(200).remove();
	$('.modal-popup').fadeOut(200);
	$('html, body').css({'overflow': '', 'height': ''});
	$('.block-ui').off('scroll touchmove mousewheel');

	if(old_appScrollPos >= 0) $(window).scrollTop(old_appScrollPos);
	old_appScrollPos = -1;
}

function selfclose() {
    if(isMobile()){
        location.href = "close:";
    }else{
	window.close();
}
}

function winback(){
	if(isMobile()){
		location.href = "back:";
	}else{
	window.history.back();
}
}

/* footer 정보 */
	function footerinfo(){
		$('.footer_wrap .info').slideToggle();
		$('.footer_wrap .footer_toggle').toggleClass("on");
	}

/*****************************************************************************/

$(document).ready(function() {

	$('title').text('부산오토필드 모바일홈페이지');

	/* 탭제어 */
	/*
	if($('.fuc_tab').length >= 1){
		$(".fuc_tab li:first").addClass("active").show();
		$(".fuc_tab li").click(function() {
			$(".fuc_tab li").removeClass("active");
			$(this).addClass("active");
			return false;
		});
	}
	*/

	if($('.fuc_subtap').length >= 1){
		$(".fuc_subtap li:first").addClass("on").show();
		$(".fuc_subtap li").click(function() {
			$(".fuc_subtap li").removeClass("on");
			$(this).addClass("on");
			$(".tab_layer").hide();
			var activeTab = $(this).attr("id");
			$('#l_' + activeTab).fadeIn();
			return false;
		});
	}

	/* 서브메뉴 */
	if($('.titlebar-center').hasClass('submenu')){
		$('.titlebar-center').click(function() {
			$(".submenu-wrap").slideToggle();
			$('html, body').scrollTop(0);
			//$(this).toggleClass('close');
		});
	}

	/* top버튼 */
	$(document).scroll(function() {
		if($('.btn-top').length >= 1){
			var scrollT = $(window).scrollTop();
			if(scrollT > 300){
				$('.btn-top').fadeIn();
			}else{
				$('.btn-top').fadeOut();
			}
			$(".btn-top").click(function() {
				$('html, body').scrollTop(0);
				return false;
			});
		}
	});

	/* 열기/접기 */
	/*
	$('.fuc_toggle').click(function() {
		$(this).toggleClass('open');
		$('.fuc_wrap').slideToggle();
	});
	*/

});
/**
 * 주어진 이름의 쿠키값을 가져온다
 * @param name
 * @return
 */
function getCookie(name)
{
	var Found = false;
	var start=0, end =0;
	var i = 0;

	while (i <= document.cookie.length)
	{
		start = i;
		end = start + name.length;
		if (document.cookie.substring(start, end) == name)
		{
			Found = true;
			break;
		}

		i++;
	}

	if (Found == true)
	{
		start = end + 1;
		end = document.cookie.indexOf(';', start);
		if (end < start) end = document.cookie.length;
		return document.cookie.substring(start, end);
	}

	return '';
}


/**
 * 쿠키 굽기
 * @param name 쿠키 이름
 * @param value 쿠키 값
 * @param expiredays 쿠키 만료기간(일단위)
 */
function setCookie( name, value, expiredays ){
	var todayDate = new Date();
	todayDate.setDate( todayDate.getDate() + expiredays );
	document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";";
}


function toggleJJimCar(target, carId){
	if(jQuery("#" + target + carId).hasClass("on")){
		jQuery.ajax({
			type: "DELETE",
			url: "/favorite/deleteFavoriteItemAjax.do?c_no=" + carId,
			data: {},
			dataType: "JSON",
			success: function(json){
				jQuery("#" + target + carId).removeClass("on");
				location.reload();
			},
			error:function(json){
				alert( json.message );
			}
		});

	}else{
		jQuery.ajax({
			type: "POST",
			url: "/favorite/insertFavoriteItemAjax.do",
			data: {c_no: carId},
			dataType: "JSON",
			success: function(json){
				jQuery("#" + target + carId).addClass("on");
			},
			error:function(json){
				alert( json.message );
			}
		});
	}
}

function StringFormat(value) {
	var theString = value;

	for (var i = 1; i < arguments.length; i++) {
		var regEx = new RegExp("\\{" + (i - 1) + "\\}", "gm");
		theString = theString.replace(regEx, arguments[i]);
	}

	return theString;
}

function lpad(n, width, letter) {
	n = n + '';
	if(!letter){
		letter = '0';
	}

	return n.length >= width ? n : new Array(width - n.length + 1).join(letter) + n;
}

// 모바일 대응
function isMobile(){
	return getCookie("isApp") ? true : false;
}

function openPopup(code, v1, v2, v3, v4, v5) {
	if(!code) return;
	if(!v1) v1 = "";
	if(!v2) v2 = "";
	if(!v3) v3 = "";
	if(!v4) v4 = "";
	if(!v5) v5 = "";

	if(isMobile()){
		location.href = "subpopup:" + code + ":" + v1 + ":" + v2 + ":" + v3 + ":" + v4 + ":" + v5;

	}else{
		var url = "";
		switch(code){
			case "car_detail":
				url = "/car/detail.do?c_no=" + v1;
				break;
			case "car_detail_calc":
				url = "/car/calc/total.do?c_no=" + v1;
				break;
			case "car_detail_accident":
				url = "/car/popCarAccident.do?c_no=" + v1;
				break;
			case "car_detail_repair":
				url = "/car/repair.do?check_num=" + v1;
				break;
			case "car_detail_direct_repair":
				url = "/car/direct_repair.do?check_num=" + v1;
				break;

			case "sangsa_detail":
				url = "/cs/selectCompanyDetailView.do?co_no=" + v1;
				break;

			case "agree":{
				switch(v1){
					case 1:
						url = "/login/agree1.do";
						break;
					case 2:
						url = "/login/agree2.do";
						break;
					case 3:
						url = "/login/agree3.do";
						break;
					case "email":
						url = "/login/email.do";
						break;
				}
				break;
			}
		}

		if(url){
			window.open(url);
		}
	}
}

function openSearchCar(code, v1, v2, v3, v4, v5){
	if(!code) return;
	if(!v1) v1 = "";
	if(!v2) v2 = "";
	if(!v3) v3 = "";
	if(!v4) v4 = "";
	if(!v5) v5 = "";

	if(isMobile()){
		location.href = "subpopup:" + code + ":" + v1 + ":" + v2 + ":" + v3 + ":" + v4 + ":" + v5;

	}else{
		var url = "";
		switch(code){
			case "search_car":
				url = "/search.do?#cho:" + v1;
				break;
			case "search_car_theme":
				url = "/search/theme.do?type=" + v1;
				break;
			case "search_car_sangsa":
				url = "/search/sangsa_cars.do?co_name=" + v1;
				break;
			case "search_car_dealer":
				url = "/search/dealer_cars.do?co_name=" + v1 + "&dl_name=" + v2;
				break;
		}

		if(url){
			location.href = url;
		}
	}
}

function closeSearchCar(){
	if(isMobile()){
		selfclose();
	}else{
		location.href = "/";
	}
}

function openNewPage(code) {
	if(isMobile()){
		if(!code) return;

		if(code.length >= 5 && code.substring(0, 5) === "https"){
			code = code.replace("https://", "newhttps://");
		}else {
			code = code.replace("http://", "newhttp://");
		}

		location.href = code;
	}else{
		window.open(code);
	}
}

function showLoading(){
	$(".loading_img").removeClass("hide");
}

function hideLoading(){
	$(".loading_img").addClass("hide");
}

function authCallbackForMobile(data){
	var arr = data.split(":");

	if(arr[0] == "next_from_mobile") {
		if(arr[1] === "checkplus" && arr[2] && arr[2].length > 0){
			var authInfos = arr[2].split("###");

			if(authInfos[0]) document.getElementById("iReturn").value = authInfos[0];
			if(authInfos[1] && authInfos[1] != 'null') document.getElementById("sName").value = authInfos[1];
			if(authInfos[2] && authInfos[2] != 'null') document.getElementById("sBirthDate").value = authInfos[2];;
			if(authInfos[3] && authInfos[3] != 'null') document.getElementById("sGender").value = authInfos[3];;
			if(authInfos[4] && authInfos[4] != 'null') document.getElementById("sNationalInfo").value = authInfos[4];
			if(authInfos[5] && authInfos[5] != 'null') document.getElementById("sDupInfo").value = authInfos[5];
			if(authInfos[6] && authInfos[6] != 'null') document.getElementById("sConnInfo").value = authInfos[6];
			if(authInfos[7] && authInfos[7] != 'null') document.getElementById("sMobileNo").value = authInfos[7];
			if(authInfos[8] && authInfos[8] != 'null') document.getElementById("sMobileCo").value = authInfos[8];
			if(authInfos[9] && authInfos[9] != 'null') document.getElementById("membId").value = authInfos[9];

			var redirectUrl = "/login/selectMembJoinStep3View.do";

			if(arr[3] === 'searchId') {
				redirectUrl = "/login/selectSearchIdResultView.do";
			} else if(arr[3] === 'searchPwd') {
				redirectUrl = "/login/selectPasswordChangeView.do";
			}

			document.form_chk2.action = redirectUrl;
			document.form_chk2.submit();

		}else if(arr[1] === "ipin"){
			if(arr[2] && arr[2] != 'null') document.getElementById("enc_data").value = arr[2];
			if(arr[3] && arr[3] != 'null') document.getElementById("backLink").value = arr[3];
			if(arr[4] && arr[4] != 'null') document.getElementById("ipin_membId").value = arr[4];

			document.vnoform.action = "/login/ipinSuccess.do";
			document.vnoform.submit();
		}
	}
}

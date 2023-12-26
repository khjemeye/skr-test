<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include/taglib_prefix.jsp"%>
<!doctype html>
<html class="no-js" lang="ko" dir="ltr">
<head>
<%@ include file="/include/head.jsp"%>
</head>
<body class="main">
    <%@ include file="/include/headerMenu.jsp"%>
    <!-- header -->
    <div id="header" class="row header fixed search">
        <!-- titlebar -->
        <div class="column titlebar no-padding">
            <div class="titlebar-left">
                <button class="menu-icon hamburger" type="button" onClick="openNav()"></button>
            </div>
            <div id="logo" class="titlebar-center logo">
                <a href="#" title="부산오토필드">부산오토필드</a>
            </div>
            <div id="top_right_btn" class="titlebar-right" style="display: none;">
                <button class="menu-icon alram" type="button" onClick="location.href='/mypage/alarm.do'">
                    <c:if test="${alarmCount ne null and alarmCount > 0}">
                        <span>${alarmCount}</span>
                    </c:if>
                </button>
            </div>
        </div>
        <!-- //titlebar -->
        <div class="row main-search">
            <div class="column">
                <div class="input" onClick="openSearchCar('search_car', 1);">차량을 검색하세요</div>
            </div>
        </div>
    </div>
    <!-- //header -->
    <!-- container -->
    <div class="container">
        <div class="row visual">
            <div class="column">
                <div class="title">
                    <!--부산오토필드 -->
                    <p>
                        <strong id="totalCarCnt">${totalCarCount}</strong>대 차량보유
                    </p>
                    <p class="subtxt">
                        영남 최대 프리미엄 <br>자동차쇼핑몰
                    </p>
                </div>
                <div id="mainCarList"></div>
                <script src="js/jquery.bxslider.min.js"></script>
                <script language="JavaScript">
                <!--
                    $(document).ready(function() {

                        // 프리미엄 차량
                        $('.premium .usedcar-list').bxSlider({
                            auto : true,
                            pause : 3000,
                            controls : false,
                            pager : true,
                            slideWidth : 300,
                            slideHeight : 470,
                            slideMargin : 3,
                            useCSS : true,
                            shrinkItems : false,
                            adaptiveHeight : false,
                            infiniteloop : true
                        });

                    });
                //-->
                </script>
                <h4># 추천 검색 키워드</h4>
                <div class="keyword">
                    <a href="javascript:openSearchCar('search_car_theme', '1');" class="red"># 신차급</a>
                    <a href="javascript:openSearchCar('search_car_theme', '2');"># 짧은주행</a>
                    <a href="javascript:openSearchCar('search_car_theme', '3');"># 특가차량</a>
                    <a href="javascript:openSearchCar('search_car_theme', '4');"># 친환경</a>
                    <a href="javascript:openSearchCar('search_car_theme', '5');"># 소상공인</a>
                    <a href="javascript:openSearchCar('search_car_theme', '6');"># 인증중고차</a>
                </div>
            </div>
        </div>
        <script language="javascript" src="../js/swiper.min.js"></script>
        <link rel="stylesheet" type="text/css" href="/css/swiper.min.css">
        <div class="swiper-container">
            <div class="swiper-wrapper">
                <div class="swiper-slide" onClick="location.href='/sell/selectCarListView.do'">
                    <img src="/images/main/middle_banner1.png" width="100%">
                </div>
				<!--<div class="swiper-slide" onClick="location.href='/magazine/event/view.do?m_no=440'">
                    <img src="/images/main/middle_event1.png" width="100%">
                </div>
				<div class="swiper-slide" onClick="location.href='/magazine/event/view.do?m_no=441'">
                    <img src="/images/main/middle_event2.png" width="100%">
                </div>-->
				<div class="swiper-slide" onClick="openSearchCar('search_car', 1);">
                    <img src="/images/main/middle_item1.png" width="100%">
                </div>
				<div class="swiper-slide" onClick="openSearchCar('search_car', 1);">
                    <img src="/images/main/middle_item2.png" width="100%">
                </div>
				<div class="swiper-slide" onClick="openSearchCar('search_car', 1);">
                    <img src="/images/main/middle_item3.png" width="100%">
                </div>
				<div class="swiper-slide" onClick="openSearchCar('search_car', 1);">
                    <img src="/images/main/middle_item4.png" width="100%">
                </div>				
                <!--<div class="swiper-slide" onClick="location.href='/magazine/event.do'">
                    <img src="/images/main/middle_banner2.png" width="100%">
                </div>
                <div class="swiper-slide" onClick="location.href='/intro/selectFacilityView.do'">
                    <img src="/images/main/middle_banner3.png" width="100%">
                </div>-->
            </div>
            <!-- Add Arrows -->
            <div class="photo_num">
                <span class="swiper-pagination-current">1</span> / <span class="swiper-pagination-total">15</span>
            </div>
            <script>
            <!--
                $(window).ready(function() {
                    var swiper = new Swiper('.swiper-container', {
                        autoplay : true,
                        loop : true,
                        preloadImages : true,
                        autoHeight : true,
                        useCss : true,
                        pagination : {
                            el : '.photo_num',
                            type : 'fraction',
                        },
                        navigation : {
                            nextEl : '.swiper-button-next',
                            prevEl : '.swiper-button-prev',
                        },
                    });
                });
            //-->
            </script>
        </div>
        <div class="row carlist">
            <div class="column">
                <h2 class="h2">국산차</h2>
                <div class="scroll-wrap" id="domesticCarLists">
                </div>
            </div>
        </div>
        <div class="row carlist bg">
            <div class="column">
                <h2 class="h2">수입차</h2>
                <div class="scroll-wrap" id="importCarLists">
                </div>
            </div>
        </div>
        <div class="row main_magazine">
            <div class="column">
                <h2 class="h2">부산오토필드 소식</h2>
                <div class="news-image-list">
                    <c:choose>
                        <c:when test="${not empty noticeList}">
                            <c:forEach var="notice" items="${noticeList}">
                                <div class="grid-item">
                                    <a href="/magazine/notice/view.do?m_no=${notice.blbdNo}"> <c:choose>
                                            <c:when test="${notice.featuredImage ne null}">
                                                <div class="img-area" style="background-image:url('${notice.featuredImage}'), url('/images/nophoto/nophoto_640x480.png');"></div>
                                            </c:when>
                                            <c:otherwise>
                                                <div class="img-area" style="background-image: url('/images/nophoto/nophoto_640x480.png');"></div>
                                            </c:otherwise>
                                        </c:choose>
                                        <div class="text-area">
                                            <div class="photo notice">
                                                <span>공지</span>
                                            </div>
                                            <div class="title">${notice.blbdTitl}</div>
                                        </div>
                                    </a>
                                </div>
                            </c:forEach>
                        </c:when>
                    </c:choose>
                    <c:choose>
                        <c:when test="${not empty newsList}">
                            <c:forEach var="news" items="${newsList}">
                                <div class="grid-item">
                                    <a href="/magazine/news/view.do?m_no=${news.blbdNo}"> <c:choose>
                                            <c:when test="${news.featuredImage ne null}">
                                                <div class="img-area" style="background-image:url('${news.featuredImage}'), url('/images/nophoto/nophoto_640x480.png');"></div>
                                            </c:when>
                                            <c:otherwise>
                                                <div class="img-area" style="background-image: url('/images/nophoto/nophoto_640x480.png');"></div>
                                            </c:otherwise>
                                        </c:choose>
                                        <div class="text-area">
                                            <div class="photo pr">
                                                <span>PR</span>
                                            </div>
                                            <div class="title">${news.blbdTitl}</div>
                                        </div>
                                    </a>
                                </div>
                            </c:forEach>
                        </c:when>
                    </c:choose>
                </div>
            </div>
        </div>
        <div class="row main_service">
            <div class="column">
                <h2 class="h2">안전거래를 위한 고객지원</h2>
                <ul>
                    <li onclick="location.href='/cs/selectGuideSellView.do'" style="cursor: pointer">판매절차</li>
                    <li onclick="location.href='/cs/selectGuideBuyView.do'" style="cursor: pointer">구매절차</li>
                    <li onclick="location.href='/cs/selectGuideDocumentView.do'" style="cursor: pointer">계약관련서류</li>
                    <li class="type2" onclick="location.href='/cs/selectCompanyListView.do'" style="cursor: pointer">상사 조회</li>
                    <li class="type2" onclick="location.href='/cs/selectDealerListView.do'" style="cursor: pointer">종사원 조회</li>
                </ul>
            </div>
        </div>
        <%@ include file="/include/footer.jsp"%>
    </div>
    <!--// container -->
    <div class="footer_wrap webmobile">
        <div class="footer_text">
            <div class="btn">
                <button type="button" onClick="footerinfo();" class="footer_toggle">부산오토필드</button>
            </div>
            <div class="info">
                부산광역시 기장군 장안읍 반룡산단3로 95, 813호<br> 대표이사 : 한상원 사업자번호 : 313-81-35291<br> 대표전화 : 051-728-6978
            </div>
            Copyright(c) 부산오토필드
			<div class="ex">부산오토필드는 통신판매중개자로서 통신판매의 당사자가 아니며, 상품거래정보, 거래에 대하여 책임을 지지 않습니다.</div>
        </div>
    </div>
    <!-- 로딩
<div class="loading_img"></div>-->
    <script src="/js/src/react.min.js"></script>
    <script src="/js/src/react-dom.min.js"></script>
    <input type="hidden" id="newCarList" value='${newCarList}' />
    <input type="hidden" id="recentCars" value='${recentCars}' />
    <input type="hidden" id="favCars" value='${favCars}' />
    <input type="hidden" id="premiumCarListData" value='${premiumCarList}' />
    <input type="hidden" id="domesticCarListData" value='${domesticCarList}' />
    <input type="hidden" id="importCarListData" value='${importCarList}' />
    <c:choose>
        <c:when test="${userVo == null}">
            <input type="hidden" id="isLogin" value='N' />
        </c:when>
        <c:otherwise>
            <input type="hidden" id="isLogin" value='Y' />
        </c:otherwise>
    </c:choose>
    <script for="window" event="onload" src="/js/build/IndexCarLists.js?ver=202007300823"></script>
    <script for="window" event="onload" src="/js/build/DomesticCarLists.js?ver=202007271606"></script>
    <script for="window" event="onload" src="/js/build/ImportCarLists.js?ver=202007271606"></script>
    <script>
        $(document).ready(function() {
            if (isMobile()) {
                jQuery("#top_right_btn").show();
            }
        });
    </script>
<script language="JavaScript">
<!--    
function startTime(){
	var time= new Date();
	hours= time.getHours();
	mins= time.getMinutes();
	secs= time.getSeconds();
	closeTime=hours*3600+mins*60+secs;
	closeTime+=10; //시간설정
	Timer();
}

function Timer(){
	var time= new Date();
	hours= time.getHours();
	mins= time.getMinutes();
	secs= time.getSeconds();
	curTime=hours*3600+mins*60+secs
	if (curTime>=closeTime){
		$('#divpop1').remove();
	}
	else{
		window.setTimeout("Timer()",10000)
	}
}

function setCookie( name, value, expiredays ) { 
	var todayDate = new Date(); 
	todayDate.setDate( todayDate.getDate() + expiredays ); 
	document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";" 
} 

function closeWin() { 
	if ( document.notice_form.chkbox.checked ){ 
	setCookie("mainDiv", "done" , 1 ); 
	} 
	$('#divpop1').remove();
}    
//-->
</script>
<style>
.test_video input[type=checkbox] + label:after {border-color:#777;background-color:#000;}
.test_video input[type=checkbox]:checked + label:after {border-color:#3bcc99;}
.test_video .button {height:40px;margin:0;background:#3bcc99;font-size:14px;}
</style>
<div id="divpop1" class="block-ui test_video" style="display:none !important;background:rgba(0,0,0,.6);">
	<div class="test_video" style="display:block;position:fixed;left:50%;top:50%;width:98%;max-width:1000px;max-height:100%;height:auto;padding:2px;transform:translate(-50%,-50%);border-radius: 0;background: #000;z-index: 99999;font-size: 0;">
		<video controls="" width="100%" autoplay="autoplay" muted="muted" loop="loop" playsinline id="myvideo"><source src="/uploadFiles/autofield.mp4" type="video/mp4"></video>
		<form name="notice_form">
			<div style="text-align:right;">
			<input type="checkbox" name="chkbox" value="checkbox" id="check1">
			<label for="check1" class="inline" style="color:#999;font-size:14px;">오늘 하루 이 창을 열지 않음</label>
			<a href="javascript:closeWin();" class="button">닫기</a>
			</div>
		</form>
	</div>
</div>
<script language="Javascript">
<!--
cookiedata = document.cookie; 

if ( cookiedata.indexOf("mainDiv=done") < 0 ){ 
	//document.all['divpop1'].style.display = "block";
}
else {
	$('#divpop1').remove();
}
//-->
</script>

</body>
</html>

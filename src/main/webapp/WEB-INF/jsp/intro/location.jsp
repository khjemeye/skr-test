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
            <a href="javascript:void(0);" title="오시는길">오시는길</a>
        </div>
        <div class="titlebar-right">
            <button class="menu-icon hamburger" type="button" onClick="openNav();"></button>
        </div>
    </div>
    <!-- //titlebar -->

</div>
<!-- //header -->

<%@ include file="/include/headerSubmenu.jsp"%>

<!-- container -->
<div class="container">

    <div class="row location01">
        <div class="column">
            <!-- * 카카오맵 - 지도퍼가기 -->
            <!-- 1. 지도 노드 -->
            <div id="daumRoughmapContainer1591259207203" class="root_daum_roughmap root_daum_roughmap_landing"></div>

            <!--
                2. 설치 스크립트
                * 지도 퍼가기 서비스를 2개 이상 넣을 경우, 설치 스크립트는 하나만 삽입합니다.
            -->
            <script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>

            <!-- 3. 실행 스크립트 -->
            <script charset="UTF-8">
                new daum.roughmap.Lander({
                    "timestamp" : "1591259207203",
                    "key" : "yo6f",
                    "mapWidth" : "320",
                    "mapHeight" : "250"
                }).render();
            </script>
            <dl>
                <dt>부산광역시 기장군 장안읍 반룡리 897-1<br><span>( 부산광역시 기장군 장안읍 반룡산단3로 95 )</span></dt>
                <dd class="call">
                    <i><em>T</em>051-608-2222</i>
                    <i><em>F</em>051-608-2221</i>
                </dd>
                <dd>부산의 영남권 최대 <br>현대식 초대형 자동차 멀티플렉스<br>- 부산오토필드 -</dd>
            </dl>
        </div>
    </div>

    <div class="row location02">
        <div class="column">
            <dl class="way1">
                <dt>자가용 이용시</dt>
                <dd class="table_row">
                    <span class="l">
                        <i>장안IC</i>
                    </span>
                    <span class="r">동해고속도로(부산-울산) 장안산업단지 월내리 방면으로 우측도로로 3.7km 이동 (6분)
                    </span>
                </dd>
            </dl>
            <dl class="way2">
                <dt>버스 이용시</dt>
                <dd class="table_row">
                    <span class="l">
                        <i>187</i>
                    </span>
                    <span class="r">신성전기 정류장</span>
                </dd>
            </dl>

        </div>
    </div>

    <%@ include file="/include/footer.jsp"%>

</div>
<!--// container -->
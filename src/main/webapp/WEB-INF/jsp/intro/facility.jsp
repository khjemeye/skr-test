<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include/taglib_prefix.jsp"%>
<%@ include file="/include/top.jsp"%>

<script src="/js/src/react.min.js"></script>
<script src="/js/src/react-dom.min.js"></script>

<script type="text/javascript">
    $(document).ready(function(){
        $('.slider-inner').bxSlider();
    });
</script>

<%@ include file="/include/headerMenu.jsp"%>

<!-- header -->
<div id="header" class="row header fixed">

    <!-- titlebar -->
    <div class="column titlebar no-padding">
        <div class="titlebar-left">
            <button class="menu-icon" type="button" onClick="winback();"></button>
        </div>
        <div id="logo" class="titlebar-center submenu">
            <a href="javascript:void(0);" title="시설안내">시설안내</a>
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

    <div class="row facilitys-title">
        <div class="column">
            <div class="title_wrap">
                <h2>지하 3층 ~ 지상 9층</h2>
                <span class="h2_txt">연면적 36,000여평의 초대형 매매단지</span>
            </div>
            <img src="/images/icon/fercility_bg.png" width="100%" >
        </div>
    </div>

    <div id="facilityListMain"></div>

    <%@ include file="/include/footer.jsp"%>
</div>

<script for="window" event="onload" src="/js/build/intro/FacilityListMain.js"></script>

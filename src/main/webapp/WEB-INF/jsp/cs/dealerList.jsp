<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.autofield.system.utility.CommonUtil" %>

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
        <div id="logo" class="titlebar-center submenu">
            <a href="javascript:void(0);" title="종사원 조회">종사원 조회</a>
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
    <div id="dealerList"></div>

    <%@ include file="/include/footer.jsp"%>

    <button type="button" class="btn-top"><span>Top</span></button>

</div>
<!-- //container -->

<script for="window" event="onload" src="/js/build/cs/DealerList.js"></script>
<script type="text/javascript">
    /* 탭이동 */
    function step2(){
        var winH = $(window).height();
        $(".step2-wrap").fadeIn();
        $("html, body").animate({scrollTop: winH}, 200);
    }

    $(document).ready(function(){
        var winH = $(window).height();
        var addH = $(".header").outerHeight();
        $(".worker-title").css('height', winH - addH);
    });
</script>

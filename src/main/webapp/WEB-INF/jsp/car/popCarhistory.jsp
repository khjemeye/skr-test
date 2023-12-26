<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include/taglib_prefix.jsp"%>
<!-- header -->
<div id="header" class="row header fixed big">

    <!-- titlebar -->
    <div class="column titlebar big no-padding">
        <div id="logo" class="titlebar-center">
            <a href="javascript:void(0);" title="사고이력정보 보고서">사고이력정보 보고서</a>
        </div>
        <div class="titlebar-right">
            <button class="menu-icon icon-close" type="button" onClick="selfclose()"></button>
        </div>
    </div>
    <!-- //titlebar -->

</div>
<!-- //header -->

<!-- container -->
<div class="container">
    <div style="padding:2rem 0 2rem 1.5rem">
        <iframe name="carHistoryIframe" id="iframeDetail" src="/car/carhistory.do?c_no=${cNo}" onload="ResizeFrame(this);" width="960" height="4800" frameborder="0" scrolling="no"></iframe>
    </div>
</div>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include/taglib_prefix.jsp"%>
<!-- header -->
<div id="header" class="row header fixed big">

    <!-- titlebar -->
    <div class="column titlebar big no-padding">
        <div id="logo" class="titlebar-center">
            <a href="javascript:void(0);" title="성능점검기록부">성능점검기록부</a>
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
        <iframe name="carCheckIframe" id="iframeDetail" src="${carCheckUrl}?check_id=${check_num}" onload="ResizeFrame(this);" width="960" height="4800" frameborder="0" scrolling="no"></iframe>
    </div>
</div>
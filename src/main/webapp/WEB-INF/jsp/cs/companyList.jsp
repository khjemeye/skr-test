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
        <div id="logo" class="titlebar-center submenu">
            <a href="javascript:void(0);" title="상사 조회">상사 조회</a>
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

    <div id="companyList"></div>

    <%@ include file="/include/footer.jsp"%>

    <button type="button" class="btn-top"><span>Top</span></button>

</div>
<!-- //container -->

<script for="window" event="onload" src="/js/build/cs/CompanyList.js"></script>
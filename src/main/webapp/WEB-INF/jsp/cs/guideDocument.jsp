<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include/taglib_prefix.jsp"%>
<%@ include file="/include/top.jsp"%>

<%@ include file="/include/headerMenu.jsp"%>

<div id="header" class="row header fixed">
    <!-- titlebar -->
    <div class="column titlebar no-padding">
        <div class="titlebar-left">
            <button class="menu-icon" type="button" onClick="winback();"></button>
        </div>
        <div id="logo" class="titlebar-center submenu">
            <a href="javascript:void(0);" title="계약서류안내">계약서류안내</a>
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

    <!--<div class="row">
        <div class="column padd0">
            <img src="../images/icon/location_bg2.png" width="100%">
        </div>
    </div>-->
    <div class="row">
        <div class="column">
            <div class="title_wrap left">
                <h2>개인</h2>
            </div>
            <table border="0" cellpadding="0" cellspacing="0" class="t_normal font12">
                <thead>
                    <tr>
                        <th class="color">판매자(양도인)</th>
                        <th class="color">구매자(양수인)</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>자동차 등록증<br>
                            자동차 완납증명서 1통<br>
                            신분증<br>
                            <span class="text-grey">인감증명서 1통*<br>
                            인감도장*</span></td>
                        <td>보험가입증명서<br>
                            신분증<br>
    <span class="text-grey">인감증명서 1통*<br>
        인감도장*</span></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    <div class="row">
        <div class="column">
            <div class="title_wrap left">
                <h2>개인사업자</h2>
            </div>
            <table border="0" cellpadding="0" cellspacing="0" class="t_normal font12">
                <thead>
                    <tr>
                        <th class="color">판매자(양도인)</th>
                        <th class="color">구매자(양수인)</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>자동차 등록증<br>
                            자동차 완납증명서 1통<br>
                            신분증<br>
                            사업자등록증 1통(사본)<br>
    <span class="text-grey">인감증명서 1통*<br>
        인감도장*</span></td>
                        <td>보험가입증명서<br>
                            신분증<br>
                            사업자등록증 1통(사본)<br>
    <span class="text-grey">인감증명서 1통*<br>
        인감도장*</span></td>
                    </tr>
                </tbody>
            </table>

        </div>
    </div>
    <div class="row">
        <div class="column">
            <div class="title_wrap left">
                <h2>법인</h2>
            </div>
            <table border="0" cellpadding="0" cellspacing="0" class="t_normal font12">
                <tbody>
                    <tr>
                        <th class="color">판매자(양도인)</th>
                        <th class="color">구매자(양수인)</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>자동차 등록증<br>
                            법인 등기부등본 1통
                            (15일 이내, 말소포함)<br>
                            사업자등록증 사본 1통<br>
                            법인 인감증명서 1통<br>
                            법인 인감도장<br>
                            자동차 완납증명서 1통<br>
                        신분증</td>
                        <td>법인 등기부등본 1통
                            (15일 이내, 말소포함)<br>
                            보험가입증명서<br>
                            사업자등록증 사본 1통<br>
                            법인 인감증명서 1통<br>
                            법인 인감도장<br>
                        신분증</td>
                    </tr>
                </tbody>
            </table>

        </div>
    </div>
    <div class="row">
        <div class="column">
            <div class="title_wrap left">
                <h2>장애인</h2>
            </div>
            <table border="0" cellpadding="0" cellspacing="0" class="t_normal font12">
                <thead>
                    <tr>
                        <th class="color">판매자(양도인)</th>
                        <th class="color">구매자(양수인)</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>자동차 등록증<br>
                            자동차 완납증명서 1통<br>
                            신분증<br>
    <span class="text-grey">인감증명서 1통*<br>
        인감도장*</span></td>
                        <td>보험가입증명서<br>
                            신분증<br>
    <span class="text-grey">인감증명서 1통*<br>
        인감도장*</span></td>
                    </tr>
                </tbody>
            </table>

        </div>
    </div>
    <div class="row">
        <div class="column">
            <div class="title_wrap left">
                <h2>외국인</h2>
            </div>
            <table border="0" cellpadding="0" cellspacing="0" class="t_normal font12">
                <thead>
                    <tr>
                        <th class="color">판매자(양도인)</th>
                        <th class="color">구매자(양수인)</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>인감증명서 발급되면 개인 이전과 동일처리 <br>
                            발급 불가시 자동차 등록사업소에 직접 방문<br>&nbsp;
                            <br>
                            -
                            신분증(외국인증록증, 여권 등)<br>
                            - 거소사실 증명서</td>
                        <td>인감증명서 발급되면 개인 이전과 동일처리 <br>
                            발급 불가시 자동차 등록사업소에 직접 방문<br>&nbsp;
                            <br>
                            - 신분증(외국인증록증, 여권 등)<br>
                            - 거소사실 증명서</td>
                    </tr>
                </tbody>
            </table>

        </div>
    </div>
    <br>

    <%@ include file="/include/footer.jsp"%>
</div>
<!--// container -->
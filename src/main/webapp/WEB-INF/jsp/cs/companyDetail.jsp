<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/include/taglib_prefix.jsp"%>
<%@ include file="/include/top.jsp"%>
<%@ include file="/include/headerMenu.jsp"%>

<!-- header -->
<div id="header" class="row header fixed">

    <!-- titlebar -->
    <div class="column titlebar no-padding">
        <div id="logo" class="titlebar-center">
            <a href="javascript:void(0);" title="상사 상세보기">상사정보</a>
        </div>
        <div class="titlebar-right">
            <button class="menu-icon icon-close" type="button" onClick="selfclose();"></button>
        </div>
    </div>
    <!-- //titlebar -->

</div>
<!-- //header -->

<!-- container -->
<div class="container">
    <div class="detailCon02">
        <div class="company-logo">
            <c:choose>
                <c:when test="${companyMap.coMainImage ne null and companyMap.coMainImage ne ''}">
                    <img src="${uploadPath}/${companyMap.coMainImage}" width="100%" onerror="this.src='${sangsaNoImage}';"></div>
                </c:when>
                <c:otherwise>
                    <img src="${sangsaNoImage}"></div>
                </c:otherwise>
            </c:choose>


        <table class="table_01" width="100%" border="0" cellspacing="0" cellpadding="0">
            <colgroup>
                <col style="width:100px">
                <col style="width:*">
            </colgroup>
            <tbody>
            <tr>
                <th>상호</th>
                <td>${companyMap.coName}</td>
            </tr>
            <tr>
                <th>대표자</th>
                <td>${companyMap.coCeo}</td>
            </tr>
            <tr>
                <th>호실</th>
                <td>${companyMap.coRoomNum}</td>
            </tr>
            <tr>
                <th>허가번호</th>
                <td>${companyMap.coNewconum}</td>
            </tr>
            <tr>
                <th>종사원수</th>
                <td>${companyMap.delrCnt}명</td>
            </tr>
            <tr>
                <th>보유차량</th>
                <td>${companyMap.carCnt}대</td>
            </tr>
            <tr>
                <th>팩스번호</th>
                <td>${companyMap.coFax}</td>
            </tr>
            <tr>
                <th>전화번호</th>
                <td><button type="button" class="btn-call" onClick="location.href='tel:${companyMap.coTel}'">${companyMap.coTel}</button></td>
            </tr>
            </tbody>
        </table>
    </div>

    <div class="button-group">
        <button type="button" class="button color-red2" onClick="searchCarAction('${companyMap.coRealName}')">보유차량보기</button>
    </div>
    <div class="divide"></div>
    <div class="row">
        <div class="column">
            <div class="title_wrap left">
                <h2>상사소개</h2>
            </div>
            <c:choose>
                <c:when test="${companyMap.coIntro ne null and companyMap.coIntro ne ''}">
                    <div class="sangsa-text">${companyMap.coIntro}</div>
                </c:when>
                <c:otherwise>
                    <div class="data-empty">등록된 설명이 없습니다.</div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
    <div class="divide"></div>
    <div class="row sangsa-photo">
        <div class="column">
            <div class="title_wrap left">
                <h2>상사사진</h2>
            </div>
            <!-- [s]bigimg-->
            <div class="bigimg">
                <div class="swiper-container">
                    <div class="swiper-wrapper">
                        <c:choose>
                            <c:when test="${imageList ne null and not empty imageList}">
                                <c:forEach var="image" items="${imageList}">
                                    <div class="swiper-slide">
                                        <img src="${uploadPath}/${image}" width="100%" onerror="this.src='${sangsaNoImage}';" />
                                    </div>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <div class="swiper-slide">
                                    <img src="${sangsaNoImage}" width="100%"/>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <!-- Add Arrows -->
                    <div class="swiper-button-next"></div>
                    <div class="swiper-button-prev"></div>
                    <div class="photo_num"><span class="swiper-pagination-current">1</span> / <span class="swiper-pagination-total">15</span></div>
                </div>
            </div>
            <!-- [e]bigimg-->
        </div>
    </div>

    <c:if test="${companyMap.coRoomNum ne null and companyMap.coRoomNum ne ''}">
        <div class="divide"></div>
        <div class="row">
            <div class="column">
                <div class="title_wrap left">
                    <h2>상사위치</h2>
                </div>

                <div class="sangsa-location">
                    <h3 class="floor">${roomFloor} - ${companyMap.coRoomNum}</h3>
                    <div class="map_floor F_${roomFloor}">
                        <svg class="map_wrap " role="img">
                            <rect class="area location" x="${companyMap.mrX}" y="${companyMap.mrY}" width="${companyMap.mrW}" height="${companyMap.mrH}"></rect>
                        </svg>
                    </div>
                </div>
            </div>
        </div>
    </c:if>
    <%@ include file="/include/footer.jsp"%>

    <button type="button" class="btn-top"><span>Top</span></button>

</div>
<!-- //container -->

<script>
function searchCarAction(company){
    openSearchCar("search_car_sangsa", encodeURIComponent(company));
}
</script>

<script>
    <!--
    $(window).load(function(){
        var swiper = new Swiper('.swiper-container', {
            preloadImages: true,
            autoHeight : true,
            useCss : true,
            pagination: {
                el: '.photo_num',
                type: 'fraction',
            },
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev',
            },
        });
    });
    //-->
</script>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.autofield.system.utility.CommonUtil" %>
<%@ include file="/include/taglib_prefix.jsp"%>

<%@ include file="/include/headerMenu.jsp"%>

<!-- header -->
<div id="header" class="row header fixed">

    <!-- titlebar -->
    <div class="column titlebar no-padding">
        <div class="titlebar-left">
            <button class="menu-icon" type="button" onClick="winback();"></button>
        </div>
        <div id="logo" class="titlebar-center submenu">
            <a href="javascript:void(0);" title="FAQ">FAQ</a>
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

    <div class="row customer-txt">
        <div class="column">
            <p class="tit">FAQ</p>
            <p>부산오토필드 서비스 이용관련 자주 질문하시는 사항들을 FAQ에 모아두었습니다.</p>
        </div>
    </div>

    <div class="row">
        <div class="column">
           <div class="qna-list">
                    <ul>
                    <c:choose>
                        <c:when test="${not empty faqList}">
                            <c:forEach items="${faqList}" var="faq" varStatus="status">
                                <li>
                                    <h3>${faq.blbdTitl}</h3>
                                    <div class="item-inner" style="display: none;">
                                        <p><strong>${CommonUtil.nl2br(faq.blbdCnts)}</strong></p>
                                        <p>${CommonUtil.nl2br(faq.ansrCnts)}</p>
                                    </div>
                                </li>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <li class="no-list">
                                <p>검색 결과가 없습니다.</p>
                            </li>
                        </c:otherwise>
                    </c:choose>
                    </ul>
                </div>
        </div>
    </div>

    <div class="row customer-btns">
        <div class="column">
            <ul>
                <li class="c3">
                   <p class="tit">이용 관련 문의</p>
                   <p>원하시는 답변이 없으신가요? 부산오토필드에 직접 문의하세요.</p>
                   <a href="/cs/selectQnaView.do" class="button">1:1 문의하기</a>
                </li>
                <li class="c2">
                   <p class="tit">대표번호</p>
                    <p>원하시는 답변이 없으신가요? 부산오토필드에 직접 문의하세요.<br>
                        <strong>051-608-2222</strong>
                    </p>
                </li>
                <li class="c1">
                    <p class="tit">제휴문의</p>
                    <p>부산오토필드와 함께하실 비즈니스 파트너를 환영합니다.</p>
                    <a href="/cs/selectContactView.do" class="button">제휴문의</a>
                </li>
            </ul>
        </div>
    </div>

    <%@ include file="/include/footer.jsp"%>

</div>
<!--// container -->

<script type="text/javascript">
<!--
    $(window).ready(function(){

        /* 토글 메뉴 */
        $('.qna-list li h3').click(function(){
            if($(this).hasClass('on')){
                $(this).next().slideToggle(300);
                $(this).toggleClass('on');
            }else{
                $('.item-inner').slideUp(300);
                $('.qna-list li h3').removeClass('on');
                $(this).next().slideToggle(300);
                $(this).toggleClass('on');
            }
        });

    });
//-->
</script>
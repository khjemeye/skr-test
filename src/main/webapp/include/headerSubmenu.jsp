<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include/taglib_prefix.jsp"%>

<div class="submenu-wrap">
    <div class="gnb">
        <ul>
            <c:choose>
                <c:when test="${submenu eq 'search'}">
                    <li><a href="/search.do?1#cho:1" title="국산차">국산차</a>
                    <li><a href="/search.do?2#cho:2" title="수입차">수입차</a>
                    <li><a href="/search.do?3#cho:3" title="화물/버스/특장">화물/버스/특장</a>
                    <li><a href="/search/theme.do" title="테마차량">테마차량</a></li>
                </c:when>
                <c:when test="${submenu eq 'cs'}">
                    <li><a href="/cs/selectGuideSellView.do" title="중고차 판매절차">중고차 판매절차</a>
                    <li><a href="/cs/selectGuideBuyView.do" title="중고차 구매절차">중고차 구매절차</a>
                    <li><a href="/cs/selectGuideDocumentView.do" title="계약서류안내">계약서류안내</a>
                    <li><a href="/cs/selectActualCarView.do" title="실제 전시차량 확인">실제 전시차량 확인</a></li>
                    <li><a href="/cs/selectCompanyListView.do" title="상사 조회">상사 조회</a></li>
                    <li><a href="/cs/selectDealerListView.do" title="종사원 조회">종사원 조회</a></li>
                </c:when>
                <c:when test="${submenu eq 'intro'}">
                    <li><a href="/intro/selectIntroView.do" title="부산오토필드 소개">부산오토필드 소개</a>
                    <li><a href="/intro/selectFacilityView.do" title="시설안내">시설안내</a>
                    <li><a href="/intro/selectLocationView.do" title="오시는길">오시는길</a>
                </c:when>
                <c:when test="${submenu eq 'magazine'}">
                <!-- li><a href="/magazine/news.do" title="뉴스">뉴스</a -->
                <li><a href="/magazine/notice.do" title="공지사항">공지사항</a>
                <li><a href="/magazine/event.do" title="이벤트">이벤트</a>
                <li><a href="/magazine/news.do" title="보도자료">보도자료</a>
                </c:when>
                <c:when test="${submenu eq 'cs2'}">
                    <li><a href="/cs/selectFaqView.do" title="FAQ">FAQ</a></li>
                    <li><a href="/cs/selectQnaView.do" title="문의하기">문의하기</a></li>
                    <li><a href="/cs/selectContactView.do" title="제휴문의">제휴문의</a></li>
                </c:when>
                <c:when test="${submenu eq 'mypage'}">
                    <li><a href="/mypage/selectMypageMainView.do" title="메인">메인</a>
                    <li><a href="/mypage/selectLastLookCarView.do" title="최근 본 차량">최근 본 차량</a>
                    <li><a href="/mypage/selectJJimCarView.do" title="관심차량">관심차량</a>
                    <li><a href="/mypage/selectMyInquriyList.do" title="나의 문의">나의 문의</a>
                    <li><a href="/mypage/selectMembInfoMngView.do" title="회원정보수정">회원정보수정</a>
                    <li><a href="/mypage/selectMembWithdrawalView.do" title="회원정보수정">회원탈퇴</a></li>
                </c:when>
            </c:choose>
        </ul>
    </div>
</div>

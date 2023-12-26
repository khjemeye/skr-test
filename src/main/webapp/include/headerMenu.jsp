<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include/taglib_prefix.jsp"%>
<!--
 TODO : /main/selectTopMenuView.do 호출 하도록 대체 해야 함..
 -->
<div class="gnbWrap" id="mySidenav">
    <div class="gnb">
        <a class="gnbClose" href="javascript:void(0)" onClick="closeNav()"></a>

        <div class="top" onClick="location.href='/'"><img src="/images/logo.png" class="logo"></div>

        <div class="gnbTop">
            <c:choose>
                <c:when test="${userVo == null}">
                    <div class="info">
                        <a href="/login/selectLoginFormView.do">로그인</a>
                        <a href="/login/selectMembJoinStep1View.do">회원가입</a>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="info">
                        <strong>${userVo.userNm}</strong> 고객님 환영합니다 <a href="/login/actionLogout.do">로그아웃</a>
                    </div>
                </c:otherwise>
            </c:choose>

            <div class="mypage_info">
                <ul>
                    <li>
                        <a href="/mypage/selectLastLookCarView.do">
                            <span id="mainMenuLatestCarCount">-</span><br>최근본차량
                        </a>
                    </li>
                    <li>
                        <a href="/mypage/selectJJimCarView.do">
                            <span id="mainMenuFavoriteCarCount">-</span><br>관심차량
                        </a>
                    </li>
                    <li>
                        <a href="/mypage/selectMyInquriyList.do">
                            <span id="mainMenuInquiryCarCount">-</span><br>나의문의
                        </a>
                    </li>
                </ul>
            </div>
        </div><!-- gnbTop -->

        <div class="gnb_scrolled">
            <ul>
                <li>
                    <div class="open">내차사기</div>
                    <ul>
                        <li><a href="javascript:openSearchCar('search_car', 1);" title="국산차">국산차</a>
                        <li><a href="javascript:openSearchCar('search_car', 2);" title="수입차">수입차</a>
                        <li><a href="javascript:openSearchCar('search_car', 3);" title="화물/버스/특장">화물/버스/특장</a>
                        <li><a href="javascript:openSearchCar('search_car_theme', '1');" title="테마차량">테마차량</a></li>
                    </ul>
                </li>
                <li>
                    <div onClick="location.href='/sell/selectCarListView.do'">내차팔기</div>
                </li>
                <li>
                    <div class="open">안전거래서비스</div>
                    <ul>
                        <li><a href="/cs/selectGuideSellView.do" title="중고차 판매절차">중고차 판매절차</a>
                        <li><a href="/cs/selectGuideBuyView.do" title="중고차 구매절차">중고차 구매절차</a>
                        <li><a href="/cs/selectGuideDocumentView.do" title="계약서류안내">계약서류안내</a>
                        <li><a href="/cs/selectActualCarView.do" title="실제 전시차량 확인">실제 전시차량 확인</a></li>
                        <li><a href="/cs/selectCompanyListView.do" title="상사 조회">상사 조회</a></li>
                        <li><a href="/cs/selectDealerListView.do" title="종사원 조회">종사원 조회</a></li>
                    </ul>
                </li>
                <li>
                    <div class="open">단지안내</div>
                    <ul>
                        <li><a href="/intro/selectIntroView.do" title="부산오토필드 소개">부산오토필드 소개</a>
                        <li><a href="/intro/selectFacilityView.do" title="시설안내">시설안내</a>
                        <li><a href="/intro/selectLocationView.do" title="오시는길">오시는길</a>
                    </ul>
                </li>
                <li>
                    <div class="open">매거진</div>
                    <ul>
                        <li><a href="/magazine/notice.do" title="공지사항">공지사항</a>
                        <li><a href="/magazine/event.do" title="이벤트">이벤트</a>
                        <li><a href="/magazine/news.do" title="보도자료">보도자료</a>
                    </ul>
                </li>
                <li>
                    <div class="open">고객센터</div>
                    <ul>
                        <li><a href="/cs/selectFaqView.do" title="FAQ">FAQ</a></li>
                        <li><a href="/cs/selectQnaView.do" title="문의하기">문의하기</a></li>
                        <li><a href="/cs/selectContactView.do" title="제휴신청">제휴신청</a></li>
                    </ul>
                </li>
                <li>
                    <div class="open">마이페이지</div>
                    <ul>
                        <li><a href="/mypage/selectMypageMainView.do" title="메인">메인</a>
                        <li><a href="/mypage/selectLastLookCarView.do" title="최근 본 차량">최근 본 차량</a>
                        <li><a href="/mypage/selectJJimCarView.do" title="관심차량">관심차량</a>
                        <li><a href="/mypage/selectMyInquriyList.do" title="나의 문의">나의 문의</a>
                        <li><a href="/mypage/selectMembInfoMngView.do" title="회원정보수정">회원정보수정</a>
                        <li><a href="/mypage/selectMembWithdrawalView.do" title="회원정보수정">회원탈퇴</a>
                    </ul>
                </li>
            </ul>
        </div>
    </div><!-- gnb -->

    <div id="setting_btn" class="setting" style="display: none;">
        <a href="/mypage/setting.do">설정</a>
    </div>
</div>

<script>
    function openNav() {
        <c:if test="${userVo != null}">
            jQuery.ajax({
                type: "GET",
                url: "/main/selectMypageCountsAjax.do",
                data: {},
                dataType: "JSON",
                success: function(json){
                    jQuery("#mainMenuLatestCarCount").text(json.latestCarCount);
                    jQuery("#mainMenuFavoriteCarCount").text(json.favCount);
                    jQuery("#mainMenuInquiryCarCount").text(json.inquiryCount);
                },
                error:function(json){}
            });
        </c:if>

        $('.gnbWrap').show();
        $('.gnbWrap').animate({ left: '0' },100);
        $('html, body').css({'overflow':'hidden','height':'100%'});
        $('body').append('<div class="block_navi" onclick="closeNav();"></div>');
        $(".block_navi").fadeIn();
    }

    function closeNav() {
        $('.gnbWrap').hide();
        $('.gnbWrap').animate({ left: '-100%' },100);
        $('html, body').css({'overflow':'auto','height':'auto'});
        $(".block_navi").remove();
    }
    $(document).ready(function(){
        if($('.gnbWrap .gnb_scrolled').length >= 1){
            $('.gnbWrap .gnb_scrolled .open').click(function () {
                $('.gnbWrap .gnb_scrolled .open').removeClass('close');
                $('.gnbWrap .gnb_scrolled ul ul').hide();
                $(this).toggleClass('close');
                $(this).next('ul').slideToggle();
                if($(this).hasClass('close')){
                    var indexi = $(this).parent().index();
                    if(indexi >= 3){
                        var scrollM = $(this).parent().offset().top;
                        $('.gnbWrap .gnb_scrolled').animate({scrollTop: '600'}, 1000);
                    }
                }
            });
        }

        if(isMobile()){
            jQuery("#setting_btn").show();
        }
    });
</script>



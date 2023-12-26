<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.autofield.system.utility.CommonUtil"%>
<%@ include file="/include/taglib_prefix.jsp"%>
<%@ include file="/include/top.jsp"%>
<!-- header -->
<div id="header" class="row header fixed">
    <!-- titlebar -->
    <div class="column titlebar no-padding">
        <div id="logo" class="titlebar-center">
            <a href="javascript:void(0);" style="font-size: 16px;">${carViewVO.currRecord.cCarnum}</a>
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
    <!-- [s]bigimg-->
    <div class="bigimg">
        <div class="swiper-container">
            <div class="swiper-wrapper">
                <c:choose>
                    <c:when test="${not empty carImageList}">
                        <c:forEach var="carImg" items="${carImageList}">
                            <div class="swiper-slide">
                                <img src="${imagePath}/${carImg.imgName}" width="100%" onError="this.src='/images/nophoto/nophoto_640x480.png';" />
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <div class="swiper-slide">
                            <img src="/images/ready_photo.png" width="100%" />
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="btn_box">
				<div class="expand">
					<a href="javascript:openZoom();"></a>
				</div>
	<c:if test="${not empty carVrList}">
				<a href="javascript:;" class="btn_3dview" onClick="go3dView();">내부사진</a>
				<script>
					function roundview(num) {
						var link = num;
						$('body').append('<div class="roundview"><a href="javascript:;" class="btn_3dclose" onclick="javascript:roundview_close();">닫기</a><iframe src="'+ link + '" width="100%" height="100%"></div>');
					}
					function roundview_close(){
						$('.roundview').hide();
					}
					<c:forEach var="carVr" items="${carVrList}">
					function go3dView() {
						roundview('/js/pannellum.htm#panorama=${imagePath}/${carVr.imgName}&title=${carViewVO.currRecord.cCarnum}&autoLoad=true');
					}
					</c:forEach>
				</script>
	</c:if>
			</div>
            <!-- Add Arrows -->
            <div class="swiper-button-next"></div>
            <div class="swiper-button-prev"></div>
            <div class="photo_num">
                <span class="swiper-pagination-current">1</span> / <span class="swiper-pagination-total">1</span>
            </div>
		  <script>
			<!--
			$(window).ready(function(){
				setTimeout(function() {

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

				}, 1700);				

			});
			//-->
		  </script>
        </div>
    </div>
    <!-- [e]bigimg-->
    <!-- [s]detailCon01 -->
    <div class="column detailCon01">
        <div class="row detail_box">
        	<div class="car-icon">
				<i class="label l2" style="display:none;" id="carAccidentIcon2">사고<br>이력</i>
	            <i class="label l3" <c:if test="${carViewVO.currRecord.cPremiumYn ne 'Y'}">style="display:none;"</c:if>>프리미엄</i>
	            <i class="label l6" <c:if test="${carViewVO.currRecord.cCertYn ne 'Y'}">style="display:none;"</c:if>>인증</i>
	            <i class="label l5" <c:if test="${fn:contains(carViewVO.currRecord.cHoticonCd, '02') eq false}">style="display:none;"</c:if>>특가</i>
	            <c:if test="${carViewVO.currRecord.cHomeserviceYn == 'Y'}">
	            <i class="label l4">홈<br>서비스<em>집까지탁송</em></i>
            </c:if>
            </div>
            <div class="detail_explain">${carViewVO.currRecord.cSubject}</div>
            <div class="detail_cartitle">${carTitle}</div>
            <div class="detail_text">${prodDate}<span>∙</span>${CommonUtil.numberFormat(carViewVO.currRecord.cMileage, "-")}km<span>∙</span>${carViewVO.currRecord.gearboxNm}<span>∙</span>${carViewVO.currRecord.fuelNm}</div>
            <p class="usedcar-icon">
            ${carViewVO.currRecord.cHoticonTag}
            </p>
            <span class="price">
	            <c:if test="${carViewVO.currRecord.cSalesCondCdNm ne null && carViewVO.currRecord.cSalesCondCdNm ne '현금'}">
	                ${carViewVO.currRecord.cSalesCondCdNm}
	            </c:if>
	            <c:if test="${carViewVO.currRecord.cSalesCondCdNm eq null || carViewVO.currRecord.cSalesCondCdNm eq '현금'}">
	                <c:if test="${carViewVO.currRecord.cSiteshowStatusCd eq 'R'}">계약중</c:if>
	                <c:if test="${carViewVO.currRecord.cSiteshowStatusCd ne 'R'}">
	                    <c:choose>
	                        <c:when test="${carViewVO.currRecord.cPrice eq 0 || carViewVO.currRecord.cPrice eq null}">가격문의</c:when>
	                        <c:when test="${carViewVO.currRecord.cPrice < 10000}">
	                            <strong class="big red">${CommonUtil.numberFormat(carViewVO.currRecord.cPrice, "-")}</strong>원
	                        </c:when>
	                        <c:otherwise>
	                            <strong class="big red">${CommonUtil.numberFormat(Math.floor(carViewVO.currRecord.cPrice/10000), "-")}</strong>만원
	                        </c:otherwise>
	                    </c:choose>
	                </c:if>
                </c:if>
            </span>
            <div class="titlebar-right-link">
                <button type="button" class="btn-sns" onClick="showLayerPopup('pop-sns');">
                    <span>소셜공유</span>
                </button>
                <c:choose>
                    <c:when test="${userVo == null}">
                        <button type="button" class="btn-favorite" onClick="alert('로그인 해 주세요')">
                            <span>찜</span>
                        </button>
                    </c:when>
                    <c:otherwise>
                        <button id="favBtn${carViewVO.currRecord.cNo}" type="button" class="btn-favorite <c:if test="${favStatus eq 'Y'}"> on</c:if>" onClick="toggleJJimCar('favBtn', '${carViewVO.currRecord.cNo}')">
                            <span>찜</span>
                        </button>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
    <!-- [e]detailCon01 -->
    <!-- [s]detailCon04 -->
    <div class="detailCon04">
        <ul>
            <c:choose>
                <c:when test="${carViewVO.currRecord.cCheckflag == 1 or (carViewVO.currRecord.cCheckflag == 2 && checkInfo.ucNo ne null)}">
                    <li class="detailbtn_01"><a href="javascript:openCarCheck();"><span class="icon01"></span>성능점검</a></li>
                </c:when>
                <c:otherwise>
                    <li class="detailbtn_01 off"><span class="icon01"></span>성능점검</li>
                </c:otherwise>
            </c:choose>
            <li class="detailbtn_02"><a href="javascript:popupCal();"><span class="icon02"></span>비용계산</a></li>
            <c:choose>
            <c:when test="${carViewVO.currRecord.caNo >= 0}"><li class="detailbtn_03"><a href="javascript:openCarHisotry();"><span class="icon03"></span>사고이력</a></li></c:when>
            <c:otherwise><li class="detailbtn_03 off"><span class="icon03"></span>사고이력</li></c:otherwise>
            </c:choose>
            <li class="detailbtn_04"><a href="javascript:gopage(5);"><span class="icon04"></span>판매자정보</a></li>
        </ul>
    </div>
    <!-- [e]detailCon04 -->
    <!-- [s]detailCon02 -->
    <div class="detailCon02">
        <table class="table_01" width="100%" border="0" cellspacing="0" cellpadding="0">
            <colgroup>
                <col style="width: 65px">
                <col style="width: *">
                <col style="width: 65px">
                <col tyle="width:*">
            </colgroup>
            <tbody>
                <tr>
                    <th>차종</th>
                    <c:choose>
                        <c:when test="${carViewVO.currRecord.bgName eq null}">
                            <td>-</td>
                        </c:when>
                        <c:otherwise>
                            <td>${carViewVO.currRecord.bgName}</td>
                        </c:otherwise>
                    </c:choose>
                    <th>차량번호</th>
                    <c:choose>
                        <c:when test="${carViewVO.currRecord.cCarnum eq null}">
                            <td>-</td>
                        </c:when>
                        <c:otherwise>
                            <td>${carViewVO.currRecord.cCarnum}</td>
                        </c:otherwise>
                    </c:choose>
                </tr>
                <tr>
                    <th>연식</th>
                    <c:choose>
                        <c:when test="${firstDate eq null}">
                            <td>-</td>
                        </c:when>
                        <c:otherwise>
                            <td>${firstDate}</td>
                        </c:otherwise>
                    </c:choose>
                    <th>주행거리</th>
                    <c:choose>
                        <c:when test="${carViewVO.currRecord.cMileage eq null}">
                            <td>-</td>
                        </c:when>
                        <c:otherwise>
                            <td>${CommonUtil.numberFormat(carViewVO.currRecord.cMileage, "-")}km</td>
                        </c:otherwise>
                    </c:choose>
                </tr>
                <tr>
                    <th>색상</th>
                    <c:choose>
                        <c:when test="${carViewVO.currRecord.bcName eq null}">
                            <td>-</td>
                        </c:when>
                        <c:otherwise>
                            <td>${carViewVO.currRecord.bcName}</td>
                        </c:otherwise>
                    </c:choose>
                    <th>변속기</th>
                    <c:choose>
                        <c:when test="${carViewVO.currRecord.gearboxNm eq null}">
                            <td>-</td>
                        </c:when>
                        <c:otherwise>
                            <td>${carViewVO.currRecord.gearboxNm}</td>
                        </c:otherwise>
                    </c:choose>
                </tr>
                <tr>
                    <th>배기량</th>
                    <c:choose>
                        <c:when test="${carViewVO.currRecord.cDisplacement eq null}">
                            <td>-</td>
                        </c:when>
                        <c:otherwise>
                            <td><fmt:formatNumber value="${carViewVO.currRecord.cDisplacement}" pattern="#,###" /> cc</td>
                        </c:otherwise>
                    </c:choose>
                    <th>압류저당</th>
                    <c:choose>
                        <c:when test="${carViewVO.currRecord.cSeizr > 0 or carViewVO.currRecord.cMrtg > 0}">
                            <td>있음</td>
                        </c:when>
                        <c:otherwise>
                            <td>없음</td>
                        </c:otherwise>
                    </c:choose>
                </tr>
                <tr>
                    <th>제시번호</th>
                    <c:choose>
                        <c:when test="${carViewVO.currRecord.cInnumber eq null}">
                            <td>-</td>
                        </c:when>
                        <c:otherwise>
                            <td>${carViewVO.currRecord.cInnumber}</td>
                        </c:otherwise>
                    </c:choose>
                    <th>제시일</th>
                    <c:choose>
                        <c:when test="${carViewVO.currRecord.cIndate eq null}">
                            <td>-</td>
                        </c:when>
                        <c:otherwise>
                            <td>${carViewVO.currRecord.cIndate}</td>
                        </c:otherwise>
                    </c:choose>
                </tr>
                <tr>
                    <th>최초등록</th>
                    <td>${firstDate}</td>
                    <th>조회수</th>
                    <c:choose>
                        <c:when test="${carViewVO.currRecord.cRef eq null}">
                            <td>-</td>
                        </c:when>
                        <c:otherwise>
                            <td>${carViewVO.currRecord.cRef}</td>
                        </c:otherwise>
                    </c:choose>
                </tr>
            </tbody>
        </table>
    </div>
    <!-- [e]detailCon02 -->
    <div class="divide"></div>
    <a name="go1" id="go1" style="display: block; transform: translateY(-50px);"></a>
    <!-- sub navigation -->
    <div class="column sub-nav col5">
        <ul>
            <li class="active"><a href="javascript:gopage(1)" title="차량옵션">차량옵션</a></li>
            <li><a href="javascript:gopage(2)" title="차량설명">차량설명</a></li>
            <li><a href="javascript:gopage(3)" title="성능정보">성능정보</a></li>
            <li><a href="javascript:gopage(4)" title="보험이력">보험이력</a></li>
            <li><a href="javascript:gopage(5)" title="판매자">판매자</a></li>
        </ul>
    </div>
    <!-- //sub navigation -->
    <div class="tabLayerClass" id="tabLayer1">
        <!--상세아이콘-->


        <ul id="option_icon_container" class="car_icon">
                    <c:choose>
                         <c:when test="${carViewVO.currRecord.sunRoofFg eq 0 || carViewVO.currRecord.sunRoofFg eq null}">
                            <li><img id="option_icon_1" src="/images/icon/sub_icon3.png" /><p>썬루프</p></li>
                         </c:when>
                         <c:otherwise>
                            <li><img id="option_icon_1" src="/images/icon/sub_icon3_on.png" /><p>썬루프</p></li>
                         </c:otherwise>
                    </c:choose>
                    <c:choose>
                         <c:when test="${carViewVO.currRecord.smartKeyFg eq 0 || carViewVO.currRecord.smartKeyFg eq null}">
                             <li><img id="option_icon_2" src="/images/icon/sub_icon1.png" /><p>스마트키</p></li>
                         </c:when>
                         <c:otherwise>
                             <li><img id="option_icon_2" src="/images/icon/sub_icon1_on.png" /><p>스마트키</p></li>
                         </c:otherwise>
                    </c:choose>

                    <c:choose>
                         <c:when test="${carViewVO.currRecord.leatherSeatFg eq 0 || carViewVO.currRecord.leatherSeatFg eq null}">
                             <li><img id="option_icon_3" src="/images/icon/sub_icon6.png" /><p>가죽시트</p></li>
                         </c:when>
                         <c:otherwise>
                             <li><img id="option_icon_3" src="/images/icon/sub_icon6_on.png" /><p>가죽시트</p></li>
                         </c:otherwise>
                    </c:choose>

                    <c:choose>
                         <c:when test="${carViewVO.currRecord.heatSeatFg eq 0 || carViewVO.currRecord.heatSeatFg eq null}">
                             <li><img id="option_icon_4" src="/images/icon/sub_icon7.png" /><p>열선시트</p></li>
                         </c:when>
                         <c:otherwise>
                             <li><img id="option_icon_4" src="/images/icon/sub_icon7_on.png" /><p>열선시트</p></li>
                         </c:otherwise>
                    </c:choose>

                    <c:choose>
                         <c:when test="${carViewVO.currRecord.naviFg eq 0 || carViewVO.currRecord.naviFg eq null}">
                             <li><img id="option_icon_5" src="/images/icon/sub_icon9.png" /><p>네비게이션</p></li>
                         </c:when>
                         <c:otherwise>
                             <li><img id="option_icon_5" src="/images/icon/sub_icon9_on.png" /><p>네비게이션</p></li>
                         </c:otherwise>
                    </c:choose>

                    <c:choose>
                         <c:when test="${carViewVO.currRecord.aloyWheelFg eq 0 || carViewVO.currRecord.aloyWheelFg eq null}">
                             <li><img id="option_icon_6" src="/images/icon/sub_icon4.png" /><p>통풍시트</p></li>
                         </c:when>
                         <c:otherwise>
                             <li><img id="option_icon_6" src="/images/icon/sub_icon4_on.png" /><p>통풍시트</p></li>
                         </c:otherwise>
                    </c:choose>

                    <c:choose>
                         <c:when test="${carViewVO.currRecord.hidFg eq 0 || carViewVO.currRecord.hidFg eq null}">
                             <li><img id="option_icon_7" src="/images/icon/sub_icon5.png" /><p>후방카메라</p></li>
                         </c:when>
                         <c:otherwise>
                             <li><img id="option_icon_7" src="/images/icon/sub_icon5_on.png" /><p>후방카메라</p></li>
                         </c:otherwise>
                    </c:choose>

                    <c:choose>
                         <c:when test="${carViewVO.currRecord.heatSteerFg eq 0 || carViewVO.currRecord.heatSteerFg eq null}">
                             <li><img id="option_icon_8" src="/images/icon/sub_icon2.png" /><p>핸들열선</p></li>
                         </c:when>
                         <c:otherwise>
                             <li><img id="option_icon_8" src="/images/icon/sub_icon2_on.png" /><p>핸들열선</p></li>
                         </c:otherwise>
                    </c:choose>

                    <c:choose>
                         <c:when test="${carViewVO.currRecord.hipassFg eq 0 || carViewVO.currRecord.hipassFg eq null}">
                             <li><img id="option_icon_9" src="/images/icon/sub_icon8.png" /><p>차선이탈경보</p></li>
                         </c:when>
                         <c:otherwise>
                             <li><img id="option_icon_9" src="/images/icon/sub_icon8_on.png" /><p>차선이탈경보</p></li>
                         </c:otherwise>
                    </c:choose>

                    <c:choose>
                         <c:when test="${carViewVO.currRecord.airbagFg eq 0 || carViewVO.currRecord.airbagFg eq null}">
                             <li><img id="option_icon_10" src="/images/icon/sub_icon10.png" /><p>차선이탈경보</p></li>
                         </c:when>
                         <c:otherwise>
                             <li><img id="option_icon_10" src="/images/icon/sub_icon10_on.png" /><p>차선이탈경보</p></li>
                         </c:otherwise>
                    </c:choose>


        </ul>
        <button type="button" class="btn_toggle whtie fuc_toggle" onclick="toggleOptionDetail();">옵션전체보기</button>
        <div class="fuc_wrap" style="display: none;">
            <ul class="detail_tab01">
                <li>
                    <p class="title">외장</p>
                    <ul id="option_2"></ul>
                </li>
                <li>
                    <p class="title">내장</p>
                    <ul id="option_3"></ul>
                </li>
                <li>
                    <p class="title">안전</p>
                    <ul id="option_4"></ul>
                </li>
                <li>
                    <p class="title">편의</p>
                    <ul id="option_5"></ul>
                </li>
                <li>
                    <p class="title">멀티미디어</p>
                    <ul id="option_6"></ul>
                </li>
            </ul>
        </div>
    </div>
    <div class="divide"></div>
    <a name="go2" id="go2" style="display: block; transform: translateY(-50px)"></a>
    <!-- sub navigation -->
    <div class="column sub-nav col5">
        <ul>
            <li><a href="javascript:gopage(1)" title="차량옵션">차량옵션</a></li>
            <li class="active"><a href="javascript:gopage(2)" title="차량설명">차량설명</a></li>
            <li><a href="javascript:gopage(3)" title="성능정보">성능정보</a></li>
            <li><a href="javascript:gopage(4)" title="보험이력">보험이력</a></li>
            <li><a href="javascript:gopage(5)" title="판매자">판매자</a></li>
        </ul>
    </div>
    <!-- //sub navigation -->
    <!-- 차량설명 -->
    <div class="column" style="clear: both">
        <c:choose>
            <c:when test="${not empty carViewVO.currRecord.cMemo}">
                <div class="row car-explain">${carViewVO.currRecord.cMemo}</div>
            </c:when>
            <c:otherwise>
                <div class="row data-empty">등록된 설명이 없습니다.</div>
            </c:otherwise>
        </c:choose>
    </div>
    <!-- 차량설명 -->
    <div class="divide"></div>
    <a name="go3" id="go3" style="display: block; transform: translateY(-50px);"></a>
    <!-- sub navigation -->
    <div class="column sub-nav col5">
        <ul>
            <li><a href="javascript:gopage(1)" title="차량옵션">차량옵션</a></li>
            <li><a href="javascript:gopage(2)" title="차량설명">차량설명</a></li>
            <li class="active"><a href="javascript:gopage(3)" title="성능정보">성능정보</a></li>
            <li><a href="javascript:gopage(4)" title="보험이력">보험이력</a></li>
            <li><a href="javascript:gopage(5)" title="판매자">판매자</a></li>
        </ul>
    </div>
    <!-- //sub navigation -->
    <c:choose>
        <c:when test="${carViewVO.currRecord.cCheckflag == 1 or (carViewVO.currRecord.cCheckflag == 2 && checkInfo.ucNo ne null)}">
            <div class="tabLayerClass" id="tabLayer3">
                <table class="t_normal" cellpadding="0" cellspacing="0">
                    <colgroup>
                        <col style="width: 150px;">
                        <col>
                    </colgroup>
                    <tr>
                        <th>중고차 성능점검센터</th>
                        <td>${carViewVO.currRecord.ucChkCenter}</td>
                    </tr>
                    <tr>
                        <th>중고차 점검자</th>
                        <td>${carViewVO.currRecord.ucChkName}</td>
                    </tr>
                </table>

                <c:if test="${carViewVO.currRecord.cCheckflag == 2 && checkInfo.ucNo ne null}">
                <!-- check-car-wrap -->
                <div class="check-car-wrap">
                    <div class="check-car" id="CarCheckState">
                        <!-- 상태표시등록 -->
                        <img src="/images/checkcar/check_link_bg.png" class="check_link_bg" />
                        <!--//상태표시등록 -->
                        <div class="condition-mark" id="CheckMark">
                            <!-- 좌측 -->
                            <p class="check_FL_foglamp" style="display: none;" id="check1">FL안개등</p>
                            <p class="check_FL_wheel" style="display: none;" id="check2">FL휠타이어</p>
                            <p class="check_RL_wheel" style="display: none;" id="check12">RL휠타이어</p>
                            <p class="check_L_side" style="display: none;" id="check4">L사이드실</p>
                            <p class="check_L_fender" style="display: none;" id="check3">L휀다</p>
                            <p class="check_FL_door" style="display: none;" id="check5">FL도어</p>
                            <p class="check_RL_door" style="display: none;" id="check9">RL도어</p>
                            <p class="check_L_quarterpanel" style="display: none;" id="check13">L쿼터패널</p>
                            <p class="check_RL_foglamp" style="display: none;" id="check14">RL안개등</p>
                            <p class="check_LA_filler" style="display: none;" id="check7">LA필러</p>
                            <p class="check_LB_filler" style="display: none;" id="check8">LB필러</p>
                            <p class="check_LC_filler" style="display: none;" id="check11">LC필러</p>
                            <p class="check_FL_window" style="display: none;" id="check6">FL윈도우</p>
                            <p class="check_RL_window" style="display: none;" id="check10">RL윈도우</p>
                            <!--//좌측 -->
                            <!-- 상단 -->
                            <p class="check_F_bumper" style="display: none;" id="check15">F범퍼</p>
                            <p class="check_grill" style="display: none;" id="check16">그릴/라디에이터 서포트</p>
                            <p class="check_L_lamp" style="display: none;" id="check17">L램프</p>
                            <p class="check_R_lamp" style="display: none;" id="check18">R램프</p>
                            <p class="check_bonnet" style="display: none;" id="check19">후드</p>
                            <p class="check_F_window" style="display: none;" id="check20">F윈도우</p>
                            <p class="check_R_window" style="display: none;" id="check24">R윈도우</p>
                            <p class="check_roof" style="display: none;" id="check23">루프</p>
                            <p class="check_L_mirror" style="display: none;" id="check21">L미러</p>
                            <p class="check_R_mirror" style="display: none;" id="check22">R미러</p>
                            <p class="check_trunk" style="display: none;" id="check26">트렁크리드</p>
                            <p class="check_L_taillight" style="display: none;" id="check25">L후미등</p>
                            <p class="check_R_taillight" style="display: none;" id="check27">R후미등</p>
                            <p class="check_R_bumper" style="display: none;" id="check28">R범퍼</p>
                            <!--//상단 -->
                            <!-- 하체 -->
                            <p class="check_F_panel" style="display: none;" id="check29">프론트패널</p>
                            <p class="check_FL_insidepanel" style="display: none;" id="check30">FL인사이드패널</p>
                            <p class="check_FL_sidemember" style="display: none;" id="check31">FL사이드멤버</p>
                            <p class="check_FL_wheelhouse" style="display: none;" id="check34">FL휠하우스</p>
                            <p class="check_FR_insidepanel" style="display: none;" id="check33">FR인사이드패널</p>
                            <p class="check_FR_sidemember" style="display: none;" id="check32">FR사이드멤버</p>
                            <p class="check_FR_wheelhouse" style="display: none;" id="check35">FR휠하우스</p>
                            <p class="check_crossmember" style="display: none;" id="check36">크로스멤버</p>
                            <p class="check_dashpanel" style="display: none;" id="check37">대쉬패널</p>
                            <p class="check_floorpanel" style="display: none;" id="check38">플로어패널</p>
                            <p class="check_packagetray" style="display: none;" id="check39">패키지트레이</p>
                            <p class="check_RL_wheelhouse" style="display: none;" id="check40">RL휠하우스</p>
                            <p class="check_RL_sidemember" style="display: none;" id="check41">RL사이드멤버</p>
                            <p class="check_trunkfloor" style="display: none;" id="check42">트렁크플로어</p>
                            <p class="check_RR_sidemember" style="display: none;" id="check43">RR사이드멤버</p>
                            <p class="check_RR_wheelhouse" style="display: none;" id="check44">RR휠하우스</p>
                            <p class="check_rearpanel" style="display: none;" id="check45">리어패널</p>
                            <!--//하체 -->
                            <!-- 우측 -->
                            <p class="check_FR_foglamp" style="display: none;" id="check46">FR안개등</p>
                            <p class="check_FR_wheel" style="display: none;" id="check48">FR휠타이어</p>
                            <p class="check_RR_wheel" style="display: none;" id="check58">RR휠타이어</p>
                            <p class="check_R_side" style="display: none;" id="check52">R사이드실</p>
                            <p class="check_R_fender" style="display: none;" id="check47">R휀다</p>
                            <p class="check_FR_door" style="display: none;" id="check51">FR도어</p>
                            <p class="check_RR_door" style="display: none;" id="check55">RR도어</p>
                            <p class="check_R_quarterpanel" style="display: none;" id="check57">R쿼터패널</p>
                            <p class="check_RR_foglamp" style="display: none;" id="check59">RR안개등</p>
                            <p class="check_RA_filler" style="display: none;" id="check49">RA필러</p>
                            <p class="check_RB_filler" style="display: none;" id="check53">RB필러</p>
                            <p class="check_RC_filler" style="display: none;" id="check56">RC필러</p>
                            <p class="check_FR_window" style="display: none;" id="check50">FR윈도우</p>
                            <p class="check_RR_window" style="display: none;" id="check54">RR윈도우</p>
                            <!--//우측 -->
                            <p class="check_radiator" style="display: none;" id="check60">라디에이터 서포트</p>
                        </div>
                        <div id="flag5" style="position: absolute; z-index: 999; left: 52px; top: 184px; display: none;">
                            <span class="i-mark" id="flag_5" pos="5"></span>
                        </div>
                        <div id="flag9" style="position: absolute; z-index: 999; left: 52px; top: 264px; display: none;">
                            <span class="i-mark" id="flag_9" pos="9"></span>
                        </div>
                        <div id="flag13" style="position: absolute; z-index: 999; left: 72px; top: 350px; display: none;">
                            <span class="i-mark" id="flag_13" pos="13"></span>
                        </div>
                        <div id="flag10" style="position: absolute; z-index: 999; left: 110px; top: 268px; display: none;">
                            <span class="i-mark" id="flag_10" pos="10"></span>
                        </div>
                        <div id="flag12" style="position: absolute; z-index: 999; left: 24px; top: 330px; display: none;">
                            <span class="i-mark" id="flag_12" pos="12"></span>
                        </div>
                        <div id="flag2" style="position: absolute; z-index: 999; left: 24px; top: 80px; display: none;">
                            <span class="i-mark" id="flag_2" pos="2"></span>
                        </div>
                        <div id="flag3" style="position: absolute; z-index: 999; left: 60px; top: 114px; display: none;">
                            <span class="i-mark" id="flag_3" pos="3"></span>
                        </div>
                        <div id="flag1" style="position: absolute; z-index: 999; left: 32px; top: 12px; display: none;">
                            <span class="i-mark" id="flag_1" pos="1"></span>
                        </div>
                        <div id="flag6" style="position: absolute; z-index: 999; left: 110px; top: 184px; display: none;">
                            <span class="i-mark" id="flag_6" pos="6"></span>
                        </div>
                        <div id="flag8" style="position: absolute; z-index: 999; left: 106px; top: 234px; display: none;">
                            <span class="i-mark" id="flag_8" pos="8"></span>
                        </div>
                        <div id="flag7" style="position: absolute; z-index: 999; left: 116px; top: 164px; display: none;">
                            <span class="i-mark" id="flag_7" pos="7"></span>
                        </div>
                        <div id="flag11" style="position: absolute; z-index: 999; left: 130px; top: 300px; display: none;">
                            <span class="i-mark" id="flag_11" pos="11"></span>
                        </div>
                        <div id="flag14" style="position: absolute; z-index: 999; left: 30px; top: 424px; display: none;">
                            <span class="i-mark" id="flag_14" pos="14"></span>
                        </div>
                        <div id="flag28" style="position: absolute; z-index: 999; left: 250px; top: 428px; display: none;">
                            <span class="i-mark" id="flag_28" pos="28"></span>
                        </div>
                        <div id="flag26" style="position: absolute; z-index: 999; left: 250px; top: 386px; display: none;">
                            <span class="i-mark" id="flag_26" pos="26"></span>
                        </div>
                        <div id="flag25" style="position: absolute; z-index: 999; left: 170px; top: 390px; display: none;">
                            <span class="i-mark" id="flag_25" pos="25"></span>
                        </div>
                        <div id="flag27" style="position: absolute; z-index: 999; left: 330px; top: 390px; display: none;">
                            <span class="i-mark" id="flag_27" pos="27"></span>
                        </div>
                        <div id="flag23" style="position: absolute; z-index: 999; left: 250px; top: 244px; display: none;">
                            <span class="i-mark" id="flag_23" pos="23"></span>
                        </div>
                        <div id="flag21" style="position: absolute; z-index: 999; left: 160px; top: 150px; display: none;">
                            <span class="i-mark" id="flag_21" pos="21"></span>
                        </div>
                        <div id="flag22" style="position: absolute; z-index: 999; left: 340px; top: 150px; display: none;">
                            <span class="i-mark" id="flag_22" pos="22"></span>
                        </div>
                        <div id="flag24" style="position: absolute; z-index: 999; left: 250px; top: 344px; display: none;">
                            <span class="i-mark" id="flag_24" pos="24"></span>
                        </div>
                        <div id="flag20" style="position: absolute; z-index: 999; left: 250px; top: 144px; display: none;">
                            <span class="i-mark" id="flag_20" pos="20"></span>
                        </div>
                        <div id="flag19" style="position: absolute; z-index: 999; left: 250px; top: 54px; display: none;">
                            <span class="i-mark" id="flag_19" pos="19"></span>
                        </div>
                        <div id="flag18" style="position: absolute; z-index: 999; left: 304px; top: 10px; display: none;">
                            <span class="i-mark" id="flag_18" pos="18"></span>
                        </div>
                        <div id="flag17" style="position: absolute; z-index: 999; left: 190px; top: 10px; display: none;">
                            <span class="i-mark" id="flag_17" pos="17"></span>
                        </div>
                        <div id="flag16" style="position: absolute; z-index: 999; left: 250px; top: 0px; display: none;">
                            <span class="i-mark" id="flag_16" pos="16"></span>
                        </div>
                        <div id="flag15" style="position: absolute; z-index: 999; left: 190px; top: -10px; display: none;">
                            <span class="i-mark" id="flag_15" pos="15"></span>
                        </div>
                        <div id="flag60" style="position: absolute; z-index: 999; left: 460px; top: 14px; display: none;">
                            <span class="i-mark" id="flag_60" pos="60"></span>
                        </div>
                        <div id="flag29" style="position: absolute; z-index: 999; left: 460px; top: 41px; display: none;">
                            <span class="i-mark" id="flag_29" pos="29"></span>
                        </div>
                        <div id="flag32" style="position: absolute; z-index: 999; left: 496px; top: 100px; display: none;">
                            <span class="i-mark" id="flag_32" pos="32"></span>
                        </div>
                        <div id="flag33" style="position: absolute; z-index: 999; left: 522px; top: 78px; display: none;">
                            <span class="i-mark" id="flag_33" pos="33"></span>
                        </div>
                        <div id="flag35" style="position: absolute; z-index: 999; left: 521px; top: 121px; display: none;">
                            <span class="i-mark" id="flag_35" pos="35"></span>
                        </div>
                        <div id="flag31" style="position: absolute; z-index: 999; left: 426px; top: 100px; display: none;">
                            <span class="i-mark" id="flag_31" pos="31"></span>
                        </div>
                        <div id="flag30" style="position: absolute; z-index: 999; left: 400px; top: 78px; display: none;">
                            <span class="i-mark" id="flag_30" pos="30"></span>
                        </div>
                        <div id="flag34" style="position: absolute; z-index: 999; left: 401px; top: 121px; display: none;">
                            <span class="i-mark" id="flag_34" pos="34"></span>
                        </div>
                        <div id="flag36" style="position: absolute; z-index: 999; left: 460px; top: 146px; display: none;">
                            <span class="i-mark" id="flag_36" pos="36"></span>
                        </div>
                        <div id="flag37" style="position: absolute; z-index: 999; left: 460px; top: 172px; display: none;">
                            <span class="i-mark" id="flag_37" pos="37"></span>
                        </div>
                        <div id="flag38" style="position: absolute; z-index: 999; left: 460px; top: 240px; display: none;">
                            <span class="i-mark" id="flag_38" pos="38"></span>
                        </div>
                        <div id="flag39" style="position: absolute; z-index: 999; left: 460px; top: 314px; display: none;">
                            <span class="i-mark" id="flag_39" pos="39"></span>
                        </div>
                        <div id="flag42" style="position: absolute; z-index: 999; left: 460px; top: 340px; display: none;">
                            <span class="i-mark" id="flag_42" pos="42"></span>
                        </div>
                        <div id="flag44" style="position: absolute; z-index: 999; left: 520px; top: 340px; display: none;">
                            <span class="i-mark" id="flag_44" pos="44"></span>
                        </div>
                        <div id="flag41" style="position: absolute; z-index: 999; left: 430px; top: 350px; display: none;">
                            <span class="i-mark" id="flag_41" pos="41"></span>
                        </div>
                        <div id="flag43" style="position: absolute; z-index: 999; left: 492px; top: 350px; display: none;">
                            <span class="i-mark" id="flag_43" pos="43"></span>
                        </div>
                        <div id="flag40" style="position: absolute; z-index: 999; left: 402px; top: 340px; display: none;">
                            <span class="i-mark" id="flag_40" pos="40"></span>
                        </div>
                        <div id="flag45" style="position: absolute; z-index: 999; left: 460px; top: 386px; display: none;">
                            <span class="i-mark" id="flag_45" pos="45"></span>
                        </div>
                        <div id="flag46" style="position: absolute; z-index: 999; left: 676px; top: 12px; display: none;">
                            <span class="i-mark" id="flag_46" pos="46"></span>
                        </div>
                        <div id="flag48" style="position: absolute; z-index: 999; left: 686px; top: 80px; display: none;">
                            <span class="i-mark" id="flag_48" pos="48"></span>
                        </div>
                        <div id="flag47" style="position: absolute; z-index: 999; left: 646px; top: 115px; display: none;">
                            <span class="i-mark" id="flag_47" pos="47"></span>
                        </div>
                        <div id="flag49" style="position: absolute; z-index: 999; left: 590px; top: 160px; display: none;">
                            <span class="i-mark" id="flag_49" pos="49"></span>
                        </div>
                        <div id="flag50" style="position: absolute; z-index: 999; left: 600px; top: 196px; display: none;">
                            <span class="i-mark" id="flag_50" pos="50"></span>
                        </div>
                        <div id="flag51" style="position: absolute; z-index: 999; left: 660px; top: 184px; display: none;">
                            <span class="i-mark" id="flag_51" pos="51"></span>
                        </div>
                        <div id="flag55" style="position: absolute; z-index: 999; left: 660px; top: 264px; display: none;">
                            <span class="i-mark" id="flag_55" pos="55"></span>
                        </div>
                        <div id="flag54" style="position: absolute; z-index: 999; left: 600px; top: 276px; display: none;">
                            <span class="i-mark" id="flag_54" pos="54"></span>
                        </div>
                        <div id="flag53" style="position: absolute; z-index: 999; left: 600px; top: 234px; display: none;">
                            <span class="i-mark" id="flag_53" pos="53"></span>
                        </div>
                        <div id="flag56" style="position: absolute; z-index: 999; left: 586px; top: 334px; display: none;">
                            <span class="i-mark" id="flag_56" pos="56"></span>
                        </div>
                        <div id="flag57" style="position: absolute; z-index: 999; left: 654px; top: 376px; display: none;">
                            <span class="i-mark" id="flag_57" pos="57"></span>
                        </div>
                        <div id="flag58" style="position: absolute; z-index: 999; left: 686px; top: 330px; display: none;">
                            <span class="i-mark" id="flag_58" pos="58"></span>
                        </div>
                        <div id="flag59" style="position: absolute; z-index: 999; left: 680px; top: 424px; display: none;">
                            <span class="i-mark" id="flag_59" pos="59"></span>
                        </div>
                        <div id="flag52" style="position: absolute; z-index: 999; left: 690px; top: 200px; display: none;">
                            <span class="i-mark" id="flag_52" pos="52"></span>
                        </div>
                        <div id="flag4" style="position: absolute; z-index: 999; left: 20px; top: 200px; display: none;">
                            <span class="i-mark" id="flag_4" pos="4"></span>
                        </div>
                    </div>
                </div>
                <input type="hidden" name="ucImgoncheck" id="ucImgoncheck" value='${checkInfo.ucImgoncheck}' />
                <!--// check-car-wrap -->
                <div class="check-car-info">
                    <span class="i-mark bg-x">X</span> 교환 <strong id="checkCountX">-</strong> <span class="i-mark bg-w">W</span> 판금/용접 <strong id="checkCountW">-</strong> <span class="i-mark bg-c">C</span> 부식 <strong id="checkCountC">-</strong><br /> <span class="i-mark bg-a">A</span> 흠집 <strong id="checkCountA">-</strong> <span class="i-mark bg-u">U</span> 요철 <strong id="checkCountU">-</strong> <span class="i-mark bg-t">T</span> 손상 <strong id="checkCountT">-</strong>
                    <div class="button-group">
                        <button type="button" class="button color-blackdark" onClick="openCarCheck();">성능·상태점검기록부 확인하기</button>
                    </div>
                </div>
                <script>
					if (jQuery("#ucImgoncheck").val()) {
						var objImgoncheck = JSON.parse(jQuery("#ucImgoncheck").val());

						var cntX = 0;
						var cntW = 0;
						var cntC = 0;
						var cntA = 0;
						var cntU = 0;
						var cntT = 0;

						jQuery.each(objImgoncheck, function(i, value) {
							jQuery("#check" + i).show();

							jQuery("#flag_" + i).text(value).addClass("bg-" + value.toLowerCase());
							jQuery("#flag" + i).show();
							if (value == "X") {
								cntX += 1
							}
							if (value == "W") {
								cntW += 1
							}
							if (value == "C") {
								cntC += 1
							}
							if (value == "A") {
								cntA += 1
							}
							if (value == "U") {
								cntU += 1
							}
							if (value == "T") {
								cntT += 1
							}
						});

						jQuery("#checkCountX").text(cntX);
						jQuery("#checkCountW").text(cntW);
						jQuery("#checkCountC").text(cntC);
						jQuery("#checkCountA").text(cntA);
						jQuery("#checkCountU").text(cntU);
						jQuery("#checkCountT").text(cntT);
					}
				</script>
                </c:if>
                <c:if test="${carViewVO.currRecord.cCheckflag == 1}">
                <div class="check-car-wrap outside_data">
                    <button type="button" class="button color-blackdark" onClick="openCarCheck();">성능·상태점검기록부 확인하기</button>
                </div>
                </c:if>
            </div>
        </c:when>
        <c:otherwise>
            <div class="row data-empty">등록된 성능점검 내역이 없습니다.</div>
        </c:otherwise>
    </c:choose>
    <div class="divide"></div>
    <a name="go4" id="go4" style="display: block; transform: translateY(-50px);"></a>
    <!-- sub navigation -->
    <div class="column sub-nav col5">
        <ul>
            <li><a href="javascript:gopage(1);" title="차량옵션">차량옵션</a></li>
            <li><a href="javascript:gopage(2);" title="차량설명">차량설명</a></li>
            <li><a href="javascript:gopage(3);" title="성능정보">성능정보</a></li>
            <li class="active"><a href="javascript:gopage(4);" title="보험이력">보험이력</a></li>
            <li><a href="javascript:gopage(5);" title="판매자">판매자</a></li>
        </ul>
    </div>
    <!-- //sub navigation -->
    <!-- [s]detailCon03 -->
    <div class="detailCon03" id="carAccidentRow" style="display: none;">
        <div class="column">
            <ul class="bohum">
                <li id="DT_r401_402">내차피해<span class="DT_r402"></span><strong class="DT_r401">-</strong></li>
                <li id="DT_r403_404">타차가해<span class="DT_r404"></span><strong class="DT_r403">-</strong></li>
            </ul>
            <table class="t_normal" cellpadding="0" cellspacing="0">
                <colgroup>
                    <col style="width: 100px;">
                    <col>
                    <col style="width: 100px;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th>전손사고</th>
                        <td class="DT_r405">-</td>
                        <th>도난사고</th>
                        <td class="DT_r409">-</td>
                    </tr>
                    <tr>
                        <th>침수사고</th>
                        <td class="DT_r407">-</td>
                        <th>특수용도</th>
                        <td class="DT_r300">-</td>
                    </tr>
                    <tr>
                        <th>차량번호 변경</th>
                        <td class="DT_r201">-</td>
                        <th>소유자 변경</th>
                        <td class="DT_r204">-</td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="button-group">
            <button type="button" class="button color-blackdark" onclick="openCarHisotry();">보험이력 상세보기</button>
        </div>
        <div class="ex-box">
            <p>
                자동차보험 사고기록이 없었다고 해서 반드시 <strong>무사고</strong>라고 할 수는 없습니다.
            </p>
        </div>
    </div>
    <div class="detailCon03" id="carAccidentEmptyRow" style="display: none;">
        <input type="hidden" id="hasCarAccident" value="">
        <div class="data-empty">등록된 사고이력 데이터가 없습니다.</div>
    </div>
    <!-- [e]detailCon03 -->
    <div class="divide"></div>
    <a name="go5" id="go5" style="display: block; transform: translateY(-50px);"></a>
    <!-- sub navigation -->
    <div class="column sub-nav col5">
        <ul>
            <li><a href="javascript:gopage(1);" title="차량옵션">차량옵션</a></li>
            <li><a href="javascript:gopage(2);" title="차량설명">차량설명</a></li>
            <li><a href="javascript:gopage(3);" title="성능정보">성능정보</a></li>
            <li><a href="javascript:gopage(4);" title="보험이력">보험이력</a></li>
            <li class="active"><a href="javascript:gopage(5);" title="판매자">판매자</a></li>
        </ul>
    </div>
    <!-- //sub navigation -->
    <!-- [s]detailCon02 -->
    <div class="detailCon02">
        <div class="seller-info">
            <div class="photo" style="background-image:url('${dealerBaseUrl}/${carViewVO.currRecord.dlImage}'), url('${dealerNoImage}');"></div>
            <ul>
                <li><strong class="title">${carViewVO.currRecord.coName}</strong></li>
                <li><span>카메니저</span> ${carViewVO.currRecord.dlName}<br> <span>보유차량</span> ${carViewVO.currRecord.dlCarCount}대<br> <span>매매사원증</span> ${carViewVO.currRecord.dlNumber}</li>
                <li class="phone">
                    <button type="button" class="btn-call" onClick="location.href='tel:${carViewVO.currRecord.dlHp}'">${carViewVO.currRecord.dlHp}</button>
                </li>
            </ul>
        </div>
    </div>
    <!-- [e]detailCon02 -->
	<h2 class="h2" style="padding-left:1rem;padding-top:1.5rem;font-size:1rem;">차량위치</h2>
	<h3 id="d_floor" class="floor m_location">-</h3>
		<div id="d_map_floor" class="map_floor">
			<div id="d_car" class="car"><span></span></div>
			<svg class="map_wrap " role="img">
			</svg>
		</div>
        <div id="d_map_floor_empty" style="display:none;" class="data-empty">차량위치정보가 없습니다.</div>

    <div class="divide"></div>
    <div class="row ex-box">
        <div class="column">
            <h4>책임의 한계 및 법적고지</h4>
            <p>부산오토필드는 단지 내의 차량에 대하여 차량정보를 제공하고 있으며 등록된 차량에 대한 모든 책임은 딜러에게 있습니다.</p>
            <p>차량구매시 반드시 홈페이지의 등록된 정보사항을 판매자에게 확인 후 거래하시기 바랍니다.</p>
        </div>
    </div>
    <!-- [s]detailCon06 -->
    <div class="detailCon06_Wrap">
        <div class="detailCon06" style="bottom: 0px; position: relative;">
            <ul>
                <li class="massage"><a href="sms:${carViewVO.currRecord.dlHp}">문자하기</a></li>
                <li class="tel"><a href="tel:${carViewVO.currRecord.dlHp}">전화하기</a></li>
            </ul>
        </div>
    </div>
    <!-- [e]detailCon06 -->
    <%@ include file="/include/footer.jsp"%>
    <button type="button" class="btn-top">
        <span>Top</span>
    </button>
</div>
<!-- //container -->
<!-- sns 팝업 -->
<div class="modal-popup ty02 pop-sns">
    <div class="pop-header">
        <span>공유하기</span>
        <button class="btn-pop-close2" onClick="closeLayerPopup();">
            <span class="hide">닫기</span>
        </button>
    </div>
    <div class="pop-content">
        <ul id="sns">
            <li><a href="javascript:sendSns('kakaotalk')"><span class="sns-kakaotalk"></span>카카오톡</a></li>
            <li><a href="javascript:sendSns('band')"><span class="sns-band"></span>밴드</a></li>
            <li><a href="javascript:sendSns('kakaostory')"><span class="sns-kakaostory"></span>카스</a></li>
            <li><a href="javascript:sendSns('twitter')"><span class="sns-twitter"></span>트위터</a></li>
            <li><a href="javascript:sendSns('facebook')"><span class="sns-facebook"></span>페이스북</a></li>
            <li><a href="javascript:sendSns('line')"><span class="sns-line"></span>라인</a></li>
        </ul>
    </div>
</div>
<!--// sns 팝업 -->
<script src="/js/kakao.min.js"></script>
<script type="text/javascript">
	Kakao.init('${kakaoApiKey}');

	/* 탭이동 */
	function gopage(num) {
		var scrollH = $('#go' + num).offset().top;
		$('html, body').animate({
			scrollTop : scrollH
		}, 200);
	}

	/* 계산기 */
	function popupCal() {
		openPopup('car_detail_calc', '${carViewVO.currRecord.cNo}');
	}

	function toggleOption() {
		$('.fuc_wrap').toggle();
	}

	function loadOptions() {
		jQuery.ajax({
			type : "GET",
			url : "/car/selectCarOptionListAjax.do?c_no=${carViewVO.currRecord.cNo}",
			data : {},
			dataType : "JSON",
			success : function(json) {
				if (json.data) {
					initOptions(json.data)
				}
			},
			error : function() {
				alert('error');
			}
		});
	}

	function loadCarHistory() {
		var p_url = "/car/popCarAccidentAjax.do";
		var p_data = {
			"cNo" : "${carViewVO.currRecord.cNo}"
		};

		jQuery.ajax({
			type : "get",
			dataType : "json",
			url : p_url,
			data : p_data,
			cache : false,
			async : false,
			success : function(returnData) {
				if (returnData.success == true) {
					var row = returnData.data;
					var xml = row.caData;

					setDTR(xml, "405"); //전손사고
					setDTR(xml, "409"); //도난사고

					//침수사고
					var r407 = $(xml).find("r407").text() - 0;
					if ($(xml).find("r407").text() - 0 > 0) {
						$(".DT_r407").text(r407);
					} else {
						$(".DT_r407").text("0");
					}

					//특수용도
					setDTR(xml, "301");
					setDTR(xml, "302");
					setDTR(xml, "303");

					setDTR(xml, "201"); //차량번호변경
					setDTR(xml, "204"); //소유자변경

	                // 내차피해 회수가 0 이면 DT_r401_402 에 없음 처리
	                var r401 = $(xml).find("r401").text() - 0;
	                var r403 = $(xml).find("r403").text() - 0;
	                if(r401 == 0) {
	                	$("#DT_r401_402").html("내차피해<strong>없음</strong>");
	                } else {
						setDTR(xml, "401"); //내차피해
						setDTR(xml, "402");
	                }
	                if(r403 == 0) {
	                	$("#DT_r403_404").html("타차가해<strong>없음</strong>");
	                } else {
						setDTR(xml, "403");
						setDTR(xml, "404");
	                }

					$("#hasCarAccident").val(true);
					$("#carAccidentRow").show();
				} else {
					$("#hasCarAccident").val('');
					$("#carAccidentEmptyRow").show();
				}
			}
		});
	}

	function openCarCheck() {
		<c:choose>
		<c:when test="${carViewVO.currRecord.cCheckflag == 1}">
        //openPopup('car_detail_direct_repair', '${carViewVO.currRecord.cChecknum}');
        window.open('${checkUrl}?check_id=${carViewVO.currRecord.cChecknum}');
		</c:when>
		<c:when test="${carViewVO.currRecord.cCheckflag == 2 && checkInfo.ucNo ne null}">
        openPopup('car_detail_repair', '${carViewVO.currRecord.cNo}');
		</c:when>
		<c:otherwise>
		alert('등록된 성능점검 내역이 없습니다.');
		</c:otherwise>
		</c:choose>
	}

	function openCarHisotry() {
		if (!$("#hasCarAccident").val()) {
			alert('등록된 사고이력 데이터가 없습니다.');
			return;
		}

		openPopup('car_detail_accident', '${carViewVO.currRecord.cNo}');
	}

	function openZoom() {
		if (isMobile()) {
			<c:choose>
			<c:when test="${not empty carImageList}">
			var list = [];
			<c:forEach var="carImg" items="${carImageList}">
			list.push('${serverHost}${imagePath}/${carImg.imgName}');
			</c:forEach>

			location.href = "imagegallery:" + list.join("##");
			</c:when>
			<c:otherwise>
			alert("이미지가 존재하지 않습니다.");
			</c:otherwise>
			</c:choose>
		} else {
			window.open("/car/zoom.do?c_no=${carViewVO.currRecord.cNo}");
		}
	}

	function SetComma(numstr) {
		numstr = String(numstr);
		var re0 = /^(-?\d+)(\d{3})($|\..*$)/;
		if (re0.test(numstr))
			return numstr.replace(re0, function(str, p1, p2, p3) {
				return SetComma(p1) + ',' + p2 + p3;
			});
		else
			return numstr;
	}

	function setDTR(xml, key, camList) {
		var text = $(xml).find("r" + key).text();

		if (key == "402" || key == "404") {
			text = SetComma(text) + "원";
		}

		if (key == "409" || key == "405") {
			text = SetComma(text);
		}

		if (key == "201" || key == "204") {
			text = SetComma(text);
		}

		if (key == "301" || key == "302" || key == "303") {
			var title = "";
			switch (key) {
			case "301":
				title = "관용";
				break;

			case "302":
				title = "영업";
				break;

			case "303":
				title = "대여";
				break;
			}

			if (text == 'Y') {
				if ($(".DT_r300").text() != "-") {
					title = $(".DT_r300").text() + ", " + title;
				}

				$(".DT_r300").text(title);
			}

			return;
		}

		$(".DT_r" + key).text(text);
	}

	function initOptions(data) {
		var checkOptions = [ 9, 75, 21, [ 25, 26 ], 74, 14, 1, 0, 33, [ 41, 42 ] ];

		jQuery.each(checkOptions, function(i1, chkOpt) {
			var selectId = undefined;
			var chkIndex = i1 + 1;

			jQuery.each(data, function(i2, opt) {
				if (typeof chkOpt === 'object') {
					if (chkOpt.indexOf(opt.bpNo) !== -1) {
						selectId = chkIndex;
					}
				} else if (chkOpt === opt.bpNo) {
					selectId = chkIndex;
				}
			});

			if (selectId) {
				var srcArr = $("#option_icon_" + chkIndex).attr("src").split(".");

				if (srcArr.length === 2) {
					$("#option_icon_" + chkIndex).attr("src", srcArr[0] + "_on.png");
				}
			}
		});

		jQuery.each(data, function(i, opt) {
			jQuery("#option_" + opt.bpCate).append("<li>" + opt.bpName + "</li>");
		});
	}

	// 최근 본 상품 추가
	function addRecentCar() {
		var carId = "${carViewVO.currRecord.cNo}";

		if (carId !== "") {
			var recentList = decodeURIComponent(getCookie("recentCarIds"));
			var arrRecentList = recentList.split(";");

			var checkExistRecent = false;
			for ( var i in arrRecentList) {
				if (arrRecentList[i] === carId) {
					checkExistRecent = true;
					break;
				}
			}

			if (!checkExistRecent) {
				arrRecentList.unshift(carId);
				setCookie("recentCarIds", arrRecentList.join(";"), 365);
			}
		}
	}

	function sendSns(sns) {
		var o;
		var _url = location.href;
		var _txt = encodeURIComponent('${carTitle}');
		var _br = encodeURIComponent('\r\n');
		var _desc = "${prodDate}∙${CommonUtil.numberFormat(carViewVO.currRecord.cMileage, '-')}km∙${carViewVO.currRecord.gearboxNm}∙${carViewVO.currRecord.fuelNm}";

		switch (sns) {
		case 'facebook':
			o = {
				method : 'popup',
				url : 'http://www.facebook.com/sharer/sharer.php?u=' + _url + '&t=' + _txt
			};
			break;

		case 'twitter':
			o = {
				method : 'popup',
				url : 'http://twitter.com/share?url=' + _url + '&text=' + _txt
			};
			break;

		case 'line':
			o = {
				method : 'popup',
				url : 'https://social-plugins.line.me/lineit/share?url=' + _url
			};
			break;

		case 'band':
			o = {
				method : 'popup',
				url : 'https://band.us/plugin/share?body=' + _txt + '&route=' + _url
			};
			break;

		case 'kakaotalk':
			Kakao.Link.sendDefault({
				objectType : "feed",
				content : {
					title : '${carTitle}' // 콘텐츠의 타이틀
					,
					description : _desc,
					imageUrl : "/images/logo.png",
					link : {
						mobileWebUrl : _url // 모바일 카카오톡에서 사용하는 웹 링크 URL
						,
						webUrl : _url
					// PC버전 카카오톡에서 사용하는 웹 링크 URL
					}
				},
				buttons : [ {
					title : "매물 확인" // 버튼 제목
					,
					link : {
						mobileWebUrl : _url // 모바일 카카오톡에서 사용하는 웹 링크 URL
						,
						webUrl : _url
					// PC버전 카카오톡에서 사용하는 웹 링크 URL
					}
				} ]
			});
			return;

		case 'kakaostory':
			Kakao.Story.share({
				url : _url,
				text : '${carTitle}'
			});
			return;

		case 'band':
			o = {
				method : 'web2app',
				param : 'create/post?text=' + _txt + _br + _url,
				a_store : 'itms-apps://itunes.apple.com/app/id542613198?mt=8',
				g_store : 'market://details?id=com.nhn.android.band',
				a_proto : 'bandapp://',
				g_proto : 'scheme=bandapp;package=com.nhn.android.band'
			};
			break;

		default:
			alert('지원하지 않는 SNS입니다.');
			return false;
		}

		switch (o.method) {
		case 'popup':
			//window.open(o.url, "_blank");
			openNewPage(o.url);
			break;

		case 'web2app':
			if (navigator.userAgent.match(/android/i)) {
				// Android
				setTimeout(function() {
					location.href = 'intent://' + o.param + '#Intent;' + o.g_proto + ';end'
				}, 100);
			} else if (navigator.userAgent.match(/(iphone)|(ipod)|(ipad)/i)) {
				// Apple
				setTimeout(function() {
					location.href = o.a_store;
				}, 200);
				setTimeout(function() {
					location.href = o.a_proto + o.param
				}, 100);
			} else {
				alert('이 기능은 모바일에서만 사용할 수 있습니다.');
			}
			break;
		}
	}

	$(document).ready(function() {

		resetCarPosition();
		<c:if test="${not empty carViewVO.currRecord.cCarnum}">
		var data = {
			"carNo" : "${carViewVO.currRecord.cCarnum}"
		}
		//alert("${carViewVO.currRecord.cCarnum}");
		/* */
		jQuery.ajax({
			type : "GET",
			url : "/car/searchZigbeeCurrentLocationAjax.do",
			data : data,
			dataType : "JSON",
			success : function(returnData) {
				if (returnData.data && returnData.data.list && returnData.data.list.length > 0) {
					var json = returnData.data.list[0];
					setCarPosition(json.floorId, json.posX, json.posY);
					$("#d_map_floor").show();
					$("#d_map_floor_empty").hide();
				} else {
					resetCarPosition();
					$("#d_map_floor").hide();
					$("#d_map_floor_empty").show();
				}
			},
			error : function() {
				resetCarPosition();
				$("#d_map_floor").hide();
				$("#d_map_floor_empty").show();
			}
		});
		/* */
		</c:if>


		addRecentCar();

		/*하단 서비스 신청 버튼 & 탑버튼*/
		$(window).scroll(function() {
			var winH = $(window).height();
			var addH = $(".detailCon06_Wrap").outerHeight();
			var docH = $(".container").outerHeight() - winH - $(".header").outerHeight() - addH;
			var st = $(this).scrollTop();

			if (st < 100) {
				$(".detailCon06").css({
					"bottom" : "0",
					"position" : "relative"
				});
			} else {
				if (st > docH) {
					$(".detailCon06").css({
						"bottom" : "0",
						"position" : "relative"
					});
				} else {
					$(".detailCon06").css({
						"bottom" : "0px",
						"position" : "fixed"
					});
					$(".btn-top").css('bottom', '4rem');
				}
			}
		});

		loadOptions();

		loadCarHistory();

	});

	function toggleOptionDetail(){
		$('.fuc_toggle').toggleClass('open');
		$('.fuc_wrap').slideToggle();
	}

	function resetCarPosition() {
		$("#d_floor").text("-");
		$("#d_map_floor").attr("class", "map_floor");
		$("#d_car").hide();
	}

	// 도면 가로크기 : 2100
	function setCarPosition(floorId, posX, posY) {
		resetCarPosition();

		// 임시...
		if (floorId == "-1") {
			floorId = "B1";
		} else if (floorId == "-2") {
			floorId = "B2";
		} else if (floorId == "-3") {
			floorId = "B3";
		} else {
			floorId = floorId + "F";
		}

		if (floorId != "") {
			var x_p = (posX / 8);
			var y_p = (posY / 6);
			$("#d_floor").text(floorId);
			$("#d_map_floor").attr("class", "map_floor F_" + floorId);
			$("#d_car").show();
			$("#d_car").css("left", x_p + "%");
			$("#d_car").css("top", y_p + "%");
		}
	}
</script>

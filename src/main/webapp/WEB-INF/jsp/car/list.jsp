<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include/taglib_prefix.jsp"%>

<%@ include file="/include/headerMenu.jsp"%>

<!-- header -->
<div id="header" class="row header fixed tab">

	<!-- titlebar -->
	<div class="column titlebar no-padding">
		<div class="titlebar-left">
			<button class="menu-icon" type="button" onClick="winback();"></button>
		</div>
		<div id="logo" class="titlebar-center submenu">
			<a href="javascript:void(0);" title="내차사기">내차사기<span class="deal_count"><strong id="totalCnt">1,366</strong>대<span></span></span></a>
		</div>
		<div class="titlebar-right">
			<button class="menu-icon hamburger" type="button" onClick="openNav();"></button>
		</div>
	</div>
	<!-- //titlebar -->

	<div class="usedcar-sortbox">
		<button type="button" class="btn-refind" onClick="location.href='search_detail.html'">재검색</button>
		<div class="btn-sort-box"><button type="button" class="btn-sort">최근 등록순</button>
			<ul class="selectbox">
				<li>최근 등록순</li>
				<li>낮은 가격순</li>
				<li>낮은 주행거리순</li>
				<li>최근 연식순</li>
			</ul>
		</div>
		<button type="button" class="btn-type">앨범형</button>
	</div>

</div>
<!-- //header -->

<!-- container -->
<div class="container">

	<!-- search result -->
	<div id="search-result" class="row">
		<div class="column no-padding">

			<ul class="usedcar-list list-view"><!--list-view-->
				<li>
					<a href="car_detail.html">
						<div class="thumb" style="background-image: url('/images/_temp/car1.jpg');"></div>
						<div class="info-wrap">
							<div class="pdt-info">
								<p class="pdt-name">닛산 패스파인더(4세대) 3.5 플래티늄</p>
								<p class="usedcar-opt">
									18/01식(19년형) ∙ 51,675km
								</p>
								<div class="pdt-price">
									<div class="price">
										<span class="sale-price"><em>2,470</em>만원</span>
									</div>
								</div>
							</div>
						</div>
					</a>
					<button type="button" class="btn-favorite"><span>찜</span></button>
				</li>
				<li>
					<a href="#">
						<div class="thumb" style="background-image: url('/images/_temp/car2.jpg');"></div>
						<div class="info-wrap">
							<div class="pdt-info">
								<p class="pdt-name">현대 투싼(2006년식)</p>
								<p class="usedcar-opt">
									18/01식(19년형) ∙ 51,675km
								</p>
								<div class="pdt-price">
									<div class="price">
										<span class="sale-price"><em>2,650</em>만원</span>
									</div>
								</div>
							</div>
						</div>
					</a>
					<button type="button" class="btn-favorite"><span>찜</span></button>
				</li>
				<li>
					<a href="#">
						<div class="thumb" style="background-image: url('/images/_temp/car1.jpg');"></div>
						<div class="info-wrap">
							<div class="pdt-info">
								<p class="pdt-name">닛산 패스파인더(4세대) 3.5 플래티늄</p>
								<p class="usedcar-opt">
									18/01식(19년형) ∙ 51,675km
								</p>
								<div class="pdt-price">
									<div class="price">
										<span class="sale-price"><em>2,470</em>만원</span>
									</div>
								</div>
							</div>
						</div>
					</a>
					<button type="button" class="btn-favorite"><span>찜</span></button>
				</li>
				<li>
					<a href="#">
						<div class="thumb" style="background-image: url('/images/nophoto/nophoto_640x480.png');"></div>
						<div class="info-wrap">
							<div class="pdt-info">
								<p class="pdt-name">현대 투싼(2006년식)</p>
								<p class="usedcar-opt">
									18/01식(19년형) ∙ 51,675km
								</p>
								<div class="pdt-price">
									<div class="price">
										<span class="sale-price"><em>2,650</em>만원</span>
									</div>
								</div>
							</div>
						</div>
					</a>
					<button type="button" class="btn-favorite"><span>찜</span></button>
				</li>
			</ul>
			<div class="paging-wrap">
				<div class="paging"><strong>1</strong> / 15</div>
			</div>
			<button type="button" class="btn-top"><span>Top</span></button>

		</div>
	</div>

</div>
<!-- //container -->


<script>
	$(document).ready(function() {

		// 선택값 영역
		var scrW = $(window).width();       // window width
		var wrapperW = $('#my-option').width();
		var emblemW = $('#my-option .emblem').outerWidth(true);       // emblem width
		var otW = wrapperW - emblemW;
		$('#my-option .option-text').outerWidth(otW);

		// featured product > 제품명 넓이값
		var fPriceW = $('#featured-product .text-wrapper .ftxt-price').outerWidth(true);
		var fTxtW = scrW - fPriceW - 10;
		$('#featured-product .text-wrapper .ftxt-name').outerWidth(fTxtW);

		// 딜러정보 열기
		$('.open-dealer').click(function() {
			showDealerInfo($(this));
		});

		// 앨범유형
		$('.btn-type').click(function() {
			if($(this).hasClass('gallery')){
				$(this).html('앨범형');
				$(this).removeClass('gallery');
				$('.usedcar-list').addClass('list-view');
			}else{
				$(this).html('리스트형');
				$(this).addClass('gallery');
				$('.usedcar-list').removeClass('list-view');
			}
		});

		/* 페이징 */
		$(document).scroll(function() {
			var scrollT = $(window).scrollTop();
			if(scrollT > 300){
				$('.paging').fadeIn();
			}else{
				$('.paging').fadeOut();
			}
		});

		/* 찜하기 (퍼블용) */
		$('.btn-favorite').click(function() {
			$(this).toggleClass('on');
		});

		/* 게시물 정렬 */
		$('.btn-sort').click(function() {
			$(this).next('.selectbox').toggle();
		});
		$('.selectbox').click(function(e) {
			$(this).hide();
		});

	});
</script>

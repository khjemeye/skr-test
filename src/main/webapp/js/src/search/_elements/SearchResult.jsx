const parse = require('html-react-parser');

class SearchCarList extends React.Component {
    constructor(props) {
        super(props);

        this.state = {
            hasMore: false,
            loadingFlag: false,
            listData: [],
            page: 1,
            rows: 10,
            totalCount: 0,
            firstLoad: true,
            ord: null
        };

        //this.props.screenType = "searchResult";
        this.props.setScreen("searchResult");
        window.addEventListener("scroll", this.handleScroll.bind(this));
    }

    componentDidMount() {
        // 선택값 영역
        const scrW = $(window).width();       // window width
        const wrapperW = $('#my-option').width();
        const emblemW = $('#my-option .emblem').outerWidth(true);       // emblem width
        const otW = wrapperW - emblemW;
        $('#my-option .option-text').outerWidth(otW);

        // featured product > 제품명 넓이값
        const fPriceW = $('#featured-product .text-wrapper .ftxt-price').outerWidth(true);
        const fTxtW = scrW - fPriceW - 10;
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

        /* 찜하기 (퍼블용) */
        $('.btn-favorite').click(function() {
            $(this).toggleClass('on');
        });

        $('.selectbox').click(function(e) {
            $(this).hide();
        });

        this.loadDataFromServer();
    }

    searchFromParent(){
        this.state.page = 1;
        this.state.listData = [];
        this.loadDataFromServer();
    }

    loadDataFromServer(){
        jQuery.ajax({
            type: "GET",
            url: "/car/listAjax.do",
            dataType: "JSON",
            cache: true,
            data: {
                recordCountPerPage: this.state.rows,
                currentPageNo: this.state.page,
                orderType: this.state.ord,

                cCho: this.props.stateData.cho,
                //sCarType: this.props.stateData.sCarType,
                sCategoryType: this.props.stateData.sCategoryType,
                sCategoryId: this.props.stateData.sCategoryId,
                sDetail: this.props.stateData.sDetail,
                sMinYear: this.props.stateData.sMinYear,
                sMaxYear: this.props.stateData.sMaxYear,
                sMinMileage: this.props.stateData.sMinMileage,
                sMaxMileage: this.props.stateData.sMaxMileage,
                sMinPrice: this.props.stateData.sMinPrice,
                sMaxPrice: this.props.stateData.sMaxPrice,
                sColor: this.props.stateData.sColor,
                sFuel: this.props.stateData.sFuel,
                sTrans: this.props.stateData.sTrans,
                sOption: this.props.stateData.sOption,
                sTextNumber: this.props.stateData.sTextNumber,
                sTextSangsa: this.props.stateData.sTextSangsa,
                sTextDealer: this.props.stateData.sTextDealer,
                sTextPhone: this.props.stateData.sTextPhone,
                sThemeType: this.props.stateData.themeType
            },
            success: function(json) {
                let listData = this.state.listData;
                let newListData = listData.concat(json.data);

                $(".titlebar-center").off('click');

                if($('.titlebar-center').hasClass('submenu')){
                    $('.titlebar-center').click(function() {
                        $(".submenu-wrap").slideToggle();
                    });
                }

                this.setState({
                    firstLoad: false,
                    loadingFlag: false,
                    listData: newListData,
                    totalCount: json.totalCount,
                    hasMore: newListData.length < json.totalCount
                }, function(){
                    initPagingRefresh();
                });
            }.bind(this)
        });
    }

    /* 페이징 */
    handleScroll(){
        //if((jQuery(window).scrollTop() + 60) > (jQuery(document).height() - jQuery(window).height())){
        if((jQuery(window).scrollTop() + 100) > (jQuery(document).height() - jQuery(window).height())){
            if(!this.state.loadingFlag && this.state.hasMore){
                this.state.loadingFlag = true;
                this.state.page = this.state.page + 1;

                const scrollT = $(window).scrollTop();
                if(scrollT > 300){
                    $('.paging').fadeIn();
                }else{
                    $('.paging').fadeOut();
                }

                this.loadDataFromServer();
            }
        }
    }

    getPrice(price){
        if(price < 10000){
            return (addComma(price) + "원");
        }else{
            return (addComma(Math.floor(price/10000)) + "만원");
        }
    }

    getPriceMan(price){
        return (addComma(Math.floor(price/10000)));
    }

    /*
    getCarTitle(bmName, boName, bsName, bdName, regCarName){
        let title = "";
        if(bmName){ title += bmName }

        if(boName){
            if(title !== ""){ title += " " }
            title += boName;
        }

        if(bsName){
            if(title !== ""){ title += " " }
            title += bsName;
        }

        if(bdName){
            if(title !== ""){ title += " " }
            title += bdName;
        }

        if(title === ""){ title = regCarName }

        return title;
    }
    */

    openSort(){
        $("#orderSelectBox").toggle();
    }

    selectSort(value){
        $('html, body').scrollTop(0);
        $("#orderSelectTitle").text($("#orderSelectItem_" + value).text());

        this.state.page = 1;
        this.state.listData = [];
        this.state.ord = value;
        this.loadDataFromServer();
    }

    toggleFavBtn(carId){
        toggleJJimCar("favCarItem", carId);
    }

    openNavigation(){
        openNav();
    }

    goBack(){
        winback();
    }

    reSearch(){
        this.props.setScreen("main");
    }

    goTheme(themeType){
        $('html, body').scrollTop(0);

    	this.props.stateData.themeType = themeType;
    	//this.selectSort('');
        this.state.page = 1;
        this.state.listData = [];
        this.loadDataFromServer();
        
    	//location.href = "/search/theme.do?type=" + themeType;
    }

    goDetail(cNo){
        openPopup('car_detail', cNo);
    }

    render() {
        return (
            <React.Fragment>
                <div id="header" className="row header fixed tab bgcolor">
                    <div className="column titlebar no-padding">
                        <div className="titlebar-left">
                            <button className="menu-icon" type="button" onClick={this.goBack.bind(this)}/>
                        </div>
                        <div id="logo" className="titlebar-center submenu">
                            {function(){
                                let title = this.props.stateData.themeType ? "테마차량" : "내차사기";

                                return (
                                    <a href="javascript:void(0);" title={title}>
                                        {title}
                                        <span className="deal_count">
                                            <strong id="totalCnt">{addComma(this.state.totalCount)}</strong> 대
                                            <span></span>
                                        </span>
                                    </a>

                                )
                            }.call(this)}
                        </div>
                        <div className="titlebar-right">
                            <button className="menu-icon hamburger" type="button" onClick={this.openNavigation.bind(this)}/>
                        </div>
                    </div>

                    <div className="usedcar-sortbox">
                        <button type="button" className="btn-refind" onClick={this.reSearch.bind(this)}>재검색</button>
                        <div className="btn-sort-box">
                            <button type="button" className="btn-sort" onClick={this.openSort.bind(this)} id="orderSelectTitle">업데이트순</button>
                            <ul id="orderSelectBox" className="selectbox">
                                <li id="orderSelectItem_le" onClick={this.selectSort.bind(this, "le")}>최근 등록순</li>
                                <li id="orderSelectItem_pa" onClick={this.selectSort.bind(this, "pa")}>낮은 가격순</li>
                                <li id="orderSelectItem_ma" onClick={this.selectSort.bind(this, "ma")}>낮은 주행거리순</li>
                                <li id="orderSelectItem_yd" onClick={this.selectSort.bind(this, "yd")}>최근 연식순</li>
                            </ul>
                        </div>
                        <button type="button" className="btn-type">앨범형</button>
                    </div>
                </div>
                <div className="submenu-wrap">
                    <div className="gnb">
                        <ul>
                            <li><a href="/search.do?1#cho:1" title="차량검색">차량검색</a></li>
                            <li><a href="/search/theme.do" title="테마차량">테마차량</a></li>
                        </ul>
                    </div>
                </div>
                <div className="container">
                    {function(){
                        if(this.props.stateData.themeType){
                            return (
                                <div>
                                    <div className="row tab-thema">
                                        <div className="column" data-aos="zoom-out">
                                            <div className="title_wrap">
                                                <h2>테마차량</h2>
                                                <span className="h2_txt">다양한 옵션 검색으로 고객님께 딱 맞는 차종을 찾으세요.</span>
                                            </div>
                                            <div className="btn_wrap">
                                            	<button type="button" className={(this.props.stateData.themeType === '1' ? "selected": "")} onClick={this.goTheme.bind(this, "1")}>신차급</button>
                                				<button type="button" className={(this.props.stateData.themeType === '2' ? "selected": "")} onClick={this.goTheme.bind(this, "2")}>짧은주행</button>
                                				<button type="button" className={(this.props.stateData.themeType === '3' ? "selected": "")} onClick={this.goTheme.bind(this, "3")}>특가차량</button>
                                				<button type="button" className={(this.props.stateData.themeType === '4' ? "selected": "")} onClick={this.goTheme.bind(this, "4")}>친환경</button>
                                				<button type="button" className={(this.props.stateData.themeType === '5' ? "selected": "")} onClick={this.goTheme.bind(this, "5")}>소상공인</button>
                                				<button type="button" className={(this.props.stateData.themeType === '6' ? "selected": "")} onClick={this.goTheme.bind(this, "6")}>인증중고차</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div className="divide"></div>
                                </div>
                            )
                        }
                    }.call(this)}

                    <div id="search-result" className="row">
                        <div className="column no-padding">

                            <ul className="usedcar-list list-view">
                                {function(){
                                    if(this.state.listData.length > 0){
                                        return this.state.listData.map(function(rowItem, key){
                                            let year = "";
                                            if(rowItem.cYear){ year = "(" + rowItem.cYear.substring(2, 4) + "년형) ∙ "; }

                                            let firstDate = "";
                                            if(rowItem.cFirstdate){
                                                let arrDate = rowItem.cFirstdate.split("-");
                                                if(arrDate.length === 3 && arrDate[0].length === 4){
                                                    firstDate = arrDate[0].substring(2, 4) + "/" + arrDate[1];
                                                }
                                            }

                                            let priceTag = null;
                                            if(rowItem.cSiteshowStatusCd == "R") {
                                                priceTag = "계약중";
                                            } else {
                                                if(rowItem.cPrice == 0) {
                                                    priceTag = "가격문의";
                                                }
                                            }

                                            let realPrice = "N";
                                            let priceText = "";
                                            if(rowItem.cSalesCondCdNm != null && rowItem.cSalesCondCdNm != '현금') {
                                            	priceText = rowItem.cSalesCondCdNm;
                                            } else {
                	                            if(priceTag == null) {
                	                            	realPrice = "Y";
                	                            	priceText = this.getPriceMan(rowItem.cPrice);
                	                            } else {
                	                            	priceText = priceTag;
                	                            }
                                            }
                                            let premiumIcon = this.props.makePremiumIcon(rowItem);

                                            return (
                                                <li key={key}>
                                                    <a href="javascript:void(0);" onClick={this.goDetail.bind(this, rowItem.cNo)}>
                                                        {function(){
                                                            if(rowItem.featuredImage){
                                                                return <div className="thumb" style={{backgroundImage: `url('` + rowItem.featuredImage + `'), url('/images/ready_photo_s.png')`}}/>
                                                            }else {
                                                                return <div className="thumb" style={{backgroundImage: `url('/images/ready_photo_s.png')`}}/>
                                                            }
                                                        }.call(this)}

                                                        <div className="info-wrap">
                                                            <div className="pdt-info">
                                                            	{premiumIcon}
                                                                <p className="pdt-name">{rowItem.cCarname ? rowItem.cCarname : rowItem.cRegname}</p>
                                                                <p className="usedcar-opt">
                                                                    {firstDate + "식" + year}{commaSplit(rowItem.cMileage) + "km"}
                                                                </p>
                                                                <p className="usedcar-ex">{rowItem.cSubject}</p>
                                                                <p className="usedcar-icon">
                                                                    {parse(rowItem.cHoticonTag)}
                                                                </p>
                                                                <div className="pdt-price">
                                                                    <div className="price">
                                                                        <span className="sale-price">
                                                                        	<em>{priceText}</em> {realPrice == "Y" ? <i>만원</i> : ''}
                                                                        </span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </a>
                                                    {function(){
                                                        if(rowItem.favStatus){
                                                            return (
                                                                <button id={"favCarItem" + rowItem.cNo} type="button" className={"btn-favorite" + ((rowItem.favStatus === "Y") ? " on": "")} onClick={this.toggleFavBtn.bind(this, rowItem.cNo)}>
                                                                    <span>찜</span>
                                                                </button>
                                                            )
                                                        }
                                                    }.call(this)}
                                                </li>
                                            );
                                        }, this);
                                    }else if(!this.state.firstLoad){
                                        return <li className="data-empty">검색된 차량이 없습니다.</li>
                                    }

                                }.call(this)}
                            </ul>
                            <div className="paging-wrap">
                                <div className="paging"><strong>{this.state.page}</strong> / {Math.ceil(this.state.totalCount/this.state.rows)}</div>
                            </div>
                            <button type="button" className="btn-top"><span>Top</span></button>
                        </div>
                    </div>
                </div>
            </React.Fragment>
        );
    }
}

module.exports = SearchCarList;

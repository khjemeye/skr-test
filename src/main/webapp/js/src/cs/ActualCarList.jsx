class ActualCarList extends React.Component {
    constructor(props) {
        super(props);

        this.state = {
            hasMore: false,
            loadingFlag: false,
            listData: [],
            page: 1,
            rows: 10,
            totalCount: 0
        };

        window.addEventListener("scroll", this.handleScroll.bind(this));
    }

    componentDidMount() {
        var winH = $(window).height();
        var addH = $(".header").outerHeight();
        $(".worker-title").css('height', winH - addH);
    }

    loadDataFromServer() {
        jQuery.ajax({
            type: "GET",
            url: "/search/actualCarListAjax.do",
            data: {
                firstRecordIndex: this.state.page,
                recordCountPerPage: this.state.rows,
                sTextNumber: jQuery("#searchText").val()
            },
            dataType: "JSON",
            success: function(json) {
                let listData = this.state.listData;
                let newListData = listData.concat(json.data);

                this.setState({
                    loadingFlag: false,
                    listData: newListData,
                    totalCount: json.totalCount,
                    hasMore: newListData.length < json.totalCount
                }, function() {
                    if (json.totalCount == 0) {
                        $(".step2-wrap").fadeOut();
                        alert("검색결과가 없습니다.");
                    }else{
                        var winH = $(window).height();
                        $(".step2-wrap").fadeIn();
                        $("html, body").animate({scrollTop: winH}, 200);
                    }
                })
            }.bind(this),
            error:function() {
                alert( 'error' );
            }
        });
    }

    handleScroll() {
        if((jQuery(window).scrollTop() + 60) > (jQuery(document).height() - jQuery(window).height())) {
            if(!this.state.loadingFlag && this.state.hasMore) {
                this.state.loadingFlag = true;
                this.state.page = this.state.page + 1;

                this.loadDataFromServer();
            }
        }
    }

    getPrice(price) {
        if(price == 0) {
            return("가격문의");
        }if(price < 10000){
            return (commaSplit(price) + "원");
        }else{
            return (commaSplit(Math.floor(price/10000)) + "만원");
        }
    }

    getPriceMan(price){
    	if(price == 0) {
            return("가격문의");
        }else{
        	return (addComma(Math.floor(price/10000)));
        }
    }

    search() {
        let searchText = jQuery("#searchText").val();

        if(searchText.length) {
            if(searchText.length < 4) {
                alert("검색어를 4자 이상 입력하세요.");
                return;
            }

            this.state.page = 1;
            this.state.listData = [];
            this.state.totalCount = 0;
            this.state.hasMore = false;

            this.loadDataFromServer();
        }else {
            alert("검색어를 입력하세요.");
        }
    }

    goDetail(cNo) {
        openPopup('car_detail', cNo);
    }

    render() {
        return (
            <React.Fragment>
                <div className="row sellcar01">
                    <div className="column">
                        <div class="title_wrap">
                            <h2>차량번호 조회</h2>
                            <p className="h2_txt">차량번호를 입력하고 조회하시면 실제 전시여부를 확인하실 수 있습니다.</p>
                        </div>
                        <input type="text" id="searchText" name="searchText" placeholder="차량번호 입력" />
                        <button type="button" className="button" onClick={this.search.bind(this)}>조회</button>
                    </div>
                </div>

                <div className="row customer-btns sellcar02">
                    <div className="column">
                        <div class="title_wrap">
                            <h2>전시차량 확인방법</h2>
                            <p className="h2_txt">부산오토필드에서 판매중인 차량은 안심하시고 거래하실 수 있습니다.</p>
                        </div>
                        <ul>
                            <li className="c1">
                                <p className="tit">실제 전시 여부</p>
                                <p>차량번호로 부산오토필드의 실제 전시차량인지 조회해보세요.<br />
                                    매장을 방문하시면 동일한 차량을 만나실 수 있습니다.</p>
                            </li>
                            <li className="c2">
                                <p className="tit">담당 판매자 확인</p>
                                <p>차량번호로 검색하시면 판매중인 각각의 차량마다 담당자가 지정되어 있습니다.<br />
                                    해당 담당자를 확인하세요. </p>
                            </li>
                            <li className="c3">
                                <p className="tit">방문 전 확인</p>
                                <p>조회하신 차량이 가끔 일시적으로 출고되거나 판매가 될 수도 있습니다. 방문하시기 전에 꼭 담당자와 먼저 통화하세요.</p>
                            </li>
                        </ul>
                    </div>
                </div>

                <div className="step2-wrap" style={{display:"none"}}>
                    <div className="divide"></div>
                    <div className="title_wrap">
                        <h2>조회결과</h2>
                    </div>
                    <ul className="usedcar-list">
                        {function() {
                            if(this.state.listData.length > 0) {
                                return this.state.listData.map(function(rowItem, key) {
                                    let year = "";
                                    if(rowItem.cYear) { year = "(" + rowItem.cYear.substring(2, 4) + "년형) ∙ "; }

                                    let firstDate = "";
                                    if(rowItem.cFirstdate) {
                                        let arrDate = rowItem.cFirstdate.split("-");
                                        if(arrDate.length === 3 && arrDate[0].length === 4) {
                                            firstDate = arrDate[0].substring(2, 4) + "/" + arrDate[1];
                                        }
                                    }

                                    let realPrice = "N";
                                    let priceText = "";
                                    if(rowItem.cSalesCondCdNm != null && rowItem.cSalesCondCdNm != '현금') {
                                    	priceText = rowItem.cSalesCondCdNm;
                                    } else {
       	                            	realPrice = "Y";
       	                            	priceText = this.getPriceMan(rowItem.cPrice);
                                    }
                                    return (
                                        <li key={key}>
                                            <a href="javascript:void(0);" onClick={this.goDetail.bind(this, rowItem.cNo)}>
                                                {function() {
                                                    if(rowItem.featuredImage) {
                                                        return <div className="thumb" style={{backgroundImage: `url('` + rowItem.featuredImage + `'), url('/images/nophoto/nophoto_640x480.png')`}}/>;
                                                    }else {
                                                        return <div className="thumb" style={{backgroundImage: `url('/images/nophoto/nophoto_640x480.png')`}}/>;
                                                    }
                                                }.call(this)}
                                                <div className="info-wrap">
                                                    <div className="pdt-info">
                                                        <p className="pdt-name">{rowItem.cCarname ? rowItem.cCarname : rowItem.cRegname}</p>
                                                        <p className="usedcar-opt"> {firstDate + "식" + year}{commaSplit(rowItem.cMileage) + "km"} </p>
                                                        {function() {
                                                            if(rowItem.cSubject) {
                                                            return <p className="usedcar-ex">{rowItem.cSubject}</p>;
                                                            }
                                                        }.call(this)}

                                                        <p className="usedcar-icon">
	                                                        {parse(rowItem.cHoticonTag)}
	                                                    </p>
                                                        <p className="seller">{rowItem.coName} {rowItem.dlName}</p>
                                                        {function() {
                                                            if(rowItem.cSiteshowStatusCd == 'S') {
                                                                return <div className="photo sellend"><span>판매완료</span></div>;
                                                            }else if(rowItem.cSiteshowStatusCd == 'R') {
                                                                return <div className="photo contract"><span>계약중</span></div>;
                                                            }else{
                                                                return <div className="photo sell"><span>판매중</span></div>;
                                                            }
                                                        }.call(this)}
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
                                        </li>
                                    );
                                }, this);
                            } else {
                                return <li className="data-empty">검색결과가 없습니다.</li>;
                            }
                        }.call(this)}
                    </ul>
                </div>

            </React.Fragment>
        );
    }
}

ReactDOM.render(
    <ActualCarList />,
    document.getElementById('actualCarList')
);

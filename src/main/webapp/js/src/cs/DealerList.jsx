class DealerList extends React.Component {
    constructor(props) {
        super(props);

        this.state = {
            hasMore: false,
            loadingFlag: false,
            searchCondition: 'name',
            listData: [],
            page: 1,
            rows: 10,
            totalCount: 0
        };

        // window.addEventListener("scroll", this.handleScroll.bind(this));
    }

    componentDidMount() {
        const winH = $(window).height();
        const addH = $(".header").outerHeight();
        $(".worker-title").css('height', winH - addH);
    }

    loadDataFromServer() {
        let self = this;

        let data = {
            page: this.state.page,
            rows: this.state.rows
        };

        if(this.state.searchCondition === 'number') {
            data["search_condition_delr_number"] = jQuery("#searchText").val();
        }else{
            data["search_condition_delr_name"] = jQuery("#searchText").val();
        }

        jQuery.ajax({
            type: "GET",
            url: "/cs/selectDealerListAjax.do",
            data: data,
            dataType: "JSON",
            success: function(json) {
                let listData = self.state.listData;
                let newListData = listData.concat(json.data);

                self.setState({
                    loadingFlag: false,
                    listData: newListData,
                    totalCount: json.count,
                    dealerNoImage: json.dealerNoImage,
                    hasMore: newListData.length < json.count
                }, function() {
                    if (json.count === 0) {
                        $(".step2-wrap").fadeOut();
                        alert("검색결과가 없습니다.");
                    }else{
                        const winH = $(window).height();
                        $(".step2-wrap").fadeIn();
                        $("html, body").animate({scrollTop: winH}, 200);
                    }
                });
            },
            error:function() {
                alert( 'error' );
            }
        });
    }

    handleScroll() {
        if((jQuery(window).scrollTop() + 60) > (jQuery(document).height() - jQuery(window).height())) {
            if(!this.state.loadingFlag && this.state.hasMore) {
                this.state.loadingFlag = true;
                this.state.page = this.state.page + 1

                this.loadDataFromServer();
            }
        }
    }

    search() {
        let searchText = jQuery("#searchText").val();

        if(searchText.length > 0 ) {
            if(searchText.length < 2) {
                alert("검색어를 2자 이상 입력하세요.");
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

    callAction(hp) {
        location.href = "tel:" + hp;
    }

    searchCarAction(dealer) {
        openSearchCar("search_car_dealer", encodeURIComponent(dealer.coName), encodeURIComponent(dealer.dlName));
    }

    onChange(event) {
        this.setState({
            searchCondition: event.currentTarget.value
        })
    }

    getTelNumber(number) {
        if(!number) {
            return "";
        }

        if(number.indexOf("-") == -1) {
            if(number.length == 11) {
                return number.substr(0, 3) + "-" + number.substr(3, 4) + "-" + number.substr(7, 4);

            }else if(number.length == 10) {
                return number.substr(0, 3) + "-" + number.substr(3, 3) + "-" + number.substr(6, 4);

            }
        }

        return number;
    }

    render() {
        return (
            <React.Fragment>
                <div className="row worker-title">
                    <div className="column member_box">
                        <div className="tit">
                            <img src="/images/logo.png" style={{height:20, marginBottom:5}}/>
                            <p>종사원 조회 서비스</p>
                            <span>부산오토필드에서 근무하시는 중고차 딜러(종사원)분들을 조회하실 수 있습니다.<br/>이름 또는 종사원 번호를 입력하세요.</span>
                        </div>
                        <div className="search">
                            <input type="radio" id="radio1_1" name="radios1" value="name" onChange={this.onChange.bind(this)} checked={this.state.searchCondition === 'name'}/>
                            <label htmlFor="radio1_1">사원명</label>
                            <input type="radio" id="radio1_2" name="radios1" value="number" onChange={this.onChange.bind(this)} checked={this.state.searchCondition === 'number'}/>
                            <label htmlFor="radio1_2">종사원번호</label>
                            <div>
                                <input type="text" id="searchText" name="searchText" placeholder="키워드 입력"/>
                                <button type="button" className="button" onClick={this.search.bind(this)}>검색</button>
                            </div>
                        </div>
                    </div>
                </div>

                <div className="step2-wrap" style={{display:"none"}}>
                    <div className="divide"></div>
                    <div className="title_wrap">
                        <h2>조회결과</h2>
                    </div>
                    <div className="row">
                        <div className="column total-text">
                            <span className="total-text">총 검색결과 <strong>{addComma(this.state.totalCount)}</strong>명</span>
                        </div>
                    </div>
                    {function() {
                        if(this.state.listData) {
                            return this.state.listData.map(function(rowItem, key) {
                                return (
                                    <React.Fragment key={key}>
                                        <div className="divide line"></div>
                                        <div className="detailCon02">
                                            <div className="seller-info">
                                                {function() {
                                                    if(rowItem.dlImage) {
                                                        return <div className="photo" style={{backgroundImage:'url(' + rowItem.uploadPath + '/' + rowItem.dlImage + '), url(' + this.state.dealerNoImage + ')'}}></div>;
                                                    } else {
                                                        return <div className="photo" style={{backgroundImage:'url(' + this.state.dealerNoImage + ')'}}></div>;
                                                    }
                                                }.call(this)}
                                                <ul>
                                                    <li><strong className="title">{rowItem.coName} {rowItem.dlName}</strong></li>
                                                    <li>
                                                        <span>보유차량</span> {rowItem.dlCarCount}대<br/>
                                                        <span>매매사원증</span> {rowItem.dlNumber}
                                                    </li>
                                                    <li className="phone">
                                                        <button type="button" className="btn-call" onClick={this.callAction.bind(this, rowItem.dlHp)}>{this.getTelNumber(rowItem.dlHp)}</button>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div className="button-group">
                                            <button type="button" className="button color-red2" onClick={this.searchCarAction.bind(this, rowItem)}>보유차량보기</button>
                                        </div>
                                        <div className="divide line"></div>
                                    </React.Fragment>
                                );
                            }, this);
                        }
                    }.call(this)}
                </div>
            </React.Fragment>
        );
    }
}

ReactDOM.render(
    <DealerList />,
    document.getElementById('dealerList')
);

class CompanyList extends React.Component {
    constructor(props) {
        super(props);

        this.state = {
            hasMore: false,
            loadingFlag: false,
            listData: [],
            page: 1,
            rows: 50,
            totalCount: 0
        };

        // window.addEventListener("scroll", this.handleScroll.bind(this));
    }

    componentDidMount() {
        const winH = $(window).height();
        const addH = $(".header").outerHeight();
        $(".sangsa-title").css('height', winH - addH);
    }

    initSwiper() {
        let swiper = new Swiper('.swiper-container', {
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

        jQuery(".swiper-wrapper").css("height", "100%");
    }

    loadDataFromServer() {
        let self = this;

        jQuery.ajax({
            type: "GET",
            url: "/cs/selectCompanyListAjax.do",
            data: {
                search_comp: jQuery("#searchText").val(),
                page: this.state.page,
                rows: this.state.rows
            },
            dataType: "JSON",
            success: function(json) {
                let listData = self.state.listData;
                let newListData = listData.concat(json.data);

                self.setState({
                    loadingFlag: false,
                    listData: newListData,
                    totalCount: json.count,
                    sangsaNoImage: json.sangsaNoImage,
                    hasMore: newListData.length < json.count
                }, function() {
                    if (json.count === 0) {
                        $(".step2-wrap").fadeOut();
                        alert("검색결과가 없습니다.");
                    }else{
                        const winH = $(window).height();
                        $(".step2-wrap").fadeIn();
                        $("html, body").animate({scrollTop: winH - 50}, 200);

                        this.initSwiper();
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

        this.state.page = 1;
        this.state.listData = [];
        this.state.totalCount = 0;
        this.state.hasMore = false;

        this.loadDataFromServer();

        /*
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
        */
    }

    searchCarAction(company) {
        openSearchCar("search_car_sangsa", encodeURIComponent(company.coName));
    }

    callAction(hp) {
        location.href = "tel:" + hp;
    }

    setErrorImg(ev) {
        ev.target.src = jQuery("#sangsaNoImage").val();
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

            }else if(number.length == 9) {
                return number.substr(0, 2) + "-" + number.substr(2, 3) + "-" + number.substr(5, 4);

            }
        }

        return number;
    }

    goDetail(coNo) {
        openPopup("sangsa_detail", coNo);
    }

    render() {
        return (
            <React.Fragment>
                <div className="row sangsa-title">
                    <div className="column member_box">
                        <div className="tit">
                            <img src="../images/search_logo.png" />
                            <p>상사 조회 서비스</p>
                            <span>부산 오토필드에서 근무하시는 중고차 딜러(종사원)분들을 조회하실 수 있습니다.<br />
                                상사명을 입력하세요.</span>
                        </div>
                        <div className="search">
                            <div>
                                <input type="text" id="searchText" name="searchText" placeholder="상사명 입력"/>
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
                    <div className="row" style={{background:'#f8f8f8'}}>
                        <div className="column total-text">
                            <span className="total-text">총 검색결과 <strong>{addComma(this.state.totalCount)}</strong>건</span>
                        </div>
                    </div>
                    <div className="row" style={{background:'#f8f8f8'}}>
                        <div className="column">
                            <ul className="usedcar-list list-dealer">
                                    {function() {
                                        if(this.state.listData && this.state.listData.length > 0) {
                                            return this.state.listData.map(function(rowItem, key) {
                                                return (
                                                    <li key={key}>
                                                        {function() {
                                                            if(rowItem.coMainImage !== null) {
                                                                return <div className="thumb" style={{backgroundImage: `url('` + rowItem.uploadPath + `/`  + rowItem.coMainImage + `'), url('` + this.state.sangsaNoImage + `')`}}></div>;
                                                            } else {
                                                                return <div className="thumb" style={{backgroundImage: `url('` + this.state.sangsaNoImage + `')`}}></div>;
                                                            }
                                                        }.call(this)}

                                                        <div className="info-wrap">
                                                            {function() {
                                                                if(rowItem.coStatusCd === '01') {
                                                                    return <div className="photo open"><span>영업중</span></div>;
                                                                }else{
                                                                    return <div className="photo close"><span>폐업</span></div>;
                                                                }
                                                            }.call(this)}
                                                            <div className="pdt-info">
                                                                <p className="pdt-name">{rowItem.coName}</p>
                                                                <p className="dealer-opt"><span>대표자</span> {rowItem.coCeo}<br />
                                                                    <span>사업자번호</span> {rowItem.coNewconum}<br />
                                                                    <span>지부/ 단지</span> {rowItem.coBranch + "/" + rowItem.coComplex}<br />
                                                                    <span>주소</span> {rowItem.coAddr1 + (rowItem.coAddr2 ? " " + rowItem.coAddr2: "")}<br />
                                                                    <span>전화번호</span> {this.getTelNumber(rowItem.coTel)}<br />
                                                                    <span>종사원수</span> {rowItem.delrCnt + "명"}</p>
                                                            </div>
                                                            <div className="button-group">
                                                                <button type="button" className="button color-red2" onClick={this.goDetail.bind(this, rowItem.coNo)}>상세보기</button>
                                                            </div>
                                                        </div>
                                                    </li>
                                                )
                                            }, this);
                                        } else {
                                            return <li className="data-empty">검색된 상사가 없습니다.</li>;
                                        }
                                    }.call(this)}
                            </ul>
                        </div>
                    </div>
                </div>
            </React.Fragment>
        );
    }
}

ReactDOM.render(
    <CompanyList />,
    document.getElementById('companyList')
);

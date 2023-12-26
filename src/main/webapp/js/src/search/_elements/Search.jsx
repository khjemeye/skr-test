class Search extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            setYearType: null,
            totalCount: 0,
            carData: null,
            colorData: null,
            fuelData: null,
            transData: null,
            optionData: null,
            picker: null
        };

        this.props.setScreen("main");
    }

    searchFromParent() {
        this.loadDataFromServer();
    }

    loadDataFromServer(){
        jQuery.ajax({
            type: "GET",
            url: "/search/resultAjax.do",
            dataType: "JSON",
            cache: true,
            data: {
                cCho: this.props.stateData.cho,
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
                if(json){
                    this.setState({
                        carData: json.car,
                        colorData: json.color,
                        fuelData: json.fuel,
                        transData: json.trans,
                        optionData: json.option,
                        totalCount: json.totalCount
                    });
                }
            }.bind(this)
        });
    }

    setPriceText(minPrice, maxPrice){
        if((minPrice === 400 || minPrice === 0) && maxPrice === 11100){
            $("#price_all").show();
            $("#price_mid").hide();
            $("#price_set").hide();
        }else if((minPrice !== 400 && minPrice !== 0) && maxPrice == 11100){
            $("#price_all").hide();
            $("#price_mid").html("<span class='slider-min'>" + minPrice + "</span>만원 이상");
            $("#price_mid").show();
            $("#price_set").hide();
        }else if((minPrice === 400 || minPrice === 0) && maxPrice !== 11100){
            $("#price_all").hide();
            $("#price_mid").html("<span class='slider-min'>" + maxPrice + "</span>만원 이하");
            $("#price_mid").show();
            $("#price_set").hide();
        }else{
            $("#price_all").hide();
            $("#price_mid").hide();
            $("#price_set").show();
        }
    }

    setMileageText(minMileage, maxMileage) {
        if ((minMileage == 4500 || minMileage == 0) && maxMileage == 160500) {
            $("#mileage_all").show();
            $("#mileage_mid").hide();
            $("#mileage_set").hide();
        } else if ((minMileage != 4500 && minMileage != 0) && maxMileage == 160500) {
            $("#mileage_all").hide();
            $("#mileage_mid").html("<span class='slider-min'>" + minMileage + "</span>km 이상");
            $("#mileage_mid").show();
            $("#mileage_set").hide();
        } else if ((minMileage == 4500 || minMileage == 0) && maxMileage != 160500) {
            $("#mileage_all").hide();
            $("#mileage_mid").html("<span class='slider-max'>" + maxMileage + "</span>km 이하");
            $("#mileage_mid").show();
            $("#mileage_set").hide();
        } else {
            $("#mileage_all").hide();
            $("#mileage_mid").hide();
            $("#mileage_set").show();
        }
    }


    componentDidMount() {
        const propObj = this.props;
        const currDate = new Date();

        this.state.picker = new Picker(document.querySelector('.js-inline-picker'), {
            controls: false,
            inline: true,
            format: 'YYYY/MM',
            date: currDate.getFullYear() + "/" + (currDate.getMonth() + 1),
            headers: true,
            text: {
                year: '년 선택',
                month: '월 선택'
            }
        });

        // range slide
        const minPriceV = $('#range-price .slider-min');  // 가격 : 최소값
        const maxPriceV = $('#range-price .slider-max');  // 가격 : 최대값
        const minKmV = $('#range-km .slider-min');        // 주행거리 : 최소값
        const maxKmV = $('#range-km .slider-max');        // 주행거리 : 최대값

        const minPrice = this.props.stateData.sMinPrice ? (Math.ceil(this.props.stateData.sMinPrice / 10000)) : 400;
        const maxPrice = this.props.stateData.sMaxPrice ? (Math.ceil(this.props.stateData.sMaxPrice / 10000)) : 11100;

        this.setPriceText(minPrice, maxPrice);

        // 가격 슬라이드
        self = this;
        $('#range-price .slider-area').slider({
            range: true,
            min: 400,
            max: 11100,
            step: 100,
            values: [minPrice, maxPrice],
            slide: function(event, ui) {
                self.setPriceText(ui.values[0], ui.values[1]);

                if(ui.values[0]){ minPriceV.html(addComma(ui.values[0])) }
                if(ui.values[1]){ maxPriceV.html(addComma(ui.values[1])) }
            },
            stop: function(event, ui){
                if(ui.values[0] === 400 && ui.values[1] === 11100) {
                    propObj.setRangePrice(null, null);
                }else{
                    propObj.setRangePrice(parseInt(ui.values[0], 10) * 10000, parseInt(ui.values[1], 10) * 10000);
                }
            }
        });

        minPriceV.html(addComma($('#range-price .slider-area').slider('values', 0)));
        maxPriceV.html(addComma($('#range-price .slider-area').slider('values', 1)));

        const minMileage = this.props.stateData.sMinMileage ? this.props.stateData.sMinMileage : 4500;
        const maxMileage = this.props.stateData.sMaxMileage ? this.props.stateData.sMaxMileage : 160500;

        this.setMileageText(minMileage, maxMileage)

        // 주행거리 슬라이드
        $('#range-km .slider-area').slider({
            range: true,
            min: 4500,
            max: 160500,
            step: 500,
            values: [minMileage, maxMileage],
            slide: function(event,ui) {
                self.setMileageText(ui.values[0], ui.values[1]);

                if(ui.values[0]){ minKmV.html(addComma(ui.values[0])) }
                if(ui.values[1]){ maxKmV.html(addComma(ui.values[1])) }
            },
            stop: function(event, ui){
                if(ui.values[0] === 4500 && ui.values[1] === 160500){
                    propObj.setRangeMileage(null, null);
                }else{
                    propObj.setRangeMileage(ui.values[0], ui.values[1]);
                }
                //self.loadDataFromServer();
            }
        });

        minKmV.html(addComma($('#range-km .slider-area').slider('values', 0)));
        maxKmV.html(addComma($('#range-km .slider-area').slider('values', 1)));

        if(this.props.stateData.sTextNumber){
            jQuery("#textNumber").val(decodeURIComponent(this.props.stateData.sTextNumber));
        }

        if(this.props.stateData.sTextSangsa) {
            jQuery("#textSangsa").val(decodeURIComponent(this.props.stateData.sTextSangsa));
        }

        if(this.props.stateData.sTextDealer) {
            jQuery("#textDealer").val(decodeURIComponent(this.props.stateData.sTextDealer));
        }

        if(this.props.stateData.sTextPhone) {
            jQuery("#textPhone").val(decodeURIComponent(this.props.stateData.sTextPhone));
        }

        this.loadDataFromServer();
    }

    setSearchCho(cho){
        // 탭을 바꿀때 제조사 모델 등급만 초기화 함
        this.props.setCho(cho);
        this.props.setCategory(null, null);
        this.props.setDetail(null);
    }

    showMore() {
        if($('.fuc_wrap').css('display') === "none"){
            this.props.setMore(true);

            $("#show-detail").addClass("open");
            $(".fuc_wrap").css("display", "block");

        }else{
            this.props.setMore(false);

            $("#show-detail").removeClass("open");
            $(".fuc_wrap").css("display", "none");
        }
    }

    showYearRangePopup(type){
        showLayerPopup('pop-year');
        this.state.setYearType = type;
    }

    closeYearRangePopup(){
        if(this.state.setYearType === 'min'){
            this.props.setMinYear(null);
        }else{
            this.props.setMaxYear(null);
        }

        closeLayerPopup();
    }

    setYearRange(){
        if(this.state.setYearType === 'min'){
            this.props.setMinYear(this.state.picker.getDate(true).replace("/", ""));
            jQuery("#minYearText").text(this.state.picker.getDate(true))

        }else{
            this.props.setMaxYear(this.state.picker.getDate(true).replace("/", ""));
            jQuery("#maxYearText").text(this.state.picker.getDate(true))
        }

        closeLayerPopup();
    }

    clearSelBrand(){
        this.props.setDetail(null);
        this.props.setCategory(null, null);
        this.setState({carData: null});
    }

    clearSelModel(){
        this.props.setDetail(null);
        this.props.setCategory("br", this.state.carData.brand.id);

        this.state.carData.model = null;
        this.state.carData.trimName = null;
        this.state.carData.detail = null;
        this.forceUpdate();
    }

    clearSelTrim(){
        this.props.setDetail(null);
        this.props.setCategory("mo", this.state.carData.model.id);

        this.state.carData.trimName = null;
        this.state.carData.detail = null;
        this.forceUpdate();
    }

    setTextNumber(){
        this.props.setTextNumber(jQuery("#textNumber").val());
    }

    setTextSangsa(){
        this.props.setTextSangsa(jQuery("#textSangsa").val());
    }

    setTextDealer(){
        this.props.setTextDealer(jQuery("#textDealer").val());
    }

    setTextPhone(){
        this.props.setTextPhone(jQuery("#textPhone").val());
    }

    search(){
        if(this.state.totalCount > 0){
            this.props.setScreen("searchResult");
        }
    }

    goBack(){
        closeSearchCar();
    }

    render() {
        let selModelColor = "#999";
        let selTrimColor = "#999";

        if(this.state.carData != null){
            if(this.state.carData.model != null){ selModelColor = "#333" }
            if(this.state.carData.trimName != null){ selTrimColor = "#333" }
        }

        return (
            <React.Fragment>
                <div id="header" className="row header fixed tab">
                    <div className="column titlebar no-padding">
                        <div className="titlebar-left">
                            <button className="menu-icon" type="button" onClick={this.goBack.bind(this)} />
                        </div>
                        <div id="logo" className="titlebar-center">
                            {function(){
                                let title = this.props.stateData.themeType ? "테마차량" : "차량검색";

                                return <a href="javascript:void(0);" title={title}>{title}</a>;
                            }.call(this)}
                        </div>
                    </div>

                    <div className="column sub-nav fuc_tab">
                        <ul>
                            <li id="search_tab1" className={this.props.stateData.cho === "1" ? "active" : ""}>
                                <a href="javascript:void(0)" onClick={this.setSearchCho.bind(this, "1")} title="국산차">국산차</a>
                            </li>
                            <li id="search_tab2" className={this.props.stateData.cho === "2" ? "active" : ""}>
                                <a href="javascript:void(0)" onClick={this.setSearchCho.bind(this, "2")} title="수입차">수입차</a>
                            </li>
                            <li id="search_tab3" className={this.props.stateData.cho === "3" ? "active" : ""}>
                                <a href="javascript:void(0)" onClick={this.setSearchCho.bind(this, "3")} title="화물,특장,버스">화물,특장,버스</a>
                            </li>
                        </ul>
                    </div>
                </div>

                <div className="container">
                    <div className="row">
                        <div className="menu-list column no-padding">
                            <ul className="article-list detail-list">
                                <li className={this.state.carData != null?(this.state.carData.brand != null?"selected":"noselected"):"noselected"}>
                                    <a className="article-item" href="javascript:void(0)" onClick={this.props.setScreen.bind(this, "optCategory")}>
                                        <span className="article-name">제조사</span>
                                        <div className="opt-wrap"><span className="opt-item">제조사를 선택하세요.</span></div>
                                    </a>
                                    {function(){
                                        if(this.state.carData != null){
                                            if(this.state.carData.brand != null){
                                                return (
                                                    <div className="opt-wrap">
                                                        <span className="opt-item">
                                                            {this.state.carData.brand.name} <button type="button" className="btn-del" onClick={this.clearSelBrand.bind(this)}/>
                                                        </span>
                                                    </div>
                                                );
                                            }
                                        }
                                    }.call(this)}
                                </li>
                                <li className={this.state.carData != null?(this.state.carData.model != null?"selected":"noselected"):"noselected"}>
                                    <a className="article-item" href="javascript:void(0)" onClick={this.props.setCategoryForModel.bind(this)}>
                                        <span className="article-name" style={{color:selModelColor}}>모델</span>

                                        {function(){
                                            let text = "모델을 선택하세요.";

                                            if(this.state.carData != null && this.state.carData.brand != null){
                                                text = "전체";
                                            }

                                            return <div className="opt-wrap"><span className="opt-item">{text}</span></div>
                                        }.call(this)}
                                    </a>
                                    {function(){
                                        if(this.state.carData != null){
                                            if(this.state.carData.model != null){
                                                let startDate = "";
                                                let endDate = "";

                                                if(this.state.carData.model.startdate){ startDate = this.state.carData.model.startdate.substring(2, 7) }
                                                if(this.state.carData.model.enddate){ endDate = this.state.carData.model.enddate.substring(2, 7) }

                                                return (
                                                    <div className="opt-wrap">
                                                        <span className="opt-item">
                                                            {this.state.carData.model.name} <i>( {startDate} ~ {endDate} )</i>
                                                            <button type="button" className="btn-del" onClick={this.clearSelModel.bind(this)}/>
                                                        </span>
                                                    </div>
                                                );
                                            }
                                        }
                                    }.call(this)}
                                </li>
                                <li className={this.state.carData != null?(this.state.carData.trimName != null?"detail-model selected":"detail-model noselected"):"detail-model noselected"}>
                                    <a className="article-item" href="javascript:void(0)" onClick={this.props.setCategoryForSeries.bind(this)}>
                                        <span className="article-name" style={{color:selTrimColor}}>등급</span>

                                        {function(){
                                            let text = "등급을 선택하세요.";

                                            if(this.state.carData != null && this.state.carData.brand != null){
                                                text = "전체";
                                            }

                                            return <div className="opt-wrap"><span className="opt-item">{text}</span></div>
                                        }.call(this)}
                                    </a>
                                    {function(){
                                        if(this.state.carData != null){
                                            if(this.state.carData.trimName != null) {
                                                return (
                                                    <div className="opt-wrap">
                                                        <span className="opt-item">
                                                            {this.state.carData.trimName}
                                                            <button type="button" className="btn-del" onClick={this.clearSelTrim.bind(this)}/>
                                                        </span>

                                                        {function () {
                                                            if (this.state.carData.detail != null) {
                                                                return this.state.carData.detail.map(function (rowItem, key) {
                                                                    if(rowItem.bdName){
                                                                        return (<div key={key}>{rowItem.bdName}</div>);
                                                                    }

                                                                    return (<div key={key}>등급없음</div>);
                                                                }, this);
                                                            }else{
                                                                return (<div>전체</div>);
                                                            }
                                                        }.call(this)}
                                                    </div>
                                                );
                                            }
                                        }
                                    }.call(this)}
                                </li>
                            </ul>

                            <button type="button" id="show-detail" className={"btn_toggle fuc_toggle " + (this.props.stateData.isMore?"open":"")} onClick={this.showMore.bind(this)}>상세검색</button>

                            <div className="fuc_wrap" style={{display: this.props.stateData.isMore?"block":"none"}}>

                                <ul className="article-list detail-list">
                                    <li id="range-year">
                                        <span className="article-name">연식</span>
                                        <div className="opt-wrap right">
                                            <span id="minYearText" className="date_picker" onClick={this.showYearRangePopup.bind(this, 'min')}>
                                            {function(){
                                                if(this.props.stateData.sMinYear == null){
                                                    return "선택";
                                                }else{
                                                    return this.props.stateData.sMinYear.substring(0, 4) + "/" + this.props.stateData.sMinYear.substring(4, 6);
                                                }
                                            }.call(this)}
                                            </span>
                                            ~
                                            <span id="maxYearText" className="date_picker" onClick={this.showYearRangePopup.bind(this, 'max')}>
                                                {function(){
                                                    if(this.props.stateData.sMaxYear == null){
                                                        return "선택";
                                                    }else{
                                                        return this.props.stateData.sMaxYear.substring(0, 4) + "/" + this.props.stateData.sMaxYear.substring(4, 6);
                                                    }
                                                }.call(this)}
                                            </span>
                                        </div>
                                    </li>
                                    <li id="range-price" className="slider-item">
                                        <span className="article-name">가격</span>
                                        <div className="article-tag" id="price_all">전체</div>
                                        <div className="article-tag" id="price_mid"/>
                                        <div className="article-tag" id="price_set" style={{display:"none"}}>
                                            <span className="slider-min"/>만원 - <span className="slider-max"/>만원
                                        </div>
                                        <div className="slider-area"/>
                                    </li>
                                    <li id="range-km" className="slider-item">
                                        <span className="article-name">주행거리</span>
                                        <div className="article-tag" id="mileage_all">전체</div>
                                        <div className="article-tag" id="mileage_mid"/>
                                        <div className="article-tag" id="mileage_set" style={{display:"none"}}>
                                            <span className="slider-min"/>km - <span className="slider-max"/>km
                                        </div>
                                        <div className="slider-area"/>
                                    </li>
                                    <li>
                                        <a className="article-item item-ton" href="javascript:void(0)" onClick={this.props.setScreen.bind(this, "optFuel")}>
                                            <span className="article-name">연료</span>
                                            <div className="opt-wrap">
                                                {function(){
                                                    if(this.state.fuelData != null){
                                                        if(this.state.fuelData === "all"){
                                                            return (<span className="opt-item">전체</span>);
                                                        }else {
                                                            return this.state.fuelData.map(function (rowItem, key) {
                                                                if(key < 2){
                                                                    return (<span key={key} className="opt-item">{rowItem.name}</span>);
                                                                }
                                                            }, this);
                                                        }
                                                    }
                                                }.call(this)}
                                                {function(){
                                                    if(this.state.fuelData != null && this.state.fuelData !== "all" && this.state.fuelData.length > 2){
                                                        return (<span className="opt-item etc">{"외 " + (this.state.fuelData.length - 2)}</span>);
                                                    }
                                                }.call(this)}
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a className="article-item item-ton" href="javascript:void(0)" onClick={this.props.setScreen.bind(this, "optGear")}>
                                            <span className="article-name">변속기</span>
                                            <div className="opt-wrap">
                                                {function(){
                                                    if(this.state.transData != null){
                                                        if(this.state.transData === "all"){
                                                            return (<span className="opt-item">전체</span>);
                                                        }else{
                                                            return this.state.transData.map(function(rowItem, key){
                                                                if(key < 2){
                                                                    return (<span key={key} className="opt-item">{rowItem.name}</span>);
                                                                }
                                                            }, this);
                                                        }
                                                    }
                                                }.call(this)}
                                                {function(){
                                                    if(this.state.transData != null && this.state.transData !== "all" && this.state.transData.length > 2){
                                                        return (<span className="opt-item etc">{"외 " + (this.state.transData.length - 2)}</span>);
                                                    }
                                                }.call(this)}
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a className="article-item item-trim" href="javascript:void(0)" onClick={this.props.setScreen.bind(this, "optColor")}>
                                            <span className="article-name">색상</span>
                                            <div className="opt-wrap">
                                                {function(){
                                                    if(this.state.colorData != null){
                                                        return this.state.colorData.map(function(rowItem, key){
                                                            if(key < 2){
                                                                return (<span key={key} className="opt-item">{rowItem.name}</span>);
                                                            }
                                                        }, this);
                                                    }
                                                }.call(this)}
                                                {function(){
                                                    if(this.state.colorData != null && this.state.colorData.length > 2){
                                                        return (<span className="opt-item etc">{"외 " + (this.state.colorData.length - 2)}</span>);
                                                    }
                                                }.call(this)}
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a className="article-item item-ton" href="javascript:void(0)" onClick={this.props.setScreen.bind(this, "optOption")}>
                                            <span className="article-name">옵션</span>
                                            <div className="opt-wrap">
                                                {function(){
                                                    if(this.state.optionData != null){
                                                        return this.state.optionData.map(function(rowItem, key){
                                                            if(key < 2){
                                                                return (<span key={key} className="opt-item">{rowItem.name}</span>);
                                                            }
                                                        }, this);
                                                    }
                                                }.call(this)}
                                                {function(){
                                                    if(this.state.optionData != null && this.state.optionData.length > 2){
                                                        return (<span className="opt-item etc">{"외 " + (this.state.optionData.length - 2)}</span>);
                                                    }
                                                }.call(this)}
                                            </div>
                                        </a>
                                    </li>
                                    <li className="input-item">
                                        <span className="article-name">차량번호</span>
                                        <input className="input01" type="text" id="textNumber" placeholder="차량번호 입력" onBlur={this.setTextNumber.bind(this)} />
                                    </li>
                                    <li className="input-item">
                                        <span className="article-name">상사명</span>
                                        <input className="input01" type="text" id="textSangsa" placeholder="상사 입력" onBlur={this.setTextSangsa.bind(this)} />
                                    </li>
                                    <li className="input-item">
                                        <span className="article-name">딜러명</span>
                                        <input className="input01" type="text" id="textDealer" placeholder="딜러명 입력" onBlur={this.setTextDealer.bind(this)} />
                                    </li>
                                    <li className="input-item">
                                        <span className="article-name">휴대폰</span>
                                        <input className="input01" type="tel" id="textPhone" placeholder="휴대폰번호('-'없이) 입력" onBlur={this.setTextPhone.bind(this)} />
                                    </li>
                                </ul>
                            </div>

                            <div className="button-group-fixed padd0">
                                <div className="button-group search-col2">
                                    <button type="button" className="button color-black" onClick={this.props.initSearch.bind(this)}>초기화</button>
                                    <button type="button" className="button color-red" id="search_btn" onClick={this.search.bind(this)}>
                                        검색
                                        <span className="deal_count">
                                            <strong id="totalCnt">{this.state.totalCount}</strong><span></span>
                                        </span>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div className="modal-popup ty02 pop-year">
                    <div className="pop-content padd0">
                        <div className="js-inline-picker">2048-10</div>

                        <div className="button-group col2-square row">
                            <button type="button" className="button color-black" onClick={this.closeYearRangePopup.bind(this)}>취소</button>
                            <button type="button" className="button color-red" onClick={this.setYearRange.bind(this)}>선택</button>
                        </div>
                    </div>
                </div>
            </React.Fragment>
        );
    }
}

module.exports = Search;

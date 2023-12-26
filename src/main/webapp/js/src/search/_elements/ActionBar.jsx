class ActionBar extends React.Component {
    constructor(props) {
        super(props);

        this.state = {
            rows: this.props.rows,
            ord: this.props.ord,
            sText: decodeURIComponent(this.props.sText)
        };
    }

    componentDidMount() {
        jQuery('.bd-top-quick span').each(function () {
            jQuery(this).on('click', function () {
                const pdtList = jQuery(this).parents('.product-area').find('.usedcar-list');
                jQuery('.bd-top-quick span').removeClass('on');
                jQuery(this).addClass('on');
                if (jQuery(this).is('.btn-list-view')) {
                    pdtList.removeClass('gallery-view').addClass('list-view');
                    jQuery('.board-list').show();
                } else if (jQuery(this).is('.btn-gallery-view')) {
                    pdtList.removeClass('list-view').addClass('gallery-view');
                    jQuery('.board-list').hide();
                }
            });
        });
    }

    setRows(event){
        this.state.rows = event.target.value;
        this.props.setRows(event.target.value);
    }

    setOrder(event){
        this.state.ord = event.target.value;
        this.props.setOrder(event.target.value);
    }

    deleteCarType(carTypeId){
        jQuery("#filterCarType" + carTypeId).prop("checked", false);
        //const valCarType = jQuery("#carTypeField input:checkbox:checked").map(function(){return this.value}).get();

        //if(valCarType.length > 0){
        //    this.props.setCarType(JSON.stringify(valCarType));
        //}else{
            this.props.setCarType(null);
        //}
    }

    deleteTrim(trimId){
        jQuery("#filterTrim" + trimId).prop("checked", false);
        //const valTrim = jQuery("#categoryField input:checkbox:checked").map(function(){return this.value}).get();

        //if(valTrim.length > 0){
        //    this.props.setTrim(JSON.stringify(valTrim));
        //}else{
            this.props.setTrim(null);
        //}
    }

    deleteColor(colorId){
        jQuery("#filterColor" + colorId).prop("checked", false);
        //const valColor = jQuery("#colorField input:checkbox:checked").map(function(){return this.value}).get();

        //if(valColor.length > 0){
        //    this.props.setColor(JSON.stringify(valColor));
        //}else{
            this.props.setColor(null);
        //}
    }

    deleteFuel(fuel){
        jQuery("#filterFuel" + fuel).prop("checked", false);
        //const valFuel = jQuery("#fuelField input:checkbox:checked").map(function(){return this.value}).get();

        //if(valFuel.length > 0){
        //    this.props.setFuel(JSON.stringify(valFuel));
        //}else{
            this.props.setFuel(null);
        //}
    }

    deleteTrans(trans){
        jQuery("#filterTrans" + trans).prop("checked", false);
        //const valTrans = jQuery("#transField input:checkbox:checked").map(function(){return this.value}).get();

        //if(valTrans.length > 0){
        //    this.props.setTrans(JSON.stringify(valTrans));
        //}else{
            this.props.setTrans(null);
        //}
    }

    deleteOption(option){
        jQuery("#filterOption" + option).prop("checked", false);
        //const valOption = jQuery("#transOption input:checkbox:checked").map(function(){return this.value}).get();

        //if(valOption.length > 0){
        //    this.props.setOption(JSON.stringify(valOption));
        //}else{
            this.props.setOption(null);
        //}
    }

    deleteYear(){
        jQuery("#minYear").val("");
        jQuery("#maxYear").val("");
        this.props.setRangeYear(null, null);
    }

    deleteMileage(){
        jQuery("#minMileage").val("");
        jQuery("#maxMileage").val("");
        this.props.setRangeMileage(null, null);
    }

    deletePrice(){
        jQuery("#minPrice").val("");
        jQuery("#maxPrice").val("");
        this.props.setRangePrice(null, null);
    }

    deleteBrand(){ jQuery("#category1").click() }
    deleteInitModel(){ jQuery("#category2").click() }
    deleteModel(){ jQuery("#category3").click() }

    cleanText(){
        this.props.setText(null);
        this.state.sText=null;

        jQuery("#resultKeyword").val("");
        jQuery("#sch_keyword").val("");

        this.props.search();
    }

    initSearch(){ this.props.initSearch() }

    search(){
        this.props.setText(jQuery("#resultKeyword").val());
        this.state.sText=jQuery("#resultKeyword").val();

        this.props.search();
        jQuery("#resultKeyword").val("");
    }

    enterKey() {
        if (window.event.keyCode == 13) { this.search() }
    }


    render() {
        let historyGubun = [];
        if(this.props.historyGubun != null){
            this.props.historyGubun.map(function(item, key){
                historyGubun.push(
                    <li key={"hg" + key}>
                        <a href="javascript:void(0);">{item.bgName}</a>
                        <button type="button" className="btn-delete" onClick={this.deleteCarType.bind(this, item.cBgno)}>삭제</button>
                    </li>);
            }, this);
        }

        let historyBrand = null;
        if(this.props.historyBrandName) {
            historyBrand = (<li key={"br"}>
                <a href="javascript:void(0);">{this.props.historyBrandName}</a>
                <button type="button" className="btn-delete" onClick={this.deleteBrand.bind(this)}>삭제</button>
            </li>);
        }

        let historyInitModel = null;
        if(this.props.historyInitModelName) {
            historyInitModel = (<li key={"mg"}>
                <a href="javascript:void(0);">{this.props.historyInitModelName}</a>
                <button type="button" className="btn-delete" onClick={this.deleteInitModel.bind(this)}>삭제</button>
            </li>);
        }

        let historyModel = null;
        if(this.props.historyModelName) {
            historyModel = (<li key={"mo"}>
                <a href="javascript:void(0);">{this.props.historyModelName}</a>
                <button type="button" className="btn-delete" onClick={this.deleteModel.bind(this)}>삭제</button>
            </li>);
        }

        let historyTrim = [];
        if(this.props.historyTrim != null){
            this.props.historyTrim.map(function(item, key){
                historyTrim.push(
                    <li key={"tr" + key}>
                        <a href="javascript:void(0);">{item.bsName}</a>
                        <button type="button" className="btn-delete" onClick={this.deleteTrim.bind(this, item.bsNo)}>삭제</button>
                    </li>);
            }, this);
        }

        let historyYear = null;
        let yearText = "";
        if(this.props.sMinYear && !this.props.sMaxYear) { yearText = this.props.sMinYear + "년 ~" }
        if(!this.props.sMinYear && this.props.sMaxYear) { yearText = "~" + this.props.sMaxYear + "년" }
        if(this.props.sMinYear && this.props.sMaxYear) { yearText = this.props.sMinYear + "년 ~ " + this.props.sMaxYear + "년" }

        if(yearText){
            historyYear = (<li key={"y"}>
                                <a href="javascript:void(0);">{yearText}</a>
                                <button type="button" className="btn-delete" onClick={this.deleteYear.bind(this)}>삭제</button>
                           </li>);
        }

        let mileageText = "";
        let historyMileage = null;
        if(this.props.sMinMileage && !this.props.sMaxMileage) { mileageText = this.props.sMinMileage + "Km ~" }
        if(!this.props.sMinMileage && this.props.sMaxMileage) { mileageText = "~" + this.props.sMaxMileage + "Km" }
        if(this.props.sMinMileage && this.props.sMaxMileage) { mileageText = this.props.sMinMileage + "Km ~ " + this.props.sMaxMileage + "Km" }

        if(mileageText){
            historyMileage = (<li key={"m"}>
                                <a href="javascript:void(0);">{mileageText}</a>
                                <button type="button" className="btn-delete" onClick={this.deleteMileage.bind(this)}>삭제</button>
                              </li>);
        }

        let priceText = "";
        let historyPrice = null;
        if(this.props.sMinPrice && !this.props.sMaxPrice) { priceText = this.props.sMinPrice + "만원 ~" }
        if(!this.props.sMinPrice && this.props.sMaxPrice) { priceText = "~" + this.props.sMaxPrice + "만원" }
        if(this.props.sMinPrice && this.props.sMaxPrice) { priceText = this.props.sMinPrice + "만원 ~ " + this.props.sMaxPrice + "만원" }

        if(priceText){
            historyPrice = (<li key={"p"}>
                                <a href="javascript:void(0);">{priceText}</a>
                                <button type="button" className="btn-delete" onClick={this.deletePrice.bind(this)}>삭제</button>
                            </li>);
        }

        let historyColor = [];
        if(this.props.historyColor != null) {
            this.props.historyColor.map(function (item, key) {
                historyColor.push(
                            <li key={"hc" + key}>
                                <a href="javascript:void(0)">{item.bcName}</a>
                                <button type="button" className="btn-delete" onClick={this.deleteColor.bind(this, item.bcNo)}>삭제</button>
                            </li>);
            }, this);
        }

        let historyFuel = [];
        if(this.props.sFuel != null) {
            JSON.parse(decodeURIComponent(this.props.sFuel)).map(function (item, key) {
                historyFuel.push(
                    <li key={"hf" + key}>
                        <a href="javascript:void(0)">{item}</a>
                        <button type="button" className="btn-delete" onClick={this.deleteFuel.bind(this, item)}>삭제</button>
                    </li>);
            }, this);
        }

        let historyTrans = [];
        if(this.props.sTrans != null) {
            JSON.parse(decodeURIComponent(this.props.sTrans)).map(function (item, key) {
                historyTrans.push(
                    <li key={"ht" + key}>
                        <a href="javascript:void(0)">{item}</a>
                        <button type="button" className="btn-delete" onClick={this.deleteTrans.bind(this, item)}>삭제</button>
                    </li>);
            }, this);
        }

        let historyOption = [];
        if(this.props.sOption != null) {
            JSON.parse(decodeURIComponent(this.props.sOption)).map(function (item, key) {
                historyOption.push(
                    <li key={"ho" + key}>
                        <a href="javascript:void(0)">{item}</a>
                        <button type="button" className="btn-delete" onClick={this.deleteOption.bind(this, item)}>삭제</button>
                    </li>);
            }, this);
        }

        let historyText = null;
        if(this.state.sText && this.state.sText != "undefined" && this.state.sText != "null"){
            historyText = (
                <li key={"h_text"}>
                    <a href="javascript:void(0)">{this.state.sText}</a>
                    <button type="button" className="btn-delete" onClick={this.cleanText.bind(this)}>삭제</button>
                </li>
            );
        }

        return (
            <em>
                {function(){
                    if(historyGubun.length !== 0 || historyBrand != null || historyInitModel != null || historyModel != null
                        || historyTrim.length !== 0 || historyYear != null || historyMileage != null || historyPrice != null
                        || historyColor.length !== 0 || historyFuel.length !== 0 || historyTrans.length !== 0
                        || historyOption.length !== 0 || historyText != null
                    ){

                    return (
                        <em>
                            <div className="tit-wrap">
                                <h3 className="title">차량리스트</h3>
                                <div className="search-box">
                                    <label htmlFor="resultKeyword" className="blind">검색어 입력</label>
                                    <input type="text" id="resultKeyword" name="resultKeyword" onKeyUp={this.enterKey.bind(this)} className="search-input" placeholder="결과내검색" />
                                     <button type="button" className="btn search" onClick={this.search.bind(this)}>검색</button>
                                 </div>
                             </div>

                            <div className="keyword-list">
                                <ul className="keyword">
                                    {historyGubun}
                                    {historyBrand}
                                    {historyInitModel}
                                    {historyModel}
                                    {historyTrim}
                                    {historyYear}
                                    {historyMileage}
                                    {historyPrice}
                                    {historyColor}
                                    {historyFuel}
                                    {historyTrans}
                                    {historyOption}
                                    {historyText}
                                </ul>

                                <button type="button" className="btn-keyword-reset" onClick={this.initSearch.bind(this)}>
                                    <span className="icon reset"></span>초기화
                                </button>
                            </div>

                            <div className="tit-wrap usedcar-result-top">
                                 <span className="total">검색결과 <em className="fc-blue">{change_price(this.props.totalCount)}</em>대</span>
                                 <div className="bd-top-quick">
                                     <span className="btn-gallery-view"><span className="icon bd-gallery"></span>갤러리</span>
                                     <span className="btn-list-view on"><span className="icon bd-list"></span>리스트</span>
                                 </div>
                                 <select className="sort2"  onChange={this.setOrder.bind(this)} value={this.state.ord}>
                                     <option value="le">최신등록순</option>
                                     <option value="pa">가격↓</option>
                                     <option value="pd">가격↑</option>
                                     <option value="ma">주행거리↓</option>
                                     <option value="md">주행거리↑</option>
                                     <option value="ya">연식↓</option>
                                     <option value="yd">연식↑</option>
                                 </select>
                                 <select onChange={this.setRows.bind(this)} value={this.state.rows}>
                                     <option value="20">20개씩 보기</option>
                                     <option value="40">40개씩 보기</option>
                                     <option value="80">80개씩 보기</option>
                                     <option value="100">100개씩 보기</option>
                                 </select>
                             </div>
                        </em>
                        );

                    }else{
                        return (
                            <em>
                                <div className="tit-wrap">
                                    <h3 className="title">차량리스트</h3>
                                    <span className="total">총 <em className="fc-blue">{change_price(this.props.totalCount)}</em>대</span>
                                    <div className="bd-top-quick">
                                        <span className="btn-gallery-view"><span className="icon bd-gallery"></span>갤러리</span>
                                        <span className="btn-list-view on"><span className="icon bd-list"></span>리스트</span>
                                    </div>
                                    <select className="sort2"  onChange={this.setOrder.bind(this)} value={this.state.ord}>
                                        <option value="le">최신등록순</option>
                                        <option value="pa">가격↓</option>
                                        <option value="pd">가격↑</option>
                                        <option value="ma">주행거리↓</option>
                                        <option value="md">주행거리↑</option>
                                        <option value="ya">연식↓</option>
                                        <option value="yd">연식↑</option>
                                    </select>
                                    <select onChange={this.setRows.bind(this)} value={this.state.rows}>
                                        <option value="20">20개씩 보기</option>
                                        <option value="40">40개씩 보기</option>
                                        <option value="80">80개씩 보기</option>
                                        <option value="100">100개씩 보기</option>
                                    </select>
                                </div>
                            </em>
                        );
                    }
                }.call(this)}

                <div className="board-list usedcar-head">
                     <div className="tbl-comm">
                         <div className="tbl-list-head">
                             <span style={{width:"23%"}} className="thumb">차량사진</span>
                             <span style={{width:"auto"}}>차량명</span>
                             <span style={{width:"8.9%"}}>연식</span>
                             <span style={{width:"10.7%"}}>주행거리</span>
                             <span style={{width:"16.9%"}}>가격</span>
                             <span style={{width:"6.1%"}}>등록일</span>
                         </div>
                     </div>
                 </div>
            </em>
        );
    }
}

module.exports = ActionBar;

class Category extends React.Component {
    constructor(props) {
        super(props);

        this.state = {
            listBrandData: [],
            listModelData: [],
            listSeriesData: [],
            listDetailData: [],
            selectedBrandId: 'all',
            selectedModelId: 'all',
            selectedSeriesId: 'all'
        };

        this.props.setScreen("optCategory");
    }

    componentDidMount() {
        $(".container .row, #car_choose").css({'height':$(window).height() - 50,'overflow':'hidden'});

        this.loadDataFromServer();
    }

    loadDataFromServer(){
        jQuery.ajax({
            type: "GET",
            url: "/search/optionInitializeCategoryListAjax.do",
            dataType: "JSON",
            cache: true,
            data: {
                cCho: this.props.cho,
                cBsNo: (this.props.sCategoryType === "tr")? this.props.sCategoryId: null,
                cBoNo: (this.props.sCategoryType === "mo")? this.props.sCategoryId: null,
                sDetail: this.props.stateData ? this.props.stateData.sDetail : null
            },
            success: function(json) {
                this.setState({
                    listBrandData: json.brandList,
                    listModelData: json.modelList ? json.modelList : []
                });

                if(this.props.sCategoryType === "br"){
                    this.state.selectedBrandId = this.props.sCategoryId;
                    this.selectBrand(this.props.sCategoryId, true);

                }else if(this.props.sCategoryType === "mo"){
                    this.state.selectedModelId = this.props.sCategoryId;

                    if(json.brandId){
                        this.state.selectedBrandId = json.brandId;
                    }

                    this.selectModel(this.props.sCategoryId, true);
                }else if(this.props.sCategoryType === "tr"){
                    if(json.brandId){
                        this.state.selectedBrandId = json.brandId;
                    }

                    if(json.modelId){
                        this.state.selectedModelId = json.modelId;
                        this.selectModel(json.modelId, true);
                        this.selectSeries(this.props.sCategoryId, true);
                    }
                }

            }.bind(this)
        });
    }

    selectBrand(brandId, ignoreParent){
        $('#car_choose .car-list').scrollTop(0);

        jQuery.ajax({
            type: "GET",
            url: "/search/optionAllModelAjax.do",
            dataType: "JSON",
            cache: true,
            data: {
                cCho: this.props.cho,
                cBmNo: brandId
            },
            success: function(json) {
                let scrW = $(window).width();
                let scrH = $(window).height() - 50;// window width
                let emblemListH = $('.emblem-list').height();   // emblem-list height
                let lPos = scrW-60;

                //$('.emblem-list li').removeClass('active');
                //$(this).parent('li').addClass('active');
                //$('#car_choose .car-list li').removeClass('active');
                $('#car_choose').removeClass('step3').addClass('step2');
                $('#car_choose .car-list').css('min-height',scrH+'px');
                $('#search_title').html('차종선택');

                this.setState({
                    listModelData: json.data,
                    selectedBrandId: brandId
                });

                if(!ignoreParent){
                    this.props.setCategory("br", brandId);
                }

            }.bind(this)
        });
    }

    selectModel(modelId, ignoreParent){
        $('#car_choose .model-list').scrollTop(0);

        if(modelId == 'all'){
            this.setState({
                selectedModelId: modelId
            });

            if(!ignoreParent) {
                this.props.setCategory("br", this.state.selectedBrandId);
                this.goBack();
            }
            return;
        }

        jQuery.ajax({
            type: "GET",
            url: "/search/optionAllSeriesAjax.do",
            dataType: "JSON",
            cache: true,
            data: {
                cCho: this.props.cho,
                cBoNo: modelId
            },
            success: function(json) {
                let scrW = $(window).width();
                let scrH = $(window).height() - 50;// window width
                let emblemListH = $('.emblem-list').height();   // emblem-list height
                let lPos = scrW-60;

                //$('#car_choose .car-list li').removeClass('active');
                //(this).parent('li').addClass('active');
                $('#car_choose').removeClass('step2').addClass('step3');
                $('#search_title').html('등급구분 선택');
                $('#car_choose .model-list').css('min-height',scrH+'px');

                this.setState({
                    listSeriesData: json.data,
                    selectedModelId: modelId
                });

                if(!ignoreParent) {
                    this.props.setCategory("mo", modelId);
                }

            }.bind(this)
        });
    }

    selectSeries(seriesId, ignoreParent){
        if(seriesId === 'all'){
            this.setState({
                selectedSeriesId: seriesId
            });

            if(!ignoreParent) {
                this.props.setCategory("mo", this.state.selectedModelId);
                this.goBack();
            }
            return;
        }

        jQuery.ajax({
            type: "GET",
            url: "/search/optionAllDetailAjax.do",
            dataType: "JSON",
            cache: true,
            data: {
                cCho: this.props.cho,
                cBsNo: seriesId
            },
            success: function(json) {
                this.setState({
                    listDetailData: json.data,
                    selectedSeriesId: seriesId
                });
                showLayerPopup('pop-detailmodel');

                if(!ignoreParent) {
                    this.props.setCategory("tr", seriesId);
                }
            }.bind(this)
        });
    }

    selectDetailItem(id) {
        if (jQuery("#detailAll").is(":checked")) {
            jQuery("#detailChecks input[type='checkbox']:checkbox").each(function(){
                $(this).prop("checked", false);
            });

            jQuery("#detail" + id).prop("checked", true);

        }else{
            if(jQuery("#detail" + id).is(":checked")){
                jQuery("#detail" + id).prop("checked", false);
            }else{
                jQuery("#detail" + id).prop("checked", true);
            }
        }

        if(jQuery("#detailAll").is(":checked")){
            this.props.setDetail(null);

        }else{
            const valDetail = jQuery("#detailChecks input:checkbox:checked").map(function(){return this.value}).get();

            if(valDetail.length > 0){
                this.props.setDetail(JSON.stringify(valDetail));
            }else{
                this.props.setDetail(null);
            }
        }
    }

    selectDetailAll(){
        if(jQuery("#detailAll").is(":checked")){
            jQuery("#detailChecks input[type='checkbox']:checkbox").each(function(){
                $(this).prop("checked", true);
            });

            this.props.setDetail(null);
        }else{
            jQuery("#detailChecks input[type='checkbox']:checkbox").each(function(){
                $(this).prop("checked", false);
            });
        }

        this.setState({
            selectedDetailList: []
        });
    }

    closeDetailPopup(){
        closeLayerPopup();
        jQuery("#detailChecks input[type='checkbox']:checkbox").each(function(){
            $(this).prop("checked", false);
        });
    }

    completeDetailPopup(){
        this.closeDetailPopup();
        this.props.setScreen("main");
    }

    goBack(){
        //this.props.setCategory(null);
        //this.props.setDetail(null);
        this.props.setScreen("main");
    }

    setBrandErrorImg(ev){
        ev.target.src = jQuery("#brandNoImage").val();
    }

    setModelErrorImg(ev){
        ev.target.src = jQuery("#modelNoImage").val();
    }

    render() {
        return (
            <React.Fragment>
                <div id="header" className="row header fixed">
                    <div className="column titlebar no-padding">
                        <div className="titlebar-left">
                            <button className="menu-icon" type="button" onClick={this.goBack.bind(this)}/>
                        </div>
                        <div id="logo" className="titlebar-center">
                            <a href="javascript:void(0);" title="제조사 선택" id="search_title">제조사 선택</a>
                        </div>
                    </div>
                </div>

                <div className="container">
                    <div className="row">
                        <div className="menu-list column no-padding" id="car_choose">
                            <ul className="article-list emblem-list scrolling">
                                {function(){
                                    return this.state.listBrandData.map(function(rowItem, key){
                                        return (
                                            <li key={key} className={this.state.selectedBrandId == rowItem.id ? "active" : ""} onClick={this.selectBrand.bind(this, rowItem.id, false)}>
                                                <a className="article-item" href="javascript:void(0);">
                                                    <span className="article-icon">
                                                        <img src={jQuery("#brandBaseUrl").val() + rowItem.image} onError={this.setBrandErrorImg} title={rowItem.name} alt=""/>
                                                    </span>
                                                    <span className="article-name">{rowItem.name}</span>
                                                </a>
                                            </li>
                                        );
                                    }, this);
                                }.call(this)}
                            </ul>

                            <div className="article-list car-list scrolling">
                                <ul>
                                    <li className={"total" + (this.state.selectedModelId === "all" ? " active" : "")} onClick={this.selectModel.bind(this, "all", false)}>
                                        <a className="article-item" href="javascript:void(0);">
                                            <span className="article-name">전체</span>
                                        </a>
                                    </li>
                                    {function(){
                                        return this.state.listModelData.map(function(rowItem, key){
                                            return (
                                                <li key={key} className={this.state.selectedModelId == rowItem.id ? "active" : ""} onClick={this.selectModel.bind(this, rowItem.id, false)}>
                                                    <a className="article-item" href="javascript:void(0);">
                                                        <span className="article-icon"><img src={jQuery("#modelBaseUrl").val() + rowItem.image} onError={this.setModelErrorImg} title={rowItem.name} alt=""/></span>
                                                        <span className="article-name">{rowItem.name}</span>
                                                        <span className="article-date">{rowItem.startdate} ~ {rowItem.enddate}</span>
                                                    </a>
                                                </li>
                                            );
                                        }, this);
                                    }.call(this)}
                                </ul>
                            </div>

                            <div className="article-list model-list scrolling">
                                <ul>
                                    <li className="total" onClick={this.selectSeries.bind(this, "all", false)}>
                                        <a className="article-item" href="javascript:void(0);">
                                            <span className="article-name">전체</span>
                                        </a>
                                    </li>
                                    {function(){
                                        return this.state.listSeriesData.map(function(rowItem, key){
                                            return (
                                                <li key={key} onClick={this.selectSeries.bind(this, rowItem.id, false)}>
                                                    <a className="article-item" href="javascript:void(0);">
                                                        <span className="article-name">{rowItem.name}</span>
                                                    </a>
                                                </li>
                                            );
                                        }, this);
                                    }.call(this)}
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

                <div className="modal-popup ty02 pop-detailmodel">
                    <div className="pop-header"><span>세부등급 선택</span>
                        <button className="btn-pop-close2" onClick={this.closeDetailPopup.bind(this)}><span className="hide">닫기</span></button>
                    </div>
                    <div className="pop-content padd0">
                        <div className="menu-list column no-padding">
                            <div className="article-list check-list paddRL">
                                <ul id="detailChecks">
                                    <li>
                                        {function(){
                                            let checked = this.props.sDetail ? false : true;
                                            return <input type="checkbox" name="detailAll" id="detailAll" onClick={this.selectDetailAll.bind(this)} checked={checked}/>
                                        }.call(this)}

                                        <label htmlFor="detailAll">전체</label>
                                    </li>
                                    {function(){
                                        return this.state.listDetailData.map(function(rowItem, key){
                                            let checked = false;

                                            try{
                                                const arrSelected = JSON.parse(decodeURIComponent(this.props.sDetail));

                                                arrSelected.map(function(detailId, key){
                                                    if(rowItem.id == detailId){
                                                        checked = true;
                                                    }
                                                })
                                            }catch(e){
                                            }

                                            return (
                                                <li key={key} onClick={this.selectDetailItem.bind(this, rowItem.id)}>
                                                    <input type="checkbox" name={"detail" + rowItem.id} id={"detail" + rowItem.id} value={rowItem.id} checked={checked}/>
                                                    <label htmlFor={"detail" + rowItem.id}>
                                                        {!rowItem.name ? "등급없음" : rowItem.name}
                                                    </label>
                                                </li>
                                            );
                                        }, this);
                                    }.call(this)}
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div className="button-group col2-square row">
                        <button type="button" className="button color-black" onClick={this.closeDetailPopup.bind(this)}>취소</button>
                        <button type="button" className="button color-red" onClick={this.completeDetailPopup.bind(this)}>선택완료</button>
                    </div>
                </div>

            </React.Fragment>
       );
    }
}

module.exports = Category;
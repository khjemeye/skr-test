const Search = require("./_elements/Search.jsx");
const SearchResult = require("./_elements/SearchResult.jsx");

const Category = require("./_elements/option/Category.jsx");
const Color = require("./_elements/option/Color.jsx");
const Fuel = require("./_elements/option/Fuel.jsx");
const Gear = require("./_elements/option/Gear.jsx");
const Option = require("./_elements/option/Option.jsx");

class CarSearchMain extends React.Component {
    constructor(props) {
        super(props);

        this.state = {
            themeType: null,
            screenType: "main",
            isMore: false
        };

        this.hashToState();

        window.addEventListener('hashchange', e => {
            this.hashToState();
        }, false);
    }

    initState(){
        this.state.cho = null;
        this.state.sCategoryType = null;
        this.state.sCategoryId = null;
        this.state.sDetail = null;
        this.state.sMinYear = null;
        this.state.sMaxYear = null;
        this.state.sMinMileage = null;
        this.state.sMaxMileage = null;
        this.state.sMinPrice = null;
        this.state.sMaxPrice = null;
        this.state.sColor = null;
        this.state.sFuel = null;
        this.state.sTrans = null;
        this.state.sOption  = null;
        this.state.sTextNumber = null;
        this.state.sTextSangsa = null;
        this.state.sTextDealer = null;
        this.state.sTextPhone = null;
        this.state.isMore = false;
        this.state.screenType= "main";
        this.state.themeType=null;
    }

    hashToState(){
        this.initState();

        if(document.location.hash){
            let arrParams = document.location.hash.replace("#", "").split("._.");

            for(let i=0; i<arrParams.length; i++){
                let arrItem = arrParams[i].split(":");

                switch(arrItem[0]){
                    case "cho":
                        this.state.cho = arrItem[1];
                        break;

                    case "category":
                        let arrCategory = arrItem[1].split("..");
                        this.state.sCategoryType = arrCategory[0];
                        this.state.sCategoryId = arrCategory[1];
                        break;

                    case "detail":
                        this.state.sDetail = arrItem[1];
                        break;

                    case "year":
                        let arrYear = arrItem[1].split("..");
                        this.state.sMinYear = arrYear[0] === 'null' ? null : arrYear[0];
                        this.state.sMaxYear = arrYear[1] === 'null' ? null : arrYear[1];
                        break;

                    case "mileage":
                        let arrMileage = arrItem[1].split("..");
                        this.state.sMinMileage = arrMileage[0] === 'null' ? null : arrMileage[0];
                        this.state.sMaxMileage = arrMileage[1] === 'null' ? null : arrMileage[1];
                        break;

                    case "price":
                        let arrPrice = arrItem[1].split("..");
                        this.state.sMinPrice = arrPrice[0] === 'null' ? null : arrPrice[0];
                        this.state.sMaxPrice = arrPrice[1] === 'null' ? null : arrPrice[1];
                        break;

                    case "color":
                        this.state.sColor = arrItem[1];
                        break;

                    case "fuel":
                        this.state.sFuel = arrItem[1];
                        break;

                    case "trans":
                        this.state.sTrans = arrItem[1];
                        break;

                    case "option":
                        this.state.sOption = arrItem[1];
                        break;

                    case "textNumber":
                        this.state.sTextNumber = arrItem[1];
                        break;

                    case "textSangsa":
                        this.state.sTextSangsa = arrItem[1];
                        break;

                    case "textDealer":
                        this.state.sTextDealer = arrItem[1];
                        break;

                    case "textPhone":
                        this.state.sTextPhone = arrItem[1];
                        break;

                    case "more":
                        this.state.isMore = arrItem[1];
                        break;

                    case "screen":
                        this.state.screenType = arrItem[1];
                        break;

                    case "theme":
                        this.state.themeType = arrItem[1];
                        break;
                }
            }
        }

        //alert("CarSearchMain.jsx::hashToState() - " + this.state.screenType + "," + this.refs.search + "," + this.refs.searchResult);
        if(this.state.screenType === 'main' && this.refs.search){
            this.refs.search.searchFromParent();
        }else if(this.state.screenType === 'searchResult' && this.refs.searchResult){
            //this.refs.searchResult.searchFromParent();
        }else {
            this.forceUpdate();
        }
    }

    componentDidMount(){}

    generateHash(){
        let condition = "";
        if(this.state.screenType){ condition += "screen:" + this.state.screenType }
        if(this.state.themeType){ condition += "._.theme:" + this.state.themeType }
        if(this.state.cho){ condition += "._.cho:" + this.state.cho }
        if(this.state.sCategoryType && this.state.sCategoryId){
            condition += "._.category:" + this.state.sCategoryType + ".." + this.state.sCategoryId;
        }
        if(this.state.sDetail){ condition += "._.detail:" + this.state.sDetail }
        if(this.state.sMinYear || this.state.sMaxYear){
            condition += "._.year:" + this.state.sMinYear + ".." + this.state.sMaxYear;
        }
        if(this.state.sMinMileage || this.state.sMaxMileage){
            condition += "._.mileage:" + (this.state.sMinMileage == 4500 ? 0 : this.state.sMinMileage) + ".." + (this.state.sMaxMileage == 160500 ? null : this.state.sMaxMileage);
        }
        if(this.state.sMinPrice || this.state.sMaxPrice){
            condition += "._.price:" + (this.state.sMinPrice == 4000000 ? 0 : this.state.sMinPrice) + ".." + (this.state.sMaxPrice == 111000000 ? null : this.state.sMaxPrice);
        }
        if(this.state.sColor){ condition += "._.color:" + this.state.sColor }
        if(this.state.sFuel){ condition += "._.fuel:" + this.state.sFuel }
        if(this.state.sTrans){ condition += "._.trans:" + this.state.sTrans }
        if(this.state.sOption){ condition += "._.option:" + this.state.sOption }
        if(this.state.sTextNumber){ condition += "._.textNumber:" + this.state.sTextNumber }
        if(this.state.sTextSangsa){ condition += "._.textSangsa:" + this.state.sTextSangsa }
        if(this.state.sTextDealer){ condition += "._.textDealer:" + this.state.sTextDealer }
        if(this.state.sTextPhone){ condition += "._.textPhone:" + this.state.sTextPhone }
        if(this.state.isMore){ condition += "._.more:" + this.state.isMore }

        document.location.hash = condition;
    }

    setCho(cho){
        this.state.cho = cho;
        this.generateHash();
    }

    setCategory(type, id){
        this.state.sDetail = null;
        this.state.sCategoryType = type;
        this.state.sCategoryId = id;
        this.generateHash();
    }

    setCategoryForModel(){
        if(this.state.sCategoryType !== "br" && this.state.sCategoryType !== "mo" && this.state.sCategoryType !== "tr"){
            alert('제조사를 먼저 선택하셔야 합니다.');

        }else{
            this.setScreen("optCategory");
        }
    }

    setCategoryForSeries(){
        if(this.state.sCategoryType !== "mo" && this.state.sCategoryType !== "tr"){
            alert('모델을 먼저 선택하셔야 합니다.');

        }else{
            this.setScreen("optCategory");
        }
    }

    setDetail(value){
        this.state.sDetail = value;
        this.generateHash();
    }

    setRangeYear(minYear, maxYear){
        this.state.sMinYear = minYear;
        this.state.sMaxYear = maxYear;
        this.generateHash();
    }

    setMinYear(minYear){
        this.state.sMinYear = minYear;
        this.generateHash();
    }

    setMaxYear(maxYear){
        this.state.sMaxYear = maxYear;
        this.generateHash();
    }

    setRangeMileage(minMileage, maxMileage){
        this.state.sMinMileage = minMileage;
        this.state.sMaxMileage = maxMileage;
        this.generateHash();
    }

    setRangePrice(minPrice, maxPrice){
        this.state.sMinPrice = minPrice;
        this.state.sMaxPrice = maxPrice;
        this.generateHash();
    }

    setColor(value){
        this.state.sColor = value;
        this.generateHash();
    }

    setFuel(value){
        this.state.sFuel = value;
        this.generateHash();
    }

    setTrans(value){
        this.state.sTrans = value;
        this.generateHash();
    }

    setOption(value){
        this.state.sOption = value;
        this.generateHash();
    }

    setTextNumber(value){
        this.state.sTextNumber = value;
        this.generateHash();
    }

    setTextSangsa(value){
        this.state.sTextSangsa = value;
        this.generateHash();
    }

    setTextDealer(value){
        this.state.sTextDealer = value;
        this.generateHash();
    }

    setTextPhone(value){
        this.state.sTextPhone = value;
        this.generateHash();
    }

    makePremiumIcon(rowItem) {
        if(rowItem.cPremiumYn == 'Y') {
        	return (<div className="car-icon"><i className="label l3">프리미엄</i></div>);
        }
        else if(rowItem.cCertYn == 'Y') {
        	return (<div className="car-icon"><i className="label l6">인증</i></div>);
        }
        else if(rowItem.cHoticonCd != null && rowItem.cHoticonCd.indexOf('02') != -1) {
        	return (<div className="car-icon"><i className="label l5">특가</i></div>);
        }
        return "";
    }

    initSearch(){
    	//KDJ2020-07-30 : 가격,마일리지 범위 슬라이더 초기화 로직 추가
    	$('#range-price .slider-area').slider('values', [400,11100])
        $("#price_all").show();
        $("#price_mid").hide();
        $("#price_set").hide();
        $('#range-km .slider-area').slider('values', [4500,160500])
        $("#mileage_all").show();
        $("#mileage_mid").hide();
        $("#mileage_set").hide();

        let url ='/search.do?#screen:main';

        if(this.state.cho){
            url = url +  '._.cho:' + this.state.cho
        }

        if(this.state.themeType){
            url = url +  '._.theme:' + this.state.themeType
        }

        location.href = url;
    }

    setScreen(type){
        this.state.screenType = type;
        this.generateHash();
    }

    setMore(state){
        this.state.isMore = state;
        this.generateHash();
    }

    render(){
        return (
            <React.Fragment>
                {function () {
                    switch (this.state.screenType) {
                        case "main":
                            return <Search
                                        ref="search"
                                        setScreen={this.setScreen.bind(this)}
                                        setCho={this.setCho.bind(this)}
                                        setMore={this.setMore.bind(this)}
                                        setMinYear={this.setMinYear.bind(this)}
                                        setMaxYear={this.setMaxYear.bind(this)}
                                        setRangePrice={this.setRangePrice.bind(this)}
                                        setRangeMileage={this.setRangeMileage.bind(this)}
                                        initSearch={this.initSearch.bind(this)}
                                        setCategory={this.setCategory.bind(this)}
                                        setDetail={this.setDetail.bind(this)}
                                        setTextNumber={this.setTextNumber.bind(this)}
                                        setTextSangsa={this.setTextSangsa.bind(this)}
                                        setTextDealer={this.setTextDealer.bind(this)}
                                        setTextPhone={this.setTextPhone.bind(this)}
                                        setCategoryForModel={this.setCategoryForModel.bind(this)}
                                        setCategoryForSeries={this.setCategoryForSeries.bind(this)}
                                        stateData={this.state}
                                    />;
                        case "optCategory":
                            return <Category
                                        setScreen={this.setScreen.bind(this)}
                                        setCategory={this.setCategory.bind(this)}
                                        setDetail={this.setDetail.bind(this)}
                                        sCategoryType={this.state.sCategoryType}
                                        sCategoryId={this.state.sCategoryId}
                                        cho={this.state.cho}
                                        sDetail={this.state.sDetail}
                                   />;
                        case "optFuel":
                            return <Fuel
                                        setScreen={this.setScreen.bind(this)}
                                        setFuel={this.setFuel.bind(this)}
                                        sFuel={this.state.sFuel}
                                    />;
                        case "optGear":
                            return <Gear
                                        setScreen={this.setScreen.bind(this)}
                                        setTrans={this.setTrans.bind(this)}
                                        sTrans={this.state.sTrans}
                                    />;
                        case "optColor":
                            return <Color
                                        setScreen={this.setScreen.bind(this)}
                                        setColor={this.setColor.bind(this)}
                                        sColor={this.state.sColor}
                                    />;
                        case "optOption":
                            return <Option
                                        setScreen={this.setScreen.bind(this)}
                                        setOption={this.setOption.bind(this)}
                                        sOption={this.state.sOption}
                                   />;
                        case "searchResult":
                            return <SearchResult
                                        ref="searchResult"
                                        setScreen={this.setScreen.bind(this)}
                            			makePremiumIcon={this.makePremiumIcon.bind(this)}
                                        stateData={this.state}
                                   />;
                    }
                }.call(this)}
            </React.Fragment>
            );
        }
    }

ReactDOM.render(
    <CarSearchMain />,
    document.getElementById('carsearchmain')
);

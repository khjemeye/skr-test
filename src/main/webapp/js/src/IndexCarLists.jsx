const parse = require('html-react-parser');

class IndexCarLists extends React.Component {
    constructor(props){
        super(props);

        this.state = {
            listData: [],
            tab: 1
        };
    }

    componentDidMount() {
        this.setState({listData: JSON.parse(jQuery("#newCarList").val())});
    }

    changeTab(index){
        for(let i=1; i<=3; i++){
            if(index !== i){
                jQuery("#mainListTab" + i).removeClass("on");
            }
        }

        jQuery("#mainListTab" + index).addClass("on");
        this.state.tab = index;

        if(index === 2) {
            if (jQuery("#recentCars").val().trim() != ""){
                this.setState({listData: JSON.parse(jQuery("#recentCars").val())});
            }else{
                this.setState({listData: null});
            }
        }else if(index === 3){
            if(jQuery("#isLogin").val() === "Y"){
                this.setState({listData: JSON.parse(jQuery("#favCars").val())});
            }else{
                this.setState({listData: null});
            }

        }else{
            this.setState({listData: JSON.parse(jQuery("#newCarList").val())});
        }
    }

    getPrice(price){
        if(price < 10000){
            return (commaSplit(price) + "원");
        }else{
            return (commaSplit(Math.floor(price/10000)) + "만원");
        }
    }

    goDetail(cNo){
        openPopup('car_detail', cNo);
    }

    render() {
        return (
            <React.Fragment>
                <div className="premium">
                    <ul className={(this.state.listData && this.state.listData.length > 0) ? "usedcar-list":""}>
                    {function(){
                        if(this.state.listData && this.state.listData.length > 0){
                            return this.state.listData.map(function(rowItem, key){
                                let year = "";

                                if(rowItem.cYear){ year = "(" + rowItem.cYear.substring(2, 4) + "년형)"; }

                                let firstDate = "";
                                if(rowItem.firstDate){
                                    const arrDate = rowItem.firstDate.split("-");
                                    if(arrDate.length === 3 && arrDate[0].length === 4){
                                        firstDate = arrDate[0].substring(2, 4) + "/" + arrDate[1];
                                    }
                                }

                                let priceTag = null;
                                if(rowItem.cSiteshowStatusCd == "R") {
                                    priceTag = "계약중";
                                } else {
                                    if(rowItem.price == 0) {
                                        priceTag = "가격문의";
                                    }
                                }

                                return (
                                    <li key={key}>
                                        <a href="javascript:void(0);" onClick={this.goDetail.bind(this, rowItem.carId)}>
                                            {function(){
                                                if(rowItem.featuredImage){
                                                    return <div className="thumb" style={{backgroundImage: `url('` + rowItem.featuredImage + `'), url('/images/nophoto/nophoto_640x480.png')`}}/>
                                                }else {
                                                    return <div className="thumb" style={{backgroundImage: `url('/images/nophoto/nophoto_640x480.png')`}}/>
                                                }
                                            }.call(this)}
                                            <div className="info-wrap">
                                                <div className="pdt-info">
            										<div className="car-icon">
            											<i className="label l5">특가</i>
            										</div>
                                                    <p className="pdt-name">{rowItem.title}</p>
                                                    <p className="usedcar-opt">
                                                    	<span>{firstDate}식{year}</span> ∙ <span>{commaSplit(rowItem.mileage)}km</span> ∙ <span>{rowItem.fuelName}</span>
                                                    </p>
                									<p className="usedcar-icon">
                									{parse(rowItem.cHoticonTag)}
            										</p>
                                                    <div className="pdt-price">
                                                        <div className="price">
                                                            <span className="sale-price">
                                                                <em>{priceTag == null ? this.getPrice(rowItem.price) : priceTag}</em>
                                                            </span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                );

                            }, this) ;

                        }else{
                            let msg = "";

                            if(this.state.tab === 1){
                                msg = "프리미엄 차량이 없습니다.";
                            }else if(this.state.tab === 2){
                                msg = "최근 본 차량이 없습니다.";
                            }else if(this.state.tab === 3){
                                if(jQuery("#isLogin").val() === "Y") {
                                    msg = "등록 된 관심차량이 없습니다.";
                                }else{
                                    msg = "로그인 해 주세요.";
                                }
                            }
                            return <li className="data-empty">{msg}</li>;
                        }
                    }.call(this)}

                    {function(){
                        if(this.state.listData && this.state.listData.length > 0){
                            var url = "";

                            if(this.state.tab === 1){
                                url = "/search.do#screen:searchResult";
                            }else if(this.state.tab === 2){
                                url = "/mypage/selectLastLookCarView.do";
                            }else if(this.state.tab === 3){
                                url = "/mypage/selectJJimCarView.do";
                            }

                            //return <li className="more"><a href={url}>더보기</a></li>
                        }
                    }.call(this)}
                    </ul>
                </div>
            </React.Fragment>
        );
    }
}

ReactDOM.render(
    <IndexCarLists />,
    document.getElementById('mainCarList')
);

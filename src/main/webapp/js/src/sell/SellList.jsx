class SellList extends React.Component {
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

    componentDidMount(){
        this.loadDataFromServer();
    }

    loadDataFromServer(){
        jQuery.ajax({
            type: "GET",
            url: "/sell/selectCarListAjax.do" ,
            data: {
                searchHp: jQuery("#searchText").val(),
                page: this.state.page,
                rows: this.state.rows
            },
            dataType: "JSON",
            success: function(json){
                let listData = this.state.listData;
                let newListData = listData.concat(json.data);

                this.setState({
                    loadingFlag: false,
                    listData: newListData,
                    totalCount: json.count,
                    hasMore: newListData.length < json.count
                });
            }.bind(this),
            error:function(){
                alert( 'error' );
            }
        });
    }

    handleScroll(){
        if((jQuery(window).scrollTop() + 60) > (jQuery(document).height() - jQuery(window).height())){
            if(!this.state.loadingFlag && this.state.hasMore){
                this.state.loadingFlag = true;
                this.state.page = this.state.page + 1;

                this.loadDataFromServer();
            }
        }
    }

    search(){
        let searchText = jQuery("#searchText").val();

        if(searchText.length === 4 || searchText.length === 0 ){
            this.state.page = 1;
            this.state.listData = [];
            this.state.totalCount = 0;
            this.state.hasMore = false;

            this.loadDataFromServer();
        }
    }

    getProdDate(firstDate, year){
        let result = "";

        if(firstDate && firstDate.length === 10){
            result = firstDate.substr(0, 4) + "년" + firstDate.substr(5, 2) + "월식";
        }

        if(year){
            result = result + "(" + year + "년형)";
        }

        return result;
    }

    getTitle(carName){
        return carName;
    }

    getHp(hp){
        return "***-****-" + hp.substring(hp.length - 4, hp.length);
    }

    getRegDate(time){
        let date = new Date(time);
        let yyyy = date.getFullYear().toString();
        let mm = (date.getMonth()+1).toString();
        let dd = date.getDate().toString();

        return yyyy + "." + ( mm[1] ? mm : "0" + mm[0] ) + "." + ( dd[1] ? dd : "0" + dd[0] );
    }

    render(){
        return (
            <React.Fragment>
                <div className="title_wrap">
                    <h2>접수내역</h2>
                </div>
                <div className="row">
                    <div className="column search-form count">
                        <span>전체 <strong>{this.state.totalCount}</strong>건</span>
                        <input type="text" id="searchText" name="searchText" maxLength={4} placeholder="연락처 뒷 4자리" maxlength="4"/>
                        <button type="button" className="btn-search" onClick={this.search.bind(this)}>검색</button>
                    </div>
                </div>
                <div className="row qa-list-wrap car-sell">
                    <div className="column">
                        <ul className="qa-list">
                            {function(){
                                if(this.state.listData){
                                    return this.state.listData.map(function(rowItem, key){
                                        return (
                                            <li className={"liClass_" + rowItem.conNo} key={key}>
                                            	<a href="javascript:;">
                                                <div className="year">{this.getProdDate(rowItem.conFirstdate, rowItem.conYear)}</div>
                                                <div className="title">{this.getTitle(rowItem.conCarname)}</div>
                                                <div className="info">
                                                    <span className="category">{this.getHp(rowItem.conHp)}</span><br/>
                                                    <span className="date">{this.getRegDate(rowItem.conRegDate)}</span>
                                                    {function(){
                                                        let className = "icon";
                                                        if(rowItem.conStatusCd === "ING"){
                                                            className = "icon ing";
                                                        }
                                                        return  <span className={className}>{rowItem.conStatusNm}</span>
                                                    }.call(this)}
                                                </div>
                                                </a>
                                                <div className="inputFormWrap">
                                                </div>
                                            </li>
                                        );
                                    }, this);
                                }else{
                                    return (<li className="result_nodata">검색결과가 없습니다.</li>);
                                }
                            }.call(this)}
                        </ul>
                    </div>
                </div>
            </React.Fragment>
        );
    }
}

ReactDOM.render(
    <SellList />,
    document.getElementById('sellList')
);

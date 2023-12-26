const Paging = require("../_common/Paging.jsx");

class AlarmList extends React.Component {
    constructor(props){
        super(props);

        this.state = {
            page: 1,
            rows: 10,
            searchText: "",
            listData: [],
            totalCount: 0
        };
    }

    componentDidMount() {
        this.loadDataFromServer();
    }

    loadDataFromServer(){
        jQuery.ajax({
            type: "GET",
            url: "/mypage/selectAlarmListAjax.do",
            dataType: "JSON",
            data: {
                page: this.state.page,
                rows: this.state.rows
            },
            success: function(json) {
                jQuery("#totalCnt").text(json.count);

                this.setState({
                    listData: json.data,
                    totalCount: json.count
                });
            }.bind(this)
        });
    }

    onPageChange(state){
        let page = this.state.page;

        if(state === 'prev'){
            this.state.page = page - 1;
        }else if(state === 'next'){
            this.state.page = page + 1;
        }

        this.loadDataFromServer();
    }

    getBeforeTime(dt){
        const min = 60 * 1000;
        const c = new Date();
        const d = new Date(dt);
        const minsAgo = Math.floor((c - d) / (min));

        let result = dt;

        if (minsAgo < 60) { // 1시간 내
            result = minsAgo + '분 전';
        } else if (minsAgo < 60 * 24) { // 하루 내
            result = Math.floor(minsAgo / 60) + '시간 전';
        } else { // 하루 이상
            result = Math.floor(minsAgo / 60 / 24) + '일 전';
        }

        return result;
    };

    render(){
        return (
            <React.Fragment>
                <div className="row">
                    <div className="column padd0">
                        <div className="qa-list-wrap notice">
                            <ul className="qa-list">
                                {function(){
                                    if(this.state.listData && this.state.listData.length > 0){
                                        return this.state.listData.map(function(rowItem, key) {
                                            return (
                                                <li key={key}>
                                                    <a href={"/mypage/alarmView.do?a_no=" + rowItem.aNo}>
                                                        {function(){
                                                            if(rowItem.aPushTypeCd === "NOTICE") {
                                                                return <div className="photo master"><span>운영자</span></div>

                                                            }else{
                                                                if(rowItem.dealerImage){
                                                                    return <div className="photo" style={{backgroundImage: `url(` + rowItem.dealerImage + `), url(` + jQuery("#dealerNoImage").val() + `)`}}><span>{rowItem.dlName}</span></div>
                                                                }else{
                                                                    return <div className="photo" style={{backgroundImage: `url(` + jQuery("#dealerNoImage").val() + `)`}}><span>{rowItem.dlName}</span></div>
                                                                }
                                                            }
                                                        }.call(this)}

                                                        <div className="title">{rowItem.aSubject}</div>
                                                        <div className="info"><span className="category">{rowItem.aTypeNm}</span>
                                                            <span className="date">{this.getBeforeTime(rowItem.aRegDate)}</span>
                                                        </div>
                                                    </a>
                                                </li>
                                            );
                                        }, this);
                                    }else{
                                        return <li className="data-empty">알림이 없습니다</li>;
                                    }
                                }.call(this)}
                            </ul>
                        </div>
                        <Paging page={this.state.page} total={this.state.totalCount} rows={this.state.rows} onPageChange={(page)=>this.onPageChange(page)}/>
                    </div>
                </div>
            </React.Fragment>
        );
    }
}

ReactDOM.render(
    <AlarmList />,
    document.getElementById('alarmList')
);

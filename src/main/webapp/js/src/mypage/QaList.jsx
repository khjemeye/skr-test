const Paging = require("../_common/Paging.jsx");

class QaList extends React.Component {
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
            url: "/mypage/selectInquiryListAjax.do",
            dataType: "JSON",
            data: {
                page: this.state.page,
                rows: this.state.rows
            },
            success: function(json) {
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

    render(){
        return (
            <React.Fragment>
                <div className="row">
                    <div className="column total-text">
                        <span className="total-text">총 <strong>{this.state.totalCount}</strong>건</span>
                    </div>
                </div>
                <div className="row qa-list-wrap qa">
                    <div className="column">

                        <ul className="qa-list">
                            {function(){
                                if(this.state.listData && this.state.listData.length > 0){
                                    return this.state.listData.map(function(rowItem, key) {
                                        return (
                                            <li key={key}>
                                                <a href={"/mypage/selectMyInquriyView.do?m_no=" + rowItem.blbdNo}>
                                                    <div className="title">{rowItem.blbdTitl}</div>
                                                    <div className="info"><span className="category">{rowItem.vocTypeNm}</span> <span
                                                        className="date">{rowItem.createDt}</span>
                                                        {function(){
                                                            if(rowItem.ansrYn === 'Y'){
                                                                return <span className="icon re-end">답변완료</span>
                                                            }else {
                                                                return <span className="icon re-wait">대기중</span>
                                                            }
                                                        }.call(this)}
                                                    </div>
                                                </a>
                                            </li>
                                        );
                                    }, this);
                                }else{
                                    return <li className="data-empty">등록된 문의사항이 없습니다</li>;
                                }
                            }.call(this)}
                        </ul>
                        {function(){
                            if(this.state.listData && this.state.listData.length > 0){
                                return <Paging page={this.state.page} total={this.state.totalCount} rows={this.state.rows} onPageChange={(page)=>this.onPageChange(page)}/>
                            }
                        }.call(this)}
                    </div>
                </div>
            </React.Fragment>
        );
    }
}

ReactDOM.render(
    <QaList />,
    document.getElementById('qaList')
);

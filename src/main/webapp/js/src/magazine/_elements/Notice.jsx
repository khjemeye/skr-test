const Paging = require("../../_common/Paging.jsx");

class Notice extends React.Component {
    constructor(props){
        super(props);

        this.state = {

        };
    }

    getDiffDays(date1, date2){
        var diff = Math.abs(date1.getTime() - date2.getTime());

        diff = Math.ceil(diff / (1000 * 3600 * 24));
        return diff;
    }

    checkNew(date){
        let days = jQuery("#checkNewDays").val();

        if(date && days){
            return this.getDiffDays(new Date(), new Date(date)) <= days;
        }

        return false;
    }

    render(){
        return (
            <React.Fragment>
                <div className="divide"></div>
                <div className="row">
                    <div className="column total-text">
                        <span className="total-text">총 <strong>{this.props.totalCount}</strong>건</span>
                    </div>
                </div>
                <div className="row">
                    <div className="column padd0">

                        <div className="qa-list-wrap notice">
                            <ul className="qa-list">
                                {function(){
                                    if(this.props.data && this.props.data.length > 0){
                                        return this.props.data.map(function(rowItem, key) {
                                            let className = "";

                                            if(rowItem.blbdLvlCd === "02"){
                                                className = "notice"
                                            }

                                            return (
                                                <li key={key} className={className}>
                                                    <a href={"/magazine/notice/view.do?m_no=" + rowItem.blbdNo}>
                                                        <div className="title">{rowItem.blbdTitl}
                                                            {function(){
                                                                if(this.checkNew(rowItem.createDt)) {
                                                                    return <span>&nbsp;<span className="icon new">new</span></span>;
                                                                }
                                                            }.call(this)}
                                                        </div>
                                                        <div className="info">
                                                            {function(){
                                                                if(rowItem.blbdLvlCd === "02") {
                                                                    return <span className="category">공지&nbsp;</span>;
                                                                }
                                                            }.call(this)}
                                                            <span className="date">{rowItem.createDt}</span>
                                                        </div>
                                                    </a>
                                                </li>
                                            );
                                        }, this);
                                    }else{
                                        return <li className="data-empty">등록된 게시물이 없습니다</li>;
                                    }
                                }.call(this)}
                            </ul>
                        </div>
                        {function(){
                            if(this.props.data && this.props.data.length > 0) {
                                return <Paging page={this.props.page} total={this.props.totalCount} rows={this.props.rows} onPageChange={this.props.onPageChange}/>
                            }
                        }.call(this)}
                    </div>
                </div>
            </React.Fragment>
        );
    }
}

module.exports = Notice;

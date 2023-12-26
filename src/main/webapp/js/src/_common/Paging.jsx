class Paging extends React.Component {
    constructor(props){
        super(props);
    }

    onPageChange(state){
        if(this.props.onPageChange){
            this.props.onPageChange(state);
        }
    }

    render(){
        let totalPage = 0;
        let total = parseInt(this.props.total);
        let rows = parseInt(this.props.rows);

        let rest = total % rows;

        if(rest > 0){
            totalPage = parseInt(total / rows) + 1;
        }else{
            totalPage = parseInt(total / rows);
        }

        return (
            <div className="paging">
                <a href="javascript:void(0);" className="prev" style={{visibility: this.props.page > 1 ? "visible" : "hidden"}} onClick={()=>this.onPageChange('prev')}><span className="hide">이전 페이지로</span></a>
                <a href="javascript:void(0);" className="active">{this.props.page}</a> / <a href="javascript:void(0);">{totalPage}</a>
                <a href="javascript:void(0);" className="next" style={{visibility: this.props.page < totalPage ? "visible" : "hidden"}} onClick={()=>this.onPageChange('next')}><span className="hide">다음 페이지로</span></a>
            </div>
        );
    }
}

module.exports = Paging;

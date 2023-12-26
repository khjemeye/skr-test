class Paging extends React.Component {
    constructor(props) {
        super(props);

        this.state = {
            page: parseInt(this.props.page)
        };
    }

    setPage(page){
        this.state.page = page;
        this.props.setPage(page);

        this.forceUpdate();
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

        let start = Math.floor((this.state.page - 1) / 10) * 10 + 1;
        let end = (Math.floor((this.state.page - 1) / 10) + 1) * 10;

        if(end > totalPage){
            end = totalPage;
        }

        let rowsArr = [];
        rowsArr.push(<a href="javascript:void(0);" onClick={this.setPage.bind(this, 1)} className="direction first"></a>);

        if(this.state.page > 1){
            rowsArr.push(<a href="javascript:void(0);" onClick={this.setPage.bind(this, (this.state.page - 1))} className="direction prev"></a>);
        }else{
            rowsArr.push(<a href="javascript:void(0);" className="direction prev"></a>);
        }

        for(let i=start; i<=end; i++){
            if(this.state.page === i){
                rowsArr.push(<strong className="num">{i}</strong>);
            }else{
                rowsArr.push(<a href="javascript:void(0)" onClick={this.setPage.bind(this, i)} className="num">{i}</a>);
            }
        }

        if(this.state.page !== totalPage){
            rowsArr.push(<a href="javascript:void(0);" onClick={this.setPage.bind(this, (this.state.page + 1))} className="direction next"></a>);
        }else{
            rowsArr.push(<a href="javascript:void(0);" className="direction next"></a>);
        }

        rowsArr.push(<a href="javascript:void(0);" onClick={this.setPage.bind(this, totalPage)} className="direction last"></a>);

        return (<div className="pagination">{rowsArr}</div>);
    }
}

module.exports = Paging;

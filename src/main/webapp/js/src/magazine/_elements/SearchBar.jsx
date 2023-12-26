class SearchBar extends React.Component {
    constructor(props){
        super(props);

        this.state = {
            searchText: ""
        };
    }

    onChange(e){
        this.setState({
            searchText: e.target.value
        });
    }

    search(){
        if(this.props.onSearch){
            this.props.onSearch(this.state.searchText);
        }
    }

    render(){
        return (
            <div className="row">
                <div className="column search-form">
                    <label htmlFor="SerchText" className="title">{this.props.title}</label>
                    <input type="text" id="searchText" name="SerchText" placeholder="키워드를 입력하세요." onChange={(e)=>this.onChange(e)} value={this.state.searchText}/>
                    <button type="button" className="btn-search" onClick={()=>this.search()}>검색</button>
                    {function(){
                        if(this.props.info){
                            return <div className="txt_info">{this.props.info}</div>
                        }
                    }.call(this)}
                </div>
            </div>
        );
    }
}

module.exports = SearchBar;

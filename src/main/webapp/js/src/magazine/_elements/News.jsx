const SearchBar = require("./SearchBar.jsx");
const NewsSlider = require("./NewsSlider.jsx");
const Paging = require("../../_common/Paging.jsx");

class News extends React.Component {
    constructor(props){
        super(props);

        this.state = {

        };
    }

    onSearch(text){
        this.state.isSearchMode = text.length > 0 ? true : false;

        if(this.props.onSearch){
            this.props.onSearch(text);
        }
    }

    render(){
        return (
            <React.Fragment>
                <div className="divide"></div>
                {function() {
                    if (this.props.banners && this.props.banners.length > 0) {
                        return <NewsSlider data={this.props.banners}/>;
                    }
                }.call(this)}
                <SearchBar title="뉴스검색" info="(제목, 내용, 작성자 기준 키워드 검색)" onSearch={(text)=>this.onSearch(text)}/>
                <div className="divide"></div>
                <div className="row">
                    <div className="column total-text">
                        <span className="total-text">총 <strong>{this.props.totalCount}</strong>건</span>
                    </div>
                </div>
                <div className="row">
                    <div className="column padd0">
                        <div className="news-image-list blog">
                            {function(){
                                if(this.props.data && this.props.data.length > 0){
                                    return this.props.data.map(function(rowItem, key) {
                                        return (
                                            <div key={key} className="grid-item">
                                                <a href={"/magazine/news/view.do?m_no=" + rowItem.blbdNo}>
                                                    {function(){
                                                        if(rowItem.featuredImage){
                                                            return <div className="img-area" style={{backgroundImage:'url(' + rowItem.featuredImage + '), url(/images/nophoto/nophoto_640x480.png)'}}></div>;
                                                        }else{
                                                            return <div className="img-area" style={{backgroundImage:"url(/images/nophoto/nophoto_640x480.png"}}></div>;
                                                        }
                                                    }.call(this)}
                                                    <div className="text-area">
                                                        {rowItem.createDt}
                                                        <div className="title">{rowItem.blbdTitl}</div>
                                                    </div>
                                                </a>
                                            </div>
                                        )
                                    }, this);
                                }else {
                                    return (
                                        <div className="grid-item data-empty">
                                            {this.state.isSearchMode ? "검색결과가 없습니다" : "등록된 게시물이 없습니다"}
                                        </div>
                                    )
                                }
                            }.call(this)}
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

module.exports = News;

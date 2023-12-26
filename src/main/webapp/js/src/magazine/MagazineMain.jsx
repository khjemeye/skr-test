const Event = require("./_elements/Event.jsx");
const News = require("./_elements/News.jsx");
const Notice = require("./_elements/Notice.jsx");

class MagazineMain extends React.Component {
    constructor(props){
        super(props);

        this.state = {
            page: 1,
            rows: 5,
            searchText: "",
            bannerData: [],
            listData: [],
            totalCount: 0,
            screenType: jQuery("#magazine_type").val()
        };
    }

    componentDidMount() {
        this.loadDataFromServer();
        this.loadBannerDataFromServer();
    }

    loadBannerDataFromServer(){
        jQuery.ajax({
            type: "GET",
            url: "/magazine/selectMagazineBannerListAjax.do",
            dataType: "JSON",
            cache: true,
            data: {
                searchType: this.state.screenType
            },
            success: function(json) {
                this.setState({
                    bannerData: json.data
                });
            }.bind(this)
        });
    }

    loadDataFromServer(){
        jQuery.ajax({
            type: "GET",
            url: "/magazine/selectMagazineListAjax.do",
            dataType: "JSON",
            cache: true,
            data: {
                page: this.state.page,
                rows: this.state.rows,
                searchText: this.state.searchText,
                searchType: this.state.screenType
            },
            success: function(json) {
                this.setState({
                    listData: json.data,
                    totalCount: json.count
                });
            }.bind(this)
        });
    }

    onSearch(text){
        this.state.page = 1;
        this.state.searchText = text ? text : '';

        this.loadDataFromServer();
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

    render() {
        return (
            <React.Fragment>
                {function (){
                    switch (this.state.screenType) {
                        case "news":
                            return <News data={this.state.listData} banners={this.state.bannerData} totalCount={this.state.totalCount} page={this.state.page} rows={this.state.rows} onPageChange={(state)=>this.onPageChange(state)} onSearch={(text)=>this.onSearch(text)}/>;
                        case "notice":
                            return <Notice data={this.state.listData} totalCount={this.state.totalCount} page={this.state.page} rows={this.state.rows} onPageChange={(state)=>this.onPageChange(state)}/>;
                        case "event":
                            return <Event data={this.state.listData} banners={this.state.bannerData} totalCount={this.state.totalCount} page={this.state.page} rows={this.state.rows} onPageChange={(state)=>this.onPageChange(state)} onSearch={(text)=>this.onSearch(text)}/>;
                    }
                }.call(this)}
            </React.Fragment>
        );
    }
}

ReactDOM.render(
    <MagazineMain />,
    document.getElementById('magazineMain')
);

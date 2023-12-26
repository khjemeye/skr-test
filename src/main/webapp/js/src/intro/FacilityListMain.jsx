class FacilityListMain extends React.Component {
    constructor(props) {
        super(props);

        this.state = {
            pageType: "1F",
            listData: [],
            listData2: [],
            sangsaBaseUrl: "",
            officeBaseUrl: "",
            sangsaNoImage: "",
            officeNoImage: ""
        };

    }

    componentDidMount() {
        this.loadDataFromServer();
    }

    loadDataFromServer() {
        let url = "/intro/selectRoomList.do";
        let floor = this.state.pageType;

        if(floor == null || floor == "") {
            floor = "1F";
        }

        jQuery.ajax({
            type: "GET",
            url: url,
            data: {
                floor: floor
            },
            cache: false,
            dataType: "JSON",
            success: function (json) {
                this.setState({
                    listData: json.companyList,
                    listData2: json.officeList,
                    sangsaBaseUrl: json.sangsaBaseUrl,
                    officeBaseUrl: json.officeBaseUrl,
                    sangsaNoImage: json.sangsaNoImage,
                    officeNoImage: json.officeNoImage
                })
            }.bind(this),
            error: function () {
                alert('erro');
            }
        });
    }

    onChangeTab(pageType) {
        this.state.pageType = pageType;
        this.loadDataFromServer();
    }

    setErrorImg(ev, src) {
        ev.target.src = src;
        ev.target.onerror = null;
    }

    render() {
        return (
            <React.Fragment>
                <div className="row">
                    <div className="column sub-nav col6">
                        <ul>
                            <li className={this.state.pageType === "1F" ? "active" : ""} onClick={this.onChangeTab.bind(this, "1F")}><a href="javascript:;" title="1F">1F</a></li>
                            <li className={this.state.pageType === "2F" ? "active" : ""} onClick={this.onChangeTab.bind(this, "2F")}><a href="javascript:;" title="2F">2F</a></li>
                            <li className={this.state.pageType === "3F" ? "active" : ""} onClick={this.onChangeTab.bind(this, "3F")}><a href="javascript:;" title="3F">3F</a></li>
                            <li className={this.state.pageType === "4F" ? "active" : ""} onClick={this.onChangeTab.bind(this, "4F")}><a href="javascript:;" title="4F">4F</a></li>
                            <li className={this.state.pageType === "5F" ? "active" : ""} onClick={this.onChangeTab.bind(this, "5F")}><a href="javascript:;" title="5F">5F</a></li>
                            <li className={this.state.pageType === "6F" ? "active" : ""} onClick={this.onChangeTab.bind(this, "6F")}><a href="javascript:;" title="6F">6F</a></li>
                            <li className={this.state.pageType === "7F" ? "active" : ""} onClick={this.onChangeTab.bind(this, "7F")}><a href="javascript:;" title="7F">7F</a></li>
                            <li className={this.state.pageType === "8F" ? "active" : ""} onClick={this.onChangeTab.bind(this, "8F")}><a href="javascript:;" title="8F">8F</a></li>
                            <li className={this.state.pageType === "9F" ? "active" : ""} onClick={this.onChangeTab.bind(this, "9F")}><a href="javascript:;" title="9F">9F</a></li>
                            <li className={this.state.pageType === "B1" ? "active" : ""} onClick={this.onChangeTab.bind(this, "B1")}><a href="javascript:;" title="B1">B1</a></li>
                            <li className={this.state.pageType === "B2" ? "active" : ""} onClick={this.onChangeTab.bind(this, "B2")}><a href="javascript:;" title="B2">B2</a></li>
                            <li className={this.state.pageType === "B3" ? "active" : ""} onClick={this.onChangeTab.bind(this, "B3")}><a href="javascript:;" title="B3">B3</a></li>
                        </ul>
                    </div>
                </div>

                <div className="divide"></div>
                <div className="row facilitys-table">
                    <div className="column">
                        <div className="title_wrap">
                            <h2>매매상사</h2>
                        </div>
                        <table border="0" cellpadding="0" cellspacing="0" className="t_normal font14">
                            <colgroup>
                                <col style={{width:50}}/>
                                <col style={{width:120}}/>
                                <col/>
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th className="color">호실</th>
                                    <th className="color">로고</th>
                                    <th className="color">상호/전화번호</th>
                                </tr>
                                {function() {
                                    if(this.state.listData.length > 0) {
                                        return this.state.listData.map(function(rowItem, key) {
                                            return (
                                                <tr key={key}>
                                                    <td>{rowItem.roomNo}</td>
                                                    {function() {
                                                        if(rowItem.mainImage) {
                                                            return <td><img src={rowItem.uploadPath + '/' + rowItem.mainImage} onError={(e) => this.setErrorImg(e, this.state.officeNoImage)} title={rowItem.name} alt="" width="100%"/></td>;
                                                        }else{
                                                            return <td><img src={this.state.officeNoImage} title={rowItem.name} alt="" width="100%"/></td>;
                                                        }
                                                    }.call(this)}
                                                    <td><div className="comp_name">{rowItem.name}</div>{rowItem.tel}</td>
                                                </tr>
                                            );
                                        }, this);
                                    }else{
                                        return <tr><td colspan="3">입주한 상사가 없습니다</td></tr>;
                                    }
                                }.call(this)}
                            </tbody>
                        </table>
                        <div className="title_wrap">
                            <h2>근생시설</h2>
                        </div>
                        <table border="0" cellpadding="0" cellspacing="0" className="t_normal font14">
                            <colgroup>
                                <col style={{width:50}}/>
                                <col style={{width:120}}/>
                                <col/>
                            </colgroup>
                            <tbody>
                                <tr>
	                                <th className="color">호실</th>
	                                <th className="color">로고</th>
	                                <th className="color">상호/전화번호</th>
                                </tr>
                                {function() {
                                    if(this.state.listData2.length > 0) {
                                        return this.state.listData2.map(function(rowItem, key) {
                                            return (
                                                <tr key={key}>
                                                    <td>{rowItem.roomNo}</td>
                                                    {function() {
                                                        if(rowItem.mainImage) {
                                                            return <td><img src={rowItem.uploadPath + '/' + rowItem.mainImage} onError={(e) => this.setErrorImg(e, this.state.officeNoImage)} title={rowItem.name} alt="" width="100%"/></td>;
                                                        }else{
                                                            return <td><img src={this.state.officeNoImage} title={rowItem.name} alt="" width="100%"/></td>;
                                                        }
                                                    }.call(this)}
                                                    <td><div className="comp_name">{rowItem.name}</div>{rowItem.tel}</td>
                                                </tr>
                                            );
                                        }, this);
                                    }else{
                                        return <tr><td colspan="3">입주한 시설이 없습니다</td></tr>;
                                    }
                                }.call(this)}
                            </tbody>
                        </table>
                    </div>
                </div>
            </React.Fragment>
        );
    }
}

ReactDOM.render(
    <FacilityListMain />,
    document.getElementById('facilityListMain')
);

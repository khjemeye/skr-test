const EventSlider = require("./EventSlider.jsx");
const SearchBar = require("./SearchBar.jsx");
const Paging = require("../../_common/Paging.jsx");

class Event extends React.Component {
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

    getDate(dateText){
        if(dateText && dateText.length == 12) {
            let year = dateText.substr(0, 4),
                month = dateText.substr(4, 2) - 1,
                day = dateText.substr(6, 2),
                hour = dateText.substr(8, 2),
                minute = dateText.substr(10, 2);

            return new Date(year, month, day, hour, minute);
        }

        return null;
    }

    getStatus(endDateText){
        let endDate = this.getDate(endDateText);

        if(endDate){
            let today = new Date();

            if(endDate < today){
                return "END"
            }else {
                return "ING"
            }
        }

        return "";
    }

    convertEtcDate(date){
        if(date.length == 12){
            return date.substring(0,4) + "." + date.substring(4,6) + "." + date.substring(6,8)
        }

        return date;
    }

    getDiffDays(date1, date2){
        var diff = Math.abs(date1.getTime() - date2.getTime());

        diff = Math.ceil(diff / (1000 * 3600 * 24));
        return diff;
    }

    getDday(endDateText){
        let endDate = this.getDate(endDateText);

        if(endDate){
            let days = this.getDiffDays(new Date(), endDate) - 1;
            return days >= 0 ? "D-" + days : "";
        }

        return "";
    }

    checkNew(date){
        let days = jQuery("#checkNewDays").val();

        if(date && days){
            return this.getDiffDays(new Date(), new Date(date)) <= days;
        }

        return false;
    }

    setErrorImg(ev){
        ev.target.src = "/images/nophoto/nophoto_640x480.png";
    }

    render(){
        return (
            <React.Fragment>
                <div className="divide"></div>
                {function() {
                    if (this.props.banners && this.props.banners.length > 0) {
                        return <EventSlider data={this.props.banners}/>;
                    }
                }.call(this)}
                <SearchBar title="이벤트" onSearch={(text)=>this.onSearch(text)}/>
                <div className="divide"></div>
                <div className="row">
                    <div className="column total-text">
                        <span className="total-text">총 <strong>{this.props.totalCount}</strong>건</span>
                    </div>
                </div>
                <div className="row">
                    <div className="column padd0">
                        <div className="newevent-list">
                            <ul>
                                {function(){
                                    if(this.props.data && this.props.data.length > 0){
                                        return this.props.data.map(function(rowItem, key) {
                                            let status = this.getStatus(rowItem.etc2);

                                            return (
                                                <li key={key}>
                                                    <a href={"/magazine/event/view.do?m_no=" + rowItem.blbdNo} title={rowItem.blbdTitl}>
                                                        {function(){
                                                            if(rowItem.featuredImage){
                                                                return <img src={rowItem.featuredImage} className="img" onError={this.setErrorImg}/>;
                                                            }else{
                                                                return <img src="/images/nophoto/nophoto_640x480.png" className="img"/>;
                                                            }
                                                        }.call(this)}

                                                        {function(){
                                                            if(rowItem.status === 'END') {
                                                                return <span className="icon-ing result">당첨자<br/>발표</span>;
                                                            }else if(this.checkNew(rowItem.createDt)){
                                                                return <span className="icon-ing new">NEW</span>;
                                                            }
                                                        }.call(this)}

                                                        <div className="text">
                                                            <p>{rowItem.blbdTitl}</p>

                                                            {function(){
                                                                let periodText = this.convertEtcDate(rowItem.etc1) + " ~ " + this.convertEtcDate(rowItem.etc2);

                                                                if(status == "END") {
                                                                    return (
                                                                        <div>
                                                                            <span className="icon-label-event end">종료</span>&nbsp;{periodText}
                                                                        </div>
                                                                    )
                                                                }else{
                                                                    return (
                                                                        <div>
                                                                            <span className="icon-label-event ing">진행중</span>&nbsp;{periodText}
                                                                            <span className="icon-label-date">{this.getDday(rowItem.etc2)}</span>
                                                                        </div>
                                                                    )
                                                                }
                                                            }.call(this)}

                                                        </div>
                                                    </a>
                                                </li>
                                            );
                                        }, this);
                                    }else{
                                        return (
                                            <div className="data-empty">
                                                {this.state.isSearchMode ? "검색결과가 없습니다" : "등록된 게시물이 없습니다"}
                                            </div>
                                        )
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

module.exports = Event;

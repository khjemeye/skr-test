class NewsSlider extends React.Component {
    constructor(props){
        super(props);

        this.state = {

        };
    }

    componentDidMount(){
        $('.slider-inner').bxSlider();
    }

    render(){
        return (
            <div className="row">
                <div className="column news-slider-wrap">
                    <div className="news-slider">
                        <ul className="slider-inner">
                            {function(){
                                if(this.props.data && this.props.data.length > 0){
                                    return this.props.data.map(function(rowItem, key) {
                                        return (
                                            <li key={key}>
                                                <a href={"/magazine/news/view.do?m_no=" + rowItem.blbdNo}>
                                                    {function(){
                                                        if(rowItem.featuredImage){
                                                            return <div className="img" style={{backgroundImage:'url(' + rowItem.featuredImage + '), url(/images/nophoto/nophoto_640x480.png)'}}></div>;
                                                        }else{
                                                            return <div className="img" style={{backgroundImage:"url(/images/nophoto/nophoto_640x480.png"}}></div>;
                                                        }
                                                    }.call(this)}
                                                    <div className="info">
                                                        {rowItem.createDt}
                                                        <div className="title">{rowItem.blbdTitl}</div>
                                                    </div>
                                                </a>
                                            </li>
                                        )
                                    }, this);
                                }
                            }.call(this)}
                        </ul>
                    </div>
                </div>
            </div>
        );
    }
}

module.exports = NewsSlider;
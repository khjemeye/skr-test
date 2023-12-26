class EventSlider extends React.Component {
    constructor(props) {
        super(props);

        this.state = {

        };
    }

    componentDidMount(){
        $('.slider-inner').bxSlider();
    }

    setErrorImg(ev){
        ev.target.src = "/images/nophoto/nophoto_640x480.png";
    }

    render(){
        return (
            <div className="row">
                <div className="column event-slider-wrap">
                    <div className="event-slider">
                        <ul className="slider-inner">
                            {function(){
                                if(this.props.data && this.props.data.length > 0){
                                    return this.props.data.map(function(rowItem, key) {
                                        return (
                                            <li key={key}>
                                                <a href={"/magazine/event/view.do?m_no=" + rowItem.blbdNo}>
                                                    {function(){
                                                        if(rowItem.featuredImage){
                                                            return <img className="img" src={rowItem.featuredImage} onError={this.setErrorImg}></img>;
                                                        }else{
                                                            return <img className="img" src="/images/nophoto/nophoto_640x480.png"></img>;
                                                        }
                                                    }.call(this)}
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

module.exports = EventSlider;
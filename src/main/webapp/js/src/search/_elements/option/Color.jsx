class Color extends React.Component {
    constructor(props) {
        super(props);

        this.state = {
            listColorData: [],
            colorVal: null,
        };

        this.props.setScreen("optColor");
    }

    loadDataFromServer(){
        jQuery.ajax({
            type: "GET",
            url: "/search/getOptionColorListAjax.do",
            dataType: "JSON",
            cache: true,
            data: {},
            success: function(json) {
                this.setState({listColorData: json.data});
            }.bind(this),
            complete: function(){
                if(this.props.sColor){
                    const arrSelected = JSON.parse(decodeURIComponent(this.props.sColor));
                    if(Array.isArray(arrSelected)){
                        arrSelected.forEach(function(id){
                            jQuery("#color" + id).addClass('selected');
                        })
                    }
                }
            }.bind(this)
        });
    }

    componentDidMount() {
        this.loadDataFromServer();
    }

    selectColor(id){
        let valColor = jQuery("#colorChecks li.selected").map(function(){return $(this).data("id")}).get();

        if(!valColor.includes(id)){
            if(valColor.length === 4){
                alert('색상은 최대 4개까지 선택 가능합니다.');
                return;
            }
        }

        if($("#color" + id).hasClass('selected')){
            $("#color" + id).removeClass('selected');
        }else{
            $("#color" + id).addClass('selected');
        }

        //$("#color" + id).find('.selected-tag').toggleClass('hide');

        valColor = jQuery("#colorChecks li.selected").map(function(){return $(this).data("id")}).get();
        if(valColor.length > 0){
            this.state.colorVal = JSON.stringify(valColor);
        }else{
            this.state.colorVal = null;
        }
    }

    complete(){
        const valColor = jQuery("#colorChecks li.selected").map(function(){return $(this).data("id")}).get();

        if(valColor.length > 0){
            this.state.colorVal = JSON.stringify(valColor);
        }else{
            this.state.colorVal = null;
        }

        if(this.state.colorVal){
            this.props.setColor(this.state.colorVal);
        }else{
            this.props.setColor(null);
        }

        this.state.colorVal=null;
        this.props.setScreen("main");
    }

    render() {
        return (
            <React.Fragment>
                <div id="header" className="row header fixed">
                    <div className="column titlebar no-padding">
                        <div className="titlebar-left">
                            <button className="menu-icon" type="button" onClick={this.props.setScreen.bind(this, "main")}/>
                        </div>
                        <div id="logo" className="titlebar-center">
                            <a href="javascript:void(0);" title="색상선택">색상선택</a>
                        </div>
                    </div>
                </div>

                <div className="container">
                    <div className="row">
                        <form>
                            <div className="option-selector option-color column">
                                <div className="description">
                                    <span>색상을 선택하세요<br/>최대 4개까지 선택 가능합니다</span>
                                </div>

                                <ul className="option-list option-3" id="colorChecks">
                                    {function(){
                                        return this.state.listColorData.map(function(rowItem, key){
                                            return (
                                                <li key={key} id={"color" + rowItem.id} onClick={this.selectColor.bind(this, rowItem.id)} data-id={rowItem.id}>
                                                    <a className={([3,4,5,6,7,8,9,10,11,12,17,18,20,22,23,26,29,30,32,50].includes(rowItem.id))?"color-light":"color-dark"} href="javascript:void(0)" title={rowItem.name} style={{backgroundColor: rowItem.bcRgb1, border: "1px solid " + rowItem.bcRgb2}}>{rowItem.shortname}</a>
                                                </li>
                                            );
                                        }, this);
                                    }.call(this)}
                                </ul>
                            </div>

                            <div className="button-group-fixed">
                                <div className="button-group">
                                    <button type="button" className="button color-red" onClick={this.complete.bind(this)}>확인</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
           </React.Fragment>
        );
    }
}

module.exports = Color;
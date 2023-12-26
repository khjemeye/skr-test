class Gear extends React.Component {
    constructor(props) {
        super(props);

        this.state = {
            listGearboxData: [],
            gearVal: null,
        };

        //this.props.screenType = "optGear";
        this.props.setScreen("optGear");
    }

    loadDataFromServer(){
        jQuery.ajax({
            type: "GET",
            url: "/search/getOptionGearboxListAjax.do",
            dataType: "JSON",
            cache: true,
            data: {},
            success: function(json) {
                this.setState({listGearboxData: json.data});
            }.bind(this),
            complete: function(){
                if(this.props.sTrans){
                    if(this.props.sTrans === "all"){
                        this.state.gearVal = "all";
                        jQuery("#gearChecks input[type='checkbox']:checkbox").each(function(){
                            $(this).prop("checked", true);
                        });

                    }else{
                        const arrSelected = JSON.parse(decodeURIComponent(this.props.sTrans));
                        if(Array.isArray(arrSelected)){
                            arrSelected.forEach(function(code){
                                jQuery("#gear" + code).prop("checked", true);
                            })
                        }
                    }
                }
            }.bind(this)
        });
    }

    componentDidMount() {
        this.loadDataFromServer();
    }

    select(code){
        if (code === "all") {
            jQuery("#gearChecks input[type='checkbox']:checkbox").each(function(){
                $(this).prop("checked", jQuery("#gearAll").is(":checked"));
            });

            if(jQuery("#gearAll").is(":checked")){
                this.state.gearVal = "all";
            }else{
                this.state.gearVal = null;
            }

        }else{
            if(jQuery("#gearAll").is(":checked")){
                jQuery("#gearChecks input[type='checkbox']:checkbox").each(function(){
                    $(this).prop("checked", false);
                });

                jQuery("#gear" + code).prop("checked", true);
            }else{
                if(jQuery("#gear" + code).is(":checked")){
                    jQuery("#gear" + code).prop("checked", true);
                }else{
                    jQuery("#gear" + code).prop("checked", false);
                }
            }

            const valGear = jQuery("#gearChecks input:checkbox:checked").map(function(){return this.value}).get();

            if(valGear.length > 0){
                this.state.gearVal = JSON.stringify(valGear);
            }else{
                this.state.gearVal = null;
            }
        }
    }

    complete(){
        if(this.state.gearVal !== 'all'){
            const valGear = jQuery("#gearChecks input:checkbox:checked").map(function(){return this.value}).get();

            if(valGear.length > 0){
                this.state.gearVal = JSON.stringify(valGear);
            }else{
                this.state.gearVal = null;
            }
        }

        if(this.state.gearVal){
            this.props.setTrans(this.state.gearVal);
        }else{
            this.props.setTrans(null);
        }

        this.state.gearVal=null;
        this.props.setScreen("main");
    }

    goBack(){
        this.props.setScreen("main");
    }

    render() {
        return (
            <React.Fragment>
                <div id="header" className="row header fixed">
                    <div className="column titlebar no-padding">
                        <div className="titlebar-left">
                            <button className="menu-icon" type="button" onClick={this.goBack.bind(this)}/>
                        </div>
                        <div id="logo" className="titlebar-center">
                            <a href="javascript:void(0);" title="변속기선택">변속기선택</a>
                        </div>
                    </div>
                </div>

                <div className="container">
                    <div className="row">
                        <form>
                            <div className="menu-list">
                                <ul className="article-list check-list" id="gearChecks">
                                    <li>
                                        <input type="checkbox" id="gearAll" onClick={this.select.bind(this, "all")}/>
                                        <label htmlFor="gearAll">전체</label>
                                    </li>
                                    {function(){
                                        return this.state.listGearboxData.map(function(rowItem, key){
                                            return (
                                                <li key={key}>
                                                    <input type="checkbox" name={"gear" + rowItem.code} id={"gear" + rowItem.code} value={rowItem.code} onClick={this.select.bind(this, rowItem.code)}/>
                                                    <label htmlFor={"gear" + rowItem.code}>{rowItem.name}</label>
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
        )
    }
}

module.exports = Gear;
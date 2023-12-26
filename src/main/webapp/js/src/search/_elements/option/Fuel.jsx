class Fuel extends React.Component {
    constructor(props) {
        super(props);

        this.state = {
            listFuelData1: [],
            listFuelData2: [],
            fuelVal: null,
        };

        this.props.setScreen("optFuel");
    }

    loadDataFromServer(){
        jQuery.ajax({
            type: "GET",
            url: "/search/getOptionFuelListAjax.do",
            dataType: "JSON",
            cache: true,
            data: {},
            success: function(json) {
                if(json){
                    let fuelData1 = [];
                    let fuelData2 = [];

                    json.data.forEach(function(item){
                        if(item.type === 'Y'){
                            fuelData2.push(item);
                        }else{
                            fuelData1.push(item);
                        }
                    });

                    this.setState({listFuelData1: fuelData1, listFuelData2: fuelData2});
                }


            }.bind(this),
            complete: function(){
                if(this.props.sFuel){
                    if(this.props.sFuel === "all"){
                        this.state.fuelVal = "all";
                        jQuery("#fuelChecks input[type='checkbox']:checkbox").each(function(){
                            $(this).prop("checked", true);
                        });

                    }else {
                        const arrSelected = JSON.parse(decodeURIComponent(this.props.sFuel));
                        if (Array.isArray(arrSelected)) {
                            arrSelected.forEach(function (code) {
                                jQuery("#fuel" + code).prop("checked", true);
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
            jQuery("#fuelChecks input[type='checkbox']:checkbox").each(function(){
                $(this).prop("checked", jQuery("#fuelAll").is(":checked"));
            });

            if(jQuery("#fuelAll").is(":checked")){
                this.state.fuelVal = "all";
            }else{
                this.state.fuelVal = null;
            }

        }else{
            if(jQuery("#fuelAll").is(":checked")){
                jQuery("#fuelChecks input[type='checkbox']:checkbox").each(function(){
                    $(this).prop("checked", false);
                });

                jQuery("#fuel" + code).prop("checked", true);
            }else{
                if(jQuery("#fuel" + code).is(":checked")){
                    jQuery("#fuel" + code).prop("checked", true);
                }else{
                    jQuery("#fuel" + code).prop("checked", false);
                }
            }

            const valFuel = jQuery("#fuelChecks input:checkbox:checked").map(function(){return this.value}).get();

            if(valFuel.length > 0){
                this.state.fuelVal = JSON.stringify(valFuel);
            }else{
                this.state.fuelVal = null;
            }
        }
    }

    complete(){
        if(this.state.fuelVal !== 'all'){
            const valFuel = jQuery("#fuelChecks input:checkbox:checked").map(function(){return this.value}).get();

            if(valFuel.length > 0){
                this.state.fuelVal = JSON.stringify(valFuel);
            }else{
                this.state.fuelVal = null;
            }
        }

        if(this.state.fuelVal){
            this.props.setFuel(this.state.fuelVal);
        }else{
            this.props.setFuel(null);
        }

        this.state.fuelVal=null;
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
                            <a href="javascript:void(0);" title="연료선택">연료선택</a>
                        </div>
                    </div>
                </div>

                <div className="container">
                    <div className="row">
                        <form>
                            <div className="menu-list" id="fuelChecks">
                                <ul className="article-list check-list">
                                    <li>
                                        <input type="checkbox" id="fuelAll" onClick={this.select.bind(this, "all")}/>
                                        <label htmlFor="fuelAll">전체</label>
                                    </li>
                                    {function(){
                                        return this.state.listFuelData1.map(function(rowItem, key){
                                            return (
                                                <li key={key}>
                                                    <input type="checkbox" name={"fuel" + rowItem.code} id={"fuel" + rowItem.code} value={rowItem.code} onClick={this.select.bind(this, rowItem.code)}/>
                                                    <label htmlFor={"fuel" + rowItem.code}>{rowItem.name}</label>
                                                </li>
                                            );
                                        }, this);
                                    }.call(this)}
                                </ul>
                                <h3>친환경차량</h3>
                                <ul className="article-list check-list">
                                    {function(){
                                        return this.state.listFuelData2.map(function(rowItem, key){
                                            return (
                                                <li key={key}>
                                                    <input type="checkbox" name={"fuel" + rowItem.code} id={"fuel" + rowItem.code} value={rowItem.code} onClick={this.select.bind(this, rowItem.code)}/>
                                                    <label htmlFor={"fuel" + rowItem.code}>{rowItem.name}</label>
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

module.exports = Fuel;
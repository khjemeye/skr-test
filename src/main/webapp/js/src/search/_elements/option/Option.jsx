class Option extends React.Component {
    constructor(props) {
        super(props);

        this.state = {
            listOptionData: [],
            optVal: null,
            selCategory: 1
        };

        this.props.setScreen("optOption");
    }

    loadDataFromServer(){
        jQuery.ajax({
            type: "GET",
            url: "/search/getCarOptionListAjax.do",
            dataType: "JSON",
            cache: true,
            data: {},
            success: function(json) {
                this.setState({listOptionData: json.data});
            }.bind(this),
            complete: function(){
                if(this.props.sOption){
                    const arrSelected = JSON.parse(decodeURIComponent(this.props.sOption));
                    if(Array.isArray(arrSelected)){
                        arrSelected.forEach(function(id){
                            jQuery("#option" + id).prop("checked", true);
                        })
                    }
                }
            }.bind(this)
        });
    }

    componentDidMount() {
        this.loadDataFromServer();
    }

    selectCategory(categoryId){
        this.setState({selCategory: categoryId});
    }

    select(id){
        if(jQuery("#option" + id).is(":checked")){
            jQuery("#option" + id).prop("checked", true);
        }else{
            jQuery("#option" + id).prop("checked", false);
        }

        const valOption = jQuery("#optionChecks input:checkbox:checked").map(function(){return this.value}).get();

        if(valOption.length > 0){
            this.state.optVal = JSON.stringify(valOption);
        }else{
            this.state.optVal = null;
        }
    }

    complete(){
        const valOption = jQuery("#optionChecks input:checkbox:checked").map(function(){return this.value}).get();

        if(valOption.length > 0){
            this.state.optVal = JSON.stringify(valOption);
        }else{
            this.state.optVal = null;
        }

        if(this.state.optVal){
            this.props.setOption(this.state.optVal);
        }else{
            this.props.setOption(null);
        }

        this.state.optVal = null;
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
                            <a href="javascript:void(0);" title="옵션선택">옵션선택</a>
                        </div>
                    </div>

                    <div className="column sub-nav col4 fuc_tab">
                        <ul>
                            <li className={this.state.selCategory === 1? "active":""} onClick={this.selectCategory.bind(this, 1)}>
                                <a href="javascript:void(0)" title="외관">외관</a>
                            </li>
                            <li className={this.state.selCategory === 2? "active":""} onClick={this.selectCategory.bind(this, 2)}>
                                <a href="javascript:void(0)" title="내장">내장</a>
                            </li>
                            <li className={this.state.selCategory === 3? "active":""} onClick={this.selectCategory.bind(this, 3)}>
                                <a href="javascript:void(0)" title="안전">안전</a>
                            </li>
                            <li className={this.state.selCategory === 4? "active":""} onClick={this.selectCategory.bind(this, 4)}>
                                <a href="javascript:void(0)" title="편의">편의</a>
                            </li>
                        </ul>
                    </div>
                </div>

                <div className="container">
                    <div className="row">
                        <form>
                            <div className="menu-list">
                                <ul className="article-list check-list" id="optionChecks">
                                    {function(){
                                        return this.state.listOptionData.map(function(rowItem, key){
                                            return (
                                                <li key={key} style={{display: (rowItem.category === this.state.selCategory)? "block":"none"}}>
                                                    <input type="checkbox" name={"option" + rowItem.id} id={"option" + rowItem.id} value={rowItem.id} onClick={this.select.bind(this, rowItem.code)} />
                                                    <label htmlFor={"option" + rowItem.id}>{rowItem.name}</label>
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

module.exports = Option;
/*******************************************************************************
 * 작성자   :   김명현
 * 함수명   :   commonAjax();
 * 기능 	: 	callurl로 ajax 요청을 하고 callBack( returnData ) 를 수행한다.
 * 인수 	: 	formId            form의 id값
 *              callurl           sumbit 할 url
 *              loadingBar        로딩바 표출 여부 생략시 false
 *              async             동기화 여부 생량시 true
 *              errorCallBack     서비스익셉션 ERROR: 인 경우에도 콜백함수를 타야 될 경우 true 로 넘길것..(생략시 false)
 *
 * 사용예 	:
 * 비고    :
******************************************************************************/
function commonAjax( data , callurl , callBack , loadingBar , async , errorCallBack) {

	if( loadingBar == undefined) loadingBar = false;
	if( async == undefined) async = true;
	if( errorCallBack == undefined) errorCallBack = false;


	$.ajax({
		async: async,
		type: "post",
		url: callurl ,
		data:data,
		dataType: "json",
		beforeSend: function() {
			// 로딩바 show()
			if( loadingBar ) { onLoading(); }
		},
		complete:function() {
			// 로딩바 hide()
			if( loadingBar ) { offLoading(); }
		},
		success:function(returnData){

			if(typeof(returnData.message) != 'undefined' && returnData.message.startsWith("ERROR:") ) {
				gfnAlert( returnData.message.replace("ERROR:","")  );
				if( errorCallBack ) { // 서비스익셉션일 경우에도 콜백에서 처리할 경우가 있으면 true 로 보낼것 !!
					callBack( returnData );
				}
			} else {
				callBack( returnData );
			}
			// 로딩바 hide()
			if( loadingBar ) { offLoading(); }
		},
		error:function(result){
			if(result.status != 0) { // 0은 로딩중 네트워크가 끈긴거라.. 체크 뺌..
				gfnAlert( '통신에러가 발생하였습니다.[' + result.status + ']:' + result.statusText);
			}
			// 로딩바 hide()
			if( loadingBar ) { offLoading(); }
		}
	});

}



/*******************************************************************************
 * 작성자   :   김명현
 * 함수명   :   commonAjaxSubmit();
 * 기능 	: 	callurl로 ajax 요청을 하고 callBack( returnData ) 를 수행한다.
 * 인수 	: 	formId            form의 id값
 *              callurl           sumbit 할 url
 *              callBackFnName    실행될 콜백함수 이름
 * 사용예 	:   파일 업로드 등의 ajaxSubmit 사용시 호출하여 사용함..
 * 비고    :
******************************************************************************/
function commonAjaxSubmit( formId , callurl , callBackFnName ) {

	onLoading();

	$("#"+formId).ajaxSubmit({
		url : callurl,
		async: true,
		type : 'post',
		dataType: "json",
		beforeSend: function() {
			// 로딩바 show()
			onLoading();
		},
		complete:function() {
			// 로딩바 hide()
			offLoading();
		},
		success:function(returnData){
			eval( callBackFnName )("success" , returnData);
			offLoading();
		},
		error:function(returnData){
			eval( callBackFnName )("error" , returnData);
			offLoading();
		}
	});
}
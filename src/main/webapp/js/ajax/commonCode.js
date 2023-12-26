/*******************************************************************************
 * 작성자  :   김명현
 * 기능 	: 	공통코드 테이블읠 조회하여 comboBox 에 표출한다.
 * 인수 	: 	targetObjId        : 화면상의 콤보박스 id
 *          data               : 조회조건
 * Return : 	null
 * 사용예 	: 	codeEx.jsp 참조
 * 비고    :
 *  data 에 올수있는 변수
 * 	var data = {
			 "codeId":"PROG_TYP_CD" // 필수조건임 조회하고자 하는 부모 공통코드 id
			 "defaultName":"-선택-"   // 기본적으로 들어가야할 selectbox 문자열
			 "defaultCode":"",      //  기본적으로 들어가야할 selectbox value값  ( 보통 defaultName 과  defaultCode 는 쌍으로 사용 함 )
			 "includeCodes":"B,E"   // 포함하여야할 코드값 ( 코드값이 5개 인데 B와 E 인놈 2개 만 보여준다 )
			 "excludeCodes":"A,C"   // 제외하여야할 코드값 ( 코드값이 5개 인데 A와 C 인놈은 제외하고 3개를 보여준다 )
			 "pattern":"[{0}] {1}"  // 패턴 값 ( 패턴을 적용하여 [코드값] 코드한글명  의 형태로 콤보박스에 표출한다.
	};
 *
******************************************************************************/
function getCode( targetObjId , data ) {


	var obj = $("#"+targetObjId);

	var callurl = "/sys/comnCd/selectCodeList.do";


	$.ajax({
		async: false,
		type: "post",
		url: callurl ,
		data:data,
		dataType: "json",
		success:function(returnData){

			obj.find("option").remove(); // 모든거 지우고

			var itemLength = returnData.result.length;

			if(itemLength != 0) {
			    $.each(returnData.result, function(i,result){
			    	obj.append("<option value='"+result.code+"'>"+result.name+"</option>");

			    });
			} else {
				obj.append("<option value=''>no Result</option>");
			}
		},
		error:function(){
			alert( 'error' );
		}

	});
}


/*******************************************************************************
 * 작성자  :   김명현
 * 기능 	: 	공통코드 테이블읠 조회하여 comboBox 에 표출한다. ( 단 , 멀티 콤보때 사용한다 )
 * 인수 	: 	targetObjId        : 화면상의 콤보박스 id
 *          data               : 조회조건
 * Return : 	null
 * 사용예 	: 	codeEx.jsp 참조
 * 비고    :
 *  data 에 올수있는 변수
 * 	var data = {
			 "codeId":"PROG_TYP_CD" // 필수조건임 조회하고자 하는 부모 공통코드 id
			 "defaultName":"-선택-"   // 기본적으로 들어가야할 selectbox 문자열
			 "defaultCode":"",      //  기본적으로 들어가야할 selectbox value값  ( 보통 defaultName 과  defaultCode 는 쌍으로 사용 함 )
			 "includeCodes":"B,E"   // 포함하여야할 코드값 ( 코드값이 5개 인데 B와 E 인놈 2개 만 보여준다 )
			 "excludeCodes":"A,C"   // 제외하여야할 코드값 ( 코드값이 5개 인데 A와 C 인놈은 제외하고 3개를 보여준다 )
			 "pattern":"[{0}] {1}"  // 패턴 값 ( 패턴을 적용하여 [코드값] 코드한글명  의 형태로 콤보박스에 표출한다.
	};


 getChildCode 함수는 데이터가 아래와 같을때만 사용가능하다..

 검색하고자 하는 codeId 와... like 검색할 value 를 넘긴다.
 즉, 이메소드는.. 부모코드의 값이 1, 2 라고 가정하고
 자식코드의 값이 11,12,13,21,22,23
 과 같은 경우에 사용한다...	 ( 실제 디비 단에서 like 로 검색함.. )
 *
******************************************************************************/
function getChildCode( targetObjId , data ) {

	var obj = $("#"+targetObjId);

	var callurl = "/sys/comnCd/selectChildCodeList.do";


	$.ajax({
		async: false,
		type: "post",
		url: callurl ,
		data:data,
		dataType: "json",
		success:function(returnData){

			obj.find("option").remove(); // 모든거 지우고

			var itemLength = returnData.result.length;

			if(itemLength != 0) {

			    $.each(returnData.result, function(i,result){
			    	obj.append("<option value='"+result.code+"'>"+result.name+"</option>");
			    });
			} else {
				obj.append("<option value=''>no Result</option>");
			}

		},
		error:function(){
			alert( 'error' );
		}
	});
}



/*******************************************************************************
 * 작성자  :   김명현
 * 기능 	: 	공통코드 테이블읠 조회하여 comboBox 에 표출한다. ( 단 , 멀티 콤보때 사용한다 )
 * 인수 	: 	targetObjId        : 화면상의 콤보박스 id
 *          data               : 조회조건
 * Return : 	null
 * 사용예 	: 	codeEx.jsp 참조
 * 비고    :
 *  data 에 올수있는 변수
 * 	var data = {
			 "codeId":"PROG_TYP_CD" // 필수조건임 조회하고자 하는 부모 공통코드 id
			 "defaultName":"-선택-"   // 기본적으로 들어가야할 selectbox 문자열
			 "defaultCode":"",      //  기본적으로 들어가야할 selectbox value값  ( 보통 defaultName 과  defaultCode 는 쌍으로 사용 함 )
			 "includeCodes":"B,E"   // 포함하여야할 코드값 ( 코드값이 5개 인데 B와 E 인놈 2개 만 보여준다 )
			 "excludeCodes":"A,C"   // 제외하여야할 코드값 ( 코드값이 5개 인데 A와 C 인놈은 제외하고 3개를 보여준다 )
			 "pattern":"[{0}] {1}"  // 패턴 값 ( 패턴을 적용하여 [코드값] 코드한글명  의 형태로 콤보박스에 표출한다.
	};


 getChildCode2 함수는 데이터가 아래와 같을때만 사용가능하다..

* 검색하고자 하는 codeId 와... CD_CLS_VAL1의 값이 같은 value 를 넘긴다.
* 즉, 이메소드는.. 부모코드의 값이 1 , 2 라고 가정하고
* 자식코드의 CD_CLS_VAL1 값이 1 인애들 2인애들을 구분해서 조회한다.
******************************************************************************/
function getChildCode2( targetObjId , data ) {

	var obj = $("#"+targetObjId);

	var callurl = "/sys/comnCd/selectChildCodeType2List.do";


	$.ajax({
		async: false,
		type: "post",
		url: callurl ,
		data:data,
		dataType: "json",
		success:function(returnData){

			obj.find("option").remove(); // 모든거 지우고

			var itemLength = returnData.result.length;

			if(itemLength != 0) {

			    $.each(returnData.result, function(i,result){
			    	obj.append("<option value='"+result.code+"'>"+result.name+"</option>");
			    });
			} else {
				obj.append("<option value=''>no Result</option>");
			}

		},
		error:function(){
			alert( 'error' );
		}
	});
}
/*******************************************************************************
 * 작성자  :   김명현
 * 기능 	: 	공통코드 테이블읠 조회하여 radio  혹은  checkbox 로 표출한다.
 * 인수 	: 	targetObjId        : 화면상의 div id ( div 위치에 라디오버튼 혹은 체크박스를 표출한다 )
 *          data               : 조회조건
 *          mode               : radio  혹은  checkbox
 *          id                 : 그룹으로 묶일  input name 과 id
 * Return : 	null
 * 사용예 	: 	codeEx.jsp 참조
 * 비고    :
 *  data 에 올수있는 변수
 * 	var data = {
			 "codeId":"PROG_TYP_CD" // 필수조건임 조회하고자 하는 부모 공통코드 id
			 "includeCodes":"B,E"   // 포함하여야할 코드값 ( 코드값이 5개 인데 B와 E 인놈 2개 만 보여준다 )
			 "excludeCodes":"A,C"   // 제외하여야할 코드값 ( 코드값이 5개 인데 A와 C 인놈은 제외하고 3개를 보여준다 )
	};
 *
******************************************************************************/
function getCodeView( targetObjId , data , mode , id) {

	var obj = $("#"+targetObjId);

	var callurl = "/sys/comnCd/selectCodeList.do";


	$.ajax({
		async: false,
		type: "post",
		url: callurl ,
		data:data,
		dataType: "json",
		success:function(returnData){

			obj.html("");

			var itemLength = returnData.result.length;
			var idx = 0;
			if(mode == "radio") {
				if(itemLength != 0) {
					var tag = "";
				    $.each(returnData.result, function(i,result){
					    tag +="<i class='formWrap'><input type='radio' id='"+id+idx+"' name='"+id+"' value='"+result.code+"' /><label for='"+id+idx+"'>"+result.name+"</label></i>";
					    idx++;
				    });
				    obj.html(tag);
				}
			}
			if(mode == "checkbox") {
				if(itemLength != 0) {
					var tag = "";
				    $.each(returnData.result, function(i,result){
					    tag +="<i class='formWrap'><input type='checkbox' id='"+id+idx+"' name='"+id+"' value='"+result.code+"' /><label for='"+id+idx+"'>"+result.name+"</label></i>";
					    idx++;
				    });
				    obj.html(tag);
				}
			}

		},
		error:function(){
			alert( 'error' );
		}
	});
}




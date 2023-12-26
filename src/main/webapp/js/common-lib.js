//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
//
//  폼 관련 함수 시작
//
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
// 특정문자 로 시작하는지를 판별 한다.
// @return : boolean
//-----------------------------------------------------------------------------
if (typeof String.prototype.startsWith != 'function') {
	String.prototype.startsWith = function (str){
		return this.indexOf(str) == 0;
	};
}

//-----------------------------------------------------------------------------
// 문자의 좌, 우 공백 제거
// @return : String
//-----------------------------------------------------------------------------
String.prototype.trim = function() {
	return this.replace(/(^\s*)|(\s*$)/g, "");
}

//-----------------------------------------------------------------------------
// 문자의 좌 공백
// @return : String
//-----------------------------------------------------------------------------
String.prototype.ltrim = function() {
	return this.replace(/(^\s*)/, "");
}

//-----------------------------------------------------------------------------
// 문자의 우 공백 제거
// @return : String
//-----------------------------------------------------------------------------
String.prototype.rtrim = function() {
	return this.replace(/(\s*$)/, "");
}

//-----------------------------------------------------------------------------
// 문자열의 byte 길이 반환
// @return : int
//-----------------------------------------------------------------------------
String.prototype.byte = function() {
	var cnt = 0;
    for (var i = 0; i < this.length; i++) {

        if (this.charCodeAt(i) > 127)
            cnt += 2;
        else
            cnt++;
    }
    return cnt;
}

//-----------------------------------------------------------------------------
// 정수형으로 변환
// @return : String
//-----------------------------------------------------------------------------
String.prototype.int = function() {

    if(!isNaN(this)) {
        return parseInt(this);
    }
    else {
        return null;
    }
}

//-----------------------------------------------------------------------------
// 숫자만 가져 오기
// @return : String
//-----------------------------------------------------------------------------
String.prototype.num = function() {
    return (this.trim().replace(/[^0-9]/g, ""));
}

//-----------------------------------------------------------------------------
// 숫자에 3자리마다 , 를 찍어서 반환
// @return : String
//-----------------------------------------------------------------------------
String.prototype.cvtNumber = function() {
    var num = this.trim();
    while((/(-?[0-9]+)([0-9]{3})/).test(num)) {
        num = num.replace((/(-?[0-9]+)([0-9]{3})/), "$1,$2");
    }
    return num;
}

//-----------------------------------------------------------------------------
// 숫자의 자리수(cnt)에 맞도록 반환
// @return : String
//-----------------------------------------------------------------------------
String.prototype.digits = function(cnt) {
    var digit = "";
    if (this.length < cnt) {
        for(var i = 0; i < cnt - this.length; i++) {
            digit += "0";
        }
    }
    return digit + this;
}

//-----------------------------------------------------------------------------
// " -> &#34; ' -> &#39;로 바꾸어서 반환
// @return : String
//-----------------------------------------------------------------------------
String.prototype.quota = function() {

    return this.replace(/"/g, "&#34;").replace(/'/g, "&#39;");

}

//-----------------------------------------------------------------------------
// 파일 확장자만 가져오기
// @return : String
//-----------------------------------------------------------------------------
String.prototype.ext = function() {
    return (this.indexOf(".") < 0) ? "" : this.substring(this.lastIndexOf(".") + 1, this.length);
}

//-----------------------------------------------------------------------------
// URL에서 파라메터 제거한 순수한 url 얻기
// @return : String
//-----------------------------------------------------------------------------
String.prototype.uri = function() {

    var arr = this.split("?");
    arr = arr[0].split("#");
    return arr[0];

}


//-----------------------------------------------------------------------------
// 정규식에 쓰이는 특수문자를 찾아서 이스케이프 한다.
// @return : String
//-----------------------------------------------------------------------------
String.prototype.meta = function() {

    var str = this;
    var result = ""
    for(var i = 0; i < str.length; i++) {
        if((/([\$\(\)\*\+\.\[\]\?\\\^\{\}\|]{1})/).test(str.charAt(i))) {
            result += str.charAt(i).replace((/([\$\(\)\*\+\.\[\]\?\\\^\{\}\|]{1})/), "\\$1");
        }
        else {
            result += str.charAt(i);
        }
    }
    return result;
}

//-----------------------------------------------------------------------------
// 정규식에 쓰이는 특수문자를 찾아서 이스케이프 한다.
// @return : String
//-----------------------------------------------------------------------------
String.prototype.remove = function(pattern) {
    return (pattern == null) ? this : eval("this.replace(/[" + pattern.meta() + "]/g, \"\")");
}

//-----------------------------------------------------------------------------
// 최소 최대 길이인지 검증
// str.isLength(min [,max])
// @return : boolean
//-----------------------------------------------------------------------------
String.prototype.isLength = function() {

    var min = arguments[0];
    var max = arguments[1] ? arguments[1] : null;
    var success = true;
    if(this.length < min) {
        success = false;
    }
    if(max && this.length > max) {
        success = false;
    }
    return success;
}

//-----------------------------------------------------------------------------
// 최소 최대 바이트인지 검증
// str.isByteLength(min [,max])
// @return : boolean
//-----------------------------------------------------------------------------
String.prototype.isByteLength = function() {
    var min = arguments[0];
    var max = arguments[1] ? arguments[1] : null;
    var success = true;
    if(this.byte() < min) {
        success = false;
    }

    if(max && this.byte() > max) {
        success = false;
    }
    return success;
}

//-----------------------------------------------------------------------------
// 공백이나 널인지 확인
// @return : boolean
//-----------------------------------------------------------------------------
String.prototype.isBlank = function() {
    var str = this.trim();
    for(var i = 0; i < str.length; i++) {
        if ((str.charAt(i) != "\t") && (str.charAt(i) != "\n") && (str.charAt(i)!="\r")) {
            return false;
        }
    }
    return true;
}

//-----------------------------------------------------------------------------
// 숫자로 구성되어 있는지 학인
// arguments[0] : 허용할 문자셋
// @return : boolean
//-----------------------------------------------------------------------------
String.prototype.isNum = function() {
    return (/^[0-9]+$/).test(this.remove(arguments[0])) ? true : false;
}

//-----------------------------------------------------------------------------
// 영어만 허용 - arguments[0] : 추가 허용할 문자들
// @return : boolean
//-----------------------------------------------------------------------------
String.prototype.isEng = function() {
    return (/^[a-zA-Z]+$/).test(this.remove(arguments[0])) ? true : false;
}

//-----------------------------------------------------------------------------
// 영어와&nbsp; 만 허용 - arguments[0] : 추가 허용할 문자들
// @return : boolean
//-----------------------------------------------------------------------------
String.prototype.isblankEng = function() {
    return (/^[a-zA-Z\s]+$/).test(this.remove(arguments[0])) ? true : false;
}

//-----------------------------------------------------------------------------
// 숫자와 영어만 허용 - arguments[0] : 추가 허용할 문자들
// @return : boolean
//-----------------------------------------------------------------------------
String.prototype.isEngNum = function() {
    return (/^[0-9a-zA-Z]+$/).test(this.remove(arguments[0])) ? true : false;
}

//-----------------------------------------------------------------------------
// 숫자와 영어만 허용 - arguments[0] : 추가 허용할 문자들
// @return : boolean
//-----------------------------------------------------------------------------
String.prototype.isNumEng = function() {
    return this.isEngNum(arguments[0]);
}


//-----------------------------------------------------------------------------
// 숫자와 영어 혼용 - arguments[0] : 추가 허용할 문자들
// @return : boolean
//-----------------------------------------------------------------------------
String.prototype.isEngNumMix = function() {

	var bResult = false;
	var bEng = false;
	var bNum = false;

	bResult = (/^[0-9a-zA-Z]+$/).test(this.remove(arguments[0])) ? true : false;

	if(bResult){
		bNum = (/^[0-9]+$/).test(this.remove(arguments[0])) ? true : false;
		if(bNum){
			return false;
		}
		bEng = (/^[a-zA-Z]+$/).test(this.remove(arguments[0])) ? true : false;
		if(bEng){
			return false;
		}
	}else{
		return false;
	}
	return true;
}


//-----------------------------------------------------------------------------
// 아이디 체크 영어와 숫자만 체크 첫글자는 영어로 시작 - arguments[0] : 추가 허용할 문자들
// @return : boolean
//-----------------------------------------------------------------------------
String.prototype.isUserid = function() {

    return (/^[a-zA-z]{1}[0-9a-zA-Z]+$/).test(this.remove(arguments[0])) ? true : false;

}

//-----------------------------------------------------------------------------
// 이메일의 유효성을 체크
// @return : boolean
//-----------------------------------------------------------------------------
String.prototype.isEmail = function() {
    return (/\w+([-+.]\w+)*@\w+([-.]\w+)*\.[a-zA-Z]{2,4}$/).test(this.trim());
}

//-----------------------------------------------------------------------------
// 전화번호 체크 - arguments[0] : 전화번호 구분자
// @return : boolean
//-----------------------------------------------------------------------------
String.prototype.isPhone = function() {
    var arg = arguments[0] ? arguments[0] : "";
    return eval("(/(02|0[3-9]{1}[0-9]{1})" + arg + "[1-9]{1}[0-9]{2,3}" + arg + "[0-9]{4}$/).test(this)");
}

//-----------------------------------------------------------------------------
// 핸드폰번호 체크 - arguments[0] : 핸드폰 구분자
// @return : boolean
//-----------------------------------------------------------------------------
String.prototype.isMobile = function() {
	var arg = arguments[0] ? arguments[0] : "";
	return eval("(/01[016789]" + arg + "[1-9]{1}[0-9]{2,3}" + arg + "[0-9]{4}$/).test(this)");

}


//-----------------------------------------------------------------------------
// replaceAll 사용자 정의 함수
//-----------------------------------------------------------------------------
String.prototype.replaceAll = function( searchStr, replaceStr )
{
    var temp = this;
    while( temp.indexOf( searchStr ) != -1 ) {
        temp = temp.replace( searchStr, replaceStr );
    }
    return temp;
}




//-----------------------------------------------------------------------------
// 설명 : 폼에서 공백 체크해서 공백이면 메세지 보여지고 해당 폼값에 포커스
// 예) checkSpace(frm,strMsg) checkSpace(폼.이름, 메세지)
// 리턴) 공백이 아니면 true | 공백이면 false
//-----------------------------------------------------------------------------
function checkSpace(frm, strMsg, blnFocus) {
	if(frm.val().isBlank()){
		alert(strMsg);
		frm.val("");
		if (!blnFocus) frm.focus();
		return false;
	}
	return true;
}



//-----------------------------------------------------------------------------
//key event가 숫자값인지 체크
//@return : boolean
//-----------------------------------------------------------------------------
function onlyNum() {
	if ((event.keyCode < 48) || (event.keyCode > 57))
		event.returnValue = false;
}


//-----------------------------------------------------------------------------
//문자열의 갯수 구하기
//@return : num
//-----------------------------------------------------------------------------
function strCount(str){
	var i;
	var count=0;
	for(i=0;i<str.length;i++){
		var ch=str.charAt(i);
		if(escape(ch).length >4){
			count += 2;
		}else{
			count++;
		}
	}
	return count;
}




//-----------------------------------------------------------------------------
// 숫자만 입력가능하게.
// 48~57(0번 ~ 9번), 95~105(키패드0번~9번), 37~40(방향키), 8(백스페이스), 46(Del키), 9(TAB키)
// ex1) <input type="text" name="aaa" onKeyDown="onlynumber(event);"/>
// ex2)	$("#cpsno").keydown(function() {
// 			onlynumber(event);
//      });
//-----------------------------------------------------------------------------
function onlynumber(event) {
	//var eventKey = event.which;
	var eventKey = event.keyCode ? event.keyCode : event.which ? event.which : event.charCode;
	if( (eventKey > 47 && eventKey < 58) ||
			(eventKey > 95 && eventKey < 106) ||
				(eventKey > 36 && eventKey < 41) ||
					eventKey == 8 ||
						eventKey == 46 ||
							eventKey == 9){

	}else{
		(event.preventDefault) ? event.preventDefault() : event.returnValue = false;
	}
}



//-----------------------------------------------------------------------------
////현재시간 구하기 // 20080301103025 표현식
//
//-----------------------------------------------------------------------------
function getTimeStamp() {
	var d = new Date();

	var s =
	leadingZeros(d.getFullYear(), 4) +
	leadingZeros(d.getMonth() + 1, 2) +
	leadingZeros(d.getDate(), 2) +

	leadingZeros(d.getHours(), 2) +
	leadingZeros(d.getMinutes(), 2) +
	leadingZeros(d.getSeconds(), 2);

	return s;
}
//1 -> 01 과 같이 변경하기
function leadingZeros(n, digits) {
	var zero = '';
	n = n.toString();
	if (n.length < digits) {
		for (i = 0; i < digits - n.length; i++)
			zero += '0';
	}
	return zero + n;
}

//-----------------------------------------------------------------------------
//두날짜 비교 하여 사이의 일자를 구함
//
//-----------------------------------------------------------------------------
function getDayInterval(time1, time2){
   /*두개의 일자를 Parameter로 받아 차이를 구하는 Functioin. time2가 존재하지 않을 경우 오늘 일자로 Setting...Import*/
   var date1 = toTimeObject(time1);
   var date2 = null;
   if(time2 == undefined){
       date2 = new Date();
   }else {
       date2 = toTimeObject(time2);
   }
   var day = 1000 * 3600 * 24;
   return parseInt((date2 - date1) / day, 10);
}
function toTimeObject(time){
    /*yyy-MM-dd형태의 일자를 Date 객체로 변환함....Import*/
    var year = eval(time.substr(0,4));
    var mon = eval(time.substr(5,2)) - 1;
    var day = eval(time.substr(8,2));
    return new Date(year, mon, day);
}
function getDateYmdFmt(ymd,deli){
    /* 8자리의 날자형태의 일자를 변경한다.*/
	if(ymd.trim().length == 8){
		return	ymd.trim().substr(0,4) + deli + ymd.trim().substr(4,2) + deli + ymd.trim().substr(6);
	}else{
		return ymd;
	}
}


//-----------------------------------------------------------------------------
// 두 날짜시간( yyyymmddhh24miss 형태) 사이의 간격을 "일-시간-분"으로 표시한다.
// 테스트 해야됨
//-----------------------------------------------------------------------------
function dateTimeCompare(startTime,endTime){
	//var startTime = "20090101123000";    // 시작일시 ('20090101 12:30:00')
	//var endTime  = "20091001172010";    // 종료일시 ('20091001 17:20:10')

	// 시작일시
	var startDate = new Date(parseInt(startTime.substring(0,4), 10),
	        parseInt(startTime.substring(4,6), 10)-1,
	        parseInt(startTime.substring(6,8), 10),
	        parseInt(startTime.substring(8,10), 10),
	        parseInt(startTime.substring(10,12), 10),
	        parseInt(startTime.substring(12,14), 10)
	       );
	// 종료일시
	var endDate   = new Date(parseInt(endTime.substring(0,4), 10),
	        parseInt(endTime.substring(4,6), 10)-1,
	        parseInt(endTime.substring(6,8), 10),
	        parseInt(endTime.substring(8,10), 10),
	        parseInt(endTime.substring(10,12), 10),
	        parseInt(endTime.substring(12,14), 10)
	       );

	// 두 일자(startTime, endTime) 사이의 차이를 구한다.
	var dateGap = endDate.getTime() - startDate.getTime();
	var timeGap = new Date(0, 0, 0, 0, 0, 0, endDate - startDate);

	// 두 일자(startTime, endTime) 사이의 간격을 "일-시간-분"으로 표시한다.
	var diffDay  = Math.floor(dateGap / (1000 * 60 * 60 * 24)); // 일수
	var diffHour = timeGap.getHours();       // 시간
	var diffMin  = timeGap.getMinutes();      // 분
	var diffSec  = timeGap.getSeconds();      // 초

	// 출력 : 샘플데이타의 경우 "273일 4시간 50분 10초"가 출력된다.
	//alert(diffDay + "일 " + diffHour + "시간 " + diffMin + "분 "  + diffSec + "초 ");

	return diffDay;
}

//-----------------------------------------------------------------------------
// 두 날짜사이의 일수를 반환함..
// ex)
/*
        if (  getDiffDay (  '<%=date()%>' , form.con_date.value  ) > 8) {
            alert("상담 희망일시는 7일이내의 날짜를 입력해 주세요");
            return;
        }
*/
//-----------------------------------------------------------------------------
function getDiffDay(startDate, endDate) {
	var diffDay = 0;
	var start_yyyy = startDate.substring(0,4);
	var start_mm = startDate.substring(5,7);
	var start_dd = startDate.substring(8,startDate.length);
	var sDate = new Date(start_yyyy, start_mm-1, start_dd);
	var end_yyyy = endDate.substring(0,4);
	var end_mm = endDate.substring(5,7);
	var end_dd = endDate.substring(8,endDate.length);
	var eDate = new Date(end_yyyy, end_mm-1, end_dd);

	diffDay = Math.ceil((eDate.getTime() - sDate.getTime())/(1000*60*60*24));

	return diffDay;
}


//-----------------------------------------------------------------------------
// 문자열이 숫자형태 인지 체크
// @param str
// @param inputName
// @return
// (kc < 48 || kc > 57)   //키보드 0,1,2,3,4,5,6,7,8,9 를 제외한 키코드
// (kc < 96 || kc > 105)  //키보드 num0, num1 ........ num9를 제외한 키코드
// (kc != 8 && kc != 9)     //키보드 backspace키와 tab키를 제외한 키코드 *
//-----------------------------------------------------------------------------
function strCheckNum(objId){
	var kc = event.keyCode;
	if((kc < 48 || kc > 57) && (kc < 96 || kc > 105) && (kc != 8 && kc != 9 && kc != 13)){
		alert('숫자만 입력할 수 있습니다.');
		$("#"+objId ).val("");
		$("#"+objId ).focus();
		return false;
	}
}



//-----------------------------------------------------------------------------
//objVal값 form file value 'C:\My Documents\My Pictures\감자도리\xxxx.jpg'
//limitExt값 'jpg|gif|png|bmp'
//확장자가 해당하는 확장자가 아닐경우 리턴 false
//-----------------------------------------------------------------------------
function fileExtCheck(objVal,limitExt){
	var val=objVal.toLowerCase();
	if(!val)
	    return false;
	fileExt = val.substr(val.lastIndexOf('.') + 1,val.length);
	if(limitExt.indexOf(fileExt) == -1){
	    alert("확장자가 " + limitExt.replace(/\|/gi,",") + "를 제외한 파일을 선택 할 수 없습니다");
	    return false;
	}
	return true;
}


//-----------------------------------------------------------------------------
//날짜 비교 함수
//sDate: 비교 대상 날짜 첫번째 ex: 2009-04-29
//eDate : 비교 대상 날짜 두번째 ex: 2009-04-28
//-----------------------------------------------------------------------------
function dateCompare(sDate,eDate){
	var start_dates = sDate.split("-");
	var end_dates = eDate.split("-");
	var date1 = new Date(start_dates[0],start_dates[1],start_dates[2]).valueOf();
	var date2 = new Date(end_dates[0],end_dates[1],end_dates[2]).valueOf();
	if( (date2 - date1) < 0 ){
		return false;
	}else{
		return true;
	}
}

// 두개의 날짜를 비교한다 스타트데이트가 엔드데이트보다 큰지를 검사
// 2011-12-22 > 2014-12-25
/*
function dateCompare(sdateStr,edateStr){
	var d1 = sdateStr;
	var d2 = edateStr;

	if(d1 != "" && d2 != ""){

		d1 = d1.replace(/-/g,"");
		d2 = d2.replace(/-/g,"");

		if(d1>d2){
			return false;
		}
		return true;
	}
}
*/

//-----------------------------------------------------------------------------
//날짜 유효성 체크(병합된 yyyymmdd 값)
//
//-----------------------------------------------------------------------------
//숫자체크
function isNumber(control, msg) {

	var val = control;
	var Num = "1234567890";
	for (i=0; i<val.length; i++) {
		if(Num.indexOf(val.substring(i,i+1))<0) {
			alert(msg+' 형식이 잘못되었습니다.');
			return false;
		}
	}
	return true;
}

// 날짜체크
function isDate(control, msg) {

	// '/'나 '-' 구분자 제거
	var val = getRemoveFormat(control);


	// 숫자, length 확인
	if (isNumber(val, msg) && val.length == 8) {
		var year = val.substring(0,4);
		var month = val.substring(4,6);
		var day = val.substring(6,8);

		// 유효날짜 확인
		if(checkDate(year,month,day,msg)){
			return true;
		} else {
			return false;
		}
	} else {
		alert(msg + " 유효하지 않은 년,월,일(YYYYMMDD)입니다. 다시 확인해 주세요!");
		return false;
	}
}

// 구분자 제거
function getRemoveFormat(val) {
	if(val.length == 10) {
		var arrDate = new Array(3);
		arrDate = val.split("/");
		if(arrDate.length != 3) {
			arrDate = val.split("-");
		}
		return arrDate[0] + arrDate[1] + arrDate[2];
	} else {
		return val;
	}
}

// 유효날짜 확인
function checkDate(varCk1, varCk2, varCk3, msg) {
	if (varCk1>="0001" && varCk1<="9999" && varCk2>="01" && varCk2<="12") {
		febDays = "29";
		if ((parseInt(varCk1,10) % 4) == 0) {
			if ((parseInt(varCk1,10) % 100) == 0 && (parseInt(varCk1,10) % 400) != 0){
				febDays = "28";
			}
		}else{
			febDays = "28";
		}
		if (varCk2=="01" && varCk3>="01" && varCk3<="31") return true;
		if (varCk2=="02" && varCk3>="01" && varCk3<=febDays) return true;
		if (varCk2=="03" && varCk3>="01" && varCk3<="31") return true;
		if (varCk2=="04" && varCk3>="01" && varCk3<="30") return true;
		if (varCk2=="05" && varCk3>="01" && varCk3<="31") return true;
		if (varCk2=="06" && varCk3>="01" && varCk3<="30") return true;
		if (varCk2=="07" && varCk3>="01" && varCk3<="31") return true;
		if (varCk2=="08" && varCk3>="01" && varCk3<="31") return true;
		if (varCk2=="09" && varCk3>="01" && varCk3<="30") return true;
		if (varCk2=="10" && varCk3>="01" && varCk3<="31") return true;
		if (varCk2=="11" && varCk3>="01" && varCk3<="30") return true;
		if (varCk2=="12" && varCk3>="01" && varCk3<="31") return true;
	}
	alert(msg + " 유효하지 않은 년,월,일(YYYYMMDD)입니다. 다시 확인해 주세요!");
	return false;
}






function strCheckNum(objId){
	var kc = event.keyCode;
	if((kc < 48 || kc > 57) && (kc < 96 || kc > 105) && (kc != 8 && kc != 9 && kc != 13)){
		alert('숫자만 입력할 수 있습니다.');
		$("#"+objId ).val("");
		$("#"+objId ).focus();
		return false;
	}
}


//-----------------------------------------------------------------------------
//날짜 유효성 체크( 유효한 날짜이고 yyyy-mm-dd 일때만 true 리턴 )
//
//-----------------------------------------------------------------------------
function isDateYmd(d)
{
	var date_pattern = /^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/;
    return date_pattern.test(d);

}

//-----------------------------------------------------------------------------
//설명 : 숫자를 체크하다가 6자 등 원하는 만큼 이동후 다음 input 박스로 이동 시키는...함수
//
//-----------------------------------------------------------------------------
function goJump(fname, len, goname){
	if (document.all[fname].value.length == len) document.all[goname].focus();
}


//-----------------------------------------------------------------------------
//설명 : select에서 선택된 option의 갯수를 리턴 시킨다. (멀티플 셀렉트 박스 벨리데이션시 사용)
//예) optionSelectedCnt(form.name)
//-----------------------------------------------------------------------------
function optionSelectedCnt(name){
	var cnt = 0;

	for(i=0;i<name.length;i++)
	{
		if ( name[i].selected == true )
		{
			cnt++;
		}
	}
	return cnt;
}


//-----------------------------------------------------------------------------
//설명 : select에서 선택된 option의 갯수를 리턴 시킨다. ( 라디오 버튼과 체크박스 벨리데이션시 사용)
//예) selectedCnt(form.name)
//-----------------------------------------------------------------------------
function selectedCnt(name){
	var cnt = 0;
	if(name){
		if(!name.length) {
			if(name.checked) {
				cnt++;
			}
		}else{
			for(i=0;i<name.length;i++)
			{
				if ( name[i].checked == true )
				{
					cnt++;
				}
			}
		}
	}
	return cnt;
}


//-----------------------------------------------------------------------------
//설명 : 체크상자 초기화 체크된것을 모두 false 로 한다.
//예)
//-----------------------------------------------------------------------------
function checkInit(name)
{
	if(name){
		if(!name.length) {
			name.checked = false;
		} else {
			for(var i=0;i<name.length;i++) {
				name[i].checked = false;
			}
		}
	}
}




//-----------------------------------------------------------------------------
//금액에 , 를 붙인다.
//-----------------------------------------------------------------------------
function Comma(input)
{
    var inputString = new String;
    var outputString = new String;
    var counter = 0;
    var decimalPoint = 0;
    var end =0;

    inputString = input.toString();

    outputString = '';

    decimalPoint = inputString.indexOf('.', 1);

    if(decimalPoint == -1)
    {
        end = inputString.length;
        for (counter = 1; counter <= inputString.length; counter++)
        {
            outputString = (counter % 3 == 0  && counter < end ? ',' : '') +
                           inputString.charAt(inputString.length - counter) +
                           outputString;
        }
    }
    else
    {
        end = decimalPoint - (inputString.charAt(0) == '-' ? 1 : 0);
        for (counter = 1; counter <= decimalPoint; counter++)
        {
            outputString = (counter % 3 == 0 && counter < end ? ',' : '') +
                         inputString.charAt(decimalPoint - counter) +
                         outputString;
        }
        for (counter = decimalPoint; counter < decimalPoint + 3; counter++)
        {
            outputString += inputString.charAt(counter);
        }
    }
    return (outputString);
}


//-----------------------------------------------------------------------------
//금액 콤마 add 함수
//
//-----------------------------------------------------------------------------
function addComma (Cost) {
	// Cost값이 0보다작으면(음수이면) Cost를 양수로변경하고 minus값도 변경
	if (Cost < 0) {
		Cost *= -1; var minus = true;
	} else var minus = false;

	// Cost값에서 소숫점위와 아래를 분리하여 dotU/dotD변수에저장
	// Cost가 숫자이기 때문에 문자로 변환하기 위해 (Cost + "") 에서 ""을 붙여줌
	// split함수사용예
	// AF = abcdefg.split("c")
	// AF[0] =>ab
	// AF[1] =>defg
	var dotPos = (Cost + "").split (".");
	var dotU = dotPos [0];
	var dotD = dotPos [1];
	// dotU(소수점위)를 3으로나누어 그 나머지를 CommaFlag에저장
	// 돈에 콤마를 표시할때 3자리 단위로 표시하기때문에...
	var CommaFlag = dotU.length % 3;
	// 나머지가 있을경우 (예: 12345 또는 12345678 ...)
	if (CommaFlag) {
	// out에 dotU앞자리를 CommaFlag길이만큼 대입
		var out = dotU.substring (0, CommaFlag);
	// dotU의 길이가 3자리 초과이면 out문자끝에 콤마를 추가

		if (dotU.length > 3) out += ",";
	}
	// 나머지가 없을경우(예: 123  또는 123456 ...)
	else var out = "";
	// dotU문자에서 CommaFlag만큼 이동한후 세글자 단위로 콤마를 찍음

	for (var i = CommaFlag; i < dotU.length; i += 3) {
		out += dotU.substring (i, i + 3);
		if (i < dotU.length - 3) out += ",";
	}
	// 음수일경우 out 변수값앞에 "-"를 추가
	if (minus) out = "-" + out;

	// 소숫점이하값이 있으면 out변수값에 소숫점을 추가하여 리턴
	if (dotD) return out + "." + dotD;
	else return out;
}

//금액에서 콤마를 제거한후 그값을 돌려주는함수
function delComma (Cost) {
	var retValue = "";
	// Cost변수에서 콤마 문자가 있을경우 콤마문자를 제거함
	for (i = 0; i < Cost.length; i++) {
		if (Cost.charAt (Cost.length - i -1) != ",") {
			retValue = Cost.charAt (Cost.length - i -1) + retValue;
		}
	}
	return retValue;
}

//입력창에서 자동으로 숫자표기(,) 로 변환
function change_price(obj) {
	if (typeof obj == "object") {
		var value=obj.value;		// 현재 객체의 값을 구함
		value=delComma(value);		// 현재 값에서 , 를 제거
		obj.value=addComma(value);	// 자릿수에 맞추어 , 추가
	} else {
		return addComma(delComma(obj));
	}
}

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
//
//폼 관련 함수 끝
//
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------












/************************************************************
  함수 : window_center(넓이,높이)
  목적 : 예약창의 사이즈 조절
  방법 : window_center (넓이,높이)
          예) window_center(100,100)
************************************************************/
function window_center(w, h) {

	width=screen.width;
	height=screen.height;

	x=(width/2)-(w/2);
	y=(height/2)-(h/2);

	window.resizeTo(w,h);
	window.moveTo(x,y);
}


/************************************************************
설명 : 새창 띄워서 포커스 주기 (자동 중앙 팝업)
예) windowOpenCenter('주소','윈도우이름',가로,세로,'기타 설정')
,scrollbars=yes ,personalbar=no ,resizable=no ,directories=no ,status=no ,menubar=no
************************************************************/
function windowOpenCenter(pUrl,pName,pW,pH,val){
	var winWidth  = window.screen.width;    //해상도가로
	var winHeight  = window.screen.height;     //해상도세로

	// XP인 경우 height 29 추가
	//if( window.navigator.userAgent.indexOf("SV1") != -1 ) {
	//	pH += 29;
	//}

	var pLeft,pTop;
	pLeft = parseInt((winWidth-pW)/2);
	pTop = parseInt((winHeight-pH)/2);

	var newWin=window.open(pUrl,pName,"width="+pW+",height="+pH+",left="+pLeft+",top="+pTop+" "+ val );
	newWin.focus();
}


/************************************************************
설명 : 새창 띄워서 포커스 주기
예) windowOpen('주소','옵션',가로,세로,탑,래프트)
,scrollbars=yes ,personalbar=no ,resizable=no ,directories=no ,status=no ,menubar=no
************************************************************/
function windowOpen(path,code,w,h,t,l){

	winToTop = t;
	winToLeft = l;

	making ='width='+w+',height='+h+',top='+winToTop+',left='+winToLeft;
	win=window.open(path,code,making);
	win.focus();

}

/************************************************************
설명 : HTML TAG Filter 에서 수정한 '<','>','&','"','\' 에 대하여 원래 html 로 보여준다
예) 이 함수는 jstl <c:out 으로 출력할경우 escapeXml 옵션으로 사용하고
    AJAX 로 받아온 변수일 경우에 아래 하래 함수를 사용할것
************************************************************/
function showHtmlTag(text){
	text = text.replace(new RegExp("&lt;", "gi"), "<");
	text = text.replace(new RegExp("&gt;", "gi"), ">");
	text = text.replace(new RegExp("&amp;", "gi"), "&");
	text = text.replace(new RegExp("&quot;", "gi"), "\"");
	text = text.replace(new RegExp("&apos;", "gi"), "'");
	//text = text.replace(new RegExp("&#39;", "gi"), "'");
	//text = text.replace(new RegExp("<br>", "gi"), " ");
	return text;
}

/** javascript object를 string으로 출력 */
function objToStr(o){
    var parse = function(_o){
        var a = [], t;
        for(var p in _o){
            if(_o.hasOwnProperty(p)){
                t = _o[p];
                if(t && typeof t == "object"){
                    a[a.length]= p + ":{ " + arguments.callee(t).join(", ") + "}";
                }else {
                    if(typeof t == "string"){
                        a[a.length] = [ p+ ": \"" + t.toString() + "\"" ];
                    } else{
                        a[a.length] = [ p+ ": " + t.toString()];
                    }
                }
            }
        }
        return a;
    };
    return "{" + parse(o).join(", ") + "}";
}


/************************************************************
같은 값이 있는 열을 병합함
사용법 : $('#테이블 ID').rowspan(0);
************************************************************/
$.fn.rowspan = function(colIdx, isStats) {
    return this.each(function(){
        var that;
        $('tr', this).each(function(row) {
            $('td:eq('+colIdx+')', this).filter(':visible').each(function(col) {

                if ($(this).html() == $(that).html()
                    && (!isStats
                            || isStats && $(this).prev().html() == $(that).prev().html()
                            )
                    ) {
                    rowspan = $(that).attr("rowspan") || 1;
                    rowspan = Number(rowspan)+1;

                    $(that).attr("rowspan",rowspan);

                    // do your action for the colspan cell here
                    $(this).hide();

                    //$(this).remove();
                    // do your action for the old cell here

                } else {
                    that = this;
                }

                // set the that if not already set
                that = (that == null) ? this : that;
            });
        });
    });
};


/************************************************************
같은 값이 있는 행을 병합함
사용법 : 사용법 : $('#테이블 ID').colspan (0);
***********************************************************/
$.fn.colspan = function(rowIdx) {
    return this.each(function(){

        var that;
        $('tr', this).filter(":eq("+rowIdx+")").each(function(row) {
            $(this).find('th').filter(':visible').each(function(col) {
                if ($(this).html() == $(that).html()) {
                    colspan = $(that).attr("colSpan") || 1;
                    colspan = Number(colspan)+1;

                    $(that).attr("colSpan",colspan);
                    $(this).hide(); // .remove();
                } else {
                    that = this;
                }

                // set the that if not already set
                that = (that == null) ? this : that;

            });
        });
    });
}

//로그찍기
function log(logStr){
	if(typeof console == 'object'){
		console.log(logStr);
	}
}


//-----------------------------------------------------------------------------
//날짜형식 변환 (20140909 => 2014-09-09)
//@return : String
//-----------------------------------------------------------------------------
String.prototype.tranceDateType = function() {

	if (this.length == 8) {
	    var year = this.substring(0,4);
	    var month = this.substring(4,6);
	    var day = this.substring(6);

	    return year +"-"+ month +"-"+ day;
	} else {
		return this;
	}
}


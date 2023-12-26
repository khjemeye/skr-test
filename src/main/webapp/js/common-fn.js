// 초기화 버튼 스크립트 (반드시 formId를 넣어주세요)
function initSearchForm(id) {
	var f = document.getElementById(id);
	f.reset();
	//$('#'+id)[0].reset();
}



//로딩..
function onLoading(){
	// 투명백그라운드를 줘서.. 로딩이 완료되기전까지 버튼 더블클릭을 못하게함.. (단, 오류시 다소 헷갈릴수있음.)
	$("body").block({ overlayCSS: { backgroundColor: 'rgba(255,255,255,0.1)' }, message: null});
}

//언로딩..
function offLoading(){
	$("body").unblock();
}




/************************************************************
윈도우 open 팝업 후 가운데 정렬
***********************************************************/
function gfnWindowOpenCenter(pUrl,pName,pW,pH,val){
	var winWidth  = window.screen.width;    //해상도가로
	var winHeight  = window.screen.height;     //해상도세로

	var pLeft,pTop;
	pLeft = parseInt((winWidth-pW)/2);
	pTop = parseInt((winHeight-pH)/2);

	var newWin=window.open(pUrl,pName,"width="+pW+",height="+pH+",left="+pLeft+",top="+pTop+" "+ val );
	newWin.focus();
}

/************************************************************
 3자리 숫자마다 콤마찍기
 ***********************************************************/
function commaSplit(srcNumber) {
	var txtNumber = '' + srcNumber;
	if (isNaN(txtNumber) || txtNumber == "") {
		return '';
	}else{
		var rxSplit = new RegExp('([0-9])([0-9][0-9][0-9][,.])');
		var arrNumber = txtNumber.split('.');
		arrNumber[0] += '.';
		do {
			arrNumber[0] = arrNumber[0].replace(rxSplit, '$1,$2');
		} while (rxSplit.test(arrNumber[0]));

		if (arrNumber.length > 1) {
			return arrNumber.join('');
		}else{
			return arrNumber[0].split('.')[0];
		}
	}
}

/************************************************************
 imgCover.js 를 재실행해줌 (비동기로 데이터를 가져왔는데 이미지 정면보기가 실행되지 않으면 아래 펑션 호출해줄것 (보통 익스에서 안됨)
 ***********************************************************/
function gfnImageCover(){

	if('objectFit' in document.documentElement.style === false) {

		// assign HTMLCollection with parents of images with objectFit to variable
		var container = document.getElementsByClassName('imgWrap'); // img를 감싸고 있는 div의 class name 을 써주세요.

		// Loop through HTMLCollection
		for(var i = 0; i < container.length; i++) {

			// Asign image source to variable
			var imageSource = container[i].querySelector('img').src;

			// Hide image
			container[i].querySelector('img').style.display = 'none';

			// Add background-size: cover
			container[i].style.backgroundSize = 'cover';

			// Add background-image: and put image source here
			container[i].style.backgroundImage = 'url(' + imageSource + ')';

			// Add background-position: center center
			container[i].style.backgroundPosition = 'center center';
		}
	}
	else {
		// You don't have to worry
		console.log('No worries, your browser supports objectFit')
	}

}
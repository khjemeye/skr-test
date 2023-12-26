

function sendAjaxMultiCombo( callurl , targetSelectObj , param , codeId, selTitle) {
	var gSelObj = targetSelectObj;

	$.getJSON( callurl+"?"+param, {type:"json"}, function (returnData, textStatus){
		if(textStatus == 'success'){
			jsonParseMultiCombo(returnData, gSelObj , codeId , selTitle);
		} else {
			alert("데이타처리 실패했습니다");
			return;
		}
	});
}

function jsonParseMultiCombo(returnData, oj , codeId , selTitle){
	oj.find("option").remove(); // 모든거 지우고

	var itemLength = returnData.result.length;

	if(itemLength != 0) {
		oj.append("<option value=''>"+selTitle+"</option>");

	    $.each(returnData.result, function(i,result){
			var code = result.code;
		    var name = result.name;
		    if(codeId == code) {
		    	oj.append("<option value="+code+" selected>"+name+"</option>"); // 서브밋 후 selected 되게 하기 위함..
		    } else {
				oj.append("<option value="+code+">"+name+"</option>");
		    }
	    });
	} else {
		oj.append("<option value=''>no Result</option>");
	}
}


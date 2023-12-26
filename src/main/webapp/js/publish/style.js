$(document).ready(function () {
	
    
    // header - all menu 열기, 닫기
	$(".allmenu_btn").click(function (e) {	
		e.stopPropagation();
		$(".allmenuWrap").toggleClass("active");	
    });
	
	// header - all menu 버튼외 클릭시 닫기
	$('html').click(function (e) {
		if (!$(e.target).is(".allmenu_btn")) {
			$('.allmenuWrap').removeClass("active");
		}
	});	
    
    // top event banner
	$('.top_banner .close').click(function () {
        $(this).parent().remove();
	});	
    

    // 우측 quick fixTo 
    $('.quick').fixTo('#container', {top: 0, useNativeSticky:true});
    
    
    // left menu
    $('.leftMenu > li > a').click(function () {
        $(this).parent().addClass('active');
        $(this).parent().siblings().removeClass('active');
	});
    
    
     // slimScroll 
    $('.slimScroll').slimScroll({ 
        height:'100%'
    });
    
    
    // 좌측 차량검색 옵션 접기, 열기 
    $(".optionWrap .tit").click(function(){
		$(this).parent('li').toggleClass("active");
	});
    
    
    
});















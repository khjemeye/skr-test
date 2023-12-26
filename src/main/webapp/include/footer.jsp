<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include/taglib_prefix.jsp"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<div class="footer_wrap">
    <div class="btn_footer">
        <button type="button" onclick="location.href='/>/?pcViewFlag=1'">PC버전</button>
        <button type="button" onclick="location.href='https://play.google.com/store/apps/details?id=com.busanautofield.app'">안드로이드 APPddd</button>
        <button type="button" onclick="location.href='https://apps.apple.com/app/id1532197564';">IOS APP</button>
    </div>
    <div class="footer_text">
        <div class="btn">
            <button type="button" onclick="footerinfo();" class="footer_toggle">부산오토필드</button>
        </div>
        <div class="info">
                부산광역시 기장군 장안읍 반룡산단3로 95, 813호<br>
                대표이사 : 한상원        사업자번호 : 313-81-35291<br>
				온라인대행 : 주식회사 에이블컴애드<br>
				서울시 강남구 논현로 149길 54, 301호(논현동)<br>
				대표자 : 이희정 사업자번호 : 574-88-00057<br />
                대표전화 : 051-608-2222
         </div>
        Copyright(c) 부산오토필드
		<div class="ex">부산오토필드는 통신판매중개자로서 통신판매의 당사자가 아니며, 상품거래정보, 거래에 대하여 책임을 지지 않습니다.</div>
    </div>
</div>

<script>
$(document).ready(function(){
    if(isMobile()){
        jQuery(".footer_wrap").hide();
        jQuery(".footer_wrap.webmobile").show();
    }
});
</script>
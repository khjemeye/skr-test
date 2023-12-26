<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include/taglib_prefix.jsp"%>
<%@ include file="/include/top.jsp"%>

<%@ include file="/include/headerMenu.jsp"%>

<!-- header -->
<div id="header" class="row header fixed">

    <!-- titlebar -->
    <div class="column titlebar no-padding">
        <div class="titlebar-left">
            <button class="menu-icon" type="button" onClick="winback();"></button>
        </div>
        <div id="logo" class="titlebar-center submenu">
            <a href="javascript:void(0);" title="문의하기">문의하기</a>
        </div>
        <div class="titlebar-right">
            <button class="menu-icon hamburger" type="button" onClick="openNav();"></button>
        </div>
    </div>
    <!-- //titlebar -->

</div>
<!-- //header -->

<%@ include file="/include/headerSubmenu.jsp"%>

<!-- container -->
<div class="container">

    <div class="row customer-txt">
        <div class="column">
            <p class="tit">문의</p>
            <p>고객과 소통하는 부산오토필드 여러분의 문의를 환영합니다.<br>FAQ 항목 외 궁금한 사항을 질문하시면 친절하게 답변해 드립니다.</p>
        </div>
    </div>
    <div class="row member_box customer_box">
        <div class="column">
            <div class="title_wrap left">
                <h2>문의하기</h2>
            </div>
            <div class="inputFormWrap">
                <ul>
                    <li>
                        <c:if test="${not empty vocTypeList}">
                            <c:forEach items="${vocTypeList}" var="type" varStatus="status">
                                <input type="radio" id="radio2_${status.count}" name="radios2" value="${type.code}">
                                <label for="radio2_${status.count}">${type.name}</label>
                            </c:forEach>
                        </c:if>
                    </li>
                    <li>
                        <div class="title">이름</div>
                        <input id="ask_name" type="text" value="${userName}">
                    </li>
                    <li>
                        <div class="title">이메일</div>
                        <div class="flex">
                            <input id="ask_email1" type="text" class="inline" value="${userEmail1}">
                            @
                            <input id="ask_email2" type="text" class="inline" value="${userEmail2}">
                        </div>
                        <select id="emailDomainNmSelect" onchange="setEmailDomainNm()">
                            <c:if test="${not empty emailDomainList}">
                                <c:forEach items="${emailDomainList}" var="type" varStatus="status">
                                    <option value="${type.code}">${type.name}</option>
                                </c:forEach>
                            </c:if>
                        </select>
                    </li>
                    <li>
                        <div class="title">제목</div>
                        <input id="ask_title" type="text">
                    </li>
                    <li>
                        <div class="title">내용</div>
                        <textarea id="ask_content" rows="5" type="textarea"></textarea>
                    </li>
                </ul>
                <dl class="agreeChk">
                    <dd>
                        <input type="checkbox" id="chk2" name="chk">
                        <label for="chk2">개인정보 수집 및 이용에 동의합니다.</label>
                        <a href="javascript:javascript:openPopup('agree', 2);" class="btn_link">약관보기</a>
                    </dd>
                </dl>

            </div>
            <div class="button-group col2">
                <button type="button" class="button color-black" onClick="winback();">취소</button>
                <button type="button" class="button" onClick="requestAsk();">등록</button>
            </div>

        </div>
    </div>

    <%--
    <div class="row customer-btns">
        <div class="column">
            <ul>
                <li class="c3">
                   <p class="tit">이용 관련 문의</p>
                   <p>원하시는 답변이 없으신가요? 부산오토필드에 직접 문의하세요.</p>
                   <a href="/cs/selectQnaView.do" class="button">1:1 문의하기</a>
                </li>
                <li class="c2">
                   <p class="tit">대표번호</p>
                    <p>원하시는 답변이 없으신가요? 부산오토필드에 직접 문의하세요.<br>
                        <strong>0000-0000</strong>
                    </p>
                </li>
                <li class="c1">
                    <p class="tit">제휴문의</p>
                    <p>부산오토필드와 함께하실 비즈니스 파트너를 환영합니다.</p>
                    <a href="/cs/selectContactView.do" class="button">제휴문의</a>
                </li>
            </ul>
        </div>
    </div>
    --%>

    <%@ include file="/include/footer.jsp"%>

</div>
<!--// container -->

<script>
function setEmailDomainNm() {
    var emailDomainNm = $('#emailDomainNmSelect').val();
    if(emailDomainNm == '직접입력') {
        $('#ask_email2').val('');
        $('#ask_email2').removeAttr('readonly');

    } else {
        $('#ask_email2').val(emailDomainNm);
        $('#ask_email2').attr('readonly',true);
    }
}

function requestAsk(){
    if(!$("#chk2").is(":checked")) {
        alert("개인정보취급방침에 동의해 주세요.");
        return;
    }

    var type = "";

    if(document.getElementsByName('radios2').length > 0) {
        if($('input[name="radios2"]:checked').val()) {
            type = $('input[name="radios2"]:checked').val();
        }else{
            alert("항목을 선택해 주세요.");
            return;
        }
    }

    if(!$("#ask_name").val()) {
        alert("이름을 입력해 주세요.");
        return;
    }

    if(!$("#ask_email1").val() || !$("#ask_email2").val()) {
        alert("이메일을 입력해 주세요.");
        return;
    }

    if(!$("#ask_title").val()) {
        alert("제목을 입력해 주세요.");
        return;
    }

    if(!$("#ask_content").val()) {
        alert("내용을 입력해 주세요.");
        return;
    }

    var data = {
        type: type,
        name: $("#ask_name").val(),
        email: $("#ask_email1").val() + "@" +$("#ask_email2").val(),
        title: $("#ask_title").val(),
        content: $("#ask_content").val()
    }

    $.ajax({
        type: "POST",
        url: "/cs/insertOrUpdateVoc.do" ,
        data: data,
        dataType: "JSON",
        success: function(json){
            if(json.message){
                alert(json.message);
                location.reload();
            }
        },
        error:function(){
            alert( 'error' );
        }
    });
}

</script>

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
            <a href="javascript:void(0);" title="제휴문의">제휴문의</a>
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

    <div class="row">
        <div class="column member_box customer_box">
            <div class="tit">
                <p>
                    <img src="/images/logo.png" style="height:18px;vertical-align:inherit;"><br>
                    제휴문의
                </p>
                <span>부산오토필드는 정직한 중고차 세상을 함께 만들어 나갈 당신의 파트너가 되겠습니다.
함께 성장을 도모하고, 시너지 효과를 창출할 많은 기업들의 소중한 연락을 기다립니다.</span>
            </div>
            <ul class="cs_a_step">
                <li class="li1">
                    <b>
                        <i>STEP 1</i>
                        <em>제휴문의</em>
                    </b>
                </li>
                <li class="li2">
                    <b>
                        <i>STEP 2</i>
                        <em>제안서 검토 및 연락</em>
                    </b>
                </li>
                <li class="li3">
                    <b>
                        <i>STEP 3</i>
                        <em>제휴내용 협의</em>
                    </b>
                </li>
                <li class="li4">
                    <b>
                        <i>STEP 4</i>
                        <em>계약체결</em>
                    </b>
                </li>
            </ul>
            <div class="inputFormWrap">
                <ul>
                    <li>
                        <div class="title">제휴문의 구분</div>

                        <c:if test="${not empty contactTypeList}">
                        <li>
                            <c:forEach items="${contactTypeList}" var="type" varStatus="status">
                                <input type="radio" id="radio1_${status.count}" name="radios1" value="${type.code}">
                                <label for="radio1_${status.count}">${type.name}</label>
                            </c:forEach>
                        </li>
                        </c:if>
                    </li>
                    <li>
                        <div class="title">회사명</div>
                        <input type="text" id="companyName">
                    </li>
                    <li>
                        <div class="title">이메일</div>
                        <input type="text" id="companyEmail" value="${userEmail}">
                    </li>
                    <li>
                        <div class="title">담당자명</div>
                        <input type="text" id="operName" value="${userName}">
                    </li>
                    <li>
                        <div class="title">연락처</div>
                        <input type="text" id="operTelNo" value="${userTel}">
                    </li>
                    <li>
                        <div class="title">제목</div>
                        <input type="text" id="contactTitl">
                    </li>
                    <li>
                        <div class="title">내용</div>
                        <textarea rows="5" type="textarea" id="contactCnts"></textarea>
                    </li>
                </ul>
                <dl class="agreeChk">
                    <dd>
                        <input type="checkbox" id="chk2">
                        <label for="chk2">개인정보 수집 및 이용에 동의합니다.</label>
                        <a href="javascript:javascript:openPopup('agree', 2);" class="btn_link">약관보기</a>
                    </dd>
                </dl>

            </div>
            <div class="button-group col2">
                <button type="button" class="button color-black" onClick="winback();">취소</button>
                <button type="button" class="button" onClick="actionRegister();">등록</button>
            </div>

        </div>
    </div>

    <%@ include file="/include/footer.jsp"%>
</div>
<!--// container -->
<script>
    function actionRegister() {
        if(!$(":input:radio[name=radios1]:checked").val()) {
            alert("제휴문의 구분을 선택해주세요");
            return;
        }
        if(!$('#companyName').val()) {
            alert("회사명을 입력해주세요");
            return;
        }
        if(!$('#companyEmail').val()) {
            alert("이메일을 입력해주세요");
            return;
        }
        if(!$('#operName').val()) {
            alert("담당자명을 입력해주세요");
            return;
        }

        if(!$('#operTelNo').val()) {
            alert("연락처를 입력해주세요");
            return;
        }
        if(!$('#contactTitl').val()) {
            alert("제목을 입력해주세요");
            return;
        }
        if(!$('#contactCnts').val()) {
            alert("제휴내용을 입력해주세요");
            return;
        }
        if (!$("input:checkbox[id='chk2']").is(":checked")) {
            alert("개인정보 수집 및 이용에 동의해주세요.");
            return;
        }

        $.ajax({
            url : '/cs/actionContactRegister.do',
            type : 'post',
            data : {
                contactDivCd : $(":input:radio[name=radios1]:checked").val(),
                companyName : $('#companyName').val(),
                companyEmail : $('#companyEmail').val(),
                operName : $('#operName').val(),
                operTelNo : $('#operTelNo').val(),
                contactTitl : $('#contactTitl').val(),
                contactCnts : $('#contactCnts').val()
            },
            dataType : 'json',
            success : function (data) {
                alert(data.resMsg);
                //winback();
            },
            error : function(data) {
                alert("정상적으로 입력되지 않았습니다. 관리자에게 문의바랍니다.");
            }
        });
    }
</script>

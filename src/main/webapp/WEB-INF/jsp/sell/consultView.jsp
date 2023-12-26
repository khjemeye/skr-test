<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.autofield.system.utility.CommonUtil"%>
<%@ include file="/include/taglib_prefix.jsp"%>
<%@ include file="/include/top.jsp"%>
<%@ include file="/include/headerMenu.jsp"%>

<script>
function goList() {
	location.href = "selectCarListView.do";
}
function delConsult() {
	if(!confirm("해당 상담글을 삭제하시겠습니까?")) {
		return;
	}

	var conNo = "${consultViewVO.currRecord.conNo}";
	var data = { "conNo" : conNo }; // queryString 형태로 보내면 400 Error 
	commonAjax(data , "/sell/deleteConsult.do" , callback = function(returnData) {
		if(returnData.success == true) {
			alert("해당 상담글이 삭제 되었습니다.");
			goList();
		} else {
			alert("상담글 삭제에 실패했습니다.");
		}

	}, true );	
}
function selConsultView(cvNo, dlNo) {
	if(!confirm("해당 딜러를 선택하시겠습니까?\n딜러를 선택하면 딜러에게 연락처가 전달됩니다.")) {
		return;
	}
	var data = { "cvNo" : cvNo, "dlNo" : dlNo }; // queryString 형태로 보내면 400 Error 
	commonAjax(data , "/sell/confirmConsultView.do" , callback = function(returnData) {
		if(returnData.success == true) {
			alert("딜러가 선택 되었습니다.");
			location.reload();
		} else {
			alert("상담글 삭제에 실패했습니다.");
		}

	}, true );	
}
</script>

<!-- header -->
<div id="header" class="row header fixed">
	
	<!-- titlebar -->
	<div class="column titlebar no-padding">		
		<div id="logo" class="titlebar-center">
			<a href="#" title="내차팔기 상담내용">내차팔기 상담내용</a>
		</div>
		<div class="titlebar-right">
		  <button class="menu-icon icon-close" type="button" onClick="winback();"></button>
		</div>
	</div>
	<!-- //titlebar -->
	
</div>
<!-- //header -->

<!-- container -->
<div class="container">

    <input type="hidden" id="cvNo" value="${cvNo}"/>
    <input type="hidden" id="conNo" value="${consultViewVO.currRecord.conNo}"/>
    <input type="hidden" id="conOption" value="${consultViewVO.currRecord.abOptions}"/>

	<div class="row detailCon01 bg">
		<div class="column">
			<div class="detail_box">
                <div class="detail_cartitle">${carTitle}</div>

                <c:if test="${consultViewVO.currRecord.abCarname ne null}">
					<div class="detail_text">${consultViewVO.currRecord.abCarname}</div>
                </c:if>
                <c:if test="${consultViewVO.currRecord.abCarname eq null}">
                    <div class="detail_text">${consultViewVO.currRecord.conCarname}</div>
                </c:if>

                <c:choose>
                    <c:when test="${modelimage ne null}">
                        <div class="model_img"><img src="${modelimage}" onerror="this.src='${modelNoImage}'"></div>
                    </c:when>
                    <c:otherwise>
                        <div class="model_img"><img src="${modelNoImage}"></div>
                    </c:otherwise>
                </c:choose>
			</div>		
		</div>
	</div>	
	<div class="row">
		<div class="column padd0">
			<table class="car_info_table">
				<tbody>
                <tr>
                    <th><img src="/images/icon/img_totalinfo1.png"></th>
                    <td class="font14">
                        <span class="smr">연식</span>
                        <c:choose>
                            <c:when test="${not empty prodDate}">
                                ${prodDate}
                            </c:when>
                            <c:otherwise>
                                -
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <th><img src="/images/icon/img_totalinfo2.png"></th>
                    <td>
                        <span class="smr">차량번호</span> ${consultViewVO.currRecord.conCarnum}
                    </td>
                </tr>
                <tr>
                    <th><img src="/images/icon/img_totalinfo3.png"></th>
                        <td>
                            <span class="smr">색상</span>
                            <c:choose>
                                <c:when test="${not empty consultViewVO.currRecord.abColor}">
                                    ${consultViewVO.currRecord.abColor}
                                </c:when>
                                <c:otherwise>
                                    -
                                </c:otherwise>
                            </c:choose>
                        </td>
                    <th><img src="/images/icon/img_totalinfo4.png"></th>
                    <td>
                        <span class="smr">주행거리</span>
                        ${CommonUtil.numberFormat(consultViewVO.currRecord.abMileage, "-")}km
                    </td>
                </tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="divide"></div>
	<div class="row">
		<div class="column">		   
			<div class="title_wrap left">
				<h2>답변내용</h2>	
			</div>				
            <c:if test="${dealerList.size() ne 0}">

			<c:set var="selCvNo" value="0" />
			<c:forEach items="${dealerList}" var="list">
				<c:if test="${list.cvConnectYn eq 'Y'}">
					<c:set var="selCvNo" value="${list.cvNo}" />
				</c:if>
			</c:forEach>
		    <div class="mysell_view">
                <ul>
					<c:forEach items="${dealerList}" var="list">
					<c:if test="${selCvNo eq 0 || list.cvNo eq selCvNo}">
					<c:set var="dealerImage" value="${dealerNoImage}" />
					<c:if test="${list.dlImage ne null && list.dlImage ne ''}">
						<c:set var="companyFolder" value="${CommonUtil.getCompanyPhotoFolder(list.dlCoNo)}" />
						<c:set var="dealerImage" value="${companyBaseUrl}${companyFolder}/${list.dlImage}" />
					</c:if>
                    <li>
                        <div class="seller-info">
							<div class="photo" style="background-image:url(${dealerImage});"></div>
							<ul>
								<li><strong class="title">${list.coName}</strong></li>
								<li>
									<span>카메니저</span> ${list.dlName}<br>
									<span>매매사원증</span> ${list.dlNumber}
								</li>
								<li class="phone">
									<button type="button" class="btn-call" onclick="location.href='tel:${list.dlHp}'">${list.dlHp}</button>
								</li>
							</ul>
						</div>
						<p>${list.cvMemo}</p>
						<c:if test="${selCvNo eq 0}">
							<button type="button" class="button color-red" onclick="selConsultView(${list.cvNo}, ${list.cvDlNo});">답변채택</button>
						</c:if>
                    </li>
                    </c:if>
                    </c:forEach> 
                </ul>				
			</div>              
			</c:if>
			<c:if test="${dealerList.size() eq 0}">
				<div class="empty">상담을 선택한 딜러가 없습니다.</div>
			</c:if>
		</div>
	</div>
	<br>
	<div class="divide"></div>
	<div class="row">
		<div class="column">		   
			<div class="title_wrap left">
				<h2>상담 신청자</h2>	
			</div>	
			<ul class="est_table">
				<li>신청일 <span class="right">${CommonUtil.getDate(consultViewVO.currRecord.conRegDate, 'yyyy-MM-dd HH:mm:ss', 'yy/MM/dd HH:mm', '-')}</span></li>
				<li>연락처 <span class="right">${CommonUtil.telFormat(consultViewVO.currRecord.conHp)}</span></li>
			</ul>
		</div>
	</div>
	<br>
	<div class="button-group padd0 col2">
		<button type="button" class="button" onclick="delConsult();">글삭제</button>
		<button type="button" class="button color-red" onclick="goList();">목록으로</button>		
	</div>
	
</div>
<!-- //container -->
</body>
</html>

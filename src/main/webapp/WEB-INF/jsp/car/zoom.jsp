<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include/taglib_prefix.jsp"%>
<!-- header -->
<div id="header" class="row header fixed">

  <!-- titlebar -->
	<div class="column titlebar big no-padding">
		<div id="logo" class="titlebar-center">
			<a href="#" title="확대보기">확대보기</a>
		</div>  
		<div class="titlebar-right">
		  <button class="menu-icon icon-close" type="button" onClick="selfclose();"></button>
		</div>
  </div>
  <!-- //titlebar -->

</div>
<!-- //header -->

<!-- container -->
<div class="container">
	<c:if test="${not empty carImageList}">
		<c:forEach var="carImg" items="${carImageList}">
			<div style="padding-bottom:10px;">
				<img src="${imagePath}/${carImg.imgName}" width="100%"  onError="this.src='/images/nophoto/nophoto_640x480.png';"/>
			</div>
		</c:forEach>
	</c:if>
</div>
<!-- //container -->

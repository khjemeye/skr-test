<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<script type="text/javascript">
var info_message = '<c:out value="${infoMsg}"/>';

if (info_message != '') {
    alert(info_message);
}
</script>


<script type="text/javascript">
var error_message = '<c:out value="${errorMsg}"/>';

if (error_message != '') {
    alert(error_message);
}
</script>

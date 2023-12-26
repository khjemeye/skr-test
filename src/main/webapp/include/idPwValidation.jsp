<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include/taglib_prefix.jsp"%>
<script>

    //var idVerification = false;
    //var pwdVerification = false;
    //var pwdChkVerification = false;

    $(document).ready(function() {

        $('#membId').focusout(function() {
            var membId = $('#membId').val();
            var regExp = /^[a-z0-9+]{6,12}$/;
            var chk = 0;

            if (membId == '' || membId.length == 0) {
                $('#membId').val('');

                $('.idOk').hide();
                $('.idErr').hide();

                $('#idVrfc').val('false');
                $('#idVrfc2').val('false');
                return;
            }

            $.ajax({

                url : '/login/validateMembId.do',
                type : 'post',
                data : {
                    membId : membId
                },
                dataType : 'json',
                success : function(data){

                    if(data.result == 'invalid') {
                        //검증 통과 못할시
                        $('.idOk').hide();
                        $('.idErr').hide();
                        $('.idErr2').show();

                        $('#idVrfc').val('true');
                        $('#idVrfc2').val('false');
                    } else if(data.result == 'valid') {

                        if(membId.search(/[0-9]/g) != -1) chk++;
                        if(membId.search(/[a-z]/ig) != -1) chk++;

                        if(!(regExp.test(membId) && chk >= 2)) {
                            $('.idOk').hide();
                            $('.idErr2').hide();
                            $('.idErr').show();

                            $('#idVrfc').val('false');
                            $('#idVrfc2').val('false');

                        } else {
                            $('.idErr').hide();
                            $('.idErr2').hide();
                            $('.idOk').show();

                            $('#idVrfc').val('true');
                            $('#idVrfc2').val('true');

                        }
                    } else {
                        alert("비정상적인 검증결과 발생. 관리자에게 문의해주세요.");
                    }
                },
                error : function() {
                    alert("error");
                }
            });
        });

        $('#membPwd').focusout(function() {

            var membPwd = $('#membPwd').val();

            //비밀번호 입력란을 비울경우 비밀번호 확인 입력란과 모든 에러메시지 숨기기
            if(membPwd == '' || membPwd.length == 0) {
                $('#membPwdChk').val("");

                $('.pwdOk').hide();
                $('.pwdErr').hide();
                $('.pwdChkErr').hide();

                $('#pwdVrfc').val('false');
                $('#pwdChkVrfc').val('false');

                return;
            }

            var regExpPw = /^[a-zA-Z0-9!@#$%^&*()?_~]{8,12}$/;
            var chk = 0;

            if(membPwd.search(/[0-9]/g) != -1) chk ++;
            if(membPwd.search(/[a-z]/g) != -1) chk ++;
            if(membPwd.search(/[A-Z]/g) != -1) chk ++;
            if(membPwd.search(/[!@#$%^&*()?_~]/g) != -1) chk ++;

            if(!(regExpPw.test(membPwd) && chk >= 2)) {

                $('.pwdOk').hide();
                $('.pwdErr').show();

                $('#pwdVrfc').val('false');
            } else {

                $('.pwdErr').hide();
                $('.pwdOk').show();
                $('#pwdVrfc').val('true');
            }
        });

        $('#membPwdChk').keyup(function() {

            var membPwd = $('#membPwd').val();
            var membPwdChk = $('#membPwdChk').val();

            if(membPwdChk == '') {
                $('.pwdChkErr').hide();
                $('#pwdChkVrfc').val('false');
                return;
            }

            if(membPwd != membPwdChk) {
                $('.pwdChkErr').show();
                $('#pwdChkVrfc').val('false');
                //pwdChkVerification = false;
            }
            else if(membPwd == membPwdChk) {
                $('.pwdChkErr').hide();
                $('#pwdChkVrfc').val('true');
                //pwdChkVerification = true;
            }
        });
    });
</script>
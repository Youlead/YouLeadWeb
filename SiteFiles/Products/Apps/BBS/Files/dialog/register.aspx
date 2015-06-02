<%@ Page Language="c#" Inherits="SiteServer.BBS.Pages.Dialog.Register" Trace="False" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<script src="../js/jquery-1.4.4.min.js" type="text/javascript"></script>
<script type="text/javascript" src="../js/jquery.form.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#a_forget').click(function(){
		var url = window.top.getDialogUrl('forget');
		return window.top.showDialog(url, 500, 620, '找回密码');
	});
});

function onRegisterSubmit(form) {
	$(form).ajaxSubmit({
		dataType: 'json',
		success: function(data) { 
			if (data.success == 'true'){
				alert(data.successMessage);
				window.top.location.reload(false);
			}else{
				alert(data.errorMessage);
			}
		}
	});
}

checkUserName = function(value)
{
	$("#username_msg").hide();
	$("#usernamevalid_msg_succ").hide();
	$("#usernamevalid_msg_error").hide();
	
	value = $('#userName').val();
	
	if ( !value || value.length == 0 )
	{
		$("#username_msg").html("用户名不能为空");
		$("#username_msg").show();
		return false;
	}
	
	if ( value.length < 2 )
	{
		$("#username_msg").html("用户名长度不能小于2个字符");
		$("#username_msg").show();
		return false;
	}

	return true;
}

checkUserNameValid = function()
{
	$("#username_msg").hide();
	$("#usernamevalid_msg_succ").hide();
	$("#usernamevalid_msg_error").hide();
	
	value = $('#userName').val();
	
	if (!checkUserName(value)) return;
	
	$.post("../ajax/config.aspx?publishmentSystemID=" + window.top.publishmentSystemID, { type: 'checkusername', value: escape(value) }, function(data) {
		if (data.success == 'true'){
			$("#usernamevalid_msg_succ").show();
			$("#usernamevalid_msg_error").hide();
		}else{
			$("#usernamevalid_msg_succ").hide()
			$("#usernamevalid_msg_error").show();
		}
	}, 'json');
}

checkEmail = function()
{
	$("#email_msg").hide();
	
	value = $('#email').val();
	
	if ( !value || value.length == 0 )
	{
		$('#email_msg').html('邮箱不能为空');
		$('#email_msg').show();
		return false;
	}
	
	if ( value.search(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/) == -1 )
	{
		$('#email_msg').html('请正确填写邮箱');
		$('#email_msg').show();
		return false;	
	}
	
	return true;
}

checkPassword = function()
{
	$('#password_msg').hide();

	var strPassword = $('#password').val();
	
	if ( !strPassword || strPassword.length == 0 )
	{
		$("#password_msg").html("密码不能为空");
		$("#password_msg").show();
		return false;
	}
	
	if ( strPassword.length < 6 || strPassword.length>20 )
	{
		$('#password_msg').html('密码长度小于6个或者大于20个字符');
		$('#password_msg').show();
		return false;
	}
	
	return true;
}

checkComfirmPassword = function()
{
	$('#comfirmPassword_msg').hide();
	
	var strPassword = $('#password').val();
	var confirmPassword = $('#comfirmPassword').val();
	
	if ( !confirmPassword || confirmPassword.length == 0 )
	{
		$("#comfirmPassword_msg").html("确认密码不能为空");
		$("#comfirmPassword_msg").show();
		return false;
	}
	
	else if ( strPassword != confirmPassword )
	{
		$('#comfirmPassword_msg').html("确认密码与密码不一致");
		$('#comfirmPassword_msg').show();
		return false;
	}
	
	return true;
}

checkVerify = function()
{
	$("#verifyCode_msg").hide();
	
	value = $('#verifyCode').val();
	
	if ( !value || value.length == 0 )
	{
		$("#verifyCode_msg").html("请填写验证码");
		$("#verifyCode_msg").show();
		return false;
	}

	return true;		
}

//检测所有
checkAll = function()
{
	var isOk = true;
	if (!checkUserName())
	{
		isOk = false;
	}
	if (!checkEmail())
	{
		isOk = false;
	}
	if (!checkPassword())
	{
		isOk = false;
	}
	if (!checkComfirmPassword())
	{
		isOk = false;
	}	
	if (!checkVerify())
	{
		isOk = false;
	}
	return isOk;
}
</script>
<link href="../css/share.css" rel="stylesheet" type="text/css">
<style media="screen" type="text/css">
.error { color:red; line-height:30px; text-align:center }
.succ { color:green; line-height:30px; text-align:center }
</style>
</head>
<body>
<div class="share_table">
<form id="registerForm" onsubmit="onRegisterSubmit(this);return false;" action="../ajax/form.aspx?publishmentSystemID=<%=Request.QueryString["publishmentSystemID"]%>&action=register" method="post">
        <div class="flow_tab_info">
          <ul>
            <li class="left_font">用户名：</li>
            <li>
              <input autocomplete="on" id="userName" name="userName" type="text" class="txt" onblur="checkUserName();" tabindex="10" />
            	<span class="flow_1font"><a href="javascript:void 0;" style="text-decoration:none" onclick="checkUserNameValid();" tabindex="-1">检测用户名是否可用</a></span>&nbsp;
            	<span id="username_msg" class="error" style="display:none"></span><span id="usernamevalid_msg_succ" class="succ" style="display:none"><br /><img src="../images/check_right.gif" width="13" height="13" /> 此用户未被使用，可以注册。</span>
                    <span id="usernamevalid_msg_error" class="error" style="display:none"><br /><img src="../images/check_error.gif" width="13" height="13" /> 对不起，此用户名不可用，请选择其他名字后再试。</span>
            </li>
          </ul>
          <ul>
            <li class="left_font">昵 称：</li>
            <li>
              <input autocomplete="on" id="displayName" name="displayName" type="text" class="txt"  tabindex="10" /></li>
          </ul>
          <ul>
            <li class="left_font">Email：</li>
            <li>
              <input autocomplete="on" id="email" name="email" type="text" class="txt" onblur="checkEmail();" tabindex="10" />&nbsp;<span id="email_msg" class="error" style="display:none"></span></li>
          </ul>
          <ul>
            <li class="left_font">密 码：</li>
            <li>
              <input name="password" id="password" maxlength="16" type="password" class="txt" onblur="checkPassword();" tabindex="11"/>&nbsp;<span id="password_msg" class="error" style="display:none"></span></li>
          </ul>
          <ul>
            <li class="left_font">确认密码：</li>
            <li>
              <input name="comfirmPassword" id="comfirmPassword" maxlength="16" type="password" class="txt" onblur="checkComfirmPassword();" tabindex="11"/>
              <span class="flow_1font">(再次输入密码)</span>&nbsp;<span id="comfirmPassword_msg" class="error" style="display:none"></span></li>
          </ul>
          <asp:PlaceHolder ID="phValidateCode" runat="server">
            <ul>
              <li class="left_font">验证码：</li>
              <li>
                <input autocomplete="off" id="verifyCode" name="verifyCode" type="text" style="ime-mode:disabled" class="txt" value="" onblur="checkVerify();" tabindex="12" maxLength="5"/>&nbsp;<span id="verifyCode_msg" class="error" style="display:none"></span></li>
            </ul>
          </asp:PlaceHolder>
          <ul>
            <li class="left_font">&nbsp;</li>
            <li>
              <div class="verify_text" id="verifytip">输入下图中的字符，不区分大小写</div>
            </li>
          </ul>
          <ul>
            <li class="left_font">&nbsp;</li>
            <li>
              <div class="pic" id="verifyshow">
                <asp:Literal ID="ltlValidateCode" runat="server"></asp:Literal>
              </div>
            </li>
          </ul>
          <br />
          <table border="0" width="500" cellspacing="2" cellpadding="2">
            <tr>
              <td width="200" align="right"><input name="input4" type="submit" class="regi_button" id="btn_forget" value="注册" onclick="return checkAll();" /></td>
              <td valign="middle"><a id="a_forget" href="javascript:;">忘记密码?</a></td>
            </tr>
          </table>
        </div>
      </form>
</div>
</body>
</html>
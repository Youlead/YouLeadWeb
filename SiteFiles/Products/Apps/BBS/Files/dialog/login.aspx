<%@ Page Language="c#" Inherits="SiteServer.BBS.Pages.Dialog.Login" Trace="False" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style type="text/css">
u { text-decoration:none; white-space:nowrap; }
* { font-family:Tahoma, Verdana, Arial, Helvetica, sans-serif; font-size:12px; }
body { margin:0; padding:0; }
form { margin:0; padding:0; }
img { border:0 none; }
a { text-decoration:none; }
em { font-style:normal; }
.clearer { clear:both; display:block; font-size:1px; height:1px; margin:0; padding:0; }
.signin { width:370px; margin:0 auto; float:none; padding:0; }
.signin .subcolumn01 .middle { float:left; width:306px; height:40px; }
.signin .subcolumn01 .middle span { line-height:40px; color:#000; font-weight:bold; font-size:14px; padding-left:4em; }
.signin .subcolumn02 { width:366px; overflow:hidden; zoom:1; width:366px; }
.signin .subcolumn02 .signin-area { padding:1px 17px; margin:0 0 0 40px; }
.signin .subcolumn02 .signin-area-bg { float:left; width:306px; }
.signin .subcolumn02 .signin-area-bg .padder { margin:8px 0 0; }
.signin .subcolumn02 .signin-area-bg .padder .sign-input { margin:10px 0 0 0; }
.signin .subcolumn02 .signin-area-bg .padder span.title { width:70px; text-align:right; margin-right:5px; -moz-user-select:none; -khtml-user-select:none; font-size:14px; }
.signin .subcolumn02 .signin-area-bg .padder span.input a { margin-left:7px; color:#3472a3; }
.signin .subcolumn02 .signin-area-bg .padder span.expand { padding-left:5.9em; -moz-user-select:none; -khtml-user-select:none; width:200px; }
*:lang(en) .signin .subcolumn02 .signin-area-bg .padder span.expand {
margin-left:-7px;
}
.signin .subcolumn02 .signin-area-bg .padder .input01 { width:170px; border:1px #6A9ED2 solid; color:#868686; font-size:14px; padding:2px; }
.signin .subcolumn02 .signin-area-bg .padder .validate { color:#808080; margin:0; }
.valcode .pic { padding:5px 0 0 60px; }
.valcode .pic img { width:130px; height:53px; }
.signin .subcolumn03 { clear:both; }
.signin .subcolumn03 .left { float:left; }
.signin .subcolumn03 .middle { float:left; }
.signin .subcolumn03 .middle .middle-padder { float:left; padding:10px 0 0 115px; }
.signin .subcolumn03 .middle .signin-btn { background:url(../images/btn-signin.gif); width:66px; height:28px; border:0; text-align:center; line-height:20px; color:#0C4E7C; cursor:pointer; }
.signin .subcolumn03 .right { float:left; }
.signin.yui-panel, .signin.yui-panel .hd, .signin.yui-panel .bd, .signin.yui-panel .ft { margin:0; padding:0; border:none; background:none; }
.signin.yui-panel .hd { font-weight:normal; }
.signin-area-bg .expand { display:block; width:16em; margin-left:55px; }
.middle-padder { width:238px; }
.middle-padder span { float:left; }
.valcode { padding:2px 0 0 0; }
.valcode a { color:#3472a3; }
.valcode .expand { padding:10px 0; float:left; }
.middle-padder .logins { width:80px; }
.middle-padder .safe { background:url(http://imgcache.qq.com/ptlogin/v3/style/4/images/topbg1.gif) no-repeat; background-position:left 13px; *background-position:left 11px;
_background-position:left 13px; width:130px; height:38px; line-height:38px; padding-left:16px; color:#868686; }
.bottom-padder { clear:both; border-top:1px solid #D2E5EF; text-align:center; padding:6px 0; width:366px; }
.bottom-padder a { color:#3472A3; margin:10px; }
.verify_text { padding:3px 0 0 60px; }
.err_m { display:none; color:#f00; }
.main { background-color:#ffffff; }
</style>
<title></title>
<script src="../js/jquery-1.4.4.min.js" type="text/javascript"></script>
<script type="text/javascript" src="../js/jquery.form.js"></script>
<script type="text/javascript" src="../js/bbs.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$('#userName').focus(function(){
		if(this.value == '用户名') this.value = '';
	}).blur(function(){
		if(this.value == '') this.value = '用户名';
	});
	
	$('#a_register').click(function(){
    var url = window.top.getDialogUrl('register');
		return window.top.showDialog(url, 500, 620, '用户注册');
	});
	
	$('#a_forget').click(function(){
    var url = window.top.getDialogUrl('forget');
		return window.top.showDialog(url, 500, 620, '找回密码');
	});
	
});

function onLoginSubmit(form) {
	$(form).ajaxSubmit({
		dataType: 'json',
		success: function(data) { 
			if (data.success == 'true'){
				
				if (data.isSSO == 'true') {
					var urlList = data.ssoUrls.split(',');
					if (urlList.length > 0) {
						window.urlCount = urlList.length;
						for (var i = 0; i < urlList.length; i++) {
							loadScript(urlList[i], function () {
								if (!window.urlLoad) window.urlLoad = 0;
								if (++window.urlLoad == window.urlCount) {
									window.top.location.reload(false);
								}
							});
						}
					} else {
						window.top.location.reload(false);
					}
				}
				else {
					window.top.location.reload(false);
				}
			}else{
				alert(data.errorMessage);
			}
		}
	});
}
</script>
</head>
<body>
<div class="signin" id="login">
  <form id="loginForm" onsubmit="onLoginSubmit(this);return false;" action="../ajax/form.aspx?publishmentSystemID=<%=Request.QueryString["publishmentSystemID"]%>&action=login" method="post"> 
    <div class="subcolumn01"> </div>
    <div class="subcolumn02">
    <div class="banner"> </div>
    <div class="signin-area">
      <div class="signin-area-bg">
        <div class="padder">
          <div id="err_m" class="err_m"></div>
          <div class="sign-input"><span class="title">帐　号：</span><span class="input">
            <input autocomplete="on" id="userName" name="userName" type="text"   class="input01"  tabindex="1" value="用户名" />
            </span></div>
          <div class="sign-input"><span class="title">密　码：</span><span class="input">
            <input name="password" id="password" maxlength="16"  type="password" class="input01" tabindex="2"/>
            </span></div>
          <div class="clearer"></div>
          <asp:PlaceHolder ID="phValidateCode" runat="server">
          <div id="verifyinput" class="valcode">
            <div class="sign-input"><span class="title">验证码：</span><span class="input">
              <input autocomplete="off" id="verifyCode" name="verifyCode" type="text" style="ime-mode:disabled" class="input01 validate" value="" tabindex="3" maxLength="5"/>
              </span></div>
            <div class="verify_text" id="verifytip">输入下图中的字符，不区分大小写</div>
            <div class="pic" id="verifyshow"> <asp:Literal ID="ltlValidateCode" runat="server"></asp:Literal> </div>
          </div>
          </asp:PlaceHolder>
        </div>
        <span class="input expand">
        <input type="checkbox" id="isHide" name="isHide" value="true" tabindex="4"/>
        <label for="isHide">隐身登录</label>
        <input type="checkbox" id="persistent" name="persistent" value="true" tabindex="5" />
        <label for="persistent">记住帐号</label>
        </span> </div>
    </div>
    <div class="clearer"></div>
    </div>
    <div class="subcolumn03">
    <div class="left">
      <div class="middle">
        <div class="middle-padder">
          <div class="logins">
            <input type="submit" class="signin-btn" src="../images/btn-signin.gif" value="" tabindex="5" />
          </div><br />

        </div>
      </div>
      <div class="right"> </div>
      <div class="bottom-padder">
        <a id="a_forget" href="javascript:void(0);">忘记密码？</a>
        <asp:PlaceHolder id="phIsRegisterAllowed" runat="server">
          <a id="a_register" href="javascript:void(0);">注册成为会员</a>
        </asp:PlaceHolder>
      </div>
    </div>
    </div>
  </form>
</div>
</body>
</html>
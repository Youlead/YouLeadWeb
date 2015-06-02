<%@ Page language="c#" Inherits="SiteServer.BBS.Pages.LoginPage" EnableViewState="false" %>
<%@ Register TagPrefix="bairong" Namespace="BaiRong.Controls" Assembly="BaiRong.Controls" %>
<%@ Import namespace="SiteServer.BBS.Core" %>
<%@ Import namespace="SiteServer.BBS.Model" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>{bbs.BBSName}</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=8" />
<link href="css/share.css" rel="stylesheet" type="text/css"/>
<link href="css/theme.css" rel="stylesheet" type="text/css"/>
<bbs:include file="include/css_js.html"></bbs:include>
<bairong:Code type="JQuery" runat="server" />
<script src="/BBS/js/jquery.form.js" type="text/javascript"></script>
<script type="text/javascript" language="javascript">
    $(document).ready(function () {
        $('#aRegister').click(function () {
            return showDialog(bbsUrl + '/dialog/register.aspx', 500, 620, '用户注册');
        });
        $('#aForget').click(function () {
            return showDialog(bbsUrl + '/dialog/forget.aspx', 350, 520, '找回密码');
        });
    });
</script>
</head>
<body>
<bbs:include file="include/header.html"></bbs:include>
<div class="hd">
  <div id="ad_navbanner" class="adv_area"></div>
</div>
<div class="hd">
  <div class="share_position"> <bbs:include file="include/shareRight.html"></bbs:include>
    <div class="share_p"><img src="images/ico_position.gif" /><a href="/BBS/">论坛</a>><a href="login.aspx">登录</a></div>
  </div>
  <div class="share_area">
    <div class="share_tit">
      <h3><a href="login.aspx">登录</a></h3>
    </div>
    <div class="share_table">
      <form id="loginForm" onsubmit="onLoginPageSubmit(this, '<%=base.returnUrl%>');return false;" action="{bbs.formUrl}login" method="post">
        <div class="flow_tab_info">
        <asp:Literal ID="ltlTips" runat="server"></asp:Literal>
          <ul>
            <li class="left_font">账 号：</li>
            <li>
              <input autocomplete="on" id="userName" name="userName" type="text" class="txt"  tabindex="10" /><span class="flow_1font">(用户名)</span></li>
          </ul>
          <ul>
            <li class="left_font">密 码：</li>
            <li>
              <input name="password" id="password" maxlength="16" type="password" class="txt" tabindex="11"/>
              <span class="flow_1font">
              <a id="aForget" href="javascript:void(0);">找回密码</a>
              </span></li>
          </ul>
          <asp:PlaceHolder ID="phValidateCode" runat="server">
            <ul>
              <li class="left_font">验证码：</li>
              <li>
                <input autocomplete="off" id="verifyCode" name="verifyCode" type="text" style="ime-mode:disabled" class="txt" value="" tabindex="12" maxLength="5"/>
                &nbsp; </li>
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
          <ul>
            <li class="left_font">&nbsp;</li>
            <li> <span class="input expand">
            <input type="checkbox" id="isHide" name="isHide" value="true" tabindex="13"/>
            <label for="isHide">隐身登录</label>
            <input type="checkbox" id="persistent" name="persistent" value="true" tabindex="14" />
            <label for="persistent">记住帐号</label>
              </span> </li>
          </ul>
          <table border="0" cellspacing="2" cellpadding="2">
            <tr>
              <td width="30">&nbsp;</td>
              <td width="100" align="right" valign="middle"><input name="input4" type="submit" class="regi_button" value="登录" /></td>
              <td valign="middle">
                <bbs:run class="base" if="IsRegisterAllowed">
                    <a id="aRegister" class="red14" href="javascript:void(0);">注册成为会员</a>
                </bbs:run>
              </td>
            </tr>
          </table>
        </div>
      </form>
    </div>
  </div>
</div>
<bbs:include file="include/footer.html"></bbs:include>
<bbs:include file="include/dialog.html"></bbs:include>
</body>
</html>

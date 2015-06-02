<%@ Page language="c#" Inherits="SiteServer.BBS.Pages.AccessPage" EnableViewState="false" %>
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
</head>
<body>
<bbs:include file="include/header.html"></bbs:include>
<div class="hd">
  <div id="ad_navbanner" class="adv_area"></div>
</div>
<div class="hd">
  <div class="share_position"> <bbs:include file="include/shareRight.html"></bbs:include>
    <div class="share_p"><img src="images/ico_position.gif" /><a href="#">论坛</a>><a href="#">访问权限</a></div>
  </div>
  <div class="share_area">
    <div class="share_tit">
      <h3><a href="#">访问权限</a></h3>
    </div>
    <div class="share_table">
      <form runat="server">
        <div class="flow_tab_info">
        <div class="tips">本版块需要密码，你必须在下面输入正确的密码才能浏览这个版块。</div>
        <ul>
            <li class="left_font">密 码：</li>
            <li>
              <asp:TextBox class="txt" id="txtPassword" runat="server" TextMode="Password"/>&nbsp;
            </li>
          </ul>
          <table border="0" cellspacing="2" cellpadding="2">
            <tr>
              <td width="30">&nbsp;</td>
              <td width="100" align="right" valign="middle"><asp:Button CssClass="regi_button" Text="提交" runat="server" OnClick="Submit_OnClick"></asp:Button></td>
              <td valign="middle">&nbsp;</td>
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

<%@ Page language="c#" Inherits="SiteServer.BBS.Pages.UserPage" EnableViewState="false" %>
<%@ Import namespace="SiteServer.BBS.Core" %>
<%@ Import namespace="SiteServer.BBS.Model" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>{bbs.BBSName}</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=8" />
<link href="css/share.css" rel="stylesheet" type="text/css">
<link href="css/theme.css" rel="stylesheet" type="text/css">
<bbs:include file="include/css_js.html"></bbs:include>
</head>
<body>
<bbs:include file="include/header.html"></bbs:include>
<div class="hd">
  <div id="ad_navbanner" class="adv_area"></div>
</div>
<div class="hd">
  <div class="share_position">
    <bbs:include file="include/shareRight.html"></bbs:include>
    <div class="share_p"><img src="images/ico_position.gif" /><a href="#">论坛</a>><a href="#">好友</a></div>
  </div>
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td width="21%" valign="top" style="padding-right:10px"><div id="sj1">
          <div id="sj_1">
            <table width="100%" border="0" cellspacing="0" cellpadding="0" height="31">
              <tr>
                <td width="1%"><img src="images/qweqw_03.png" width="6" height="31"  border="0"/></td>
                <td width="98%"><div id="s_bj">好友</div></td>
                <td width="1%" align="right"><img src="images/qweqw_07.png" width="5" height="31"  border="0"/></td>
              </tr>
            </table>
          </div>
          <div id="sj_2">
            <ul>
              <li><a href="online.aspx">在线成员</a></li>
              <li><a class="select" href="userlist.aspx">用户列表</a></li>
            </ul>
          </div>
          <div id="sj_3">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="1%"><img src="images/edit_06.png"  border="0"/></td>
                <td width="98%" style="background-image:url(images/edit_08.png); background-repeat:repeat-x; height:9px;"></td>
                <td width="1%"><img src="images/edit_10.png"  border="0"/></td>
              </tr>
            </table>
          </div>
        </div></td>
      <td width="79%" valign="top"><div class="share_area">
          <div class="share_tit">
            <h3>用户资料</h3>
          </div>
          <div class="share_table">
      <div class="flow_tab_info">
        <ul>
          <li class="left_font">账 号：</li>
          <li>
            <asp:Literal ID="ltlUserName" runat="server"></asp:Literal>
          </li>
        </ul>
        <ul>
          <li class="left_font">昵 称：</li>
          <li>
            <asp:Literal ID="ltlDisplayName" runat="server"></asp:Literal>
        </ul>
        <ul>
          <li class="left_font">头 像：</li>
          <li>
            <asp:Literal ID="ltlAvatar" runat="server"></asp:Literal>
          </li>
        </ul>
        <ul>
          <li class="left_font">签 名：</li>
          <li>
            <asp:Literal ID="ltlSignature" runat="server"></asp:Literal>
          </li>
        </ul>
      </div>
    </div>
        </div></td>
    </tr>
  </table>
</div>
<bbs:include file="include/footer.html"></bbs:include>
<bbs:include file="include/dialog.html"></bbs:include>
</body>
</html>

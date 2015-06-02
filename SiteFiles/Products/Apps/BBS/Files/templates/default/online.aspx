<%@ Page language="c#" Inherits="SiteServer.BBS.Pages.OnlinePage" EnableViewState="false" %>
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
<style type="text/css">
.avator img { width: 48px; height: 48px; padding: 2px; border-top-color: #f2f2f2; border-right-color: #cdcdcd; border-bottom-color: #cdcdcd; border-left-color: #f2f2f2; border-width: 1px; border-style: solid; }
.user { margin-top: 0px; margin-right: -4px; margin-bottom: 10px; margin-left: -2px; }
.user li { width: 155px; height: 58px; overflow: hidden; padding-top: 10px; padding-right: 10px; padding-bottom: 10px; padding-left: 70px; margin-top: 10px; margin-right: 5px; margin-bottom: 0px; margin-left: 5px; border-color: #f3f3f3; border-width: 1px; border-style: solid; float: left; background-color: rgb(249, 249, 249); }
.user H4 { font-size: 1em; line-height:1.5; height: 20px; overflow: hidden; }
.user .avator { margin-left: -60px; position: absolute; }
.adduser { padding-left: 20px; background-image: url("images/adduser.gif"); background-attachment: scroll; background-repeat: no-repeat; background-position-x: 0px; background-position-y: 50%; background-color: transparent; }
.cl:after { height: 0px; clear: both; display: block; visibility: hidden; content: "."; }
.cl { zoom: 1; }
.user .maxh { overflow: hidden; line-height:1.5; }
.xg1 { color: #999; line-height:1.5; }
.xg1 a { color: #999; }
</style>
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
              <li><a class="select" href="online.aspx">在线成员</a></li>
              <li><a href="userlist.aspx">用户列表</a></li>
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
            <h3>在线成员</h3>
          </div>
          <div class="share_table" style="padding:0; margin:0; padding-left:5px;">
            <form runat="server" style="padding:0; margin:0;">
              <ul class="user cl">
                <asp:repeater ID="rptUsers" runat="server">
                  <itemtemplate>
                    <li>
                      <div class="avator">
                        <asp:Literal ID="ltlAvator" runat="server"></asp:Literal>
                      </div>
                      <h4>
                        <asp:Literal ID="ltlUserName" runat="server"></asp:Literal>
                      </h4>
                      <P class="maxh"><asp:Literal ID="ltlSignature" runat="server"></asp:Literal></P>
                      <div class=xg1><!--<a title="加为好友" class="adduser">加为好友</a>--><asp:Literal ID="ltlAddon" runat="server"></asp:Literal></div>
                    </li>
                  </itemtemplate>
                </asp:repeater>
              </ul>
            </form>
          </div>
        </div></td>
    </tr>
  </table>
</div>
<bbs:include file="include/footer.html"></bbs:include>
<bbs:include file="include/dialog.html"></bbs:include>
</body>
</html>

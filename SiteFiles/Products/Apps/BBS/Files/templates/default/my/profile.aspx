<%@ Page language="c#" Inherits="SiteServer.BBS.Pages.ProfilePage" %>
<%@ Import namespace="SiteServer.BBS.Core" %>
<%@ Import namespace="SiteServer.BBS.Model" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>{bbs.BBSName}</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=8" />
<link href="../css/share.css" rel="stylesheet" type="text/css">
<link href="../css/theme.css" rel="stylesheet" type="text/css">
<bbs:include file="include/css_js.html"></bbs:include>
<script type="text/javascript" language="javascript" src="../js/jquery.idTabs.min.js"></script>
</head>
<body>
<bbs:include file="include/header.html"></bbs:include>
<div class="hd">
  <div id="ad_navbanner" class="adv_area"></div>
</div>
<div class="hd">
  <div class="share_position"> <bbs:include file="include/shareRight.html"></bbs:include>
    <div class="share_p"><img src="../images/ico_position.gif" /><a href="#">论坛</a>><a href="#">设置中心</a></div>
  </div>
  
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td width="21%" valign="top" style="padding-right:10px"><div id="sj1">
          <div id="sj_1">
            <table width="100%" border="0" cellspacing="0" cellpadding="0" height="31">
              <tr>
                <td width="1%"><img src="../images/qweqw_03.png" width="6" height="31"  border="0"/></td>
                <td width="98%"><div id="s_bj">设置中心</div></td>
                <td width="1%" align="right"><img src="../images/qweqw_07.png" width="5" height="31"  border="0"/></td>
              </tr>
            </table>
          </div>
          <div id="sj_2">
            <ul>
              <li><a href="avatar.aspx">修改头像</a></li>
              <li><a class="select" href="profile.aspx">个人资料</a></li>
              <li><a href="credits.aspx">积分</a></li>
              <li><a href="password.aspx">密码安全</a></li>
              <li><a href="permission.aspx">用户权限</a></li>
            </ul>
          </div>
          <div id="sj_3">
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="1%"><img src="../images/edit_06.png"  border="0"/></td>
    <td width="98%" style="background-image:url(../images/edit_08.png); background-repeat:repeat-x; height:9px;"></td>
    <td width="1%"><img src="../images/edit_10.png"  border="0"/></td>
  </tr>
</table>

          </div>
        </div></td>
      <td width="79%"><div class="share_area">
          <div class="share_tit">
            <h3>个人资料</h3>
          </div>
          <div class="share_table">          
          
          <div id="tabs">
          
          <ul class="tab cl">
                <li>
                <a class="selected" href="#tab1">基本资料</a> 
                </li>
                <!--<li>
                <a href="#tab2">积分记录</a> 
                </li>
                <li>
                <a href="#tab3">积分规则</a> 
                </li>-->
            </ul>
          
             <div class="tabContent" id="tab1"></div>       </div>  <script type="text/javascript">   $("#tabs ul").idTabs(); </script>
          
            <form runat="server">
            <div class="flow_tab_info">
              <!--<h2>修改密码</h2>
              <p>你必须填写原密码才能修改下面的资料。 </p>-->
              <p>&nbsp;</p>
              <table width="90%">
                <tr>
                  <td width="120">帖子签名：</td>
                  <td><asp:TextBox class="txt" style="width:320px;height:60px;" ID="Signature" runat="server" TextMode="MultiLine"></asp:TextBox>
                  </td>
                </tr>
                <tr>
                  <td colspan="2" height="30" align="center"><asp:Button type="button" class="regi_button" OnClick="Submit_Click" runat="server" Text="保 存"  /></td>
                </tr>
              </table>
            </div>
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
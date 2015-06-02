<%@ Page language="c#" Inherits="SiteServer.BBS.Pages.PasswordPage" EnableViewState="false" %>
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
              <li><a href="profile.aspx">个人资料</a></li>
              <li><a href="credits.aspx">积分</a></li>
              <li><a class="select" href="password.aspx">密码安全</a></li>
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
            <h3>密码安全</h3>
          </div>
          <div class="share_table">
          <script type="text/javascript" language="javascript">
	function upload_submit_form()
	{
		document.forms[0].encType="multipart/form-data";
		document.forms[0].submit();
		return true;
	}
	function _showImage(oInput)
	{
		var disp = 0;
		var s = oInput.value;
		var ext;
		if (s.length<5)
			return;
		ext = s.substr(s.length-3,3).toLowerCase();
		if (ext=="jpg" || ext=="jpeg" || ext=="gif" || ext=="bmp" || ext=="png")
		{
			document.getElementById('Preview').src = s;
		}
	}
	</script>
            <form runat="server">
            <div class="flow_tab_info">
              <h2>修改密码</h2>
<p>你必须填写原密码才能修改下面的资料。
</p>
              <p>&nbsp;</p>
              <table width="400">
                <tr>
                  <td width="30%">管理员登录名：</td>
                  <td width="70%"><asp:literal ID="UserName" runat="server"></asp:literal></td>
                </tr>
                <tr>
                  <td width="30%">当前密码：</td>
                  <td><asp:TextBox class="txt" ID="CurrentPassword" runat="server" MaxLength="50" Size="20" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ControlToValidate="CurrentPassword" ErrorMessage=" *" Display="Dynamic" runat="server" /></td>
                </tr>
                <tr>
                  <td width="30%">新密码：</td>
                  <td><asp:TextBox class="txt" ID="NewPassword" runat="server" MaxLength="50" Size="20" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ControlToValidate="NewPassword" ErrorMessage=" *" Display="Dynamic" runat="server" /></td>
                </tr>
                <tr>
                  <td width="30%">重复输入新密码：</td>
                  <td><asp:TextBox class="txt" ID="ConfirmNewPassword" runat="server" TextMode="Password" MaxLength="50" Size="20"></asp:TextBox>
                    <asp:RequiredFieldValidator ControlToValidate="ConfirmNewPassword" ErrorMessage=" *" Display="Dynamic" runat="server" /></td>
                </tr>
                <tr>
                  <td align="center" colspan="2"><asp:CompareValidator ID="NewPasswordCompare" runat="server" ControlToCompare="NewPassword"
				ControlToValidate="ConfirmNewPassword" Display="Dynamic" ErrorMessage="两次输入的新密码不一致！请再输入一遍您上面填写的新密码。"></asp:CompareValidator></td>
                </tr>
                <tr>
                  <td colspan="2" height="30" align="center">
                  <asp:Button type="button" class="regi_button" OnClick="Submit_Click" runat="server" Text="修 改"  /></td>
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

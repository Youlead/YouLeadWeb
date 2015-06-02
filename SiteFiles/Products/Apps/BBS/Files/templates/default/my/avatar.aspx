<%@ Page language="c#" Inherits="SiteServer.BBS.Pages.AvatarPage" EnableViewState="false" %>
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
              <li><a class="select" href="avatar.aspx">修改头像</a></li>
              <li><a href="profile.aspx">个人资料</a></li>
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
            <h3>修改头像</h3>
          </div>
          <div class="share_table">
          <script type="text/javascript" language="javascript">
	function upload_submit_form()
	{
		document.forms["avatarForm"].encType="multipart/form-data";
		document.forms["avatarForm"].submit();
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
            <form id="avatarForm" runat="server">
            <div class="flow_tab_info">
              <h2>请选择您喜欢的图片作为头像图片(支持jpg,gif,png格式):</h2>
              <p>&nbsp;</p>
              <dl>
                <dd>
                  <table border="0" cellpadding="2" cellspacing="2" style="width:300px">
                    <tr>
                      <td><input type="file" class="inputFile" id="hifFile" runat="server" /></td>
                      <td align="left" style="width:20px"><input name="input4" style="cursor:pointer; margin-left:10px" type="button" class="regi_button" value="上传" onClick="upload_submit_form();" /></td>
                    </tr>
                  </table>
                </dd>
              </dl>
              <p>&nbsp;</p>
              <h2>当前我的头像</h2>
<p>
                如果你还没有设置自己的头像，系统会显示为默认头像，你需要自己上传一张新照片来作为自己的个人头像。
</p>
              <p>&nbsp;</p>
              <table border="0" style="width:400px;" cellspacing="2" cellpadding="2">
                <tr>
                  <td><img src="<%=UserUtils.GetUserAvatarLargeUrl(UserUtils.UserName)%>" width="180" height="180" /></td>
                  <td><img src="<%=UserUtils.GetUserAvatarMiddleUrl(UserUtils.UserName)%>" width="120" height="120" /></td>
                  <td><img src="<%=UserUtils.GetUserAvatarSmallUrl(UserUtils.UserName)%>" width="48" height="48" /></td>
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

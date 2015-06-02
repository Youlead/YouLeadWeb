<%@ Page Language="C#" Inherits="SiteServer.BBS.Pages.RegisterSucess" %>
<%@ Register TagPrefix="bairong" Namespace="BaiRong.Controls" Assembly="BaiRong.Controls" %>
<%@ Import namespace="SiteServer.BBS.Core" %>
<%@ Import namespace="SiteServer.BBS.Model" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>{bbs.BBSName}</title>
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=8" />
<link href="css/share.css" rel="stylesheet" type="text/css"/>
<link href="css/theme.css" rel="stylesheet" type="text/css"/>
<bbs:include file="include/css_js.html"></bbs:include>
<bairong:Code ID="Code1" type="JQuery" runat="server" />

</head>
<body>
<bbs:include file="include/header.html"></bbs:include>
<div class="hd">
  <div id="ad_navbanner" class="adv_area"></div>
</div>
<div class="hd">
<div class="share_position"> <bbs:include file="include/shareRight.html"></bbs:include>
    <div class="share_p"><img src="images/ico_position.gif" /><a href="/BBS/">论坛</a>><a href="login.aspx">注册成功</a></div>
  </div>
 <div class="share_area">
    <div class="share_tit">
      <h3><a href="login.aspx">注册</a></h3>
    </div>
    <div class="share_table" style="line-height:300px; text-align:center;font-size:16px">
        <img src="{bbs.bbsUrl}/images/success.gif" /> 恭喜您已经注册成功.<a id="a_Login" class="register" href="{bbs.bbsUrl}" style="color:#1B5299">返回</a>
    </div>
  </div>
  </div>
<bbs:include file="include/footer.html"></bbs:include>
<bbs:include file="include/dialog.html"></bbs:include>
</body>
</html>

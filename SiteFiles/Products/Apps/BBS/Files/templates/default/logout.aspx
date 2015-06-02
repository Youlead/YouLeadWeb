<%@ Page language="c#" Inherits="SiteServer.BBS.Pages.LogoutPage" EnableViewState="false" %>
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
$(function() {
	if (window.top != self){
		window.top.location = self.location;
	}
	
	var url = '{bbs.formUrl}logout';
	window.returnUrl = '<%=GetReturnUrl()%>';
	$.post(url, null, function(json){
		if ('string' == typeof json) {
			json = eval('(' + json + ')');
		}
		if (json.isSSO == 'true'){
			var urlList = json.ssoUrls.split(',');
			if (urlList.length > 0){
				window.urlCount = urlList.length;
				for( var i = 0; i < urlList.length; i ++ ){
					loadScript(urlList[i],function(){
						if (!window.urlLoad) window.urlLoad = 0;
						if (++window.urlLoad == window.urlCount){
							window.location.href = window.returnUrl;
						}
					});
				}
			}else{
				window.location.href = window.returnUrl;
			}
		}
		else{
			window.location.href = window.returnUrl;
		}
	})
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
    <div class="share_p"><img src="images/ico_position.gif" /><a href="/BBS/">论坛</a>><a href="login.aspx">退出登录</a></div>
  </div>
  <div class="share_area">
    <div class="share_tit">
      <h3><a href="login.aspx">退出登录</a></h3>
    </div>
    <div class="share_table">
      <p id="logout" style="padding:10px;">&nbsp;&nbsp;系统正在退出,请稍后...</p>
    </div>
  </div>
</div>
<bbs:include file="include/footer.html"></bbs:include>
<bbs:include file="include/dialog.html"></bbs:include>
</body>
</html>

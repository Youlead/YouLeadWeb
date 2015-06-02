<%@ Page Language="c#" Inherits="BaiRong.BackgroundPages.FrameworkLoading" Trace="False"%>
<%@ Register TagPrefix="bairong" Namespace="BaiRong.Controls" Assembly="BaiRong.Controls" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>载入程序</title>
<link rel="stylesheet" href="inc/style.css" type="text/css" />
<bairong:custom type="style" runat="server"></bairong:custom>
<bairong:Code type="jQuery" runat="server" />
<bairong:Code type="html5shiv" runat="server" />
</head>
<body>
<table width="100%" height="380" border="0" cellpadding="4" cellspacing="0">
  <tr>
    <td class="center" valign="middle">
	   <img src="pic/loading.gif" />
        <br />
        <span style="margin-top:10px;">载入中，请稍候...</span>
    </td>
  </tr>
</table>
</body>
</html>
<script language="javascript">
$(function(){
  var url = "<%=GetRedirectUrl()%>";
  if (url && url.length > 0){
    setTimeout(function(){location.href = url;},200);
  }
});
</script>
<!-- check for 3.6 html permissions -->
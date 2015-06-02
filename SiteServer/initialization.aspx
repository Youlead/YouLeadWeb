<%@ Page Language="c#" Inherits="BaiRong.BackgroundPages.FrameworkInitialization" Trace="False"%>
<%@ Register TagPrefix="bairong" Namespace="BaiRong.Controls" Assembly="BaiRong.Controls" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>系统初始化...</title>
<bairong:Code type="JQuery" runat="server" />
<bairong:Code type="bootstrap" runat="server" />
<bairong:Code type="html5shiv" runat="server" />
<link rel="stylesheet" href="inc/style.css" type="text/css" />
<script language="JavaScript">
if (window.top != self){
	window.top.location = self.location;
}
</script>
<style type="text/css">
.well img{
  padding-bottom: 10px;
}
</style>
</head>

<body>
<form class="form-inline" runat="server">
  <asp:Literal id="ltlBreadCrumb" runat="server" />
  <bairong:alerts runat="server" />

  <div class="well" style="margin-top:20px;">
    <table class="table table-noborder">
      <tr>
        <td class="center">
          <asp:Literal ID="ltlContent" runat="server"></asp:Literal>
        </td>
      </tr>
    </table>
  </div>

</form>
</body>
</html>
<!-- check for 3.6 html permissions -->
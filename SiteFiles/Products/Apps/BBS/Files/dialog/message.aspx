<%@ Page Language="c#" Inherits="SiteServer.BBS.Pages.Dialog.Message" Trace="False" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
</head>
<body>
<style>
.message { padding-bottom: 6px; line-height: 160%; min-height: 40px; padding-left: 58px; padding-right: 0px; background: url(../images/success.gif) no-repeat 8px 8px; height: auto !important; font-size: 14px; padding-top: 3px; }
.success { background-image: url(../images/success.gif); }
.failure { background-image: url(../images/failure.gif); }
.info { background-image: url(../images/info.gif); }
</style>
<div class="message <%=MessageType%>">
  <p>
    <asp:Literal ID="ltlMessage" runat="server"></asp:Literal>
  </p>
</div>
</body>
</html>
<%@ Page Language="C#" validateRequest="false" Inherits="SiteServer.WeiXin.BackgroundPages.Modal.KeywordPreview" Trace="false"%>

<%@ Register TagPrefix="bairong" Namespace="BaiRong.Controls" Assembly="BaiRong.Controls" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<!--#include file="../inc/header.aspx"-->
</head>

<body>
<!--#include file="../inc/openWindow.html"-->
<form class="form-inline" runat="server">
<asp:Button id="btnSubmit" useSubmitBehavior="false" OnClick="Submit_OnClick" runat="server" style="display:none" />
<bairong:alerts runat="server"></bairong:alerts>

  <table class="table table-noborder table-hover">
    <tr>
      <td class="center"><h5>请输入微信号，此图文消息将发送至该微信号预览：</h5></td>
    </tr>
    <tr>
      <td class="center">
        <asp:TextBox id="tbWeiXin" runat="server" />
        <asp:RequiredFieldValidator ControlToValidate="tbWeiXin" errorMessage=" *" foreColor="red" display="Dynamic" runat="server" />
      </td>
    </tr>
  </table>

</form>
</body>
</html>
<!-- check for 3.6 html permissions -->
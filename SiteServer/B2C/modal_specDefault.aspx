<%@ Page Language="C#" Inherits="SiteServer.B2C.BackgroundPages.Modal.SpecDefault" Trace="false"%>

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
      <td width="120">规格名称：</td>
      <td><asp:Literal ID="ltlSpec" runat="server"></asp:Literal></td>
    </tr>
    <tr>
      <td>默认选择：</td>
      <td><asp:CheckBoxList ID="cblDefault" class="checkboxlist" repeatDirection="Horizontal" repeatColumns="3" runat="server"></asp:CheckBoxList></td>
    </tr>
  </table>

</form>
</body>
</html>
<!-- check for 3.6.4 html permissions -->
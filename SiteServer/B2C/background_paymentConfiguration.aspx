<%@ Page Language="C#" Inherits="SiteServer.B2C.BackgroundPages.BackgroundPaymentConfiguration" %>

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
  <asp:Literal id="ltlBreadCrumb" runat="server" />
  <bairong:alerts runat="server" />

  <div class="popover popover-static">
  <h3 class="popover-title">配置支付方式</h3>
  <div class="popover-content">
    
    <table class="table noborder table-hover">
      <tr>
        <td width="180">支付方式名称：</td>
        <td>
          <asp:TextBox id="tbPaymentName" runat="server" />
          <asp:RequiredFieldValidator ControlToValidate="tbPaymentName" errorMessage=" *" foreColor="red" display="Dynamic" runat="server" />
          <asp:RegularExpressionValidator runat="server" ControlToValidate="tbPaymentName" ValidationExpression="[^']+" errorMessage=" *" foreColor="red" display="Dynamic" />
        </td>
      </tr>
      <tr>
        <td>类型：</td>
        <td>
          <asp:Literal id="ltlPaymentType" runat="server" />
        </td>
      </tr>
      <asp:PlaceHolder id="phAlipay" visible="false" runat="server">
          <tr>
            <td>支付宝账户：</td>
            <td>
              <asp:TextBox id="tbAlipaySellerEmail" runat="server" />
              <asp:RequiredFieldValidator ControlToValidate="tbAlipaySellerEmail" errorMessage=" *" foreColor="red" display="Dynamic" runat="server" />
              <asp:RegularExpressionValidator runat="server" ControlToValidate="tbAlipaySellerEmail" ValidationExpression="[^']+" errorMessage=" *" foreColor="red" display="Dynamic" />
            </td>
          </tr>
          <tr>
            <td>合作者身份（PID）：</td>
            <td>
              <asp:TextBox id="tbAlipayPartner" runat="server" />
              <asp:RequiredFieldValidator ControlToValidate="tbAlipayPartner" errorMessage=" *" foreColor="red" display="Dynamic" runat="server" />
              <asp:RegularExpressionValidator runat="server" ControlToValidate="tbAlipayPartner" ValidationExpression="[^']+" errorMessage=" *" foreColor="red" display="Dynamic" />
            </td>
          </tr>
          <tr>
            <td>安全校验码（Key）：</td>
            <td>
              <asp:TextBox id="tbAlipayKey" runat="server" />
              <asp:RequiredFieldValidator ControlToValidate="tbAlipayKey" errorMessage=" *" foreColor="red" display="Dynamic" runat="server" />
              <asp:RegularExpressionValidator runat="server" ControlToValidate="tbAlipayKey" ValidationExpression="[^']+" errorMessage=" *" foreColor="red" display="Dynamic" />
            </td>
          </tr>
          <tr>
            <td>选择接口类型：</td>
            <td>
              <asp:DropDownList id="ddlAlipayType" runat="server"></asp:DropDownList>
            </td>
          </tr>
      </asp:PlaceHolder>
      <tr>
        <td>支付方式描述：</td>
        <td>
          <bairong:BREditor id="breDescription" runat="server"></bairong:BREditor>
        </td>
      </tr>
    </table>
  
    <hr />
    <table class="table noborder">
      <tr>
        <td class="center">
          <asp:Button class="btn btn-primary" id="Submit" text="确 定" onclick="Submit_OnClick" runat="server" />
          <input type="button" value="返 回" onclick="javascript:location.href = 'background_payment.aspx?PublishmentSystemID=<%=PublishmentSystemID%>';" class="btn">
        </td>
      </tr>
    </table>
  
    </div>
  </div>

</form>
</body>
</html>
<!-- check for 3.6 html permissions -->
<%@ Page Language="C#" Inherits="BaiRong.BackgroundPages.BackgroundUserConfigMessage" %>

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
  <h3 class="popover-title">通知设置</h3>
  <div class="popover-content">
    
    <table class="table noborder table-hover">
      <tr>
        <td width="120">是否显示通知：</td>
        <td><asp:RadioButtonList ID="rblIsMessage" runat="server" AutoPostBack="true" OnSelectedIndexChanged="rblIsMessage_SelectedIndexChanged" RepeatDirection="Horizontal"></asp:RadioButtonList></td>
      </tr>
      <asp:PlaceHolder ID="phMessage" runat="server">
      <tr>
        <td width="120">通知标题：</td>
        <td>
        <asp:TextBox ID="tbMessageTitle" Width="360" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator
          ControlToValidate="tbMessageTitle"
          ErrorMessage=" *" foreColor="red"
          Display="Dynamic"
          runat="server"
          />
        </td>
      </tr>
        <tr>
          <td width="120">通知内容：</td>
          <td>
          <bairong:BREditor id="breMessageContent" runat="server"></bairong:BREditor>
          </td>
        </tr>
      </asp:PlaceHolder>
    </table>
  
    <hr />
    <table class="table noborder">
      <tr>
        <td class="center">
          <asp:Button class="btn btn-primary" id="Submit" text="确 定" onclick="Submit_OnClick" runat="server" />
        </td>
      </tr>
    </table>
  
    </div>
  </div>

</form>
</body>
</html>
<!-- check for 3.6 html permissions -->
<%@ Page Language="C#" Inherits="SiteServer.B2C.BackgroundPages.BackgroundConfigurationShipment" %>

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
  <bairong:alerts runat="server"></bairong:alerts>

  <div class="popover popover-static">
    <h3 class="popover-title">运费设置</h3>
    <div class="popover-content">
    
      <table class="table noborder table-hover">
        <tr>
          <td width="120">运费：</td>
          <td>
            <asp:TextBox id="tbShipmentPrice" class="input-mini" runat="server"/>
            <asp:RequiredFieldValidator
              ControlToValidate="tbShipmentPrice"
              errorMessage=" *" foreColor="red" 
              Display="Dynamic"
              runat="server"/> 元
          </td>
        </tr>
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
<!-- check for 3.6.4 html permissions -->
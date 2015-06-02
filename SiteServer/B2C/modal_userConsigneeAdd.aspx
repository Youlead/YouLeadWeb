<%@ Page Language="C#" Inherits="SiteServer.B2C.BackgroundPages.Modal.UserConsigneeAdd" %>

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

  <table class="table noborder table-hover">
	  <tr>
      <td width="120">收货人：</td>
      <td><asp:TextBox ID="tbConsignee" runat="server"  Columns="45" MaxLength="50"></asp:TextBox></td>
    </tr>
    <tr>
      <td>所在地区：</td>
      <td>
        <asp:DropDownList id="ddlProvice" class="input-medium" runat="server">
          <asp:ListItem value="" text="--请选择--"></asp:ListItem>
        </asp:DropDownList>
        <asp:DropDownList id="ddlCity" class="input-medium" runat="server">
          <asp:ListItem value="" text="--请选择--"></asp:ListItem>
        </asp:DropDownList>
        <asp:DropDownList id="ddlArea" class="input-medium" runat="server">
          <asp:ListItem value="" text="--请选择--"></asp:ListItem>
        </asp:DropDownList>
      </td>
    </tr>
    <tr>
      <td>详细地址：</td>
      <td><asp:TextBox ID="tbAddress" runat="server" class="input-xlarge"></asp:TextBox></td>
    </tr>
    <tr>
      <td>邮编：</td>
      <td><asp:TextBox ID="tbZipcode" runat="server"  Columns="45" MaxLength="50"></asp:TextBox></td>
    </tr>
    <tr>
      <td>手机：</td>
      <td><asp:TextBox ID="tbMobile" runat="server"  Columns="45" MaxLength="50"></asp:TextBox></td>
    </tr>
    <tr>
      <td>固定电话：</td>
      <td><asp:TextBox ID="tbTel" runat="server"  Columns="45" MaxLength="50"></asp:TextBox></td>
    </tr>
    <tr>
      <td>邮箱：</td>
      <td><asp:TextBox ID="tbEmail" runat="server"  Columns="45" MaxLength="50"></asp:TextBox></td>
    </tr>
  </table>

</form>
</body>
</html>
<!-- check for 3.6 html permissions -->
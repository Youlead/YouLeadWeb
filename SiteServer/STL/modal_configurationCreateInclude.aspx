﻿<%@ Page Language="C#" Inherits="SiteServer.STL.BackgroundPages.Modal.ConfigurationCreateInclude" Trace="false"%>

<%@ Register TagPrefix="bairong" Namespace="BaiRong.Controls" Assembly="BaiRong.Controls" %>

<%@ Register TagPrefix="site" Namespace="SiteServer.CMS.Controls" Assembly="SiteServer.CMS" %>
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
      <td width="220">当内容变动时需要生成的包含文件：</td>
      <td><asp:ListBox ID="IncludeFileCollection" SelectionMode="Multiple" Rows="12" runat="server"></asp:ListBox></td>
    </tr>
  </table>

</form>
</body>
</html>
<!-- check for 3.6 html permissions -->
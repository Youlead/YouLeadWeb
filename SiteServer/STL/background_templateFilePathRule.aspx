﻿<%@ Page Language="C#" Inherits="SiteServer.STL.BackgroundPages.BackgroundTemplateFilePathRule" %>

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
  <asp:Literal id="ltlBreadCrumb" runat="server" />

  <bairong:alerts text="在此可设置各栏目的生成页面命名规则，或者指定对应栏目的生成页面地址。" runat="server" />

  <table class="table table-bordered table-hover">
    <tr class="info thead">
      <td>栏目名</td>
      <td>页面路径</td>
      <td class="center" style="width:50px;">&nbsp;</td>
    </tr>
    <asp:Repeater ID="rptContents" runat="server">
      <itemtemplate>
        <asp:Literal id="ltlHtml" runat="server" />
      </itemtemplate>
    </asp:Repeater>
  </table>

  <br>

</form>
</body>
</html>
<!-- check for 3.6 html permissions -->
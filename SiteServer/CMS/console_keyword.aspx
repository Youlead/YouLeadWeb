﻿<%@ Page Language="C#" Inherits="SiteServer.CMS.BackgroundPages.ConsoleKeyword" %>

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
  <bairong:alerts runat="server" />

  <table class="table table-bordered table-hover">
    <tr class="info thead">
      <td>敏感词</td>
      <td>替换为</td>
      <td width="100">等级</td>
      <td width="100"></td>
      <td width="100"></td>
    </tr>
    <asp:Repeater ID="rptContents" runat="server">
      <itemtemplate>
        <tr>
          <td><asp:Literal ID="ltlKeyword"  runat="server"></asp:Literal></td>
          <td><asp:Literal ID="ltlAlternative"  runat="server"></asp:Literal></td>
          <td class="center"><asp:Literal ID="ltlGrade"  runat="server"></asp:Literal></td>
          <td class="center"><asp:Literal ID="ltlEdit" runat="server"></asp:Literal></td>
          <td class="center"><asp:Literal ID="ltlDelete" runat="server"></asp:Literal></td>
        </tr>
      </itemtemplate>
    </asp:Repeater>
  </table>

  <bairong:sqlPager id="spContents" runat="server" class="table table-pager" />

  <ul class="breadcrumb breadcrumb-button">
    <asp:Button class="btn btn-success" id="btnAdd" Text="添加敏感词" runat="server" />
    <asp:Button class="btn" id="btnImport" Text="导入词库" runat="server" />
    <asp:Button class="btn" Text="导出词库" runat="server" OnClick="ExportWord_Click" />
  </ul>

</form>
</body>
</html>
<!-- check for 3.6 html permissions -->
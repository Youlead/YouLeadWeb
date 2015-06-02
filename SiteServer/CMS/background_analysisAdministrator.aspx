<%@ Page Language="C#" Inherits="SiteServer.CMS.BackgroundPages.BackgroundAnalysisAdministrator" enableViewState = "false" %>

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
  <bairong:alerts runat="server" />
  <asp:Literal id="ltlBreadCrumb" runat="server" />

  <div class="well well-small">
    开始时间：
    <bairong:DateTimeTextBox id="StartDate" class="input-small" Columns="30" runat="server" />
    结束时间：
    <bairong:DateTimeTextBox id="EndDate" class="input-small" Columns="30" runat="server" />
    <asp:Button class="btn" id="Analysis" style="margin-bottom:0px;" OnClick="Analysis_OnClick" Text="分 析" runat="server" />
  </div>

  <div class="popover popover-static">
    <h3 class="popover-title">按栏目统计</h3>
    <div class="popover-content">
      <table class="table table-bordered table-hover">
        <tr class="info thead">
          <td>栏目名 </td>
          <td width="70">新增内容 </td>
          <td width="70">修改内容 </td>
          <td width="70">新增评论 </td>
        </tr>
        <asp:Repeater ID="rptChannels" runat="server">
          <itemtemplate>
            <bairong:NoTagText id="ElHtml" runat="server" />
          </itemtemplate>
        </asp:Repeater>
      </table>
    </div>
  </div>

  <div class="popover popover-static">
    <h3 class="popover-title">按管理员统计</h3>
    <div class="popover-content">
      <table class="table table-bordered table-hover">
        <tr class="info thead">
          <td>登录名 </td>
          <td>显示名 </td>
          <td width="70">新增内容 </td>
        </tr>
        <asp:Repeater ID="rptContents" runat="server">
          <itemtemplate>
            <tr>
              <td><asp:Literal ID="ltlUserName" runat="server"></asp:Literal></td>
              <td><asp:Literal ID="ltlDisplayName" runat="server"></asp:Literal></td>
              <td><asp:Literal ID="ltlContentAdd" runat="server"></asp:Literal></td>
            </tr>
          </itemtemplate>
        </asp:Repeater>
      </table>
    </div>
  </div>

  <bairong:sqlPager id="spContents" runat="server" class="table table-pager" />

</form>
</body>
</html>
<!-- check for 3.6 html permissions -->
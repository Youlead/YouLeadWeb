<%@ Page Language="C#" Inherits="SiteServer.CMS.BackgroundPages.ConsoleSiteAnalysis" enableViewState = "false" %>

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

  <div class="well well-small">
    <table class="table table-noborder">
      <tr>
        <td>
          开始时间：
          <bairong:DateTimeTextBox id="StartDate" class="input-small" runat="server" />
          结束时间：
          <bairong:DateTimeTextBox id="EndDate" class="input-small" runat="server" />
          <asp:Button class="btn" id="Analysis" OnClick="Analysis_OnClick" Text="分 析" runat="server" />
        </td>
      </tr>
    </table>
  </div>

  <div class="popover popover-static">
    <h3 class="popover-title">应用数据统计</h3>
    <div class="popover-content">
    
      <asp:dataGrid id="dgContents" showHeader="true" AutoGenerateColumns="false" DataKeyField="PublishmentSystemID" HeaderStyle-CssClass="info thead" CssClass="table table-bordered table-hover" gridlines="none" runat="server">
        <Columns>
          <asp:TemplateColumn
            HeaderText="应用名称">
            <ItemTemplate>
            <asp:Literal ID="ltlPublishmentSystemName" runat="server"></asp:Literal>
            </ItemTemplate>
            <ItemStyle Width="250" HorizontalAlign="left"/>
          </asp:TemplateColumn>
          <asp:TemplateColumn
            HeaderText="新增信息数目">
            <ItemTemplate>
              <asp:Literal ID="ltlNewContentNum" runat="server"></asp:Literal>
            </ItemTemplate>
            <ItemStyle Width="100" cssClass="center"/>
          </asp:TemplateColumn>
          <asp:TemplateColumn
            HeaderText="更新信息数目">
            <ItemTemplate>
              <asp:Literal ID="ltlUpdateContentNum" runat="server"></asp:Literal>
            </ItemTemplate>
            <ItemStyle Width="100" cssClass="center"/>
          </asp:TemplateColumn>
          <asp:TemplateColumn
            HeaderText="新增评论数目">
            <ItemTemplate>
              <asp:Literal ID="ltlNewRemarkNum" runat="server"></asp:Literal>
            </ItemTemplate>
            <ItemStyle Width="100" cssClass="center"/>
          </asp:TemplateColumn>
          <asp:TemplateColumn
            HeaderText="合计">
            <ItemTemplate>
              <asp:Literal ID="ltlHorizentalTotalNum" runat="server"></asp:Literal>
            </ItemTemplate>
            <ItemStyle Width="100" cssClass="center"/>
          </asp:TemplateColumn>
        </Columns>
      </asp:dataGrid>
  
    </div>
  </div>

  <div class="popover popover-static">
    <h3 class="popover-title">总计</h3>
    <div class="popover-content">
    
      <table class="table table-bordered table-hover">
        <tr class="info thead">
          <td>所有应用</td>
          <td>新增信息数目</td>
          <td>更新信息数目</td>
          <td>新增评论数目</td>
          <td>合计</td>
        </tr>
        <tr>
          <td class="center" style="width:250px;"> 总计 </td>
          <td class="center" style="width:100px;"><%=GetVerticalNum(NEW_CONTENT)%></td>
          <td class="center" style="width:100px;"><%=GetVerticalNum(UPDATE_CONTENT)%></td>
          <td class="center" style="width:100px;"><%=GetVerticalNum(NEW_REMARK)%></td>
          <td class="center" style="width:100px;"><%=GetVerticalTotalNum()%></td>
        </tr>
      </table>
  
    </div>
  </div>

</form>
</body>
</html>
<!-- check for 3.6 html permissions -->
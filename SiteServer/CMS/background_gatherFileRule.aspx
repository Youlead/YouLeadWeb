<%@ Page Language="C#" Inherits="SiteServer.CMS.BackgroundPages.BackgroundGatherFileRule" %>

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

  <asp:dataGrid id="dgContents" showHeader="true" AutoGenerateColumns="false" DataKeyField="GatherRuleName" HeaderStyle-CssClass="info thead" CssClass="table table-bordered table-hover" gridlines="none" runat="server">
    <Columns>
      <asp:TemplateColumn
        HeaderText="采集规则名称">
        <ItemTemplate> <%#DataBinder.Eval(Container.DataItem,"GatherRuleName")%> </ItemTemplate>
        <ItemStyle Width="180" cssClass="center" />
      </asp:TemplateColumn>
      <asp:TemplateColumn
        HeaderText="采集网址">
        <ItemTemplate> <%#GetGatherUrl((string)DataBinder.Eval(Container.DataItem,"GatherUrl"))%> </ItemTemplate>
        <ItemStyle cssClass="center" />
      </asp:TemplateColumn>
      <asp:TemplateColumn
        HeaderText="最近一次采集时间">
        <ItemTemplate> <%#GetLastGatherDate((DateTime)DataBinder.Eval(Container.DataItem,"LastGatherDate"))%> </ItemTemplate>
        <ItemStyle Width="150" cssClass="center" />
      </asp:TemplateColumn>
      <asp:TemplateColumn >
        <ItemTemplate> <%#GetTestGatherUrl((string)DataBinder.Eval(Container.DataItem,"GatherRuleName"))%> </ItemTemplate>
        <ItemStyle Width="70" cssClass="center" />
      </asp:TemplateColumn>
      <asp:TemplateColumn >
        <ItemTemplate> <IMG style="VERTICAL-ALIGN: middle;" src="../Pic/Icon/gather.gif"><%#GetStartGatherUrl((string)DataBinder.Eval(Container.DataItem,"GatherRuleName"))%> </ItemTemplate>
        <ItemStyle Width="100" cssClass="center" />
      </asp:TemplateColumn>
      <asp:TemplateColumn >
        <ItemTemplate> <%#GetEditLink((string)DataBinder.Eval(Container.DataItem,"GatherRuleName"))%> </ItemTemplate>
        <ItemStyle Width="60" cssClass="center" />
      </asp:TemplateColumn>
      <asp:TemplateColumn >
        <ItemTemplate> <a href="background_gatherFileRule.aspx?PublishmentSystemID=<%=base.PublishmentSystemID%>&GatherRuleName=<%# DataBinder.Eval(Container.DataItem,"GatherRuleName")%>&Copy=True">复制</a> </ItemTemplate>
        <ItemStyle Width="60" cssClass="center" />
      </asp:TemplateColumn>
      <asp:TemplateColumn >
        <ItemTemplate> <a href="background_gatherFileRule.aspx?PublishmentSystemID=<%=base.PublishmentSystemID%>&GatherRuleName=<%# DataBinder.Eval(Container.DataItem,"GatherRuleName")%>&Delete=True" onClick="javascript:return confirm('此操作将删除采集规则“<%# DataBinder.Eval(Container.DataItem,"GatherRuleName")%>”，确认吗？');">删除</a> </ItemTemplate>
        <ItemStyle Width="60" cssClass="center" />
      </asp:TemplateColumn>
      <asp:TemplateColumn
        HeaderText="<input type='checkbox' onClick='_checkFormAll(this.checked)'>">
        <ItemTemplate>
          <input type="checkbox" name="GatherRuleNameCollection" value='<%#DataBinder.Eval(Container.DataItem, "GatherRuleName")%>' />
        </ItemTemplate>
        <ItemStyle Width="20" cssClass="center" />
      </asp:TemplateColumn>
    </Columns>
  </asp:dataGrid>

  <ul class="breadcrumb breadcrumb-button">
    <input type=button class="btn btn-success" onClick="location.href='background_gatherFileRuleAdd.aspx?PublishmentSystemID=<%=base.PublishmentSystemID%>';" value="添加采集规则" />
    <asp:Button class="btn" id="Start" Text="开始采集" runat="server" />
  </ul>

</form>
</body>
</html>
<!-- check for 3.6 html permissions -->
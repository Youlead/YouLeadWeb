﻿<%@ Page Language="C#" Inherits="SiteServer.CMS.BackgroundPages.BackgroundGatherRule" %>

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
        <ItemTemplate>
          <asp:Literal ID="ltlGatherRuleName" runat="server"></asp:Literal>
        </ItemTemplate>
        <ItemStyle Width="180" cssClass="center" />
      </asp:TemplateColumn>
      <asp:TemplateColumn
        HeaderText="采集网址">
        <ItemTemplate>
          <asp:Literal ID="ltlGatherUrl" runat="server"></asp:Literal>
        </ItemTemplate>
        <ItemStyle HorizontalAlign="left" />
      </asp:TemplateColumn>
      <asp:TemplateColumn
        HeaderText="最近一次采集时间">
        <ItemTemplate>
          <asp:Literal ID="ltlLastGatherDate" runat="server"></asp:Literal>
        </ItemTemplate>
        <ItemStyle Width="150" cssClass="center" />
      </asp:TemplateColumn>
      <asp:TemplateColumn >
        <ItemTemplate>
          <asp:Literal ID="ltlTestGatherUrl" runat="server"></asp:Literal>
        </ItemTemplate>
        <ItemStyle Width="70" cssClass="center" />
      </asp:TemplateColumn>
      <asp:TemplateColumn >
        <ItemTemplate> <IMG style="VERTICAL-ALIGN: middle;" src="../Pic/Icon/gather.gif">
          <asp:Literal ID="ltlStartGatherUrl" runat="server"></asp:Literal>
        </ItemTemplate>
        <ItemStyle Width="100" cssClass="center" />
      </asp:TemplateColumn>
      <asp:TemplateColumn >
        <ItemTemplate>
          <asp:Literal ID="ltlEditLink" runat="server"></asp:Literal>
        </ItemTemplate>
        <ItemStyle Width="60" cssClass="center" />
      </asp:TemplateColumn>
      <asp:TemplateColumn >
        <ItemTemplate>
          <asp:Literal ID="ltlCopyLink" runat="server"></asp:Literal>
        </ItemTemplate>
        <ItemStyle Width="60" cssClass="center" />
      </asp:TemplateColumn>
      <asp:TemplateColumn >
        <ItemTemplate>
          <asp:Literal ID="ltlDeleteLink" runat="server"></asp:Literal>
        </ItemTemplate>
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
    <input type="button" class="btn btn-success" onClick="location.href='background_gatherRuleAdd.aspx?PublishmentSystemID=<%=base.PublishmentSystemID%>';" value="添加采集规则" />
    <input type="button" class="btn" onClick="<%=GetImportClickString()%>" value="导入采集规则" />
    <asp:Button class="btn" id="Export" Text="导出采集规则" runat="server" />
    <asp:Button class="btn" id="Start" Text="开始采集" runat="server" />
  </ul>

</form>
</body>
</html>
<!-- check for 3.6 html permissions -->
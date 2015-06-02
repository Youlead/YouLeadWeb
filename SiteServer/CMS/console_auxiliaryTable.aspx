﻿<%@ Page Language="C#" Inherits="SiteServer.CMS.BackgroundPages.ConsoleAuxiliaryTable" %>

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

  <asp:dataGrid id="dgContents" showHeader="true" AutoGenerateColumns="false" DataKeyField="TableENName" HeaderStyle-CssClass="info thead" CssClass="table table-bordered table-hover" gridlines="none" runat="server">
    <PagerStyle Mode="NumericPages" PageButtonCount="10" HorizontalAlign="Right" />
      <Columns>
      <asp:TemplateColumn>
        <ItemTemplate> <a href="console_tableMetadata.aspx?ENName=<%#DataBinder.Eval(Container.DataItem,"TableENName")%>&TableType=<%#DataBinder.Eval(Container.DataItem,"AuxiliaryTableType")%>" style="color:<%# GetFontColor(DataBinder.Eval(Container.DataItem,"IsCreatedInDB").ToString(), DataBinder.Eval(Container.DataItem,"IsChangedAfterCreatedInDB").ToString())%>">管理</a> </ItemTemplate>
        <ItemStyle Width="40" cssClass="center" />
      </asp:TemplateColumn>
      <asp:TemplateColumn HeaderText="辅助表标识">
        <ItemTemplate> <span style="color:<%# GetFontColor(DataBinder.Eval(Container.DataItem,"IsCreatedInDB").ToString(), DataBinder.Eval(Container.DataItem,"IsChangedAfterCreatedInDB").ToString())%>"><%#DataBinder.Eval(Container.DataItem,"TableENName")%></span> </ItemTemplate>
        <ItemStyle HorizontalAlign="left" />
      </asp:TemplateColumn>
      <asp:TemplateColumn
        HeaderText="辅助表名称">
        <ItemTemplate> <a style="color:<%# GetFontColor(DataBinder.Eval(Container.DataItem,"IsCreatedInDB").ToString(), DataBinder.Eval(Container.DataItem,"IsChangedAfterCreatedInDB").ToString())%>" href="console_auxiliaryTableAdd.aspx?ENName=<%#DataBinder.Eval(Container.DataItem,"TableENName")%>" ><%#DataBinder.Eval(Container.DataItem,"TableCNName")%></a> </ItemTemplate>
        <ItemStyle Width="160" HorizontalAlign="left" />
      </asp:TemplateColumn>
      <asp:TemplateColumn
        HeaderText="类型">
        <ItemTemplate> <span style="color:<%# GetFontColor(DataBinder.Eval(Container.DataItem,"IsCreatedInDB").ToString(), DataBinder.Eval(Container.DataItem,"IsChangedAfterCreatedInDB").ToString())%>"> <%# GetAuxiliatyTableType(DataBinder.Eval(Container.DataItem,"AuxiliaryTableType").ToString())%></span> </ItemTemplate>
        <ItemStyle Width="80" cssClass="center" />
      </asp:TemplateColumn>
      <asp:TemplateColumn HeaderText="被使用数目">
        <ItemTemplate> <span style="color:<%# GetFontColor(DataBinder.Eval(Container.DataItem,"IsCreatedInDB").ToString(), DataBinder.Eval(Container.DataItem,"IsChangedAfterCreatedInDB").ToString())%>"> <%#GetTableUsedNum(DataBinder.Eval(Container.DataItem,"TableENName").ToString(), DataBinder.Eval(Container.DataItem,"AuxiliaryTableType").ToString())%></span> </ItemTemplate>
        <ItemStyle Width="80" cssClass="center" />
      </asp:TemplateColumn>
      <asp:TemplateColumn HeaderText="是否存在">
        <ItemTemplate> <span style="color:<%# GetFontColor(DataBinder.Eval(Container.DataItem,"IsCreatedInDB").ToString(), DataBinder.Eval(Container.DataItem,"IsChangedAfterCreatedInDB").ToString())%>"> <%#GetYesOrNo((string)DataBinder.Eval(Container.DataItem,"IsCreatedInDB"))%></span> </ItemTemplate>
        <ItemStyle Width="60" cssClass="center" />
      </asp:TemplateColumn>
      <asp:TemplateColumn
        HeaderText="创建后修改">
        <ItemTemplate> <span style="color:<%# GetFontColor(DataBinder.Eval(Container.DataItem,"IsCreatedInDB").ToString(), DataBinder.Eval(Container.DataItem,"IsChangedAfterCreatedInDB").ToString())%>"> <%# GetIsChangedAfterCreatedInDB(DataBinder.Eval(Container.DataItem,"IsCreatedInDB").ToString(), DataBinder.Eval(Container.DataItem,"IsChangedAfterCreatedInDB").ToString())%></span> </ItemTemplate>
        <ItemStyle Width="80" cssClass="center" />
      </asp:TemplateColumn>
      <asp:TemplateColumn>
        <ItemTemplate> <a <%# GetTableUsedNum(DataBinder.Eval(Container.DataItem,"TableENName").ToString(), DataBinder.Eval(Container.DataItem,"AuxiliaryTableType").ToString()) == 0 ? "" : "style='display:none'"%> href="console_auxiliaryTable.aspx?Delete=True&ENName=<%# DataBinder.Eval(Container.DataItem,"TableENName")%>" onClick="javascript:return confirm('此操作将删除辅助表“<%# DataBinder.Eval(Container.DataItem,"TableCNName")%>”，如果辅助表已在数据库中建立，将同时删除建立的辅助表，确认吗？');" style="color:<%# GetFontColor(DataBinder.Eval(Container.DataItem,"IsCreatedInDB").ToString(), DataBinder.Eval(Container.DataItem,"IsChangedAfterCreatedInDB").ToString())%>">删除</a> </ItemTemplate>
        <ItemStyle Width="40" cssClass="center" />
      </asp:TemplateColumn>
    </Columns>
  </asp:dataGrid>

</form>
</body>
</html>
<!-- check for 3.6 html permissions -->
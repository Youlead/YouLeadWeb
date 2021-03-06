﻿<%@ Page Language="C#" Inherits="SiteServer.B2C.BackgroundPages.ConsoleUser" %>

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
  <bairong:alerts runat="server" />

  <div class="well well-small">
    <table class="table table-noborder">
      <tr>
        <td>
          用户类型：
          <asp:DropDownList ID="ddlTypeID" class="input-medium" runat="server" OnSelectedIndexChanged="Search_OnClick" AutoPostBack="true" ></asp:DropDownList>
          注册时间：
          <asp:DropDownList ID="CreateDate" class="input-medium" AutoPostBack="true" OnSelectedIndexChanged="Search_OnClick" runat="server">
            <asp:ListItem Text="全部时间" Value="0" Selected="true"></asp:ListItem>
            <asp:ListItem Text="1天内" Value="1"></asp:ListItem>
            <asp:ListItem Text="2天内" Value="2"></asp:ListItem>
            <asp:ListItem Text="3天内" Value="3"></asp:ListItem>
            <asp:ListItem Text="1周内" Value="7"></asp:ListItem>
            <asp:ListItem Text="1个月内" Value="30"></asp:ListItem>
            <asp:ListItem Text="3个月内" Value="90"></asp:ListItem>
            <asp:ListItem Text="半年内" Value="180"></asp:ListItem>
            <asp:ListItem Text="1年内" Value="365"></asp:ListItem>
          </asp:DropDownList>
          最后活动时间：
          <asp:DropDownList ID="LastActivityDate" class="input-medium" AutoPostBack="true" OnSelectedIndexChanged="Search_OnClick" runat="server">
            <asp:ListItem Text="全部时间" Value="0" Selected="true"></asp:ListItem>
            <asp:ListItem Text="1天内" Value="1"></asp:ListItem>
            <asp:ListItem Text="2天内" Value="2"></asp:ListItem>
            <asp:ListItem Text="3天内" Value="3"></asp:ListItem>
            <asp:ListItem Text="1周内" Value="7"></asp:ListItem>
            <asp:ListItem Text="1个月内" Value="30"></asp:ListItem>
            <asp:ListItem Text="3个月内" Value="90"></asp:ListItem>
            <asp:ListItem Text="半年内" Value="180"></asp:ListItem>
            <asp:ListItem Text="1年内" Value="365"></asp:ListItem>
          </asp:DropDownList>
          显示条数：
          <asp:DropDownList ID="PageNum" class="input-small" AutoPostBack="true" OnSelectedIndexChanged="Search_OnClick" runat="server">
            <asp:ListItem Text="默认" Value="0" Selected="true"></asp:ListItem>
            <asp:ListItem Text="30" Value="30"></asp:ListItem>
            <asp:ListItem Text="50" Value="50"></asp:ListItem>
            <asp:ListItem Text="100" Value="100"></asp:ListItem>
            <asp:ListItem Text="200" Value="200"></asp:ListItem>
            <asp:ListItem Text="300" Value="300"></asp:ListItem>
          </asp:DropDownList>
        </td>
      </tr>
      <tr>
        <td>
          关键字：
          <asp:TextBox id="Keyword" MaxLength="500" Size="25" runat="server"/>
          <asp:Button class="btn" OnClick="Search_OnClick" id="Search" text="搜 索"  runat="server"/>
        </td>
      </tr>
    </table>
  </div>

  <table class="table table-bordered table-hover">
    <tr class="info thead">
      <td>账号</td>
      <td>姓名</td>
      <td>用户类型</td>
      <td>用户组</td>
      <td class="center" width="40">积分</td>
      <td width="120">注册时间</td>
      <td width="120">最后活动时间</td>
      <td width="60">&nbsp;</td>
      <td width="60">&nbsp;</td>
      <td width="60">&nbsp;</td>
      <td width="40">&nbsp;</td>
      <td width="20" class="center"><input onClick="_checkFormAll(this.checked)" type="checkbox" /></td>
    </tr>
    <asp:Repeater ID="rptContents" runat="server">
      <itemtemplate>
        <tr>
          <td>
            <asp:Literal ID="ltlUserName" runat="server"></asp:Literal>
          </td>
          <td>
            <asp:Literal ID="ltlDisplayName" runat="server"></asp:Literal>
          </td>
          <td>
            <asp:Literal ID="ltlType" runat="server"></asp:Literal>
          </td>
          <td>
            <asp:Literal ID="ltlUserGroupName" runat="server"></asp:Literal>
          </td>
          <td class="center">
            <asp:Literal ID="ltlCredits" runat="server"></asp:Literal>
          </td>
          <td class="center">
            <asp:Literal ID="ltlCreateDate" runat="server"></asp:Literal>
          </td>
          <td class="center">
            <asp:Literal ID="ltlLastActivityDate" runat="server"></asp:Literal>
          </td>
          <td class="center">
            <asp:HyperLink ID="hlConsignee" Text="收货地址" runat="server"></asp:HyperLink>
          </td>
          <td class="center">
            <asp:HyperLink ID="hlInvoice" Text="发票信息" runat="server"></asp:HyperLink>
          </td>
          <td class="center">
            <asp:HyperLink NavigateUrl="javascript:;" ID="hlChangePassword" Text="重设密码" runat="server"></asp:HyperLink>
          </td>
          <td class="center">
            <asp:HyperLink ID="hlEditLink" Text="编辑" runat="server"></asp:HyperLink>
          </td>
          <td class="center">
            <asp:Literal ID="ltlSelect" runat="server"></asp:Literal>
          </td>
        </tr>
      </itemtemplate>
    </asp:Repeater>
  </table>

  <bairong:sqlPager id="spContents" runat="server" class="table table-pager" />

  <ul class="breadcrumb breadcrumb-button">
    <asp:PlaceHolder ID="phType" runat="server">
      <asp:Button class="btn" id="AddToType" Text="设置用户类型" runat="server" />
    </asp:PlaceHolder>
    <asp:Button class="btn" id="AddToGroup" Text="设置用户组" runat="server" />
    <asp:Button class="btn" id="Lock" Text="锁定用户" runat="server" />
    <asp:Button class="btn" id="UnLock" Text="解除锁定" runat="server" />
    <asp:Button class="btn" id="SendMail" Text="发送邮件" runat="server" />
    <asp:Button class="btn" id="Delete" Text="删 除" runat="server" />
    <asp:Button class="btn" id="Import" Text="导入Excel" runat="server" />
    <asp:Button class="btn" id="Export" Text="导出Excel" runat="server" />
  </ul>

</form>
</body>
</html>
<!-- check for 3.6 html permissions -->
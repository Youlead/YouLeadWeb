﻿<%@ Page Language="C#" Inherits="SiteServer.CMS.BackgroundPages.Modal.TaskAdd" Trace="false"%>

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

  <script type="text/javascript" language="javascript">
  function selectAll(isChecked)
  {
    for(var i=0; i<document.getElementById('<%=CreateChannelIDCollection.ClientID%>').options.length; i++)
    {
      document.getElementById('<%=CreateChannelIDCollection.ClientID%>').options[i].selected = isChecked;
    }
  }
  </script>

  <table class="table table-noborder table-hover">
    <tr>
      <td width="120"><bairong:help HelpText="任务名称" Text="任务名称：" runat="server" ></bairong:help></td>
      <td><asp:TextBox Columns="35" MaxLength="200" id="TaskName" runat="server" />
        <asp:RequiredFieldValidator ControlToValidate="TaskName" ErrorMessage=" *" foreColor="red" Display="Dynamic" runat="server" />
        <asp:RegularExpressionValidator runat="server" ControlToValidate="TaskName"
						ValidationExpression="[^']+" errorMessage=" *" foreColor="red" display="Dynamic" /></td>
    </tr>
    <tr>
      <td><bairong:help HelpText="任务执行的频率" Text="任务执行频率：" runat="server" ></bairong:help></td>
      <td><asp:DropDownList ID="FrequencyType" class="input-medium" AutoPostBack="true" OnSelectedIndexChanged="FrequencyType_SelectedIndexChanged" runat="server"></asp:DropDownList>
        <asp:PlaceHolder id="PlaceHolder_PeriodIntervalMinute" Visible="false" runat="server"> &nbsp;周期：&nbsp;每
          <asp:TextBox class="input-mini" MaxLength="50" Text="30" id="PeriodInterval" runat="server" />
          &nbsp;
          <asp:DropDownList ID="PeriodIntervalType" class="input-small" runat="server"></asp:DropDownList>
          <asp:RequiredFieldValidator ControlToValidate="PeriodInterval" errorMessage=" *" foreColor="red" display="Dynamic" runat="server" />
          <asp:RegularExpressionValidator
						ControlToValidate="PeriodInterval"
						ValidationExpression="\d+"
						Display="Dynamic"
						ErrorMessage="必须为大于零的整数"
						runat="server"/>
          <asp:CompareValidator 
						ControlToValidate="PeriodInterval" 
						Operator="GreaterThan" 
						ValueToCompare="0" 
						Display="Dynamic"
						ErrorMessage="必须为大于零的整数"
						runat="server"/>
        </asp:PlaceHolder></td>
    </tr>
    <asp:PlaceHolder id="PlaceHolder_NotPeriod" runat="server">
      <tr>
        <td><bairong:help HelpText="任务执行的开始时刻" Text="任务开始时刻：" runat="server" ></bairong:help></td>
        <td><table width="100%" border="0" cellspacing="1" cellpadding="1">
            <tr>
              <td>日期：</td>
              <td><asp:DropDownList ID="StartDay" CssClass="input-small" runat="server"></asp:DropDownList></td>
              <td>星期：</td>
              <td><asp:DropDownList ID="StartWeekday" CssClass="input-small" runat="server"></asp:DropDownList></td>
              <td>小时：</td>
              <td><asp:DropDownList ID="StartHour" CssClass="input-small" runat="server"></asp:DropDownList></td>
            </tr>
          </table></td>
      </tr>
    </asp:PlaceHolder>
    <tr>
      <td width="120"><bairong:help HelpText="任务描述" Text="任务描述：" runat="server" ></bairong:help></td>
      <td><asp:TextBox Columns="55" TextMode="MultiLine" Rows="2" MaxLength="200" id="Description" runat="server" /></td>
    </tr>
    <tr>
      <td colspan="2"><hr /></td>
    </tr>
    <asp:PlaceHolder id="PlaceHolder_Publish" Visible="false" runat="server">
      <tr>
        <td>选择发布类型：</td>
        <td><asp:CheckBoxList ID="PublishTypes" RepeatDirection="Horizontal" class="noborder checkboxlist" RepeatColumns="4" runat="server"></asp:CheckBoxList></td>
      </tr>
      <asp:PlaceHolder id="PlaceHolder_Publish_JustInTime" Visible="false" runat="server">
        <tr>
          <td><bairong:help HelpText="实时监听的文件类型" Text="监听文件类型：" runat="server" ></bairong:help></td>
          <td><asp:TextBox ID="PublishFilter" runat="server"></asp:TextBox>
            <br>
            (“*.txt”代表监听文本文件，“*.*”或空代表监听所有文件) </td>
        </tr>
      </asp:PlaceHolder>
    </asp:PlaceHolder>
    <asp:PlaceHolder id="PlaceHolder_Create" Visible="false" runat="server">
      <tr>
        <td><bairong:help HelpText="选择需要生成的对象" Text="需要生成的对象：" runat="server" ></bairong:help>
        </td>
        <td>
          <asp:ListBox ID="CreateChannelIDCollection" SelectionMode="Multiple" Rows="13" runat="server"></asp:ListBox>
          &nbsp;<asp:CheckBox id="CreateIsCreateAll" class="checkbox inline" text="生成全部" runat="server"></asp:CheckBox>
        </td>
      </tr>
      <tr>
        <td><bairong:help HelpText="生成文件的类型" Text="生成类型：" runat="server" ></bairong:help></td>
        <td><asp:CheckBoxList ID="CreateCreateTypes" RepeatDirection="Horizontal" class="noborder" runat="server"></asp:CheckBoxList></td>
      </tr>
      <tr>
        <td><bairong:help HelpText="生成站点地图(SiteMap)" Text="生成站点地图(SiteMap)：" runat="server" ></bairong:help></td>
        <td><asp:CheckBox ID="CreateIsCreateSiteMap" runat="server" Text="生成"></asp:CheckBox></td>
      </tr>
    </asp:PlaceHolder>
    <asp:PlaceHolder id="PlaceHolder_Gather" Visible="false" runat="server">
      <tr>
        <td><bairong:help id="GatherHelp" Text="需要定时采集的的对象：" runat="server" ></bairong:help></td>
        <td><asp:ListBox ID="GatherListBox" SelectionMode="Multiple" Rows="10" runat="server"></asp:ListBox>
          <asp:RequiredFieldValidator ControlToValidate="GatherListBox" ErrorMessage=" *" foreColor="red" Display="Dynamic" runat="server" /></td>
      </tr>
    </asp:PlaceHolder>
    <asp:PlaceHolder id="PlaceHolder_Backup" Visible="false" runat="server">
      <tr>
        <td><bairong:help HelpText="选择备份类型" Text="选择备份类型：" runat="server" ></bairong:help></td>
        <td><asp:DropDownList ID="BackupType" runat="server"></asp:DropDownList></td>
      </tr>
      <asp:PlaceHolder id="PlaceHolder_Backup_PublishmentSystem" Visible="false" runat="server">
        <tr>
          <td><bairong:help HelpText="选择需要备份的站点" Text="需要备份的站点：" runat="server" ></bairong:help></td>
          <td><asp:ListBox ID="BackupPublishmentSystemIDCollection" SelectionMode="Multiple" Rows="8" runat="server"></asp:ListBox>
            &nbsp;&nbsp;
            <asp:CheckBox ID="BackupIsBackupAll" runat="server" onClick="selectAll(this.checked);" Text="全部"></asp:CheckBox></td>
        </tr>
      </asp:PlaceHolder>
    </asp:PlaceHolder>
  </table>

</form>
</body>
</html>
<!-- check for 3.6 html permissions -->
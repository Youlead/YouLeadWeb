<%@ Page Language="C#" Inherits="SiteServer.CMS.BackgroundPages.BackgroundConfigurationWaterMark" %>

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

  <div class="popover popover-static">
    <h3 class="popover-title">图片水印设置</h3>
    <div class="popover-content">
    
      <table class="table noborder table-hover">
        <tr>
          <td width="160"><bairong:help HelpText="选择是否将水印加载在上传的图片中" Text="是否启用水印功能：" runat="server" ></bairong:help></td>
          <td><asp:RadioButtonList ID="IsWaterMark" runat="server" RepeatDirection="Horizontal" class="noborder" AutoPostBack="true" OnSelectedIndexChanged="IsWaterMark_SelectedIndexChanged"></asp:RadioButtonList></td>
        </tr>
        <tr id="WaterMarkPositionRow" runat="server">
          <td width="160"><bairong:help HelpText="请在此选择水印添加的位置(共 9 个位置可选)." Text="添加水印位置：" runat="server" ></bairong:help></td>
          <td><asp:literal id="WaterMarkPosition" runat="server"></asp:literal></td>
        </tr>
        <tr id="WaterMarkTransparencyRow" runat="server">
          <td width="160"><bairong:help HelpText="取值范围10%--100% (100%为不透明). " Text="水印不透明度：" runat="server" ></bairong:help></td>
          <td><asp:DropDownList ID="WaterMarkTransparency" runat="server"></asp:DropDownList></td>
        </tr>
        <tr id="WaterMarkMinRow" runat="server">
          <td width="160"><bairong:help HelpText="需要添加水印的图片的最小尺寸. " Text="图片最小尺寸：" runat="server" ></bairong:help></td>
          <td> 宽：
            <asp:TextBox ID="WaterMarkMinWidth" class="input-mini" Columns="10" MaxLength="50" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ControlToValidate="WaterMarkMinWidth" errorMessage=" *" foreColor="red" display="Dynamic" runat="server" />
            <asp:RegularExpressionValidator ControlToValidate="WaterMarkMinWidth" ValidationExpression="\d+" Display="Dynamic" ErrorMessage="此项必须为数字" runat="server"/>
            （0代表不限制）
            高：
            <asp:TextBox ID="WaterMarkMinHeight" class="input-mini" Columns="10" MaxLength="50" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ControlToValidate="WaterMarkMinHeight" errorMessage=" *" foreColor="red" display="Dynamic" runat="server" />
            <asp:RegularExpressionValidator ControlToValidate="WaterMarkMinHeight" ValidationExpression="\d+" Display="Dynamic" ErrorMessage="此项必须为数字" runat="server"/>
            （0代表不限制） </td>
        </tr>
        <tr id="IsImageWaterMarkRow" runat="server">
          <td><bairong:help HelpText="选择使用的水印类型" Text="水印类型：" runat="server" ></bairong:help></td>
          <td><asp:RadioButtonList ID="IsImageWaterMark" runat="server" RepeatDirection="Horizontal" class="noborder" AutoPostBack="true" OnSelectedIndexChanged="IsWaterMark_SelectedIndexChanged"></asp:RadioButtonList></td>
        </tr>
        <tr id="WaterMarkFormatStringRow" runat="server">
          <td><bairong:help HelpText="文字型水印的内容" Text="文字型水印的内容：" runat="server" ></bairong:help></td>
          <td><asp:TextBox Columns="25" MaxLength="50" id="WaterMarkFormatString" runat="server" />
            <asp:RequiredFieldValidator ControlToValidate="WaterMarkFormatString" errorMessage=" *" foreColor="red" display="Dynamic" runat="server" />
            <asp:RegularExpressionValidator runat="server" ControlToValidate="WaterMarkFormatString" ValidationExpression="[^']+" ErrorMessage="此项不能为空" Display="Dynamic" />
            <br>
            可以使用替换变量: {0}表示当前日期 {1}表示当前时间 例如:&quot;上传于{0} {1}&quot; </td>
        </tr>
        <tr id="WaterMarkFontNameRow" runat="server">
          <td><bairong:help HelpText="文字水印的字体" Text="文字水印的字体：" runat="server" ></bairong:help></td>
          <td><asp:DropDownList ID="WaterMarkFontName" runat="server"></asp:DropDownList></td>
        </tr>
        <tr id="WaterMarkFontSizeRow" runat="server">
          <td><bairong:help HelpText="文字水印的大小:" Text="文字水印的大小：" runat="server" ></bairong:help></td>
          <td><asp:TextBox class="input-mini" Columns="25" MaxLength="50" id="WaterMarkFontSize" runat="server" />
            <asp:RequiredFieldValidator ControlToValidate="WaterMarkFontSize" ErrorMessage="此项不能为空" Display="Dynamic" runat="server" />
            <asp:RegularExpressionValidator
              ControlToValidate="WaterMarkFontSize"
              ValidationExpression="\d+"
              Display="Dynamic"
              ErrorMessage="此项必须为数字"
              runat="server"/></td>
        </tr>
        <tr id="WaterMarkImagePathRow" runat="server">
          <td><bairong:help HelpText="图片型水印文件" Text="图片型水印文件：" runat="server" ></bairong:help></td>
          <td>
              <asp:TextBox Columns="55" MaxLength="100" id="WaterMarkImagePath" runat="server"/>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                ControlToValidate="WaterMarkImagePath"
                errorMessage=" *" foreColor="red" 
                Display="Dynamic"
                runat="server"/>
              &nbsp;
              <asp:Button ID="ImageUrlSelect" runat="server" class="btn" text="选择"></asp:Button>
              &nbsp;
              <asp:Button ID="ImageUrlUpload" runat="server" class="btn" text="上传"></asp:Button>
            </td>
        </tr>
      </table>
  
      <hr />
      <table class="table noborder">
        <tr>
          <td class="center">
            <asp:Button class="btn btn-primary" id="Submit" text="确 定" onclick="Submit_OnClick" runat="server" />
          </td>
        </tr>
      </table>
  
    </div>
  </div>

</form>
</body>
</html>
<!-- check for 3.6 html permissions -->
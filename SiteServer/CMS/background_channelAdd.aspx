<%@ Page Language="C#" validateRequest="false" Inherits="SiteServer.CMS.BackgroundPages.BackgroundChannelAdd" %>

<%@ Register TagPrefix="bairong" Namespace="BaiRong.Controls" Assembly="BaiRong.Controls" %>

<%@ Register TagPrefix="site" Namespace="SiteServer.CMS.Controls" Assembly="SiteServer.CMS" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=7" />
<!--#include file="../inc/header.aspx"-->
</head>

<body>
<!--#include file="../inc/openWindow.html"-->
<form class="form-inline" runat="server">
  <asp:Literal id="ltlBreadCrumb" runat="server" />
  <bairong:alerts runat="server" />

  <div class="popover popover-static">
    <h3 class="popover-title">添加栏目</h3>
    <div class="popover-content">
    
      <table class="table noborder table-hover">
        <tr>
          <td width="150">父栏目：</td>
          <td>
            <asp:DropDownList id="ParentNodeID" AutoPostBack="true" OnSelectedIndexChanged="ParentNodeID_SelectedIndexChanged" runat="server"></asp:DropDownList>
          </td>
        </tr>
        <tr>
          <td>栏目名称：</td>
          <td>
            <asp:TextBox Columns="45" MaxLength="255" id="NodeName" runat="server"/>
            <asp:RequiredFieldValidator id="RequiredFieldValidator"
              ControlToValidate="NodeName"
              errorMessage=" *" foreColor="red" 
              Display="Dynamic"
              runat="server"/>
          </td>
        </tr>
        <tr>
          <td>栏目索引：</td>
          <td>
            <asp:TextBox Columns="45" MaxLength="255" id="NodeIndexName" runat="server"/>
            <asp:RegularExpressionValidator id="RegularExpressionValidator1"
              runat="server"
              ControlToValidate="NodeIndexName"
              ValidationExpression="[^']+"
              errorMessage=" *" foreColor="red" 
              Display="Dynamic" />
          </td>
        </tr>
        <tr>
          <td>内容模型：</td>
          <td>
            <asp:DropDownList id="ContentModelID" runat="server"> </asp:DropDownList>
          </td>
        </tr>
        <tr>
          <td>栏目链接：</td>
          <td>
            <asp:TextBox Columns="45" MaxLength="200" id="LinkURL" runat="server"/>
            <asp:RegularExpressionValidator id="RegularExpressionValidator11"
              runat="server"
              ControlToValidate="LinkURL"
              ValidationExpression="[^']+"
              errorMessage=" *" foreColor="red" 
              Display="Dynamic" />
          </td>
        </tr>
        <tr>
          <td>链接类型：</td>
          <td>
            <asp:DropDownList id="LinkType" runat="server"> </asp:DropDownList>
          </td>
        </tr>
        <tr>
          <td>栏目模板：</td>
          <td>
            <asp:DropDownList id="ChannelTemplateID" DataTextField="TemplateName" DataValueField="TemplateID" runat="server"></asp:DropDownList>
          </td>
        </tr>
        <tr>
          <td>本栏目内容模板：</td>
          <td>
            <asp:DropDownList id="ContentTemplateID" DataTextField="TemplateName" DataValueField="TemplateID" runat="server"></asp:DropDownList>
          </td>
        </tr>
        <tr>
          <td>生成页面路径：</td>
          <td>
            <asp:TextBox Columns="45" MaxLength="200" id="FilePath" runat="server"/>
            <asp:RegularExpressionValidator
              runat="server"
              ControlToValidate="FilePath"
              ValidationExpression="[^']+"
              errorMessage=" *" foreColor="red" 
              Display="Dynamic" />
          </td>
        </tr>
        <tr>
          <td>栏目页面命名规则：</td>
          <td>
            <asp:TextBox Columns="38" MaxLength="200" id="ChannelFilePathRule" runat="server"/>
            <asp:Button ID="CreateChannelRule" class="btn" text="构造" runat="server"></asp:Button>
          </td>
        </tr>
        <tr>
          <td>内容页面命名规则：</td>
          <td>
            <asp:TextBox Columns="38" MaxLength="200" id="ContentFilePathRule" runat="server"/>
            <asp:Button ID="CreateContentRule" class="btn" text="构造" runat="server"></asp:Button>
          </td>
        </tr>
        <tr>
          <td>可以添加栏目：</td>
          <td>
            <asp:RadioButtonList id="IsChannelAddable" RepeatDirection="Horizontal" class="noborder" runat="server">
              <asp:ListItem Text="是" Selected="True"/>
              <asp:ListItem Text="否" />
            </asp:RadioButtonList>
          </td>
        </tr>
        <tr>
          <td>可以添加内容：</td>
          <td>
            <asp:RadioButtonList id="IsContentAddable" RepeatDirection="Horizontal" class="noborder" runat="server">
              <asp:ListItem Text="是" Selected="True"/>
              <asp:ListItem Text="否" />
            </asp:RadioButtonList>
          </td>
        </tr>
        <tr>
          <td>栏目图片地址：</td>
          <td>
            <asp:TextBox id="NavigationPicPath"
              MaxLength="100"
              Size="45"
              runat="server"/>
            <asp:Button ID="SelectImage" class="btn" text="选择" runat="server"></asp:Button>
            <asp:Button ID="UploadImage" class="btn" text="上传" runat="server"></asp:Button>
          </td>
        </tr>
        <tr>
          <td colspan="2">
            <site:TextEditorControl id="Content" runat="server"></site:TextEditorControl>
          </td>
        </tr>
        <tr>
          <td>关键字列表：</td>
          <td>
            <asp:TextBox Rows="3" Width="350" MaxLength="100" TextMode="MultiLine" id="Keywords" runat="server" />
            <asp:RegularExpressionValidator runat="server" ControlToValidate="Keywords" ValidationExpression="[^']+" errorMessage=" *" foreColor="red" display="Dynamic" />
            <=100 <br>
            <span>注意：各关键词间用英文逗号“,”隔开。<span>
          </td>
        </tr>
        <tr>
          <td>页面描述：</td>
          <td>
            <asp:TextBox Width="350" Rows="4" MaxLength="200" TextMode="MultiLine" id="Description" runat="server" />
            <asp:RegularExpressionValidator runat="server" ControlToValidate="Description" ValidationExpression="[^']+" errorMessage=" *" foreColor="red" display="Dynamic" />
            <=200
          </td>
        </tr>
        <site:ChannelAuxiliaryControl ID="ControlForAuxiliary" runat="server"/>
        <tr>
          <td>栏目组：</td>
          <td>
            <asp:CheckBoxList CssClass="checkboxlist" ID="NodeGroupNameCollection" DataTextField="NodeGroupName" DataValueField="NodeGroupName" RepeatDirection="Horizontal" RepeatColumns="5" runat="server"/>
          </td>
        </tr>
      </table>
  
      <hr />
      <table class="table noborder">
        <tr>
          <td class="center">
            <asp:Button class="btn btn-primary" id="Submit" text="添 加" onclick="Submit_OnClick" runat="server"/>
            <input class="btn" type="button" onClick="location.href='<%=ReturnUrl%>';return false;" value="返 回" />
          </td>
        </tr>
      </table>
  
    </div>
  </div>

</form>
</body>
</html>
<!-- check for 3.6 html permissions -->
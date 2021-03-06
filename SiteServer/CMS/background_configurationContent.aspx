﻿<%@ Page Language="C#" Inherits="SiteServer.CMS.BackgroundPages.BackgroundConfigurationContent" %>

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
  <bairong:alerts text="如果修改了自动分页选项，需要将所有内容页重新生成" runat="server"></bairong:alerts>

  <div class="popover popover-static">
    <h3 class="popover-title">内容管理设置</h3>
    <div class="popover-content">
    
      <table class="table noborder table-hover">
        <tr>
          <td width="240">内容编辑页是否使用内容组功能：</td>
          <td><asp:DropDownList ID="ddlIsGroupContent" runat="server"></asp:DropDownList></td>
        </tr>
        <tr>
          <td>内容编辑页是否使用标签功能：</td>
          <td><asp:DropDownList ID="ddlIsRelatedByTags" runat="server"></asp:DropDownList></td>
        </tr>
        <tr>
          <td>内容编辑页是否使用内容转移功能：</td>
          <td><asp:DropDownList ID="ddlIsTranslate" runat="server"></asp:DropDownList></td>
        </tr>
        <tr>
          <td>自动保存外部图片：</td>
          <td><asp:DropDownList ID="ddlIsSaveImageInTextEditor" runat="server"></asp:DropDownList></td>
        </tr>
        <tr>
          <td>内容是否自动分页：</td>
          <td><asp:DropDownList ID="ddlIsAutoPageInTextEditor" runat="server"></asp:DropDownList></td>
        </tr>
        <tr>
          <td>内容自动分页每页字数：</td>
          <td><asp:TextBox class="input-small" id="tbAutoPageWordNum" runat="server"/>
            <asp:RequiredFieldValidator
              ControlToValidate="tbAutoPageWordNum"
              errorMessage=" *" foreColor="red"
              Display="Dynamic"
              runat="server"/></td>
        </tr>
        <tr>
          <td>是否启用自动保存草稿功能：</td>
          <td><asp:DropDownList ID="ddlIsAutoSaveContent" runat="server"></asp:DropDownList></td>
        </tr>
        <tr>
          <td>自动保存草稿间隔时间：</td>
          <td><asp:TextBox class="input-small" id="tbAutoSaveContentInterval" runat="server"/>
            <asp:RequiredFieldValidator
              ControlToValidate="tbAutoSaveContentInterval"
              errorMessage=" *" foreColor="red"
              Display="Dynamic"
              runat="server"/> 秒</td>
        </tr>
        <tr>
          <td>是否启用标题换行功能：</td>
          <td>
            <asp:RadioButtonList ID="rblIsContentTitleBreakLine" RepeatDirection="Horizontal" class="noborder" runat="server"></asp:RadioButtonList><span>在标题中输入两连续的英文空格，内容页中标题将自动换行，列表页将忽略此空格</span></td>
        </tr>
        <tr>
          <td>默认编辑器类型：</td>
          <td><asp:DropDownList ID="ddlTextEditorType" runat="server"></asp:DropDownList></td>
        </tr>
        <tr>
          <td>内容审核机制：</td>
          <td>
            <asp:RadioButtonList id="rblIsCheckContentUseLevel" AutoPostBack="true" OnSelectedIndexChanged="rblIsCheckContentUseLevel_OnSelectedIndexChanged" RepeatDirection="Horizontal" class="noborder" runat="server"> </asp:RadioButtonList>
            <span>选择内容审核的机制，需要多级审核的请选择多级审核机制，否则选择默认审核机制</span>
          </td>
        </tr>
        <asp:PlaceHolder id="phCheckContentLevel" runat="server">
        <tr>
          <td>内容审核级别：</td>
          <td>
            <asp:DropDownList id="CheckContentLevel" runat="server">
              <asp:ListItem Value="2" Text="二级" Selected="true"></asp:ListItem>
              <asp:ListItem Value="3" Text="三级"></asp:ListItem>
              <asp:ListItem Value="4" Text="四级"></asp:ListItem>
              <asp:ListItem Value="5" Text="五级"></asp:ListItem>
            </asp:DropDownList>
            <span>指此内容在添加后需要经多少次审核才能正式发布</span>
          </td>
        </tr>
        </asp:PlaceHolder>
        <tr>
          <td>后台内容列表显示评论链接：</td>
          <td>
            <asp:RadioButtonList id="rblIsContentCommentable"
        RepeatDirection="Horizontal" class="noborder"
        runat="server">
              <asp:ListItem Text="是" Value="True" Selected="True" />
              <asp:ListItem Value="False" Text="否"/>
            </asp:RadioButtonList>
          </td>
        </tr>
        <tr>
          <td>图片内容模型预览图片尺寸：</td>
          <td> 宽：
            <asp:TextBox Columns="25" MaxLength="50" Width="50" id="tbPhotoContentPreviewWidth" runat="server"/>
            <asp:RequiredFieldValidator
              ControlToValidate="tbPhotoContentPreviewWidth"
              errorMessage=" *" foreColor="red" 
              Display="Dynamic"
              runat="server"/>
            <span>(px)</span>&nbsp;
            高：
            <asp:TextBox Columns="25" MaxLength="50" Width="50" id="tbPhotoContentPreviewHeight" runat="server"/>
            <asp:RequiredFieldValidator
              ControlToValidate="tbPhotoContentPreviewHeight"
              errorMessage=" *" foreColor="red" 
              Display="Dynamic"
              runat="server"/>
            <span>(px)</span> </td>
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
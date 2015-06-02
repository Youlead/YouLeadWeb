<%@ Page Language="C#" Inherits="SiteServer.CMS.BackgroundPages.BackgroundGatherDatabaseRuleAdd" %>

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
    <h3 class="popover-title"><asp:Literal id="ltlPageTitle" runat="server" /></h3>
    <div class="popover-content">
    
      <asp:PlaceHolder id="GatherRuleBase" runat="server" Visible="false">
        <table class="table noborder table-hover">
          <tr>
            <td width="170">采集规则名称：</td>
            <td>
              <asp:TextBox Columns="25" MaxLength="50" id="GatherRuleName" runat="server"/>
            </td>
          </tr>
          <tr>
            <td>采集到栏目：</td>
            <td>
              <asp:DropDownList ID="NodeIDDropDownList" runat="server"></asp:DropDownList>
            </td>
          </tr>
          <tr>
            <td>采集内容数：</td>
            <td>
              <asp:TextBox class="input-mini" Columns="4" MaxLength="4" id="GatherNum" Style="text-align:right" Text="0" runat="server"/>
              <asp:RequiredFieldValidator
                ControlToValidate="GatherNum"
                errorMessage=" *" foreColor="red" 
                Display="Dynamic"
                runat="server"/>
              <asp:RegularExpressionValidator
                ControlToValidate="GatherNum"
                ValidationExpression="\d+"
                ErrorMessage="采集数只能是数字"
                Display="Dynamic"
                runat="server"/>
              <br>
              <span>需要采集的内容数，0代表采集所有内容</span>
            </td>
          </tr>
          <tr>
            <td>不经过审核：</td>
            <td>
              <asp:RadioButtonList id="IsChecked" RepeatDirection="Horizontal" class="radiobuttonlist" runat="server">
                <asp:ListItem Value="True" Selected="true">是</asp:ListItem>
                <asp:ListItem Value="False">否</asp:ListItem>
              </asp:RadioButtonList>
              <span>采集的内容是否不经过审核直接添加到栏目中</span>
            </td>
          </tr>
        </table>
      </asp:PlaceHolder>
      <asp:PlaceHolder id="GatherDatabaseLogin" runat="server" Visible="false">
        <table class="table noborder table-hover">
          <tr>
            <td width="170">数据库类型：</td>
            <td>
              <asp:DropDownList ID="DatabaseType" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DatabaseType_Changed"></asp:DropDownList>
            </td>
          </tr>
          <tr id="DatabaseServerRow" runat="server">
            <td>IP地址或者服务器名：</td>
            <td>
              <asp:TextBox id="DatabaseServer" runat="server" Columns="40" MaxLength="200" value="(local)"></asp:textbox>
              <br>
              <span>数据库所在的IP地址或者服务器名</span>
            </td>
          </tr>
          <tr id="DatabaseFilePathRow" runat="server">
            <td>数据库文件路径：</td>
            <td><asp:TextBox id="DatabaseFilePath" runat="server" Columns="40" MaxLength="200"></asp:textbox>
              <br />
              <span>以“~/”开头代表系统根目录，以“@/”开头代表站点根目录</span>
            </td>
          </tr>
          <tr>
            <td>登录账号：</td>
            <td>
              <asp:TextBox id="UserName" style="width:150px;" runat="server"></asp:TextBox>
            </td>
          </tr>
          <tr>
            <td>登录密码：</td>
            <td>
              <asp:TextBox id="Password" style="width:150px;" runat="server" TextMode="Password"></asp:textbox>
              <input type="hidden" runat="server" id="PasswordHidden" />
              <input type="hidden" runat="server" id="DatabaseNameHidden" />
              <input type="hidden" runat="server" id="RelatedTableNameHidden" />
              <input type="hidden" runat="server" id="RelatedIdentityHidden" />
              <input type="hidden" runat="server" id="RelatedOrderByHidden" />
            </td>
          </tr>
        </table>
      </asp:PlaceHolder>
      <asp:PlaceHolder id="GatherRelatedTable" runat="server" Visible="false">
        <table class="table noborder table-hover">
          <tr id="DatabaseNameRow" runat="server">
            <td width="170">采集数据库名称：</td>
            <td>
              <asp:DropDownList ID="DatabaseName" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DatabaseName_Changed"></asp:DropDownList>
            </td>
          </tr>
          <tr>
            <td>采集表名称：</td>
            <td>
              <asp:DropDownList ID="RelatedTableName" runat="server" AutoPostBack="true" OnSelectedIndexChanged="RelatedTable_Changed"></asp:DropDownList>
            </td>
          </tr>
          <tr>
            <td>主键字段名称：</td>
            <td>
              <asp:DropDownList ID="RelatedIdentity" runat="server"></asp:DropDownList>
            </td>
          </tr>
          <tr>
            <td>排序字段名称：</td>
            <td>
              <asp:DropDownList ID="RelatedOrderBy" runat="server"></asp:DropDownList>
            </td>
          </tr>
          <tr>
            <td>倒序采集：</td>
            <td>
              <asp:RadioButtonList id="IsOrderByDesc" RepeatDirection="Horizontal" class="noborder" runat="server">
                <asp:ListItem Value="True" Selected="true">是</asp:ListItem>
                <asp:ListItem Value="False">否</asp:ListItem>
              </asp:RadioButtonList>
            </td>
          </tr>
          <tr>
            <td>Where条件语句：</td>
            <td>
              <asp:TextBox ID="WhereString" runat="server" TextMode="MultiLine" Rows="4" Columns="60"></asp:TextBox>
            </td>
          </tr>
        </table>
      </asp:PlaceHolder>
      <asp:PlaceHolder id="GatherTableMatch" runat="server" Visible="false">

        <input type="hidden" id="TableMatchIDHidden" runat="server" />
        <table class="table noborder table-hover">
          <tr>
            <td class="align-right">
              采集数据库：<asp:Literal ID="TableName" runat="server"></asp:Literal>
            </td>
            <td width="50"></td>
            <td>
              内容数据库：<asp:Literal ID="TableNameToMatch" runat="server"></asp:Literal>
            </td>
          </tr>
          <tr>
            <td class="align-right">
              <asp:ListBox ID="Columns" runat="server" SelectionMode="Single" Rows="14" style="width:auto"></asp:ListBox>
            </td>
            <td>
              <p><asp:Button class="btn" id="Add" text=" <- " onclick="Add_OnClick" runat="server" /></p>
              <p><asp:Button class="btn" id="Delete" text=" -> " onclick="Delete_OnClick" runat="server" /></p>
            </td>
            <td>
              <asp:ListBox ID="ColumnsToMatch" runat="server" SelectionMode="Single" Rows="14" style="width:auto"></asp:ListBox>
            </td>
          </tr>
        </table>
      </asp:PlaceHolder>
      <asp:PlaceHolder id="Done" runat="server" Visible="false">

        <blockquote>
          <p>完成!</p>
          <small>操作成功。</small>
        </blockquote>

      </asp:PlaceHolder>
      <asp:PlaceHolder id="OperatingError" runat="server" Visible="false">

        <blockquote>
          <p>发生错误</p>
          <small>执行向导过程中出错</small>
        </blockquote>

        <div class="alert alert-error">
          <h4><asp:Label ID="ErrorLabel" runat="server"></asp:Label></h4>
        </div>

      </asp:PlaceHolder>
  
      <hr />
      <table class="table noborder">
        <tr>
          <td class="center">
            <asp:Button class="btn" ID="Previous" OnClick="PreviousPanel" runat="server" Text="< 上一步"></asp:Button>
            <asp:Button class="btn btn-primary" id="Next" onclick="NextPanel" runat="server" text="下一步 >"></asp:button>
          </td>
        </tr>
      </table>
  
    </div>
  </div>

</form>
</body>
</html>
<!-- check for 3.6 html permissions -->
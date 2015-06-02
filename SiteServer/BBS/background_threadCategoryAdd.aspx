<%@ Page Language="C#" Inherits="SiteServer.BBS.BackgroundPages.BackgroundThreadCategoryAdd" %>

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

  <script>
  function setOptionColor(obj) {
    for (var i=0;i<obj.options.length;i++) {
      if (obj.options[i].value=="") 
        obj.options[i].style.color="gray";
      else
        obj.options[i].style.color="black";
    }
  }
  </script>

  <div class="popover popover-static">
    <h3 class="popover-title"><asp:Literal id="ltlPageTitle" runat="server" /></h3>
    <div class="popover-content">
    
      <table class="table noborder table-hover">
        <tr>
          <td width="170"><bairong:help HelpText="分类所属版块" Text="分类所属版块：" runat="server" ></bairong:help></td>
          <td>
            <asp:DropDownList ID="ddlForumIDList" runat="server"></asp:DropDownList>
            <asp:RequiredFieldValidator ControlToValidate="ddlForumIDList" ErrorMessage=" *" foreColor="red" Display="Dynamic" runat="server"/>
            <script type="text/javascript" language="javascript">
            setOptionColor(document.getElementById('<%=ddlForumIDList.ClientID%>'));
            </script>  
          </td>
        </tr>
        <tr>
          <td width="170"><bairong:help HelpText="分类名称" Text="分类名称：" runat="server" ></bairong:help></td>
          <td>
            <asp:TextBox  Columns="40" MaxLength="200" id="txtCategoryName" runat="server" />  
              <asp:RegularExpressionValidator runat="server" ControlToValidate="txtCategoryName"
                  ValidationExpression="[^']+" errorMessage=" *" foreColor="red" display="Dynamic" />
          </td>
        </tr> 
        <tr>
          <td width="170"><bairong:help HelpText="简 介" Text="简 介：" runat="server" ></bairong:help></td>
          <td>
            <asp:TextBox  TextMode="MultiLine" width="90%" Rows="5" MaxLength="1000" id="txtSummary" runat="server" />  
          </td>
        </tr>
      </table>
  
      <hr />
      <table class="table noborder">
        <tr>
          <td class="center">
            <asp:Button class="btn btn-primary" id="Submit" text="确 定" onclick="Submit_OnClick" runat="server" />
            <input class="btn" type="button" onClick="location.href='background_threadCategory.aspx';return false;" value="返 回" />
          </td>
        </tr>
      </table>
  
    </div>
  </div>

</form>
</body>
</html>
<!-- check for 3.6 html permissions -->
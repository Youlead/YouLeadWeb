<%@ Page Language="C#" validateRequest="false" Inherits="SiteServer.CMS.BackgroundPages.Modal.ChannelAdd" Trace="false"%>

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

  <script language="javascript">
  function selectChannel(nodeNames, nodeID){
      $('#nodeNames').html(nodeNames);
      $('#nodeID').val(nodeID);
  }
  </script>

  <table class="table noborder">
    <tr>
      <td width="80"> 父栏目： </td>
      <td><div class="fill_box">
          <div class="addr_base addr_normal"> <b id="nodeNames"></b>
            <input id="nodeID" name="nodeID" value="0" type="hidden">
          </div>
        </div>
        <div ID="divSelectChannel" class="btn_pencil" runat="server"><span class="pencil"></span>　选择</div>
      <asp:Literal ID="ltlSelectChannelScript" runat="server"></asp:Literal>
      </td>
    </tr>
    <tr>
      <td>内容模型：</td>
      <td><asp:DropDownList ID="ContentModelID" runat="server"></asp:DropDownList></td>
    </tr>
    <tr>
      <td colspan="2">
        <div class="alert alert-info">
          栏目之间用换行分割，下级栏目在栏目前添加“－”字符，索引可以放到括号中，如： <br>
          栏目一(栏目索引)<br>
          －下级栏目(下级索引)<br>
          －－下下级栏目
        </div>
      </td>
    </tr>
    <tr>
      <td colspan="2" class="center"><asp:TextBox style="width:98%;height:240px" TextMode="MultiLine" id="NodeNames" runat="server"/></td>
    </tr>
  </table>

</form>
</body>
</html>
<!-- check for 3.6 html permissions -->
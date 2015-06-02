<%@ Page Language="C#" Inherits="BaiRong.BackgroundPages.BackgroundUserConfigDisplay" %>

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

  <bairong:code type="ajaxUpload" runat="server" />

  <div class="popover popover-static">
  <h3 class="popover-title">显示设置</h3>
  <div class="popover-content">
    
    <table class="table noborder table-hover">
      <tr>
        <td width="150">系统名称：</td>
        <td><asp:TextBox ID="tbSystemName" runat="server"></asp:TextBox>
          <asp:RequiredFieldValidator
			ControlToValidate="tbSystemName"
			ErrorMessage=" *" foreColor="red"
			Display="Dynamic"
			runat="server"
			/></td>
      </tr>
      <tr>
        <td width="120">是否设置LOGO：</td>
        <td><asp:DropDownList ID="ddlIsLogo" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlIsLogo_SelectedIndexChanged"></asp:DropDownList></td>
      </tr>
      <tr>
        <td width="120">LOGO：</td>
        <td><asp:Literal ID="ltlLogoUrl" runat="server"></asp:Literal></td>
      </tr>
      <asp:PlaceHolder ID="phLogo" runat="server">
        <tr>
          <td width="120">选择图片：</td>
          <td><div id="uploadFile" class="btn btn-success">选 择</div>
            <span id="img_upload_txt" style="clear:both; font-size:12px; color:#FF3737;"></span></td>
        </tr>
        <script type="text/javascript" language="javascript">
		var timeoutID;
		$(document).ready(function(){
			new AjaxUpload('uploadFile', {
			 action: "background_userConfigDisplay.aspx?uploadLogo=true",
			 name: "Filedata",
			 data: {},
			 onSubmit: function(file, ext) {
				 var reg = /^(gif|jpg|jpeg|png)$/i;
				 if (ext && reg.test(ext)) {
					 $('#img_upload_txt').text('上传中... ');
					 timeoutID = window.setTimeout(function () {
						 location.reload();
					 }, 4000);
				 } else {
					 $('#img_upload_txt').text('系统不允许上传指定的格式');
					 return false;
				 }
			 },
			 onComplete: function(file, response) {
				$('#img_upload_txt').text(' ');
				 if (response) {
					 response = eval("(" + response + ")");
					 if (response.success == 'true') {
						 $('#logoUrl').attr('src', response.logoUrl);
						 window.clearTimeout(timeoutID);
					 } else {
						 $('#img_upload_txt').text(response.message);
					 }
				 }
			 }
			});
		});
		</script>
      </asp:PlaceHolder>
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
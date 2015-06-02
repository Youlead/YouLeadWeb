<%@ Page Language="c#" Inherits="SiteServer.BBS.Pages.Dialog.Post" Trace="False" %>
<%@ Import namespace="SiteServer.BBS.Core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/tr/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link href="../css/share.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="../js/jquery.form.js"></script>
<script type="text/javascript" src="../js/jquery.bgiframe.min.js"></script>
<script type="text/javascript" src="../js/jquery.loading.js"></script>
<script type="text/javascript" src="<%=GetBBSUrl()%>/editor/kindeditor-min.js"></script>
<script type="text/javascript" src="../js/editor.js"></script>
<script>
function gotoAdvancedUrl() {
	Storage.save('title', $('#title', $('#contentForm')).val());
	Storage.save('content', $('#content', $('#contentForm')).val());
	window.top.location = '<%=GetPostPageUrl()%>';
}
function onDialogPostSubmit(form) {
	KE.sync("content");
	if($('#content', form).val() == '') {
		failureMessage('请填写内容', function(){KE.util.focus("content");});
	} else {
		loading = new ol.loading();
		loading.show();
		$(form).ajaxSubmit({
			dataType: 'json',
			success: function(data) { 
				loading.hide();
				if (data.success == 'true'){
					window.top.hideDialog();
					if (data.page == "false"){
						window.top.location.reload(false);
					}else{
						window.top.location.href = data.url;
					}
				}else{
					failureMessage(data.errorMessage);
				}
			}
		});
	}
}
KE.show({
	id : 'content',
	imageUploadJson : '../editor/upload_json.ashx',
	allowFileManager : false,
	items : ['fontname', 'fontsize', '|', 'textcolor', 'bgcolor', 'bold', 'italic', 'underline', 'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist', '|', 'emoticons', 'image', 'media', 'link'],
	afterCreate : function(id) {
		KE.event.ctrl(document, 13, function() {
			KE.util.setData(id);
			onDialogPostSubmit(document.forms['contentForm']);
		});
		KE.event.ctrl(KE.g[id].iframeDoc, 13, function() {
			KE.util.setData(id);
			onDialogPostSubmit(document.forms['contentForm']);
		});
	}
});
</script>
</head>
<body>
<form id="contentForm" onsubmit="onDialogPostSubmit(this);return false;" action="../ajax/form.aspx?publishmentSystemID=<%=Request.QueryString["publishmentSystemID"]%>&action=postAllInOne" method="post">
  <input id="forumID" name="forumID" type="hidden" value="<%=base.forumID%>" />
  <input id="threadID" name="threadID" type="hidden" value="<%=base.threadID%>" />
  <input id="postID" name="postID" type="hidden" value="<%=base.postID%>" />
  <input id="postType" name="postType" type="hidden" value="<%=base.postType%>" />
  <div class="container">
    <table>
      <tr>
        <td valign="top" style="padding:5px;"><div class="posting_function" style="width:450px;">
            <div style="padding:5px;">
              <input id="title" name="title" type="text" class="txtTitle" value="<%=base.GetTitle()%>" style="width:350px;" />
              <span class="share_right">&nbsp;<a href="javascript:;" onclick="gotoAdvancedUrl();">高级模式</a></span>
            </div>
            <div style="padding:5px;">
            <asp:PlaceHolder ID="phReference" Visible="false" runat="server">
            <div class="reg" style="padding-left:20px; line-height:15px;padding-bottom:5px;"><asp:Literal ID="ltlReference" runat="server"></asp:Literal></div>
            </asp:PlaceHolder>
              <textarea id="content" name="content" cols="100" rows="8" style="width:440px;height:170px;visibility:hidden;"><%=base.GetContent()%></textarea>
            </div>
            <asp:PlaceHolder ID="phVerifyCode" runat="server">
            <div style="padding-left:5px;"> 验证码：
              <input id="verifyCode" name="verifyCode" type="text" class="txtTitle" maxlength="4" style="width:50px;" />
              <img src="<%=UserUtils.PostVerifyCodeImageUrl%>"/> </div>
            </asp:PlaceHolder>
            <input type="submit" value="提交" class="submit_btn"/>
          </div>
          <div id="face_right" class="face_right" style="width:250px;">
            <div id="tabs" class="face_tit">
              <ul>
                <asp:Literal ID="ltlFaceLinks" runat="server"></asp:Literal>
              </ul>
            </div>
            <div id="tab-contents">
              <asp:Literal ID="ltlFaceDefaultContents" runat="server"></asp:Literal>
            </div>
          </div></td>
      </tr>
    </table>
  </div>  
</form>
<link href="../css/popout.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
var bbsUrl = '..';
</script>
<script type="text/javascript" src="../js/popout.js"></script>
<asp:Literal ID="ltlScripts" runat="server"></asp:Literal>
</body>
</html>
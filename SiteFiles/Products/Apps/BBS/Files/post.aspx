<%@ Page language="c#" Inherits="SiteServer.BBS.Pages.PostPage" EnableViewState="false" %>
<%@ Import namespace="SiteServer.BBS.Core" %>
<%@ Import namespace="SiteServer.BBS.Model" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>SiteServer BBS 论坛 - Powered by SiteServer BBS</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=8" />
<link href="css/share.css" rel="stylesheet" type="text/css">
<link href="css/theme.css" rel="stylesheet" type="text/css">
<link href="/bbs_test/css/dialog.css" rel="stylesheet" type="text/css">
<link href="/bbs_test/css/popout.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/bbs_test/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="/bbs_test/js/jquery.form.js"></script>
<script type="text/javascript" src="/bbs_test/js/jquery.bgiframe.min.js"></script>
<script type="text/javascript" src="/bbs_test/js/jquery.loading.js"></script>
<script type="text/javascript">
var bbsUrl = '/bbs_test';var loading;var publishmentSystemID = 866;</script>
<script type="text/javascript" src="/bbs_test/js/bbs.js"></script>
<script type="text/javascript" src="/bbs_test/js/ready.js"></script>
<script runat="server">
protected override void OnInit(EventArgs e)
{
    base.PublishmentSystemID = 866;
    base.OnInit(e);
}
</script>
<%if (base.IsFullScreen){%><link href="/bbs_test/css/fullscreen.css" rel="stylesheet" type="text/css"><%}%>
<script type="text/javascript" language="javascript" src="js/jquery.idTabs.min.js"></script>
<link href="js/jquery_select/selectStyle.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery_select/jquery.select-1.3.6.js"></script>
<script type="text/javascript" src="js/jquery.upload.js"></script>
<script type="text/javascript" src="editor/kindeditor-min.js"></script>
<script type="text/javascript" src="js/editor.js"></script>

<%if (base.isPoll){%><link href="css/vote.css" rel="stylesheet" type="text/css" /><script language="javascript" type="text/javascript" src="js/DatePicker/WdatePicker.js"></script><script language="javascript" type="text/javascript">
  function addItems(){
    if (document.getElementById('voteItems2').style.display == "none"){
        $('#voteItems2').show();
    }else if (document.getElementById('voteItems3').style.display == "none"){
        $('#voteItems3').show();
    }else if (document.getElementById('voteItems4').style.display == "none"){
        $('#voteItems4').show();
        $('#vote_addicon').hide();
    }
  }
</script><%}%>

<script language="javascript" type="text/javascript">
KE.show({
	id : 'content',
	imageUploadJson : '/bbs_test/editor/upload_json.ashx?publishmentSystemID=866',
	allowFileManager : false,
	items : [
		'fullscreen', 'undo', 'redo', 'print', 'cut', 'copy', 'paste',
		'plainpaste', 'wordpaste', '|', 'justifyleft', 'justifycenter', 'justifyright',
		'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', 'subscript',
		'superscript', '|', 'selectall', '-',
		'title', 'fontname', 'fontsize', '|', 'textcolor', 'bgcolor', 'bold',
		'italic', 'underline', 'strikethrough', 'removeformat', '|', 'image',
		'flash', 'media', 'advtable', 'hr', 'emoticons', 'link', 'unlink', '|', 'ubb_code', 'ubb_hide'
	],
	afterCreate : function(id) {
		KE.event.ctrl(document, 13, function() {
			KE.util.setData(id);
			onPostPageSubmit(document.forms['contentForm']);
		});
		KE.event.ctrl(KE.g[id].iframeDoc, 13, function() {
			KE.util.setData(id);
			onPostPageSubmit(document.forms['contentForm']);
		});
	}
});
$(document).ready(function(){
	if (Storage.load('title')){
		$('#title', $('#contentForm')).val(Storage.load('title'));
		Storage.save('title', '', 1);
	}
	if (Storage.load('content')){
		$('#content', $('#contentForm')).val(Storage.load('content'));
		Storage.save('content', '', 1);
	}
});
</script>
</head>
<body>
<script type="text/javascript" src="/bbs_test/js/dialog.js"></script>
<script type="text/javascript" src="/bbs_test/js/popout.js"></script>
<div id="header">
  <div class="hd">
    <div class="header_left">
      <div class="header_logo">
        <a href="/bbs_test/default.aspx"><img src="/bbs_test/images/logo.png" /></a>
      </div>
      <div class="navigation">
        <ul>
        <li class="nav_cur"><a href="/bbs_test/default.aspx" style="" target="">论坛</a></li>
        </ul>
      </div>
    </div>
    <div class="use_area">
      
<%if (UserUtils.IsAnonymous){%><form id="loginForm" onsubmit="onLoginSubmit(this);return false;" action="/bbs_test/ajax/form.aspx?publishmentSystemID=866&action=login" method="post"><div id="login"><div class="logindiv"><div class="login1"><p><label for="ls_username">帐号&nbsp;</label><input id="userName" name="userName" tabindex="1" class="px vm" value="用户名" type="text"><label class="fl"><input type="checkbox" id="persistent" name="persistent" checked="checked" value="true">
                      记住</input></label></input></p><p><label for="ls_password">密码&nbsp;</label><input id="password" name="password" tabindex="2" class="px vm" type="password" autocomplete="off">
                    &nbsp;
                    <input type="image" src="/bbs_test/images/login.gif" align="middle" /></input></p></div><div class="login2"></div><div class="login3">
<%if (base.IsRegisterAllowed){%><p><a id="a_register" class="register" href="javascript:void(0);">注册新用户</a></p><%}%>
<p><a id="a_forget" href="javascript:void(0);">忘记密码？</a></p></div><div style="clear:both"></div></div></div></form>
<%if (UserUtils.IsThirdLogin){%><div class="thirdLogin"><a href="<%=UserUtils.GetThirdLoginUrl(this.Request.RawUrl)%>"><img src="/bbs_test/images/thirdLogin.png" /></a></div><%}%>
<%}else{%><div id="loggedIn"><div class="use_img"><a href="/bbs_test/my/avatar.aspx"><img src="<%=UserUtils.GetUserAvatarSmallUrl(UserUtils.UserName)%>" /></a></div><div class="use_left"><div class="use_font"><span class="use_name"><%=UserUtils.DisplayName%></span> | <a href="<%=UserUtils.GetLogoutUrl(this.Request.RawUrl)%>">退出</a><span class="use_other">积分：
                <%=UserUtils.GetCredits(UserUtils.UserName)%></span><span class="use_other">用户组：
                <%=UserUtils.GetGroupName(UserUtils.UserName)%></span></div><div id="seleMenu" class="pop"><ul><li style="visibility:hidden"><!--<a href="/usercenter/index.aspx#0,4" target="_blank">短消息</a>--></li><li id="liB" class="liB"><a href="/bbs_test/userlist.aspx">好友</a></li><li id="liC" class="liC libg"><a href="javascript:;">设置</a><div class="seleMenu"><div class="seleLay"></div><div class="seleCon"><p><a href="/bbs_test/my/avatar.aspx">修改头像</a></p><p><a href="/bbs_test/my/profile.aspx">个人资料</a></p><p><a href="/bbs_test/my/credits.aspx">积分</a></p><p><a href="/bbs_test/my/password.aspx">密码安全</a></p><p><a href="/bbs_test/my/permission.aspx">用户权限</a></p></div></div></li><li id="liD" class="liD libg"><a href="javascript:;">我的中心</a><div class="seleMenu"><div class="seleLay"></div><div class="seleCon">
<%if (UserUtils.IsModerator){%><p><a href="/bbs_test/handle.aspx" target="_blank">新帖监控</a></p><%}%>
<p><a href="/bbs_test/mypost.aspx" target="_blank">我的帖子</a></p></div></div></li></ul></div></div></div><%}%>

    </div>
    <div class="nav_fu">
      <ul>
        
      </ul>
      <div class="search">
        <form action="/bbs_test/search.aspx">
        <input id="word" name="word" value="请输入搜索条件" class="sea_input"/>
        <input type="submit"  value="" class="sear_btn"/>
        </form>
      </div>
      <!--<div class="nav_hot"><span class="hot_tit">热搜：</span><a href="thread.aspx">明星</a>|<a href="thread.aspx">名人</a>|<a href="thread.aspx">谈客</a></div>-->
    </div>
  </div>
</div>
<div id="ajaxLoading" style="position:absolute">请稍后...</div>
<div class="hd">
  <div id="ad_navbanner" class="adv_area"></div>
</div>
<div class="hd">
  <div class="share_position">
    <span class="share_right"><a href="/bbs_test/search.aspx?orderBy=addDate&totalNum=100">查看新帖</a>|<a href="/bbs_test/search.aspx?type=digest&totalNum=100">精华帖</a>|<a href="/bbs_test/search.aspx?type=image&totalNum=100">图片贴</a></span>
    <div class="share_p"><img src="images/ico_position.gif" />
    <%--<a href="/BBS">论坛</a>--%>
    <asp:HyperLink ID="bbslost" runat="server" >论坛</asp:HyperLink>>
    <a href="#">帖子操作</a></div>
  </div>
  <div class="share_area">
    <div class="share_tit">
      <h3>
        <asp:Literal ID="ltlOperate" runat="server"></asp:Literal>
      </h3>
    </div>
    <div class="share_table" style="padding:0px;">
      <form id="contentForm" onsubmit="onPostPageSubmit(this);return false;" action="/bbs_test/ajax/form.aspx?publishmentSystemID=866&action=postAllInOne" method="post">
        <input id="forumID" name="forumID" type="hidden" value="<%=base.forumID%>" />
        <input id="threadID" name="threadID" type="hidden" value="<%=base.threadID%>" />
        <input id="postID" name="postID" type="hidden" value="<%=base.postID%>" />
        <input id="postType" name="postType" type="hidden" value="<%=base.postType%>" />
        <input id="fileCount" name="fileCount" type="hidden" value="<%=base.fileCount%>" />
        <table cellspacing="0" cellpadding="0">
          <tr>
            <td valign="top" class="post_left"><h3 style="padding-left:20px"><%=UserUtils.UserName%></h3>
              <div class="avatar"><a href="<%=UserUtils.GetUserUrl(UserUtils.UserName)%>" target="_blank"><img src="<%=UserUtils.GetUserAvatarMiddleUrl(UserUtils.UserName)%>" width="120" height="120" /></a></div></td>
            <td valign="top" style="padding:10px;"><table>
                <tr>
                  <td><div style="padding:5px;"> <%=GetCategorySelectHtml()%>
                      <input id="title" name="title" type="text" class="txtTitle" value="<%=base.GetTitle()%>" />
                    </div></td>
                </tr>
                
<%if (base.isPoll){%><tr><td><div class="lv_form"><fieldset><p class="lv_mt">投票选项：<span class="gray9">可设置最多20项，每项最多20个汉字</span></p><p class="lv_inputsub"><span>1.</span><input type="text" id="PollItems1" name="PollItems"></input></p><p class="lv_inputsub"><span>2.</span><input type="text" id="PollItems2" name="PollItems"></input></p><p class="lv_inputsub"><span>3.</span><input type="text" id="PollItems3" name="PollItems"></input></p><p class="lv_inputsub"><span>4.</span><input type="text" id="PollItems4" name="PollItems"></input></p><p class="lv_inputsub"><span>5.</span><input type="text" id="PollItems5" name="PollItems"></input></p><div id="voteItems2" style="display:none"><p class="lv_inputsub"><span>6.</span><input type="text" id="PollItems6" name="PollItems"></input></p><p class="lv_inputsub"><span>7.</span><input type="text" id="PollItems7" name="PollItems"></input></p><p class="lv_inputsub"><span>8.</span><input type="text" id="PollItems8" name="PollItems"></input></p><p class="lv_inputsub"><span>9.</span><input type="text" id="PollItems9" name="PollItems"></input></p><p class="lv_inputsub"><span>10.</span><input type="text" id="PollItems10" name="PollItems"></input></p></div><div id="voteItems3" style="display:none"><p class="lv_inputsub"><span>11.</span><input type="text" id="PollItems11" name="PollItems"></input></p><p class="lv_inputsub"><span>12.</span><input type="text" id="PollItems12" name="PollItems"></input></p><p class="lv_inputsub"><span>13.</span><input type="text" id="PollItems13" name="PollItems"></input></p><p class="lv_inputsub"><span>14.</span><input type="text" id="PollItems14" name="PollItems"></input></p><p class="lv_inputsub"><span>15.</span><input type="text" id="PollItems15" name="PollItems"></input></p></div><div id="voteItems4" style="display:none"><p class="lv_inputsub"><span>16.</span><input type="text" id="PollItems16" name="PollItems"></input></p><p class="lv_inputsub"><span>17.</span><input type="text" id="PollItems17" name="PollItems"></input></p><p class="lv_inputsub"><span>18.</span><input type="text" id="PollItems18" name="PollItems"></input></p><p class="lv_inputsub"><span>19.</span><input type="text" id="PollItems19" name="PollItems"></input></p><p class="lv_inputsub"><span>20.</span><input type="text" id="PollItems20" name="PollItems"></input></p></div><p id="vote_addicon"><span class="vote_addicon"></span><a href="javascript:;" onclick="addItems()">增加选项</a></p><p><span class="lv_results">投票结果：</span><input type="radio" name="IsVoteFirst" value="False" checked="checked" class="lv_input2"><label class="label12">任何人可见</label><input type="radio" name="IsVoteFirst" value="True" class="lv_input2"><label class="label12">投票后可见</label></input></input></p><p><label for="">单选/多选：</label><select id="MaxNum" name="MaxNum"><option selected="selected" value="1">单选</option><option value="0">多选</option></select></p><p><label for="">截止时间：</label><input type="text" value="<%=GetPollDeadline()%>" class="lv_calendar" name="Deadline" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm',isShowClear:false})"></input></p></fieldset><asp:Literal ID="ltlPollScript" runat="server"></asp:Literal></div></td></tr><%}%>

                <tr>
                  <td><div style="padding:5px;">
                      <asp:PlaceHolder ID="phReference" Visible="false" runat="server">
                        <div class="reg" style="padding-left:20px; line-height:15px;padding-bottom:5px;">
                          <asp:Literal ID="ltlReference" runat="server"></asp:Literal>
                        </div>
                      </asp:PlaceHolder>
                      <textarea id="content" name="content"  style="width:100%;height:350px;visibility:hidden;"><%=base.GetContent()%></textarea>
                    </div></td>
                </tr>
                <tr>
                  <td><div class="posting_function">
                      <div id="filetabs">
                        <ul class="tab cl">
                          <li><a class="selected" href="#filetab1">上传附件(图片)</a></li>
                          <li><a href="#filetab2">更多选项</a></li>
                        </ul>
                        <div class="tabContent" id="filetab1">
                          <script type="text/javascript" src="js/swfUpload/swfupload.js"></script>
<script type="text/javascript" src="js/swfUpload/handlers.js"></script>
<script type="text/javascript">
function uploadSuccess(file, response) {
	if (response) {
	 response = eval("(" + response + ")");
	 
	 if (response.success == 'true') {
		addToList(response.id, response.fileName, response.tips, response.description, response.price);
	 } else {
		 $('#img_upload_txt').text(response.message);
	 }
	}
}

function addToList(id, fileName, tips, description, price){
	var count = parseInt($('#fileCount').val()) + 1;
	var $el = $('<tr id="fileTr_' + count + '">' + $('#fileTr_0').html().replace(/_0/g, '_' + count) + '</tr>');
	$el.insertAfter($('#fileTr_' + (count - 1)));
	$('#fileID_' + count).val(id);
	$('#fileLink_' + count).html(fileName);
	$('#fileLink_' + count).attr('title', tips);
	$('#fileLink_' + count).click(function(){
		KE.insertHtml('content', "[attachment id=" + id + "]");
	});
	$('#fileDescription_' + count).val(description);
	$('#filePrice_' + count).val(price);
	$('#fileCount').val(count);
}

function removeFromList(trID){
	$(trID).remove();
	var count = parseInt($('#fileCount').val());
	$('#fileCount').val(count - 1);
}

var swfu;
$(document).ready(function(){
	$("select").sSelect();
	$("#filetabs ul").idTabs();
	
	if (navigator.userAgent.indexOf("Firefox")== -1){
		swfu = new SWFUpload({
		// Backend Settings
		upload_url: "/bbs_test/ajax/upload.aspx?publishmentSystemID=" + publishmentSystemID,
	
		// File Upload Settings
		file_size_limit : "2 MB",
		file_types : "<%=GetUploadTypes(false)%>",
		file_types_description : "附件",
		file_upload_limit : 0,    // Zero means unlimited
	
		// Event Handler Settings - these functions as defined in Handlers.js
		//  The handlers are not part of SWFUpload but are part of my website and control how
		//  my website reacts to the SWFUpload events.
		swfupload_preload_handler : preLoad,
		swfupload_load_failed_handler : loadFailed,
		file_queue_error_handler : fileQueueError,
		file_dialog_complete_handler : fileDialogComplete,
		upload_error_handler : uploadError,
		upload_success_handler : uploadSuccess,
		upload_complete_handler : uploadComplete,
	
		// Button settings
		button_image_url : "js/swfUpload/button.png",
		button_placeholder_id : "swfUploadPlaceholder",
		button_width: 114,
		button_height: 22,
		button_text : '多个文件上传',
		button_text_top_padding: 1,
		button_text_left_padding: 5,
	
		// Flash Settings
		flash_url : "js/swfUpload/swfupload.swf",	// Relative to this file
		flash9_url : "js/swfUpload/swfupload_FP9.swf",	// Relative to this file
	
		// Debug Settings
		debug: false
		});	
	}
	
	new AjaxUpload('uploadFile', {
	 action: "ajax/upload.aspx?publishmentSystemID" + publishmentSystemID,
	 name: "Filedata",
	 data: {},
	 onSubmit: function(file, ext) {
		 var reg = /^(<%=GetUploadTypes(true)%>)$/i;
		 if (ext && reg.test(ext)) {
			 $('#img_upload_txt').text('上传中... ');
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
				 addToList(response.id, response.fileName, response.tips, response.description, response.price);
			 } else {
				 $('#img_upload_txt').text(response.message);
			 }
		 }
	 }
	});	
	<%=GetAddToListScript()%>
});
</script>
<style>
.tab a {
	margin-top:-2px;
}
.upload {
	background-image:url(js/swfUpload/button.png);
	width:104px;
	height:18px;
	text-align:left;
	padding:2px 5px;
	cursor:default;
	text-decoration:none;
	display:block;
}
</style>
                          <table id="filesTable" width="100%">
                            <tr>
                              <td>文件名</td>
                              <td>描述</td>
                              <td>价格</td>
                              <td>&nbsp;</td>
                            </tr>
                            <tr id="fileTr_0" style="display:none">
                              <td><p><span>
                                  <input id="fileID_0" name="fileID" type="hidden" />
                                  <a id="fileLink_0" class="xi2" href="javascript:;"></a></span></p></td>
                              <td><input id="fileDescription_0" name="fileDescription" class="txt" size="18"></td>
                              <td><input id="filePrice_0" name="filePrice" class="txt" value="0" size="1"></td>
                              <td><a onclick="removeFromList(this.parentNode.parentNode)" href="javascript:;">删除</a></td>
                            </tr>
                          </table>
                          <p class=notice><%=GetUploadTips()%></p>
                          <br />
                          <table width="260" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td><a id="uploadFile" class="upload">单个文件上传</a></td>
                              <td><span id="swfUploadPlaceholder"></span></td>
                            </tr>
                          </table>
                          <span id="img_upload_txt" style="clear:both; font-size:12px; color:#FF3737;"></span> </div>
                        <div class="tabContent" id="filetab2">
                          <table width="100%">
                            <tr>
                              <td><ul>
                                  <li>
                                    <label for="isSignature">
                                      <input type="checkbox" id="isSignature" name="isSignature" value="true" checked />
                                      &nbsp;使用签名</label>
                                  </li>
                                </ul></td>
                              <td valign="top">&nbsp;</td>
                            </tr>
                          </table>
                        </div>
                        
<%if (base.isVerifyCode){%><div style="padding-left:10px">
                            验证码：
                            <input id="verifyCode" name="verifyCode" type="text" class="txtTitle" maxlength="4" style="width:50px;" /><img src="<%=UserUtils.PostVerifyCodeImageUrl%>" /></div><%}%>

                      </div>
                      <ul>
                        <li>
                          <input type="submit" value="提交" class="submit_btn"/>
                        </li>
                      </ul>
                    </div>
                    <div id="face_right" class="face_right">
                      <div id="tabs" class="face_tit">
                        <ul>
                          <li class="current"><a id="yoci" href="/bbs_test/ajax/face.aspx?publishmentSystemID=866&faceName=yoci">悠嘻猴</a></li><li><a id="tuzki" href="/bbs_test/ajax/face.aspx?publishmentSystemID=866&faceName=tuzki">兔斯基</a></li><li><a id="oniontou" href="/bbs_test/ajax/face.aspx?publishmentSystemID=866&faceName=oniontou">洋葱头</a></li>
                        </ul>
                      </div>
                      <div id="tab-contents">
                        <div id="tabs-yoci" class="face_info"><a href="javascript:void(0);"><img src="/bbs_test/smile/yoci/一无所有.gif" border="0" /></a><a href="javascript:void(0);"><img src="/bbs_test/smile/yoci/七窍生烟.gif" border="0" /></a><a href="javascript:void(0);"><img src="/bbs_test/smile/yoci/不可以.gif" border="0" /></a><a href="javascript:void(0);"><img src="/bbs_test/smile/yoci/不好意思.gif" border="0" /></a><a href="javascript:void(0);"><img src="/bbs_test/smile/yoci/不懂.gif" border="0" /></a><a href="javascript:void(0);"><img src="/bbs_test/smile/yoci/不给糖就捣蛋.gif" border="0" /></a><a href="javascript:void(0);"><img src="/bbs_test/smile/yoci/不至于吧.gif" border="0" /></a><a href="javascript:void(0);"><img src="/bbs_test/smile/yoci/不行了.GIF" border="0" /></a><a href="javascript:void(0);"><img src="/bbs_test/smile/yoci/不要了拉.gif" border="0" /></a><a href="javascript:void(0);"><img src="/bbs_test/smile/yoci/不要拉.gif" border="0" /></a><a href="javascript:void(0);"><img src="/bbs_test/smile/yoci/乖.gif" border="0" /></a><a href="javascript:void(0);"><img src="/bbs_test/smile/yoci/交给我吧.gif" border="0" /></a><a href="javascript:void(0);"><img src="/bbs_test/smile/yoci/什么问题.gif" border="0" /></a><a href="javascript:void(0);"><img src="/bbs_test/smile/yoci/体操.gif" border="0" /></a><a href="javascript:void(0);"><img src="/bbs_test/smile/yoci/你好.gif" border="0" /></a><a href="javascript:void(0);"><img src="/bbs_test/smile/yoci/健身.gif" border="0" /></a><div class="face_page"><span class="face_cur_page">1</span><a href="/bbs_test/ajax/face.aspx?publishmentSystemID=866&faceName=yoci&page=2">2</a><a href="/bbs_test/ajax/face.aspx?publishmentSystemID=866&faceName=yoci&page=3">3</a><a href="/bbs_test/ajax/face.aspx?publishmentSystemID=866&faceName=yoci&page=4">4</a><a href="/bbs_test/ajax/face.aspx?publishmentSystemID=866&faceName=yoci&page=5">5</a><a href="/bbs_test/ajax/face.aspx?publishmentSystemID=866&faceName=yoci&page=6">6</a><a href="/bbs_test/ajax/face.aspx?publishmentSystemID=866&faceName=yoci&page=7">7</a><a href="/bbs_test/ajax/face.aspx?publishmentSystemID=866&faceName=yoci&page=8">8</a><a href="/bbs_test/ajax/face.aspx?publishmentSystemID=866&faceName=yoci&page=9">9</a></div></div>
                      </div>
                    </div></td>
                </tr>
              </table></td>
          </tr>
        </table>
      </form>
    </div>
  </div>
</div>
<div class="hd">
  <div class="footer">
    <p>
    
    </p>
    <p id="copyright">Powered by <strong><a href="http://bbs.siteserver.cn">SiteServer BBS</a></strong> V4.0 BETA © 2003-2014 <a href="http://www.siteserver.cn">Bairongsoft Corporation</a>.</p>
  </div>
</div>
<div id="dialog_window" style="Z-INDEX: 300009; display: block; display:none; width: 400px; height: 288px; TOP: 79px; LEFT: 400px" class="window window_current">
  <div style="Z-INDEX: 26; height: 268px" id="dialog_outer" class="window_outer">
    <div style="Z-INDEX: 300009" id="window_inner" class="window_inner">
      <div class="window_bg_container">
        <div class="window_bg window_center"> </div>
        <div class="window_bg window_t"> </div>
        <div class="window_bg window_rt"> </div>
        <div class="window_bg window_r"> </div>
        <div class="window_bg window_rb"> </div>
        <div class="window_bg window_b"> </div>
        <div class="window_bg window_lb"> </div>
        <div class="window_bg window_l"> </div>
        <div class="window_bg window_lt"> </div>
      </div>
      <div class="window_content">
        <div id="window_titleBar_5" class="window_titleBar" style="cursor:move;" onmousedown = "moveDialog(event);">
          <div id="window_titleButtonBar_5" class="window_titleButtonBar"> <a style="display: block" id="dialog_close" class="ui_button window_action_button window_close" title="关闭" href="javascript:void(0);" hidefocus=""></a> </div>
          <div id="dialog_title" class="window_title titleText"></div>
        </div>
        <div style="width: 380px; height: 240px" id="dialog_body" class="window_bodyArea">
          <div style="height: 99%" id="login_window_content_area" class="content_area">
            <div id="dialog_tips_container" style="PADDING-LEFT: 2px; width: 100%; display: block; BACKGROUND-COLOR:#ffffe1;"> <span id="dialog_tips" style="float: left"></span><span style="display: inline; float: right; CURSOR: pointer; MARGIN-RIGHT: 5px" id="close_login_tip" onclick="this.parentNode.style.display='none';">ｘ</span> </div>
            <div class="login_window_wrap">
              <iframe hideFocus id="dialog_iframe" src="" frameBorder="no" allowTransparency scrolling="no"></iframe>
            </div>
          </div>
        </div>
        <div style="display: none" id="dialog_control" class="window_controlArea">
        <a style="display: block" id="dialog_cancel" class="ui_button window_button window_cancel" title="" href="javascript:void(0);" onclick="hideDialog();" hidefocus="">取消</a>
        <a style="display: block" id="dialog_ok" class="ui_button window_button window_ok" title="" href="javascript:void(0);" onclick="hideDialog();" hidefocus="">确定</a>
        </div>
      </div>
    </div>
  </div>
  <IFRAME class="fullscreen_bg_iframe" height="100%" width="100%"></IFRAME>
</div>
<asp:Literal ID="ltlScripts" runat="server"></asp:Literal>
</body>
</html>

<%@ Page language="c#" Inherits="SiteServer.BBS.Pages.PostPage" EnableViewState="false" %>
<%@ Import namespace="SiteServer.BBS.Core" %>
<%@ Import namespace="SiteServer.BBS.Model" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>{bbs.BBSName}</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=8" />
<link href="css/share.css" rel="stylesheet" type="text/css">
<link href="css/theme.css" rel="stylesheet" type="text/css">
<bbs:include file="include/css_js.html"></bbs:include>
<script type="text/javascript" language="javascript" src="js/jquery.idTabs.min.js"></script>
<link href="js/jquery_select/selectStyle.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery_select/jquery.select-1.3.6.js"></script>
<script type="text/javascript" src="js/jquery.upload.js"></script>
<script type="text/javascript" src="editor/kindeditor-min.js"></script>
<script type="text/javascript" src="js/editor.js"></script>
<bbs:run if="base.isPoll">
  <link href="css/vote.css" rel="stylesheet" type="text/css" />
  <script language="javascript" type="text/javascript" src="js/DatePicker/WdatePicker.js"></script>
  <script language="javascript" type="text/javascript">
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
</script>
</bbs:run>
<script language="javascript" type="text/javascript">
KE.show({
	id : 'content',
	imageUploadJson : '{bbs.editUploadUrl}',
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
<bbs:include file="include/header.html"></bbs:include>
<div class="hd">
  <div id="ad_navbanner" class="adv_area"></div>
</div>
<div class="hd">
  <div class="share_position">
    <bbs:include file="include/shareRight.html"></bbs:include>
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
      <form id="contentForm" onsubmit="onPostPageSubmit(this);return false;" action="{bbs.formUrl}postAllInOne" method="post">
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
                <bbs:run if="base.isPoll">
                  <tr>
                    <td><div class="lv_form">
                        <fieldset>
                          <p class="lv_mt">投票选项：<span class="gray9">可设置最多20项，每项最多20个汉字</span></p>
                          <p class="lv_inputsub"><span>1.</span>
                            <input type="text" id="PollItems1" name="PollItems">
                          </p>
                          <p class="lv_inputsub"><span>2.</span>
                            <input type="text" id="PollItems2" name="PollItems">
                          </p>
                          <p class="lv_inputsub"><span>3.</span>
                            <input type="text" id="PollItems3" name="PollItems">
                          </p>
                          <p class="lv_inputsub"><span>4.</span>
                            <input type="text" id="PollItems4" name="PollItems">
                          </p>
                          <p class="lv_inputsub"><span>5.</span>
                            <input type="text" id="PollItems5" name="PollItems">
                          </p>
                          <div id="voteItems2" style="display:none">
                            <p class="lv_inputsub"><span>6.</span>
                              <input type="text" id="PollItems6" name="PollItems">
                            </p>
                            <p class="lv_inputsub"><span>7.</span>
                              <input type="text" id="PollItems7" name="PollItems">
                            </p>
                            <p class="lv_inputsub"><span>8.</span>
                              <input type="text" id="PollItems8" name="PollItems">
                            </p>
                            <p class="lv_inputsub"><span>9.</span>
                              <input type="text" id="PollItems9" name="PollItems">
                            </p>
                            <p class="lv_inputsub"><span>10.</span>
                              <input type="text" id="PollItems10" name="PollItems">
                            </p>
                          </div>
                          <div id="voteItems3" style="display:none">
                            <p class="lv_inputsub"><span>11.</span>
                              <input type="text" id="PollItems11" name="PollItems">
                            </p>
                            <p class="lv_inputsub"><span>12.</span>
                              <input type="text" id="PollItems12" name="PollItems">
                            </p>
                            <p class="lv_inputsub"><span>13.</span>
                              <input type="text" id="PollItems13" name="PollItems">
                            </p>
                            <p class="lv_inputsub"><span>14.</span>
                              <input type="text" id="PollItems14" name="PollItems">
                            </p>
                            <p class="lv_inputsub"><span>15.</span>
                              <input type="text" id="PollItems15" name="PollItems">
                            </p>
                          </div>
                          <div id="voteItems4" style="display:none">
                            <p class="lv_inputsub"><span>16.</span>
                              <input type="text" id="PollItems16" name="PollItems">
                            </p>
                            <p class="lv_inputsub"><span>17.</span>
                              <input type="text" id="PollItems17" name="PollItems">
                            </p>
                            <p class="lv_inputsub"><span>18.</span>
                              <input type="text" id="PollItems18" name="PollItems">
                            </p>
                            <p class="lv_inputsub"><span>19.</span>
                              <input type="text" id="PollItems19" name="PollItems">
                            </p>
                            <p class="lv_inputsub"><span>20.</span>
                              <input type="text" id="PollItems20" name="PollItems">
                            </p>
                          </div>
                          <p id="vote_addicon"><span class="vote_addicon"></span><a href="javascript:;" onclick="addItems()">增加选项</a></p>
                          <p> <span class="lv_results">投票结果：</span>
                            <input type="radio" name="IsVoteFirst" value="False" checked="checked" class="lv_input2">
                            <label class="label12">任何人可见</label>
                            <input type="radio" name="IsVoteFirst" value="True" class="lv_input2">
                            <label class="label12">投票后可见</label>
                          </p>
                          <p>
                            <label for="">单选/多选：</label>
                            <select id="MaxNum" name="MaxNum">
                              <option selected="selected" value="1">单选</option>
                              <option value="0">多选</option>
                            </select>
                          </p>
                          <p>
                            <label for="">截止时间：</label>
                            <input type="text" value="<%=GetPollDeadline()%>" class="lv_calendar" name="Deadline"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm',isShowClear:false})">
                          </p>
                        </fieldset>
                        <asp:Literal ID="ltlPollScript" runat="server"></asp:Literal>
                      </div></td>
                  </tr>
                </bbs:run>
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
                          <bbs:include file="include/upload.html"></bbs:include>
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
                        <bbs:run if="base.isVerifyCode">
                          <div style="padding-left:10px">
                            验证码：
                            <input id="verifyCode" name="verifyCode" type="text" class="txtTitle" maxlength="4" style="width:50px;" />
                            <img src="<%=UserUtils.PostVerifyCodeImageUrl%>" /> </div>
                        </bbs:run>
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
                          <bbs:value type="FaceLinks"></bbs:value>
                        </ul>
                      </div>
                      <div id="tab-contents">
                        <bbs:value type="FaceDefaultContents"></bbs:value>
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
<bbs:include file="include/footer.html"></bbs:include>
<bbs:include file="include/dialog.html"></bbs:include>
</body>
</html>

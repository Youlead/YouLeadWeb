<%@ Page language="c#" Inherits="SiteServer.BBS.Pages.ThreadPage" EnableViewState="false" %>
<%@ Import namespace="SiteServer.BBS.Core" %>
<%@ Import namespace="SiteServer.BBS.Model" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=base.threadInfo.Title%>- {bbs.BBSName}</title>
<meta name="keywords" content="<%=base.threadInfo.Title%>" />
<meta name="description" content="<%=base.threadInfo.Title%>" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=8" />
<link href="css/share.css" rel="stylesheet" type="text/css">
<link href="css/theme.css" rel="stylesheet" type="text/css">
<bbs:include file="include/css_js.html"></bbs:include>
<script type="text/javascript">
$(document).ready(function(){	
	$('#posting1').hover(function(){
		$("#menu_post1").fadeIn(400);
	},function(){
		$("#menu_post1").hide();
	});
	$("#menu_post1").hover(function(){
		$("#menu_post1").show();
	},function(){
		$("#menu_post1").hide();
	});
	$('#posting2').hover(function(){
		$("#menu_post2").fadeIn(400);
	},function(){
		$("#menu_post2").hide();
	});
	$("#menu_post2").hover(function(){
		$("#menu_post2").show();
	},function(){
		$("#menu_post2").hide();
	});
});
function copyFloorUrl(page, postID) {
	var floorUrl = '<%=GetUrl("threadUrl")%>' + (page > 1 ? '?page=' + page : '') + '#' + postID;
	if (window.clipboardData) {
		window.clipboardData.setData("Text",floorUrl);
		successMessage('已成功复制');
	} else {
		prompt('按下 Ctrl+C 复制到剪贴板', floorUrl)
	}
}
function gotoFloor(f){
	location.href = '<%=GetUrl("floorUrl")%>' + f;
}
function copyCode(content){
	if (window.clipboardData) {  
        window.clipboardData.setData("Text",content);
		successMessage('已成功复制');
    }else{
		failureMessage('对不起，复制功能仅支持IE浏览器');
	}
}
</script>
<bbs:run class="UserUtils" if="IsAllowReplyPost">
  <script type="text/javascript" src="editor/kindeditor-min.js"></script>
  <script type="text/javascript" src="js/editor.js"></script>
  <script type="text/javascript" src="js/jquery-jtemplates.js"></script>
  <script type="text/javascript">
function gotoAdvancedUrl() {
	Storage.save('title', $('#title', $('#addPostForm')).val());
	Storage.save('content', $('#content', $('#addPostForm')).val());
	location.href = '<%=base.GetUrl("replyUrl")%>';
}
KE.show({
	id : 'content',
	imageUploadJson : '{bbs.editUploadUrl}',
	allowFileManager : false,
	items : ['fontname', 'fontsize', '|', 'textcolor', 'bgcolor', 'bold', 'italic', 'underline', 'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist', '|', 'emoticons', 'image', 'media', 'link', '|', 'ubb_code', 'ubb_hide'],
	afterCreate : function(id) {
		KE.event.ctrl(document, 13, function() {
			KE.util.setData(id);
			onAddPostSubmit(document.forms['addPostForm']);
		});
		KE.event.ctrl(KE.g[id].iframeDoc, 13, function() {
			KE.util.setData(id);
			onAddPostSubmit(document.forms['addPostForm']);
		});
	}
});
</script>
</bbs:run>
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
      <bbs:run get="GetLocation()"></bbs:run>
    </div>
  </div>
  <div class="post_bar">
    <div class="post_function"><span class="posting" id="posting1"><a href="<%=base.GetUrl("addPostUrl")%>">发 帖</a></span><span class="reply"><a href="javascript:void(0);" onclick="<%=base.GetUrl("replyThread")%>">回 复</a></span></div>
    <bbs:include file="include/pager.html"></bbs:include>
  </div>
  <div class="menuPost" id="menu_post1" style=" z-index:99">
    <ul>
      <li> <a hideFocus="true" href="<%=base.GetUrl("addPostUrl")%>">新 帖</a> </li>
      <li> <a hideFocus="true" href="<%=base.GetUrl("addPollUrl")%>">投 票</a> </li>
    </ul>
    <div style="clear:both"></div>
  </div>
  <div class="main thread">
    <div class="postlist" style="position:relative">
    <asp:Image ID="imgIdentify" runat="server" style="width:133px;height:97px;position:absolute; right:100px;" />
      <bbs:include file="include/postManager.html"></bbs:include>
      <table cellspacing="0" cellpadding="0" class="plh">
        <tr>
          <td class="pls"><div class="hm post_num"><span class="xg1">阅读:</span>
              <bbs:run get="base.threadInfo.Hits"></bbs:run>
              <span class="pipe">|</span><span class="xg1">回复:</span>
              <bbs:run get="base.threadInfo.Replies"></bbs:run>
            </div></td>
          <td class="ts"><div class="post_spe_rig">
              <input id="floor" type="text" class="jfl_px"/>
              <a href="javascript:;" onclick="gotoFloor($('#floor').val());return false;"><img src="images/flbg.gif" border="0" /></a></div>
            <h1><img src="images/ico_post_tit.gif" />
              <bbs:run get="base.threadInfo.Title"></bbs:run>
            </h1></td>
        </tr>
      </table>
     
      <asp:Repeater ID="rptPosts" runat="server">
        <itemtemplate>
        
          <table cellspacing="0" cellpadding="0" class="plh plo" id="postList" runat="server">
            <tr>
              <td valign="top" class="post_left"><div class="authi">
                  <asp:Literal ID="ltlOnline" runat="server"></asp:Literal>
                  <asp:HyperLink ID="hlUserName" CssClass="xw1" runat="server"></asp:HyperLink>
                </div>
                <div class="avatar">
                  <asp:Image ID="imgUserImage" width="120" height="120" runat="server"></asp:Image>
                </div>
                <div class="use_photo">
                  <ul>
                    <li>级别：
                      <asp:Literal ID="ltlGroupName" runat="server"></asp:Literal>
                    </li>
                    <li>
                      <asp:Literal ID="ltlStars" runat="server"></asp:Literal>
                    </li>
                  </ul>
                </div>
                <div class="post_img_info">
                  <ul>
                    <li>积分</li>
                    <li>
                      <asp:Literal ID="ltlCredits" runat="server"></asp:Literal>
                    </li>
                  </ul>
                  <ul>
                    <li>帖子</li>
                    <li>
                      <asp:Literal ID="ltlPostCount" runat="server"></asp:Literal>
                    </li>
                  </ul>
                  <ul>
                    <li>威望</li>
                    <li>
                      <asp:Literal ID="ltlPrestige" runat="server"></asp:Literal>
                    </li>
                  </ul>
                  <ul>
                    <li>贡献</li>
                    <li>
                      <asp:Literal ID="ltlContribution" runat="server"></asp:Literal>
                    </li>
                  </ul>
                  <ul>
                    <li>金币</li>
                    <li>
                      <asp:Literal ID="ltlCurrency" runat="server"></asp:Literal>
                    </li>
                  </ul>
                  <ul>
                    <li>在线时间</li>
                    <li>
                      <asp:Literal ID="ltlOnlineTotal" runat="server"></asp:Literal>
                    </li>
                  </ul>
                  <ul>
                    <li>注册时间</li>
                    <li>
                      <asp:Literal ID="ltlCreationDate" runat="server"></asp:Literal>
                    </li>
                  </ul>
                </div></td>
              <td valign="top"><div class="post_top">
                  <asp:Literal ID="ltlFloor" runat="server"></asp:Literal>
                  发表于：<asp:Literal ID="ltlAddDate" runat="server"></asp:Literal><asp:Literal ID="ltlEditDate" runat="server"></asp:Literal>
                  
                  <asp:Literal ID="ltlEditUserName" runat="server"></asp:Literal>
                  
                  <a href="#">只看楼主</a></div>
                <div class="post_title">
                  <asp:Literal ID="ltlTitle" runat="server"></asp:Literal>
                </div>
                <div class="post_right">
                  <asp:Literal ID="ltlContent" runat="server"></asp:Literal>
                  <bbs:include file="include/poll.html"></bbs:include>
                  <asp:Literal ID="ltlAttachment" runat="server"></asp:Literal>
                </div>
                <asp:PlaceHolder ID="phThreadPost" runat="server" Visible="false">
                  <div class="post_share"> <strong>分享:</strong>&nbsp;&nbsp; <a href="javascript:(function(){window.open('http://v.t.sina.com.cn/share/share.php?title='+encodeURIComponent('<%=base.threadInfo.Title%> - {bbs.bbsName}')+'&url='+encodeURIComponent(location.href)+'&source=bookmark','_blank','width=450,height=400');})()" title="分享到新浪微博"><img src="images/sinaweibo.png" width="16" height="16" align="absmiddle" />&nbsp;新浪微博</a> <a href="javascript:void(0)" onclick="window.open( 'http://v.t.qq.com/share/share.php?url='+encodeURIComponent(document.location)+'&appkey=&site=&title='+encodeURI('<%=base.threadInfo.Title%> - {bbs.bbsName}'),'', 'width=700, height=680, top=0, left=0, toolbar=no, menubar=no, scrollbars=no, location=yes, resizable=no, status=no' );" title="分享到腾讯微博"><img src="images/qqweibo.png" width="16" height="16" align="absmiddle" />&nbsp;腾讯微博</a> <a href="javascript:void(0);" onclick="window.open('http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?url='+encodeURIComponent(document.location.href));return false;" title="分享到QQ空间"><img src="images/qzone.gif" width="16" height="16" align="absmiddle" />&nbsp;QQ空间</a> </div>
                  <bbs:run if="base.IsManageable()">
                    <div class="post_manage"> <strong>管理:</strong>&nbsp;&nbsp; <a onclick="<%=base.GetUrl("deleteThreadSingle")%>" href="javascript:;">删除</a><span class="pipe">|</span><a onclick="<%=base.GetUrl("translateSingle")%>" href="javascript:;">移动</a><span class="pipe">|</span><a onclick="<%=base.GetUrl("categorySingle")%>" href="javascript:;">分类</a><span class="pipe">|</span><a onclick="<%=base.GetUrl("highlightSingle.top")%>" href="javascript:;">置顶</a><span class="pipe">|</span><a onclick="<%=base.GetUrl("highlightSingle.digest")%>" href="javascript:;">精华</a><span class="pipe">|</span><a onclick="<%=base.GetUrl("highlightSingle.highlight")%>" href="javascript:;">高亮</a><span class="pipe">|</span><a onclick="<%=base.GetUrl("lockSingle")%>" href="javascript:;">锁定</a><span class="pipe">|</span><a onclick="<%=base.GetUrl("banThreadSingle")%>" href="javascript:;">屏蔽</a><span class="pipe">|</span><a onclick="<%=base.GetUrl("identifySingle")%>" href="javascript:;">鉴定</a> <span class="pipe">|</span> <a href="javascript:;" onclick="<%=base.GetUrl("disableUserSingle")%>" class="mr5" id="disableUser">禁止用户</a> </div>
                  </bbs:run>
                </asp:PlaceHolder>
                <asp:Literal ID="ltlSignature" runat="server"></asp:Literal>
                <div class="post_bot">
                  <div class="function">
                    <asp:Literal ID="ltlManage" runat="server"></asp:Literal>
                  </div>
                  <div class="post_rig_info">
                    <asp:Literal ID="ltlEditUrl" runat="server"></asp:Literal>
                  </div>
                </div></td>
            </tr>
          </table>
        
        </itemtemplate>
      </asp:Repeater>
    
      <p style="display:none">
        <textarea id="template" rows="0" cols="0"><!--
<table cellspacing="0" cellpadding="0" class="plh plo">
  <tr>
    <td valign="top" class="post_left"><div class="authi"><img src="images/status_online.png" /><a class="xw1" href="{$T.userUrl}">{$T.userName}</a></div>
      <div class="avatar"><a href="{$T.userUrl}"><img src="{$T.userImageUrl}" width="120" height="120" /></a></div>
      <div class="use_photo">
        <ul>
          <li>级别：{$T.groupName}</li>
          <li>{$T.stars}</li>
        </ul>
      </div>
      <div class="post_img_info">
        <ul>
            <li>积分</li>
            <li>{$T.credits}</li>
          </ul>
          <ul>
            <li>帖子</li>
            <li>{$T.postCount}</li>
          </ul>
          <ul>
            <li>威望</li>
            <li>{$T.prestige}</li>
          </ul>
          <ul>
            <li>贡献</li>
            <li>{$T.contribution}</li>
          </ul>
          <ul>
            <li>金币</li>
            <li>{$T.currency}</li>
          </ul>
          <ul>
            <li>在线时间</li>
            <li>{$T.onlineTotal}</li>
          </ul>
          <ul>
            <li>注册时间</li>
            <li>{$T.creationDate}</li>
          </ul>
      </div></td>
    <td valign="top"><div class="post_top"><span class="lz">{$T.floor}</span>发表于：{$T.addDate}<a href="#">只看楼主</a></div>
    <div class="post_title">{$T.title}</div>
      <div class="post_right">
        {$T.content}
      </div>
      {$T.signature}
      <div class="post_bot">
        <div class="function"> <a href="#">举报</a> <a href="#">顶端</a>&nbsp; 
        <label for="postID_{$T.postID}"><input id="postID_{$T.postID}" onclick="postManage.show('postManagerPop',this.id)" name="postIDArray" value="{$T.postID}" type="checkbox" autocomplete="off"> 管理</label>
        </div>
        <div class="post_rig_info"> <a href="#" class="fastre">回复</a> <a href="#" class="reg">引用</a> <a href="{$T.editUrl}" class="edit">编辑</a></div>
      </div></td>
  </tr>
</table>
-->
</textarea>
      </p>
      <table id="templateBefore" cellspacing="0" cellpadding="0" class="plh">
        <tr>
          <td class="pls_02"><div class="hm post_02num">
              <bbs:run get="base.GetNavigation(false)"></bbs:run>
              <span class="pipe">|</span>
              <bbs:run get="base.GetNavigation(true)"></bbs:run>
            </div></td>
          <td class="zt_line"><bbs:run if="base.IsManageable()">
              <div class="post_manage"> <strong>管理:</strong>&nbsp;&nbsp; <a onclick="<%=base.GetUrl("deleteThreadSingle")%>" href="javascript:;">删除</a><span class="pipe">|</span><a onclick="<%=base.GetUrl("translateSingle")%>" href="javascript:;">移动</a><span class="pipe">|</span><a onclick="<%=base.GetUrl("categorySingle")%>" href="javascript:;">分类</a><span class="pipe">|</span><a onclick="<%=base.GetUrl("highlightSingle.top")%>" href="javascript:;">置顶</a><span class="pipe">|</span><a onclick="<%=base.GetUrl("highlightSingle.digest")%>" href="javascript:;">精华</a><span class="pipe">|</span><a onclick="<%=base.GetUrl("highlightSingle.highlight")%>" href="javascript:;">高亮</a><span class="pipe">|</span><a onclick="<%=base.GetUrl("lockSingle")%>" href="javascript:;">锁定</a><span class="pipe">|</span><a onclick="<%=base.GetUrl("banThreadSingle")%>" href="javascript:;">屏蔽</a><span class="pipe">|</span><a onclick="<%=base.GetUrl("identifySingle")%>" href="javascript:;">鉴定</a><span class="pipe">|</span><a href="javascript:;" onclick="<%=base.GetUrl("disableUserSingle")%>" class="mr5" id="disableUser">禁止用户</a> </div>
            </bbs:run></td>
        </tr>
      </table>
    </div>
  </div>
  <div class="post_bar">
    <div class="post_function"><span class="posting" id="posting2"><a href="<%=base.GetUrl("addPostUrl")%>">发 帖</a></span><span class="reply"><a href="javascript:void(0);" onclick="<%=base.GetUrl("replyThread")%>">回 复</a></span></div>
    <bbs:include file="include/pager.html"></bbs:include>
  </div>
  <div class="menuPost" id="menu_post2">
    <ul>
      <li> <a hideFocus="true" href="<%=base.GetUrl("addPostUrl")%>">新 帖</a> </li>
      <li> <a hideFocus="true" href="<%=base.GetUrl("addPollUrl")%>">投 票</a> </li>
    </ul>
  </div>
  <!--发表回复开始-->
  <bbs:run if="IsPostable()">
    <form id="addPostForm" onsubmit="onAddPostSubmit(this);return false;" action="{bbs.formUrl}addPost" method="post">
      <input id="forumID" name="forumID" type="hidden" value="<%=base.forumID%>" />
      <input id="threadID" name="threadID" type="hidden" value="<%=base.threadID%>" />
      <input id="replies" name="replies" type="hidden" value="<%=base.threadInfo.Replies%>" />
      <input id="isSignature" name="isSignature" type="hidden" value="true" />
      <table cellspacing="0" cellpadding="0" class="last_table">
        <tr>
          <td valign="top" class="post_left"><h3>快速回复</h3>
            <div class="avatar"><a href="<%=UserUtils.GetUserUrl(UserUtils.UserName)%>" target="_blank"><img src="<%=UserUtils.GetUserAvatarMiddleUrl(UserUtils.UserName)%>" width="120" height="120" /></a></div>
            <div class="use_photo">
              <ul>
                <li>级别： <%=UserUtils.GetGroupName(UserUtils.UserName)%> </li>
                <li id="stars"> <%=UserUtils.GetStars(UserUtils.UserName)%> </li>
              </ul>
            </div></td>
          <td valign="top" style="padding:5px;"><div class="posting_function">
              <div style="padding:5px;">
                <input id="title" name="title" type="text" class="txtTitle" value="Re:<%=base.threadInfo.Title%>" />
                <span class="share_right">&nbsp;<a href="javascript:;" onclick="gotoAdvancedUrl();return false;">高级模式</a></span> </div>
              <div style="padding:5px;">
                <textarea id="content" name="content" cols="100" rows="8" style="width:485px;height:180px;visibility:hidden;"></textarea>
              </div>
              <bbs:run if="UserUtils.IsVerifyCodePost">
                <div style="padding-left:5px;"> 验证码：
                  <input id="verifyCode" name="verifyCode" type="text" class="txtTitle" maxlength="4" style="width:50px;" />
                  <img src="<%=UserUtils.PostVerifyCodeImageUrl%>"/> </div>
              </bbs:run>
              <input type="submit"  value="提交" class="submit_btn" />
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
      </table>
    </form>
  </bbs:run>
  <!--发表回复结束--> 
</div>
<bbs:include file="include/footer.html"></bbs:include>
<bbs:include file="include/dialog.html"></bbs:include>
</body>
</html>
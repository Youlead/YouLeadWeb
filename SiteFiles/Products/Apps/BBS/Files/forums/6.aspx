<%@ Page language="c#" Inherits="SiteServer.BBS.Pages.ForumPage" EnableViewState="false" %>
<%@ Import namespace="SiteServer.BBS.Core" %>
<%@ Import namespace="SiteServer.BBS.Model" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>下级版块1 - SiteServer BBS 论坛 - Powered by SiteServer BBS</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=8" />
<link href="../css/share.css" rel="stylesheet" type="text/css">
<link href="../css/theme.css" rel="stylesheet" type="text/css">
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
<link href="../js/jquery_select/selectStyle.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/jquery_select/jquery.select-1.3.6.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("select").sSelect();
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
function changeTarget(newWin){
	if (newWin){$('.new a').attr('target', '_blank');}else{$('.new a').attr('target', '_self');}
}
</script>

<%if (!UserUtils.IsAnonymous){%><script type="text/javascript" src="/bbs_test/editor/kindeditor-min.js"></script><script type="text/javascript" src="/bbs_test/js/editor.js"></script><script>
function gotoAdvancedUrl() {
    Storage.save('title', $('#title', $('#contentForm')).val());
    Storage.save('content', $('#content', $('#contentForm')).val());
    location.href = '/bbs_test/post.aspx?forumID=6';
}
KE.show({
    id : 'content',
    imageUploadJson : '/bbs_test/editor/upload_json.ashx?publishmentSystemID=866',
    allowFileManager : false,
    items : ['fontname', 'fontsize', '|', 'textcolor', 'bgcolor', 'bold', 'italic', 'underline', 'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist', '|', 'emoticons', 'image', 'media', 'link', '|', 'ubb_code', 'ubb_hide'],
    afterCreate : function(id) {
        KE.event.ctrl(document, 13, function() {
            KE.util.setData(id);
            onAddThreadSubmit(document.forms['contentForm']);
        });
        KE.event.ctrl(KE.g[id].iframeDoc, 13, function() {
            KE.util.setData(id);
            onAddThreadSubmit(document.forms['contentForm']);
        });
    }
 });
</script><%}%>

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
    <div class="share_p"><img src="../images/ico_position.gif" />
            <a href="/bbs_test">SiteServer BBS 论坛</a>><a href="/bbs_test/forums/5.aspx">版块一</a>><a href="/bbs_test/forums/6.aspx">下级版块1</a>
          </div>
  </div>
        <!--子版块开始-->
        
        <!--子版块结束-->
        <div class="main thread"><div class="explan_thr"><!--<p class="y">
        版主: <span class="f_c">
        <a href="post.aspx">admin</a></span>      </p>--><div class="y thread_right"><div><!--<img src="../images/favour.gif" /><a href="#" class="favour">收藏</a> --><img src="../images/forumdigest.gif" /><a href="../rss.aspx?forumID=6" target="_blank" class="digest">订阅</a><img src="../images/icon_feed.gif" /><a href="../my/permission.aspx?forumID=6" class="feed">权限</a></div><div>版主：<span class="moderator"></span></div></div><div class="y thread_left"><h1>下级版块1</h1><span class="left">今日: <strong class="xi1"><%=this.forumInfo.TodayPostCount + this.forumInfo.TodayThreadCount%></strong><span class="pipe">|</span>主题: <strong class="xi1"><%=this.forumInfo.TodayThreadCount%></strong><span class="pipe">|</span>帖子: <strong class="xi1"><%=this.forumInfo.TodayPostCount%></strong></span><p></p></div><div class="thread_line"></div><div class="explan_font"><span class="y"><img id="arrow_summary" onClick="$('#summary').toggle();" style="cursor:pointer" src="../images/arrow_u.gif" border="0" /></span><div id="summary"></div><br /></div></div><div class="post_bar"><div class="post_function"><span class="posting" id="posting1"><a href="/bbs_test/post.aspx?forumID=6">发 帖</a></span></div><%if (base.pagerInfo != null){%>
<div class="page_out">
  <div class="pagination">
    <div class="page_right">
      <%if (base.pagerInfo.Page > 1){%>
      <a href="<%=base.pagerInfo.GetUrl(base.pagerInfo.Page - 1)%>"><span>上一页</span></a>
      <%}%>
      <%if (base.pagerInfo.Start > 1){%>
      <a href="<%=base.pagerInfo.GetUrl(1)%>">1...</a>
      <%}%>
      <%for(int i = base.pagerInfo.Start; i <= base.pagerInfo.End; i++){ %>
      <%if (i == base.pagerInfo.Page){%>
      <span class="page-cur"><%=i%></span>
      <%}else{%>
      <a href="<%=base.pagerInfo.GetUrl(i)%>"><%=i%></a>
      <%}%>
      <%}%>
      <%if (base.pagerInfo.End < base.pagerInfo.PageCount){%>
      <a href="<%=base.pagerInfo.GetUrl(base.pagerInfo.PageCount)%>">...<%=base.pagerInfo.PageCount%></a>
      <%}%>
      <%if (base.pagerInfo.Page < base.pagerInfo.End){%>
      <a class="page-next" href="<%=base.pagerInfo.GetUrl(base.pagerInfo.Page + 1)%>"><span>下一页</span></a>
      <%}%>
    </div>
  </div>
</div>
<%}%>
</div><div class="menuPost" id="menu_post1"><ul><li><a hideFocus="true" href="/bbs_test/post.aspx?forumID=6">新 帖</a></li><li><a hideFocus="true" href="/bbs_test/post.aspx?forumID=6&addType=poll">投 票</a></li></ul></div><div class="nav_thread"><ul><asp:Literal ID="ltlCategories" runat="server"></asp:Literal></ul><div class="nav_rig_info"><a href="?type=digest">精华</a> | <a href="?type=image">图片贴</a>&nbsp;&nbsp;
                <input name="" type="checkbox" value="" onclick="changeTarget(this.checked);" /><span class="nav_rig_font">新窗口中打开</span></div></div><div class="th"><table cellspacing="0" cellpadding="0" class="th"><tr><td width="66%"><div class="tf"> 排序:
                
<%if (base.orderBy == "addDate"){%><a href="?orderBy=lastDate" class="showmenu">最后回复</a><a href="?orderBy=addDate" class="xi4">最新发帖</a><%}else{%><a href="?orderBy=lastDate" class="xi4">最后回复</a><a href="?orderBy=addDate" class="showmenu">最新发帖</a><%}%>
<span class="pipe">|</span>类型: <a href="#" class="xi4">全部主题</a><a href="#" class="showmenu">投票</a></div></td><td width="14%" class="by">&nbsp;&nbsp;&nbsp;作者</td><td width="6%" class="num">&nbsp;回复</td><td width="14%" class="by">&nbsp;最后发表</td></tr></table></div><div class="thread_out" style="border:1px solid #dadada;padding:10px; background:url(../images/info_table_bg.gif) repeat-x left top;"><table border="0" class="info_table">
<%if (base.pageNum <= 1){%><asp:repeater ID="rptTopThreads" runat="server"><itemtemplate><tr><td class="folder">
<%if (base.isModerator){%>
                        <%if (base.topForumID==0)
                          { %>
                            <input type="checkbox" autocomplete="off" name="threadIDArray" id="threadID_<%#DataBinder.Eval(Container.DataItem,"id")%>" value="<%#DataBinder.Eval(Container.DataItem,"id")%>" onclick="threadManager.show('threadManagerPop','title_<%#DataBinder.Eval(Container.DataItem,"id")%>')" />
                           <%  }%>
                           <%else
                          { %>
                           <input type="checkbox" autocomplete="off" name="threadIDArray" id="Checkbox1" value="<%#DataBinder.Eval(Container.DataItem,"id")%>" onclick="threadManager.show('threadManagerPop','title_<%#DataBinder.Eval(Container.DataItem,"id")%>')" disabled="disabled" style="display:none" />
                           
                           <% }%>
                            &nbsp; <%}%>
<asp:Literal ID="ltlIcon" runat="server"></asp:Literal></td><th class="new" id="title_<%#DataBinder.Eval(Container.DataItem,"id")%>"><asp:Literal ID="ltlTitle" runat="server"></asp:Literal><span class="tpages">&nbsp;<asp:Literal ID="ltlPages" runat="server"></asp:Literal></span></th><td width="14%" class="by"><em><asp:HyperLink ID="hlUserName" runat="server"></asp:HyperLink></em><div class="thread_number"><asp:Literal ID="ltlAddDate" runat="server"></asp:Literal></div></td><td width="6%" class="num"><asp:HyperLink ID="hlReplies" CssClass="xg3" runat="server"></asp:HyperLink><div class="thread_number"> <%#DataBinder.Eval(Container.DataItem,"hits")%> </div></td><td width="14%" class="by"><em><asp:HyperLink ID="hlLastUserName" runat="server"></asp:HyperLink></em><div class="thread_number"><asp:Literal ID="ltlLastDate" runat="server"></asp:Literal></div></td></tr></itemtemplate></asp:repeater><tr class="ts"><td> </td><th>普通主题</th><td> </td><td> </td><td> </td></tr><%}%>
<asp:repeater ID="rptThreads" runat="server"><itemtemplate><tr><td class="folder">
<%if (base.isModerator){%><input type="checkbox" autocomplete="off" name="threadIDArray" id="threadID_<%#DataBinder.Eval(Container.DataItem,"id")%>" value="<%#DataBinder.Eval(Container.DataItem,"id")%>" onclick="threadManager.show('threadManagerPop','title_<%#DataBinder.Eval(Container.DataItem,"id")%>')" />
                    &nbsp; <%}%>
<asp:Literal ID="ltlIcon" runat="server"></asp:Literal></td><th class="new" id="title_<%#DataBinder.Eval(Container.DataItem,"id")%>"><asp:Literal ID="ltlTitle" runat="server"></asp:Literal><span class="tpages">&nbsp;<asp:Literal ID="ltlPages" runat="server"></asp:Literal></span></th><td width="14%" class="by"><em><asp:HyperLink ID="hlUserName" runat="server"></asp:HyperLink></em><div class="thread_number"><asp:Literal ID="ltlAddDate" runat="server"></asp:Literal></div></td><td width="6%" class="num"><asp:HyperLink ID="hlReplies" CssClass="xg3" runat="server"></asp:HyperLink><div class="thread_number"> <%#DataBinder.Eval(Container.DataItem,"hits")%> </div></td><td width="14%" class="by"><em><asp:HyperLink ID="hlLastUserName" runat="server"></asp:HyperLink></em><div class="thread_number"><asp:Literal ID="ltlLastDate" runat="server"></asp:Literal></div></td></tr></itemtemplate></asp:repeater>
<%if (base.isModerator){%><tr class="ts"><td> </td><th>管理主题</th><td> </td><td> </td><td> </td></tr><tr><td class="folder" style="width:50px;"><label for="pw_sel_all" class="fl mr5"><input name="chkall" id="pw_sel_all" autocomplete="off" type="checkbox" onclick="threadManager.checkall(this)" />
                        &nbsp;全选</label></td><td colspan="4"><P><strong><a onclick="if (!alertCheckBoxCollection(document.getElementsByName('threadIDArray'), '请选择主题进行操作')){showDialog('/bbs_test/dialog/delete.aspx?publishmentSystemID=866&forumID=6&action=DeleteThread' + '&threadIDArray=' + getCheckBoxCollectionValue(document.getElementsByName('threadIDArray')),260, 300, '删除主题', '');}return false;" class="xg3" href="javascript:;">删除</a></strong><span class="pipe">|</span><strong><a onclick="if (!alertCheckBoxCollection(document.getElementsByName('threadIDArray'), '请选择主题进行操作')){showDialog('/bbs_test/dialog/translate.aspx?publishmentSystemID=866&forumID=6' + '&threadIDArray=' + getCheckBoxCollectionValue(document.getElementsByName('threadIDArray')),300, 360, '移动主题', '');}return false;" class="xg3" href="javascript:;">移动</a></strong><span class="pipe">|</span><strong><a onclick="failureMessage('该板块没有设置主题分类');" class="xg3" href="javascript:;">分类</a></strong><span class="pipe">|</span><a onclick="if (!alertCheckBoxCollection(document.getElementsByName('threadIDArray'), '请选择主题进行操作')){showDialog('/bbs_test/dialog/highlight.aspx?action=top&publishmentSystemID=866&forumID=6' + '&threadIDArray=' + getCheckBoxCollectionValue(document.getElementsByName('threadIDArray')),460, 400, '主题管理', '');}return false;" class="xi1" href="javascript:;">置顶</a><span class="pipe">|</span><a onclick="if (!alertCheckBoxCollection(document.getElementsByName('threadIDArray'), '请选择主题进行操作')){showDialog('/bbs_test/dialog/highlight.aspx?action=digest&publishmentSystemID=866&forumID=6' + '&threadIDArray=' + getCheckBoxCollectionValue(document.getElementsByName('threadIDArray')),460, 400, '主题管理', '');}return false;" class="xi1" href="javascript:;">精华</a><span class="pipe">|</span><a onclick="if (!alertCheckBoxCollection(document.getElementsByName('threadIDArray'), '请选择主题进行操作')){showDialog('/bbs_test/dialog/highlight.aspx?action=highlight&publishmentSystemID=866&forumID=6' + '&threadIDArray=' + getCheckBoxCollectionValue(document.getElementsByName('threadIDArray')),460, 400, '主题管理', '');}return false;" class="xi1" href="javascript:;">高亮</a><span class="pipe">|</span><a onclick="" class="xg3" href="javascript:;">提升/下沉</a><span class="pipe">|</span><a onclick="" class="xg3" href="javascript:;">锁定/关闭</a></P></td></tr><%}%>
</table></div><div class="post_bar"><div class="post_function"><span class="posting" id="posting2"><a href="/bbs_test/post.aspx?forumID=6">发 帖</a></span></div><%if (base.pagerInfo != null){%>
<div class="page_out">
  <div class="pagination">
    <div class="page_right">
      <%if (base.pagerInfo.Page > 1){%>
      <a href="<%=base.pagerInfo.GetUrl(base.pagerInfo.Page - 1)%>"><span>上一页</span></a>
      <%}%>
      <%if (base.pagerInfo.Start > 1){%>
      <a href="<%=base.pagerInfo.GetUrl(1)%>">1...</a>
      <%}%>
      <%for(int i = base.pagerInfo.Start; i <= base.pagerInfo.End; i++){ %>
      <%if (i == base.pagerInfo.Page){%>
      <span class="page-cur"><%=i%></span>
      <%}else{%>
      <a href="<%=base.pagerInfo.GetUrl(i)%>"><%=i%></a>
      <%}%>
      <%}%>
      <%if (base.pagerInfo.End < base.pagerInfo.PageCount){%>
      <a href="<%=base.pagerInfo.GetUrl(base.pagerInfo.PageCount)%>">...<%=base.pagerInfo.PageCount%></a>
      <%}%>
      <%if (base.pagerInfo.Page < base.pagerInfo.End){%>
      <a class="page-next" href="<%=base.pagerInfo.GetUrl(base.pagerInfo.Page + 1)%>"><span>下一页</span></a>
      <%}%>
    </div>
  </div>
</div>
<%}%>
</div><div class="menuPost" id="menu_post2"><ul><li><a hideFocus="true" href="/bbs_test/post.aspx?forumID=6">新 帖</a></li><li><a hideFocus="true" href="/bbs_test/post.aspx?forumID=6&addType=poll">投 票</a></li></ul></div><!--发表主题开始-->
<%if (!UserUtils.IsAnonymous){%><form id="contentForm" onSubmit="onAddThreadSubmit(this);return false;" action="/bbs_test/ajax/form.aspx?publishmentSystemID=866&action=addThread" method="post"><input id="forumID" name="forumID" type="hidden" value="6" /><input id="isSignature" name="isSignature" type="hidden" value="true" /><table cellspacing="0" cellpadding="0" class="last_table"><tr><td valign="top" class="post_left"><h3>快速发表主题</h3><div class="avatar"><a href="<%=UserUtils.GetUserUrl(UserUtils.UserName)%>" target="_blank"><img src="<%=UserUtils.GetUserAvatarMiddleUrl(UserUtils.UserName)%>" width="120" height="120" /></a></div><div class="use_photo"><ul><li>级别： <%=UserUtils.GetGroupName(UserUtils.UserName)%> </li><li id="stars"> <%=UserUtils.GetStars(UserUtils.UserName)%> </li></ul></div></td><td valign="top" style="padding:5px;"><div class="posting_function"><div style="padding:5px;"> <%=GetCategorySelectHtml()%>
                        <input id="title" name="title" type="text" class="txtTitle" /><span class="share_right">&nbsp;<a href="javascript:;" onclick="gotoAdvancedUrl();return false;">高级模式</a></span></div><div style="padding:5px;"><textarea id="content" name="content" cols="100" rows="8" style="width:485px;height:170px;visibility:hidden;"></textarea></div>
<%if (UserUtils.IsVerifyCodeThread){%><div style="padding-left:5px;"> 验证码：
                  <input id="verifyCode" name="verifyCode" type="text" class="txtTitle" maxlength="4" style="width:50px;" /><img src="<%=UserUtils.PostVerifyCodeImageUrl%>" /></div><%}%>
<input type="submit" value="提交" class="submit_btn" /></div><div id="face_right" class="face_right"><div id="tabs" class="face_tit"><ul><li class="current"><a id="yoci" href="/bbs_test/ajax/face.aspx?publishmentSystemID=866&faceName=yoci">悠嘻猴</a></li><li><a id="tuzki" href="/bbs_test/ajax/face.aspx?publishmentSystemID=866&faceName=tuzki">兔斯基</a></li><li><a id="oniontou" href="/bbs_test/ajax/face.aspx?publishmentSystemID=866&faceName=oniontou">洋葱头</a></li></ul></div><div id="tab-contents"><div id="tabs-yoci" class="face_info"><a href="javascript:void(0);"><img src="/bbs_test/smile/yoci/一无所有.gif" border="0" /></a><a href="javascript:void(0);"><img src="/bbs_test/smile/yoci/七窍生烟.gif" border="0" /></a><a href="javascript:void(0);"><img src="/bbs_test/smile/yoci/不可以.gif" border="0" /></a><a href="javascript:void(0);"><img src="/bbs_test/smile/yoci/不好意思.gif" border="0" /></a><a href="javascript:void(0);"><img src="/bbs_test/smile/yoci/不懂.gif" border="0" /></a><a href="javascript:void(0);"><img src="/bbs_test/smile/yoci/不给糖就捣蛋.gif" border="0" /></a><a href="javascript:void(0);"><img src="/bbs_test/smile/yoci/不至于吧.gif" border="0" /></a><a href="javascript:void(0);"><img src="/bbs_test/smile/yoci/不行了.GIF" border="0" /></a><a href="javascript:void(0);"><img src="/bbs_test/smile/yoci/不要了拉.gif" border="0" /></a><a href="javascript:void(0);"><img src="/bbs_test/smile/yoci/不要拉.gif" border="0" /></a><a href="javascript:void(0);"><img src="/bbs_test/smile/yoci/乖.gif" border="0" /></a><a href="javascript:void(0);"><img src="/bbs_test/smile/yoci/交给我吧.gif" border="0" /></a><a href="javascript:void(0);"><img src="/bbs_test/smile/yoci/什么问题.gif" border="0" /></a><a href="javascript:void(0);"><img src="/bbs_test/smile/yoci/体操.gif" border="0" /></a><a href="javascript:void(0);"><img src="/bbs_test/smile/yoci/你好.gif" border="0" /></a><a href="javascript:void(0);"><img src="/bbs_test/smile/yoci/健身.gif" border="0" /></a><div class="face_page"><span class="face_cur_page">1</span><a href="/bbs_test/ajax/face.aspx?publishmentSystemID=866&faceName=yoci&page=2">2</a><a href="/bbs_test/ajax/face.aspx?publishmentSystemID=866&faceName=yoci&page=3">3</a><a href="/bbs_test/ajax/face.aspx?publishmentSystemID=866&faceName=yoci&page=4">4</a><a href="/bbs_test/ajax/face.aspx?publishmentSystemID=866&faceName=yoci&page=5">5</a><a href="/bbs_test/ajax/face.aspx?publishmentSystemID=866&faceName=yoci&page=6">6</a><a href="/bbs_test/ajax/face.aspx?publishmentSystemID=866&faceName=yoci&page=7">7</a><a href="/bbs_test/ajax/face.aspx?publishmentSystemID=866&faceName=yoci&page=8">8</a><a href="/bbs_test/ajax/face.aspx?publishmentSystemID=866&faceName=yoci&page=9">9</a></div></div></div></div></td></tr></table></form><%}%>
<!--发表主题结束--></div>
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

<%if (base.isModerator){%><script type="text/javascript">
	$("td.folder").css({width:'50px'});
  </script><script type="text/javascript"> 
function threadManager(){
    this.checknum = function (all) {
        var a = b = 0;
        var selected = '';
        var check = document.getElementsByName('threadIDArray');
        for (var i = 0; i < check.length; i++) {
            if (!all && check[i].checked) {

                selected += '&threadIDArray[' + a + ']=' + check[i].value;
                a++;
            } else if (all == 1) {
               
                if (check[i].disabled == true) {
                   
                    check[i].checked = false;
                }
                else {
                    check[i].checked = true;
                }
                a++;
            } else if (all == 2) {
                check[i].checked = false;
                b++;
            } else {
                b++;
            }
        }
        return new Array(a, b, selected);
    }
	this.checkinfo = '';
	this.setCounter = function(num){
		var tags = document.getElementsByTagName('strong');
		for(var i=0;i<tags.length;i++){
			if(tags[i].id == 'select_count')tags[i].innerHTML = num;
		}
	}
	this.show = function(popDiv,obj){
		this.checkinfo = this.checknum(0);
		if(this.checkinfo[0] > 0){
			this.setCounter(this.checkinfo[0]);
			read.open(popDiv,obj,2);
		}else{
			read.close();
		}
		this.setSelectAll();
	}
	this.setSelectAll = function(){
		var total = this.checkinfo[1] + this.checkinfo[0];
		if (total > 0) {
			getObj('pw_sel_all').checked = false;
			try{getObj('ajaxall').checked = false;}catch(e){}
			if(this.checkinfo[0] == total){
				getObj('pw_sel_all').checked = true;
				try{getObj('ajaxall').checked = true;}catch(e){}
			}
		}
	}
	this.action = function (atag,id){
		read.obj = atag;
		var info = this.checknum();
		var data = info[2];
		sendmsg(atag.href,data,id);
		return false;
	}
	this.checkall = function (obj) {
	  
	    var allType = 1; //1全选，2取消全选
	    if (!obj.checked) allType = 2;
	    this.checkinfo = this.checknum(allType);
	    this.setSelectAll();
	    this.setCounter(this.checkinfo[0]);
	}
}
var threadManager = new threadManager;
</script>
<div id="threadManagerPop" style="display:none" class="popout">
  <table cellspacing="0" cellpadding="0" border="0">
    <tbody>
      <tr>
        <td class="bgcorner1"></td>
        <td class="pobg1"></td>
        <td class="bgcorner2"></td>
      </tr>
      <tr>
        <td class="pobg4"></td>
        <td><div class="popoutContent">
            <div style="width:320px;">
              <div class="popTop" style="cursor:move;" onmousedown = "read.move(event);"> <a href="javascript:void(0)" class="adel" onclick="closep()">关闭</a> <span class="mr20">选中<strong class="xi1" id="select_count">1</strong>篇</span> </div>
              <div class="popContent">
                <p> <strong><a onclick="if (!alertCheckBoxCollection(document.getElementsByName('threadIDArray'), '请选择主题进行操作')){showDialog('/bbs_test/dialog/delete.aspx?publishmentSystemID=866&forumID=6&action=DeleteThread' + '&threadIDArray=' + getCheckBoxCollectionValue(document.getElementsByName('threadIDArray')),260, 300, '删除主题', '');}return false;" class="xg3" href="javascript:;">删除</a></strong> <span class="pipe">|</span><strong><a onclick="if (!alertCheckBoxCollection(document.getElementsByName('threadIDArray'), '请选择主题进行操作')){showDialog('/bbs_test/dialog/translate.aspx?publishmentSystemID=866&forumID=6' + '&threadIDArray=' + getCheckBoxCollectionValue(document.getElementsByName('threadIDArray')),300, 360, '移动主题', '');}return false;" class="xg3" href="javascript:;">移动</a></strong> <span class="pipe">|</span><strong><a onclick="failureMessage('该板块没有设置主题分类');" class="xg3" href="javascript:;">分类</a></strong> </p>
                <p> <a onclick="if (!alertCheckBoxCollection(document.getElementsByName('threadIDArray'), '请选择主题进行操作')){showDialog('/bbs_test/dialog/highlight.aspx?action=top&publishmentSystemID=866&forumID=6' + '&threadIDArray=' + getCheckBoxCollectionValue(document.getElementsByName('threadIDArray')),460, 400, '主题管理', '');}return false;" class="xi1" href="javascript:;">置顶</a> <span class="pipe">|</span> <a onclick="if (!alertCheckBoxCollection(document.getElementsByName('threadIDArray'), '请选择主题进行操作')){showDialog('/bbs_test/dialog/highlight.aspx?action=digest&publishmentSystemID=866&forumID=6' + '&threadIDArray=' + getCheckBoxCollectionValue(document.getElementsByName('threadIDArray')),460, 400, '主题管理', '');}return false;" class="xi1" href="javascript:;">精华</a> <span class="pipe">|</span> <a onclick="if (!alertCheckBoxCollection(document.getElementsByName('threadIDArray'), '请选择主题进行操作')){showDialog('/bbs_test/dialog/highlight.aspx?action=highlight&publishmentSystemID=866&forumID=6' + '&threadIDArray=' + getCheckBoxCollectionValue(document.getElementsByName('threadIDArray')),460, 400, '主题管理', '');}return false;" class="xi1" href="javascript:;">高亮</a> <span class="pipe">|</span> <a onclick="if (!alertCheckBoxCollection(document.getElementsByName('threadIDArray'), '请选择主题进行操作')){showDialog('/bbs_test/dialog/upDown.aspx?publishmentSystemID=866&forumID=6' + '&threadIDArray=' + getCheckBoxCollectionValue(document.getElementsByName('threadIDArray')),300, 360, '提升下沉', '');}return false;" class="xg3" href="javascript:;">升降</a> <span class="pipe">|</span> <a onclick="if (!alertCheckBoxCollection(document.getElementsByName('threadIDArray'), '请选择主题进行操作')){showDialog('/bbs_test/dialog/lock.aspx?publishmentSystemID=866&forumID=6' + '&threadIDArray=' + getCheckBoxCollectionValue(document.getElementsByName('threadIDArray')),300, 360, '锁定', '');}return false;" class="xg3" href="javascript:;">锁定</a> <span class="pipe">|</span> <a onclick="if (!alertCheckBoxCollection(document.getElementsByName('threadIDArray'), '请选择主题进行操作')){showDialog('/bbs_test/dialog/ban.aspx?publishmentSystemID=866&forumID=6&action=BanThreads' + '&threadIDArray=' + getCheckBoxCollectionValue(document.getElementsByName('threadIDArray')),300, 360, '屏蔽帖子', '');}return false;" class="xg3" href="javascript:;">屏蔽</a> </p>
              </div>
              <div class="popBottom">
                <label>
                  <input name="ajaxall" id="ajaxall" type="checkbox" value=""  onclick="threadManager.checkall(this);"/>
                  全选</label>
              </div>
            </div>
          </div></td>
        <td class="pobg2"></td>
      </tr>
      <tr>
        <td class="bgcorner4"></td>
        <td class="pobg3"></td>
        <td class="bgcorner3"></td>
      </tr>
    </tbody>
  </table>
</div><%}%>

</body>
</html>
<script runat="server">
protected override void OnLoad(EventArgs e)
{
	base.forumID = 6;
	base.OnLoad(e);
}
</script>
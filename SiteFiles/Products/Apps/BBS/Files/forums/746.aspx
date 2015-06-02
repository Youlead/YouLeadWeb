<%@ Page language="c#" Inherits="SiteServer.BBS.Pages.ForumPage" EnableViewState="false" %>
<%@ Import namespace="SiteServer.BBS.Core" %>
<%@ Import namespace="SiteServer.BBS.Model" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>SiteServer CMS内容管理系统 - SiteServer BBS 论坛 - Powered by SiteServer BBS</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=8" />
<link href="../css/share.css" rel="stylesheet" type="text/css">
<link href="../css/theme.css" rel="stylesheet" type="text/css">
<link href="/BBS/css/dialog.css" rel="stylesheet" type="text/css">
<link href="/BBS/css/popout.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/BBS/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="/BBS/js/jquery.form.js"></script>
<script type="text/javascript" src="/BBS/js/jquery.bgiframe.min.js"></script>
<script type="text/javascript" src="/BBS/js/jquery.loading.js"></script>
<script type="text/javascript">
var bbsUrl = '/BBS';var loading;</script>
<script type="text/javascript" src="/BBS/js/bbs.js"></script>
<script type="text/javascript" src="/BBS/js/ready.js"></script>
<%if (Config.IsFullScreen){%><link href="/BBS/css/fullscreen.css" rel="stylesheet" type="text/css"><%}%>
<link href="../js/jquery.select/selectStyle.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/jquery.select/jquery.select-1.3.6.js"></script>
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

<%if (!UserUtils.IsAnonymous){%><script type="text/javascript" src="/BBS/editor/kindeditor-min.js"></script><script type="text/javascript" src="/BBS/js/editor.js"></script><script>
function gotoAdvancedUrl() {
    Storage.save('title', $('#title', $('#contentForm')).val());
    Storage.save('content', $('#content', $('#contentForm')).val());
    location.href = '/BBS/post.aspx?forumID=746';
}
KE.show({
    id : 'content',
    imageUploadJson : '/BBS/editor/upload_json.ashx',
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
<script type="text/javascript" src="/BBS/js/dialog.js"></script>
<script type="text/javascript" src="/BBS/js/popout.js"></script>
<div id="header">
  <div class="hd">
    <div class="header_left">
      <div class="header_logo">
        <a href="/BBS/default.aspx"><img src="/BBS/images/logo.png" /></a>
      </div>
      <div class="navigation">
        <ul>
        <li><a href="/BBS" style="" target="">论坛</a></li><li><a href="/" style="" target="">门户</a></li><li><a href="/usercenter" style="" target="_blank">个人中心</a></li>
        </ul>
      </div>
    </div>
    <div class="use_area">
      
<%if (UserUtils.IsAnonymous){%><form id="loginForm" onsubmit="onLoginSubmit(this);return false;" action="/BBS/ajax/form.aspx?action=login" method="post"><div id="login"><div class="logindiv"><div class="login1"><p><label for="ls_username">帐号&nbsp;</label><input id="userName" name="userName" tabindex="1" class="px vm" value="用户名" type="text"><label class="fl"><input type="checkbox" id="persistent" name="persistent" checked="checked" value="true">
                      记住</input></label></input></p><p><label for="ls_password">密码&nbsp;</label><input id="password" name="password" tabindex="2" class="px vm" type="password" autocomplete="off">
                    &nbsp;
                    <input type="image" src="/BBS/images/login.gif" align="middle" /></input></p></div><div class="login2"></div><div class="login3">
<%if (Config.IsRegisterAllowed){%><p><a id="a_register" class="register" href="javascript:void(0);">注册新用户</a></p><%}%>
<p><a id="a_forget" href="javascript:void(0);">忘记密码？</a></p></div><div style="clear:both"></div></div></div></form><!-- denglu start --><div class="denglu" style="float:right;"><%=UserUtils.DengLuScript%></div><!-- denglu end --><%}else{%><div id="loggedIn"><div class="use_img"><a href="/BBS/my/avatar.aspx"><img src="<%=UserUtils.GetUserAvatarSmallUrl(UserUtils.UserName)%>" /></a></div><div class="use_left"><div class="use_font"><span class="use_name"><%=UserUtils.UserName%></span> | <a href="<%=UserUtils.GetLogoutUrl(this.Request.RawUrl)%>">退出</a><span class="use_other">积分：
                <%=UserUtils.GetCredits(UserUtils.UserName)%></span><span class="use_other">用户组：
                <%=UserUtils.GetGroupName(UserUtils.UserName)%></span></div><div id="seleMenu" class="pop" collection="Y"><ul><li>
                  <%=GetNameUserMessage() %>
                   <!--<a href="/usercenter/index.aspx#0,4" target="_blank">短消息</a>--></li><li id="liB" class="liB"><a href="/BBS/userlist.aspx">好友</a></li><li id="liC" class="liC libg"><a href="javascript:;">设置</a><div class="seleMenu"><div class="seleLay"></div><div class="seleCon"><p><a href="/BBS/my/avatar.aspx">修改头像</a></p><p><a href="/BBS/my/profile.aspx">个人资料</a></p><p><a href="/BBS/my/credits.aspx">积分</a></p><p><a href="/BBS/my/password.aspx">密码安全</a></p><p><a href="/BBS/my/permission.aspx">用户权限</a></p></div></div></li><li id="liD" class="liD libg"><a href="javascript:;">我的中心</a><div class="seleMenu"><div class="seleLay"></div><div class="seleCon">
<%if (UserUtils.IsModerator){%><p><a href="/BBS/handle.aspx" target="_blank">新帖监控</a></p><%}%>
<p><a href="/BBS/mypost.aspx" target="_blank">我的帖子</a></p>
<%if (Config.IsSpace){%><p><a href="<%=UserUtils.GetUserUrl(UserUtils.UserName)%>" target="_blank">个人空间</a></p><%}%>

<%if (Config.IsAsk){%><p><a href="/ask/" target="_blank">问答</a></p><%}%>
<p><a href="http://www.dev.com/usercenter" target="_blank">用户中心</a></p>
<%if (Config.IsFullScreen){%><link href="/BBS/css/fullscreen.css" rel="stylesheet" type="text/css"><p><a href="javascript:;" onclick="userConfig('fullscreen', 'false');return false;">切换到窄版</a></p></link><%}else{%><p><a href="javascript:;" onclick="userConfig('fullscreen', 'true');return false;">切换到宽版</a></p><%}%>
</div></div></li></ul></div></div></div><%}%>

    </div>
    <div class="nav_fu">
      <ul>
        <li><a href="/BBS/forums/2.aspx" style="" target="">产品发布区</a></li><li>|</li><li><a href="/BBS/forums/6.aspx" style="" target="">SiteServer CMS 答疑</a></li>
      </ul>
      <div class="search">
        <form action="/BBS/search.aspx">
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
    <span class="share_right"><a href="/BBS/search.aspx?orderBy=addDate&totalNum=100">查看新帖</a>|<a href="/BBS/search.aspx?type=digest&totalNum=100">精华帖</a>|<a href="/BBS/search.aspx?type=image&totalNum=100">图片贴</a></span>
    <div class="share_p"><img src="../images/ico_position.gif" />
            <a href="/BBS/">SiteServer BBS 论坛</a>><a href="/BBS/forums/746.aspx">SiteServer CMS内容管理系统</a>
          </div>
  </div>
        <!--子版块开始-->
        <div class="share_area sha_bot_line" style="margin-bottom:10px;"><div class="share_tit"><span class="y"></span><h2><a href="/BBS/forums/746.aspx">SiteServer CMS内容管理系统</a></h2></div><div class="share_table sha_bot_line"><table cellspacing="0" align="Center" style="width:100%;border-collapse:collapse;">
	<tr>
		<td class="fl_g" align="left" valign="top" style="width:33.3%;"><div class="fl_icn_g"><a href="/BBS/forums/747.aspx">
<%if (ForumUtils.IsNewThread(747)){%><img src="../images/forum_new.gif" /><%}else{%><img src="../images/forum.gif" /><%}%>
</a></div><dl><dt><a href="/BBS/forums/747.aspx"><strong>Siteserver CMS答疑</strong></a><em class="xi1"> 
                    (<%=ForumUtils.GetTodayThreadAndPostCount(747)%>)
                     </em></dt><dd><em>主题:
                      <%=ForumUtils.GetThreadCount(747)%></em>，<em>帖数:
                      <%=ForumUtils.GetPostCount(747)%></em></dd><dd><%=ForumUtils.GetLastDate(747)%></dd></dl></td><td class="fl_g" align="left" valign="top" style="width:33.3%;"><div class="fl_icn_g"><a href="/BBS/forums/749.aspx">
<%if (ForumUtils.IsNewThread(749)){%><img src="../images/forum_new.gif" /><%}else{%><img src="../images/forum.gif" /><%}%>
</a></div><dl><dt><a href="/BBS/forums/749.aspx"><strong>教程发布中心</strong></a><em class="xi1"> 
                    (<%=ForumUtils.GetTodayThreadAndPostCount(749)%>)
                     </em></dt><dd><em>主题:
                      <%=ForumUtils.GetThreadCount(749)%></em>，<em>帖数:
                      <%=ForumUtils.GetPostCount(749)%></em></dd><dd><%=ForumUtils.GetLastDate(749)%></dd></dl></td><td class="fl_g" align="left" valign="top" style="width:33.3%;"><div class="fl_icn_g"><a href="/BBS/forums/751.aspx">
<%if (ForumUtils.IsNewThread(751)){%><img src="../images/forum_new.gif" /><%}else{%><img src="../images/forum.gif" /><%}%>
</a></div><dl><dt><a href="/BBS/forums/751.aspx"><strong>模板下载区</strong></a><em class="xi1"> 
                    (<%=ForumUtils.GetTodayThreadAndPostCount(751)%>)
                     </em></dt><dd><em>主题:
                      <%=ForumUtils.GetThreadCount(751)%></em>，<em>帖数:
                      <%=ForumUtils.GetPostCount(751)%></em></dd><dd><%=ForumUtils.GetLastDate(751)%></dd></dl></td>
	</tr><tr>
		<td class="fl_g" align="left" valign="top" style="width:33.3%;"><div class="fl_icn_g"><a href="/BBS/forums/748.aspx">
<%if (ForumUtils.IsNewThread(748)){%><img src="../images/forum_new.gif" /><%}else{%><img src="../images/forum.gif" /><%}%>
</a></div><dl><dt><a href="/BBS/forums/748.aspx"><strong>系统BUG报告</strong></a><em class="xi1"> 
                    (<%=ForumUtils.GetTodayThreadAndPostCount(748)%>)
                     </em></dt><dd><em>主题:
                      <%=ForumUtils.GetThreadCount(748)%></em>，<em>帖数:
                      <%=ForumUtils.GetPostCount(748)%></em></dd><dd><%=ForumUtils.GetLastDate(748)%></dd></dl></td><td class="fl_g" align="left" valign="top" style="width:33.3%;"><div class="fl_icn_g"><a href="/BBS/forums/750.aspx">
<%if (ForumUtils.IsNewThread(750)){%><img src="../images/forum_new.gif" /><%}else{%><img src="../images/forum.gif" /><%}%>
</a></div><dl><dt><a href="/BBS/forums/750.aspx"><strong>模板交流区</strong></a><em class="xi1"> 
                    (<%=ForumUtils.GetTodayThreadAndPostCount(750)%>)
                     </em></dt><dd><em>主题:
                      <%=ForumUtils.GetThreadCount(750)%></em>，<em>帖数:
                      <%=ForumUtils.GetPostCount(750)%></em></dd><dd><%=ForumUtils.GetLastDate(750)%></dd></dl></td><td class="fl_g" align="left" valign="top" style="width:33.3%;"><div class="fl_icn_g"><a href="/BBS/forums/752.aspx">
<%if (ForumUtils.IsNewThread(752)){%><img src="../images/forum_new.gif" /><%}else{%><img src="../images/forum.gif" /><%}%>
</a></div><dl><dt><a href="/BBS/forums/752.aspx"><strong>采集规则共享</strong></a><em class="xi1"> 
                    (<%=ForumUtils.GetTodayThreadAndPostCount(752)%>)
                     </em></dt><dd><em>主题:
                      <%=ForumUtils.GetThreadCount(752)%></em>，<em>帖数:
                      <%=ForumUtils.GetPostCount(752)%></em></dd><dd><%=ForumUtils.GetLastDate(752)%></dd></dl></td>
	</tr>
</table></div></div>
        <!--子版块结束-->
        
      </div>
<div class="hd">
  <div class="footer">
    <p>
    
    </p>
    <p id="copyright">Powered by <strong><a href="http://bbs.siteserver.cn">SiteServer BBS</a></strong> V3.6.1 © 2003-2013 <a href="http://www.siteserver.cn">Bairongsoft Corporation</a>.</p>
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
                <p> <strong><a onclick="if (!alertCheckBoxCollection(document.getElementsByName('threadIDArray'), '请选择主题进行操作')){showDialog('/BBS/dialog/delete.aspx?action=DeleteThread&forumID=746' + '&threadIDArray=' + getCheckBoxCollectionValue(document.getElementsByName('threadIDArray')),260, 300, '删除主题', '');}return false;" class="xg3" href="javascript:;">删除</a></strong> <span class="pipe">|</span><strong><a onclick="if (!alertCheckBoxCollection(document.getElementsByName('threadIDArray'), '请选择主题进行操作')){showDialog('/BBS/dialog/translate.aspx?forumID=746' + '&threadIDArray=' + getCheckBoxCollectionValue(document.getElementsByName('threadIDArray')),300, 360, '移动主题', '');}return false;" class="xg3" href="javascript:;">移动</a></strong> <span class="pipe">|</span><strong><a onclick="failureMessage('该板块没有设置主题分类');" class="xg3" href="javascript:;">分类</a></strong> </p>
                <p> <a onclick="if (!alertCheckBoxCollection(document.getElementsByName('threadIDArray'), '请选择主题进行操作')){showDialog('/BBS/dialog/highlight.aspx?action=top&forumID=746' + '&threadIDArray=' + getCheckBoxCollectionValue(document.getElementsByName('threadIDArray')),460, 400, '主题管理', '');}return false;" class="xi1" href="javascript:;">置顶</a> <span class="pipe">|</span> <a onclick="if (!alertCheckBoxCollection(document.getElementsByName('threadIDArray'), '请选择主题进行操作')){showDialog('/BBS/dialog/highlight.aspx?action=digest&forumID=746' + '&threadIDArray=' + getCheckBoxCollectionValue(document.getElementsByName('threadIDArray')),460, 400, '主题管理', '');}return false;" class="xi1" href="javascript:;">精华</a> <span class="pipe">|</span> <a onclick="if (!alertCheckBoxCollection(document.getElementsByName('threadIDArray'), '请选择主题进行操作')){showDialog('/BBS/dialog/highlight.aspx?action=highlight&forumID=746' + '&threadIDArray=' + getCheckBoxCollectionValue(document.getElementsByName('threadIDArray')),460, 400, '主题管理', '');}return false;" class="xi1" href="javascript:;">高亮</a> <span class="pipe">|</span> <a onclick="if (!alertCheckBoxCollection(document.getElementsByName('threadIDArray'), '请选择主题进行操作')){showDialog('/BBS/dialog/upDown.aspx?forumID=746' + '&threadIDArray=' + getCheckBoxCollectionValue(document.getElementsByName('threadIDArray')),300, 360, '提升下沉', '');}return false;" class="xg3" href="javascript:;">升降</a> <span class="pipe">|</span> <a onclick="if (!alertCheckBoxCollection(document.getElementsByName('threadIDArray'), '请选择主题进行操作')){showDialog('/BBS/dialog/lock.aspx?forumID=746' + '&threadIDArray=' + getCheckBoxCollectionValue(document.getElementsByName('threadIDArray')),300, 360, '锁定', '');}return false;" class="xg3" href="javascript:;">锁定</a> <span class="pipe">|</span> <a onclick="if (!alertCheckBoxCollection(document.getElementsByName('threadIDArray'), '请选择主题进行操作')){showDialog('/BBS/dialog/ban.aspx?forumID=746&action=BanThreads' + '&threadIDArray=' + getCheckBoxCollectionValue(document.getElementsByName('threadIDArray')),300, 360, '屏蔽帖子', '');}return false;" class="xg3" href="javascript:;">屏蔽</a> </p>
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
	base.forumID = 746;
	base.OnLoad(e);
}
</script>
<script type="text/javascript" language="javascript">document.ondblclick=function(x){location.href = 'http://www.dev.com/siteserver/bbs/background_utils.aspx?type=CreatePage&directoryName=template&fileName=forum.aspx&forumID=746';}</script>
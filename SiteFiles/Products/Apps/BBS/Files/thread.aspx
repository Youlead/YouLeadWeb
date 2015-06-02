<%@ Page language="c#" Inherits="SiteServer.BBS.Pages.ThreadPage" EnableViewState="false" %>
<%@ Import namespace="SiteServer.BBS.Core" %>
<%@ Import namespace="SiteServer.BBS.Model" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=base.threadInfo.Title%>- SiteServer BBS 论坛 - Powered by SiteServer BBS</title>
<meta name="keywords" content="<%=base.threadInfo.Title%>" />
<meta name="description" content="<%=base.threadInfo.Title%>" />
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

<%if (UserUtils.IsAllowReplyPost){%><script type="text/javascript" src="editor/kindeditor-min.js"></script><script type="text/javascript" src="js/editor.js"></script><script type="text/javascript" src="js/jquery-jtemplates.js"></script><script type="text/javascript">
function gotoAdvancedUrl() {
	Storage.save('title', $('#title', $('#addPostForm')).val());
	Storage.save('content', $('#content', $('#addPostForm')).val());
	location.href = '<%=base.GetUrl("replyUrl")%>';
}
KE.show({
	id : 'content',
	imageUploadJson : '/bbs_test/editor/upload_json.ashx?publishmentSystemID=866',
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
    <div class="share_p"><img src="images/ico_position.gif" />
      <%=GetLocation()%>
    </div>
  </div>
  <div class="post_bar">
    <div class="post_function"><span class="posting" id="posting1"><a href="<%=base.GetUrl("addPostUrl")%>">发 帖</a></span><span class="reply"><a href="javascript:void(0);" onclick="<%=base.GetUrl("replyThread")%>">回 复</a></span></div>
    <%if (base.pagerInfo != null){%>
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
      
<script type="text/javascript">
function postManage(){
	this.checknum = function(all){
		var a = b = 0;
		var selected = '';
		var check = document.getElementsByName('postIDArray');
		for (var i=0; i<check.length; i++) {
			if(!all && check[i].checked) {
				selected += '&postIDArray[' + a + ']=' + check[i].value;
				a++;
			}else if(all == 1){
				check[i].checked = true;
				a++;
			}else if(all == 2){
				check[i].checked = false;
				b++;
			}else{
				b++;
			}
		}
		return new Array(a,b,selected);
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
	}
	this.checkall = function(obj){
		var allType = 1;//1全选，2取消全选
		if(!obj.checked)allType = 2;
		this.checkinfo = this.checknum(allType);
		this.setCounter(this.checkinfo[0]);
	}
}
var postManage = new postManage;
</script>

<div id="postManagerPop" style="display:none" class="popout">
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
            <div style="width:220px;">
              <div class="popTop" style="cursor:move;" onmousedown = "read.move(event);"> <a href="javascript:void(0)" class="adel" onclick="closep()">关闭</a> <span class="mr20">选中<strong class="xi1" id="select_count">1</strong>篇</span> </div>
              <div class="popContent">
                <p><a href="javascript:;" onclick="<%=base.GetUrl("deletePost")%>" class="mr5">删除</a> <span class="pipe">|</span>
                 <a href="javascript:;" onclick="<%=base.GetUrl("upDownPost")%>" class="mr5">升降</a> <span class="pipe">|</span>
                  <a href="javascript:;" onclick="<%=base.GetUrl("banPost")%>" title="屏蔽单帖" class="mr5">屏蔽</a>
                  
                  <span class="pipe">|</span>
                  <a href="javascript:;" onclick="<%=base.GetUrl("disableUser")%>" class="mr5" id="disableUser">禁止用户</a>
                 
                  </p>
              </div>
              <div class="popBottom cc">
                <label class="fl">
                  <input type="checkbox" onclick="postManage.checkall(this);" value="" id="ajaxall" name="ajaxall">
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
</div>
<!-- //end reply管理弹出 -->

      <table cellspacing="0" cellpadding="0" class="plh">
        <tr>
          <td class="pls"><div class="hm post_num"><span class="xg1">阅读:</span>
              <%=base.threadInfo.Hits%>
              <span class="pipe">|</span><span class="xg1">回复:</span>
              <%=base.threadInfo.Replies%>
            </div></td>
          <td class="ts"><div class="post_spe_rig">
              <input id="floor" type="text" class="jfl_px"/>
              <a href="javascript:;" onclick="gotoFloor($('#floor').val());return false;"><img src="images/flbg.gif" border="0" /></a></div>
            <h1><img src="images/ico_post_tit.gif" />
              <%=base.threadInfo.Title%>
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
                  
<%if (base.pollInfo != null){%><style type="text/css" media="screen">
fieldset { border: 0px; margin: 0px; outline-style: none; outline-color: invert; padding: 0px; }
.onvote_info { line-height: 18px; margin: 15px 0px; }
.onvote_info input { border: medium none; }
.onvote_info .oi_input { text-align: center; }
.onvote_info th { padding-bottom: 3px; padding-left: 0px; padding-right: 0px; padding-top: 3px; font-style: normal; font-weight: normal; }
.onvote_info td { padding-bottom: 3px; padding-left: 0px; padding-right: 0px; padding-top: 3px; }
.onvote_info th.oi_text { text-align: right; padding-bottom: 3px; padding-left: 8px; padding-right: 8px; word-wrap: break-word; height: 26px; padding-top: 3px; }
.oi_numline1, .oi_numline2, .oi_numline3, .oi_numline4, .oi_numline5 { background: url(/bbs_test/images/poll/public_bg_01.png) no-repeat; float: left; height: 12px; overflow: hidden; }
.oi_numline1 span, .oi_numline2 span, .oi_numline3 span, .oi_numline4 span, .oi_numline5 span { background: url(/bbs_test/images/poll/public_bg_01.png) no-repeat; float: left; height: 12px; overflow: hidden; }
.oi_numline { width: 180px; background: url(/bbs_test/images/poll/public_bg_03.png) no-repeat left center; height: 12px; overflow: hidden; }
.oi_numline1 { background-position: right -24px; }
.oi_numline1 span { width: 100%; background-position: left -12px; }
.oi_numline2 { background-position: right -48px; }
.oi_numline2 span { width: 100%; background-position: left -36px; }
.oi_numline3 { background-position: right -72px; }
.oi_numline3 span { width: 100%; background-position: left -60px; }
.oi_numline4 { background-position: right -96px; }
.oi_numline4 span { width: 100%; background-position: left -84px; }
.oi_numline5 { background-position: right -120px; }
.oi_numline5 span { width: 100%; background-position: left -108px; }
.onvote_info td.oi_num { padding-left: 7px; width: 100px; padding-right: 7px; }
.oi_num span { padding-bottom: 0px; padding-left: 2px; padding-right: 2px; color: #9b9b9b; padding-top: 0px; }
.oi_right { width: 16px; display: inline-block; background: url(/bbs_test/images/poll/vote_ico.png) no-repeat 2px -51px; height: 12px; }
.onvote_btn { text-align: right; padding-bottom: 10px; padding-left: 0px; padding-right: 226px; font-size: 14px; padding-top: 0px; }
.onvote_btn01 { border: medium none; text-align: center; padding-bottom: 0px; line-height: 28px; padding-left: 0px; width: 71px; padding-right: 0px; background: url(/bbs_test/images/poll/public_btn_01.png) no-repeat; height: 28px; font-size: 12px; overflow: hidden; cursor: pointer; font-weight: 700; padding-top: 0px; }
.onvote_btn01 { background-position: 0px 0px; color: #fff; }
.vote_main { margin:10px 0; padding: 0; width: 600px; font-family: Arial, Helvetica, sans-serif; color: #000; font-size: 12px; }
.onvote_infocontsp { padding: 10px; background-color:white; }
.onvote_infocontsp .onvote_info tr { cursor: pointer; }
.onvote_infocontsp .onvote_info .oi_input { width: 24px; }
.onvote_infocontsp .oi_text { text-align: right; padding-right: 12px; color: #414141; }
.onvote_infocontsp td.oi_num { padding-bottom: 3px; padding-left: 12px; width: 114px; padding-right: 12px; padding-top: 3px; }
.onvote_infocontsp td.oi_input { padding-bottom: 0px; padding-left: 0px; padding-right: 30px; padding-top: 0px; }
.onvote_infocontsp .onvote_btn { padding-bottom: 10px; padding-left: 0px; padding-right: 28px; padding-top: 0px; }
.onvote_infocontsp .onvote_btn .onvote_btnc { border: medium none; vertical-align: middle; }
.onvote_infocontsp .onvote_btn label { margin: 0px 10px 0px 5px; font-size: 12px; cursor: pointer; }
.onvote_infocontsp .onvote_btn01 { font-size: 14px; }
.onvote_btn input { border-bottom: 0px; border-left: 0px; border-top: 0px; border-right: 0px; }
.onvote_btn02 { border-bottom: medium none; text-align: center; border-left: medium none; padding-bottom: 0px; line-height: 28px; padding-left: 0px; width: 71px; padding-right: 0px; background: url(/bbs_test/images/poll/public_btn_01.png) no-repeat; height: 28px; font-size: 12px; overflow: hidden; border-top: medium none; cursor: pointer; font-weight: 700; border-right: medium none; padding-top: 0px; }
.onvote_btn02 { background-position: 0px -56px; color: #959595; }
.onvote_info tr { position: relative; }
.onvote_infotip { text-align: center; line-height: 30px; margin: 15px auto 0px; padding-left: 8px; width: 166px; background: url(/bbs_test/images/poll/public_bg_04.png) no-repeat left center; height: 30px; color: #575757; }
</style><div class="vote_main"><div class="onvote_infocontsp">
<%if (!base.isPolled && !base.pollInfo.IsOverTime && base.pollInfo.IsVoteFirst){%><div id="poll_tip" class="onvote_infotip"> 投票后才能查看结果 </div><%}%>
<form onsubmit="onPollSubmit(this);return false;" action="/bbs_test/ajax/form.aspx?publishmentSystemID=866&action=poll" method="post"><input id="threadID" name="threadID" type="hidden" value="<%=base.threadID%>" /><fieldset><table id="optwrap" class="onvote_info" cellSpacing="0" cellPadding="0" width="100%"><tbody><asp:Literal ID="ltlPollTrs" runat="server"></asp:Literal></tbody></table>
<%if (!UserUtils.IsAnonymous){%>
<%if (base.isPolled){%><div class="onvote_btn"><a href="javascript:;"><input style="CURSOR: default" class="onvote_btn02" type="button" value="已投票" /></a></div><%}else{%>
<%if (base.pollInfo.IsOverTime){%><div class="onvote_btn"><a href="javascript:;"><input style="CURSOR: default" class="onvote_btn02" type="button" value="已结束" /></a></div><%}else{%><p class="oi_text" style="text-align:center"><span>有效期：<%=base.pollInfo.AddDate.ToString("yyyy年MM月dd日 HH:mm")%> -- <%=base.pollInfo.Deadline.ToString("yyyy年MM月dd日 HH:mm")%></span></p><div class="onvote_btn"><span><input id="anonymous" class="onvote_btnc" type="checkbox" name="anonymous" value="on" /><label for="anonymous">匿名</label></span><input class="onvote_btn01" type="submit" value="投票" /></div><%}%>
<%}%>
<%}%>
</fieldset></form></div></div><%}%>


                  <asp:Literal ID="ltlAttachment" runat="server"></asp:Literal>
                </div>
                <asp:PlaceHolder ID="phThreadPost" runat="server" Visible="false">
                  <div class="post_share"> <strong>分享:</strong>&nbsp;&nbsp; <a href="javascript:(function(){window.open('http://v.t.sina.com.cn/share/share.php?title='+encodeURIComponent('<%=base.threadInfo.Title%> - SiteServer BBS 论坛')+'&url='+encodeURIComponent(location.href)+'&source=bookmark','_blank','width=450,height=400');})()" title="分享到新浪微博"><img src="images/sinaweibo.png" width="16" height="16" align="absmiddle" />&nbsp;新浪微博</a> <a href="javascript:void(0)" onclick="window.open( 'http://v.t.qq.com/share/share.php?url='+encodeURIComponent(document.location)+'&appkey=&site=&title='+encodeURI('<%=base.threadInfo.Title%> - SiteServer BBS 论坛'),'', 'width=700, height=680, top=0, left=0, toolbar=no, menubar=no, scrollbars=no, location=yes, resizable=no, status=no' );" title="分享到腾讯微博"><img src="images/qqweibo.png" width="16" height="16" align="absmiddle" />&nbsp;腾讯微博</a> <a href="javascript:void(0);" onclick="window.open('http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?url='+encodeURIComponent(document.location.href));return false;" title="分享到QQ空间"><img src="images/qzone.gif" width="16" height="16" align="absmiddle" />&nbsp;QQ空间</a> </div>
                  
<%if (base.IsManageable()){%><div class="post_manage"><strong>管理:</strong>&nbsp;&nbsp; <a onclick="<%=base.GetUrl("deleteThreadSingle")%>" href="javascript:;">删除</a><span class="pipe">|</span><a onclick="<%=base.GetUrl("translateSingle")%>" href="javascript:;">移动</a><span class="pipe">|</span><a onclick="<%=base.GetUrl("categorySingle")%>" href="javascript:;">分类</a><span class="pipe">|</span><a onclick="<%=base.GetUrl("highlightSingle.top")%>" href="javascript:;">置顶</a><span class="pipe">|</span><a onclick="<%=base.GetUrl("highlightSingle.digest")%>" href="javascript:;">精华</a><span class="pipe">|</span><a onclick="<%=base.GetUrl("highlightSingle.highlight")%>" href="javascript:;">高亮</a><span class="pipe">|</span><a onclick="<%=base.GetUrl("lockSingle")%>" href="javascript:;">锁定</a><span class="pipe">|</span><a onclick="<%=base.GetUrl("banThreadSingle")%>" href="javascript:;">屏蔽</a><span class="pipe">|</span><a onclick="<%=base.GetUrl("identifySingle")%>" href="javascript:;">鉴定</a><span class="pipe">|</span><a href="javascript:;" onclick="<%=base.GetUrl("disableUserSingle")%>" class="mr5" id="disableUser">禁止用户</a></div><%}%>

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
              <%=base.GetNavigation(false)%>
              <span class="pipe">|</span>
              <%=base.GetNavigation(true)%>
            </div></td>
          <td class="zt_line">
<%if (base.IsManageable()){%><div class="post_manage"><strong>管理:</strong>&nbsp;&nbsp; <a onclick="<%=base.GetUrl("deleteThreadSingle")%>" href="javascript:;">删除</a><span class="pipe">|</span><a onclick="<%=base.GetUrl("translateSingle")%>" href="javascript:;">移动</a><span class="pipe">|</span><a onclick="<%=base.GetUrl("categorySingle")%>" href="javascript:;">分类</a><span class="pipe">|</span><a onclick="<%=base.GetUrl("highlightSingle.top")%>" href="javascript:;">置顶</a><span class="pipe">|</span><a onclick="<%=base.GetUrl("highlightSingle.digest")%>" href="javascript:;">精华</a><span class="pipe">|</span><a onclick="<%=base.GetUrl("highlightSingle.highlight")%>" href="javascript:;">高亮</a><span class="pipe">|</span><a onclick="<%=base.GetUrl("lockSingle")%>" href="javascript:;">锁定</a><span class="pipe">|</span><a onclick="<%=base.GetUrl("banThreadSingle")%>" href="javascript:;">屏蔽</a><span class="pipe">|</span><a onclick="<%=base.GetUrl("identifySingle")%>" href="javascript:;">鉴定</a><span class="pipe">|</span><a href="javascript:;" onclick="<%=base.GetUrl("disableUserSingle")%>" class="mr5" id="disableUser">禁止用户</a></div><%}%>
</td>
        </tr>
      </table>
    </div>
  </div>
  <div class="post_bar">
    <div class="post_function"><span class="posting" id="posting2"><a href="<%=base.GetUrl("addPostUrl")%>">发 帖</a></span><span class="reply"><a href="javascript:void(0);" onclick="<%=base.GetUrl("replyThread")%>">回 复</a></span></div>
    <%if (base.pagerInfo != null){%>
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

  </div>
  <div class="menuPost" id="menu_post2">
    <ul>
      <li> <a hideFocus="true" href="<%=base.GetUrl("addPostUrl")%>">新 帖</a> </li>
      <li> <a hideFocus="true" href="<%=base.GetUrl("addPollUrl")%>">投 票</a> </li>
    </ul>
  </div>
  <!--发表回复开始-->
  
<%if (IsPostable()){%><form id="addPostForm" onsubmit="onAddPostSubmit(this);return false;" action="/bbs_test/ajax/form.aspx?publishmentSystemID=866&action=addPost" method="post"><input id="forumID" name="forumID" type="hidden" value="<%=base.forumID%>" /><input id="threadID" name="threadID" type="hidden" value="<%=base.threadID%>" /><input id="replies" name="replies" type="hidden" value="<%=base.threadInfo.Replies%>" /><input id="isSignature" name="isSignature" type="hidden" value="true" /><table cellspacing="0" cellpadding="0" class="last_table"><tr><td valign="top" class="post_left"><h3>快速回复</h3><div class="avatar"><a href="<%=UserUtils.GetUserUrl(UserUtils.UserName)%>" target="_blank"><img src="<%=UserUtils.GetUserAvatarMiddleUrl(UserUtils.UserName)%>" width="120" height="120" /></a></div><div class="use_photo"><ul><li>级别： <%=UserUtils.GetGroupName(UserUtils.UserName)%> </li><li id="stars"> <%=UserUtils.GetStars(UserUtils.UserName)%> </li></ul></div></td><td valign="top" style="padding:5px;"><div class="posting_function"><div style="padding:5px;"><input id="title" name="title" type="text" class="txtTitle" value="Re:<%=base.threadInfo.Title%>" /><span class="share_right">&nbsp;<a href="javascript:;" onclick="gotoAdvancedUrl();return false;">高级模式</a></span></div><div style="padding:5px;"><textarea id="content" name="content" cols="100" rows="8" style="width:485px;height:180px;visibility:hidden;"></textarea></div>
<%if (UserUtils.IsVerifyCodePost){%><div style="padding-left:5px;"> 验证码：
                  <input id="verifyCode" name="verifyCode" type="text" class="txtTitle" maxlength="4" style="width:50px;" /><img src="<%=UserUtils.PostVerifyCodeImageUrl%>" /></div><%}%>
<input type="submit" value="提交" class="submit_btn" /></div><div id="face_right" class="face_right"><div id="tabs" class="face_tit"><ul><li class="current"><a id="yoci" href="/bbs_test/ajax/face.aspx?publishmentSystemID=866&faceName=yoci">悠嘻猴</a></li><li><a id="tuzki" href="/bbs_test/ajax/face.aspx?publishmentSystemID=866&faceName=tuzki">兔斯基</a></li><li><a id="oniontou" href="/bbs_test/ajax/face.aspx?publishmentSystemID=866&faceName=oniontou">洋葱头</a></li></ul></div><div id="tab-contents"><div id="tabs-yoci" class="face_info"><a href="javascript:void(0);"><img src="/bbs_test/smile/yoci/一无所有.gif" border="0" /></a><a href="javascript:void(0);"><img src="/bbs_test/smile/yoci/七窍生烟.gif" border="0" /></a><a href="javascript:void(0);"><img src="/bbs_test/smile/yoci/不可以.gif" border="0" /></a><a href="javascript:void(0);"><img src="/bbs_test/smile/yoci/不好意思.gif" border="0" /></a><a href="javascript:void(0);"><img src="/bbs_test/smile/yoci/不懂.gif" border="0" /></a><a href="javascript:void(0);"><img src="/bbs_test/smile/yoci/不给糖就捣蛋.gif" border="0" /></a><a href="javascript:void(0);"><img src="/bbs_test/smile/yoci/不至于吧.gif" border="0" /></a><a href="javascript:void(0);"><img src="/bbs_test/smile/yoci/不行了.GIF" border="0" /></a><a href="javascript:void(0);"><img src="/bbs_test/smile/yoci/不要了拉.gif" border="0" /></a><a href="javascript:void(0);"><img src="/bbs_test/smile/yoci/不要拉.gif" border="0" /></a><a href="javascript:void(0);"><img src="/bbs_test/smile/yoci/乖.gif" border="0" /></a><a href="javascript:void(0);"><img src="/bbs_test/smile/yoci/交给我吧.gif" border="0" /></a><a href="javascript:void(0);"><img src="/bbs_test/smile/yoci/什么问题.gif" border="0" /></a><a href="javascript:void(0);"><img src="/bbs_test/smile/yoci/体操.gif" border="0" /></a><a href="javascript:void(0);"><img src="/bbs_test/smile/yoci/你好.gif" border="0" /></a><a href="javascript:void(0);"><img src="/bbs_test/smile/yoci/健身.gif" border="0" /></a><div class="face_page"><span class="face_cur_page">1</span><a href="/bbs_test/ajax/face.aspx?publishmentSystemID=866&faceName=yoci&page=2">2</a><a href="/bbs_test/ajax/face.aspx?publishmentSystemID=866&faceName=yoci&page=3">3</a><a href="/bbs_test/ajax/face.aspx?publishmentSystemID=866&faceName=yoci&page=4">4</a><a href="/bbs_test/ajax/face.aspx?publishmentSystemID=866&faceName=yoci&page=5">5</a><a href="/bbs_test/ajax/face.aspx?publishmentSystemID=866&faceName=yoci&page=6">6</a><a href="/bbs_test/ajax/face.aspx?publishmentSystemID=866&faceName=yoci&page=7">7</a><a href="/bbs_test/ajax/face.aspx?publishmentSystemID=866&faceName=yoci&page=8">8</a><a href="/bbs_test/ajax/face.aspx?publishmentSystemID=866&faceName=yoci&page=9">9</a></div></div></div></div></td></tr></table></form><%}%>

  <!--发表回复结束--> 
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
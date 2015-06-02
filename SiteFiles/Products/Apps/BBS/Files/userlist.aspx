<%@ Page language="c#" Inherits="SiteServer.BBS.Pages.UserListPage" EnableViewState="false" %>
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
<style type="text/css">
.avator img { width: 48px; height: 48px; padding: 2px; border-top-color: #f2f2f2; border-right-color: #cdcdcd; border-bottom-color: #cdcdcd; border-left-color: #f2f2f2; border-width: 1px; border-style: solid; }
.user { margin-top: 0px; margin-right: -4px; margin-bottom: 10px; margin-left: 0px; }
.user li { width: 155px; height: 58px; overflow: hidden; padding-top: 10px; padding-right: 10px; padding-bottom: 10px; padding-left: 70px; margin-top: 10px; margin-right: 5px; margin-bottom: 0px; margin-left: 5px; border-color: #f3f3f3; border-width: 1px; border-style: solid; float: left; background-color: rgb(249, 249, 249); }
.user H4 { font-size: 1em; line-height:1.5; height: 20px; overflow: hidden; }
.user .avator { margin-left: -60px; position: absolute; }
.adduser { padding-left: 20px; background-image: url("images/adduser.gif"); background-attachment: scroll; background-repeat: no-repeat; background-position-x: 0px; background-position-y: 50%; background-color: transparent; }
.cl:after { height: 0px; clear: both; display: block; visibility: hidden; content: "."; }
.cl { zoom: 1; }
.user .maxh { overflow: hidden; line-height:1.5; }
.xg1 { color: #999; line-height:1.5; }
.xg1 a { color: #999; }
</style>
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
    <div class="share_p"><img src="images/ico_position.gif" /><a href="#">论坛</a>><a href="#">好友</a></div>
  </div>
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td width="21%" valign="top" style="padding-right:10px"><div id="sj1">
          <div id="sj_1">
            <table width="100%" border="0" cellspacing="0" cellpadding="0" height="31">
              <tr>
                <td width="1%"><img src="images/qweqw_03.png" width="6" height="31"  border="0"/></td>
                <td width="98%"><div id="s_bj">好友</div></td>
                <td width="1%" align="right"><img src="images/qweqw_07.png" width="5" height="31"  border="0"/></td>
              </tr>
            </table>
          </div>
          <div id="sj_2">
            <ul>
              <li><a href="online.aspx">在线成员</a></li>
              <li><a class="select" href="userlist.aspx">用户列表</a></li>
            </ul>
          </div>
          <div id="sj_3">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="1%"><img src="images/edit_06.png"  border="0"/></td>
                <td width="98%" style="background-image:url(images/edit_08.png); background-repeat:repeat-x; height:9px;"></td>
                <td width="1%"><img src="images/edit_10.png"  border="0"/></td>
              </tr>
            </table>
          </div>
        </div></td>
      <td width="79%" valign="top"><div class="share_area">
          <div class="share_tit">
            <h3>用户列表</h3>
          </div>
          <div class="share_table" style="padding:0; margin:0; padding-left:5px;">
            <form runat="server" style="padding:0; margin:0;">
              <ul class="user cl">
                <asp:repeater ID="rptUsers" runat="server">
                  <itemtemplate>
                    <li>
                      <div class="avator">
                        <asp:Literal ID="ltlAvator" runat="server"></asp:Literal>
                      </div>
                      <h4>
                        <asp:Literal ID="ltlUserName" runat="server"></asp:Literal>
                      </h4>
                      <P class="maxh"><asp:Literal ID="ltlSignature" runat="server"></asp:Literal></P>
                      <div class=xg1><!--<a title="加为好友" class="adduser">加为好友</a>--><asp:Literal ID="ltlAddon" runat="server"></asp:Literal></div>
                    </li>
                  </itemtemplate>
                </asp:repeater>
              </ul>
              
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

            </form>
          </div>
        </div></td>
    </tr>
  </table>
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

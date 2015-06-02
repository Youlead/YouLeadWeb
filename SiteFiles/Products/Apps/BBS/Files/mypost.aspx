<%@ Page Language="C#" EnableViewState="false" Inherits="SiteServer.BBS.Pages.MyPost" %>

<%@ Import Namespace="SiteServer.BBS.Core" %>
<%@ Import Namespace="SiteServer.BBS.Model" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SiteServer BBS 论坛 - Powered by SiteServer BBS</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=8" />
    <link href="css/share.css" rel="stylesheet" type="text/css" />
    <link href="css/theme.css" rel="stylesheet" type="text/css" />
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
        .noLine td, .noLine th
        {
            border-bottom-width: 0;
        }
        .grayTxt
        {
            font-size: 14px;
            color: #666;
            line-height: 23px;
        }
    </style>
    <script language="javascript" type="text/javascript">
        function _alertCheckBoxCollection(checklist, alertString) {
            var collectionValue = _getCheckBoxCollectionValue(checklist);
            if (collectionValue.length == 0) {
                alert(alertString);
                return true;
            }
            return false;
        }
        var _goto = function (url) {
            window.location.href = url;
        };

        function _isNull(obj) {
            if (typeof (obj) == "undefined")
                return true;
            if (obj == undefined)
                return true;
            if (obj == null)
                return true;
            return false;
        }

        function _getCheckBoxCollectionValue(checklist) {
            var retval = new String("");
            if (!_isNull(checklist)) {
                if (_isNull(checklist.length)) {
                    if (checklist.checked) {
                        retval = checklist.value + '';
                    }
                } else {
                    var hasValue = false;
                    for (var i = 0; i < checklist.length; i++) {
                        if (checklist[i].checked) {
                            hasValue = true;
                            retval += checklist[i].value + ',';
                        }
                    }
                    if (hasValue) {
                        retval = retval.substring(0, retval.length - 1);
                    }
                }
            }
            return retval;
        } 
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
        <div id="ad_navbanner" class="adv_area">
        </div>
    </div>
    <div class="hd">
        <div class="share_position">
            <div class="share_p">
                <img src="images/ico_position.gif" /><a href="#">论坛</a>><a href="#">我的帖子</a>
            </div>
        </div>
        <div class="main thread">
            <div class="post_bar">
                <div class="post_function">
                </div>
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
            <div class="nav_thread">
                <ul>
                    <li class="thr_current">我的帖子 </li>
                </ul>
                <div class="nav_rig_info">
                </div>
            </div>
            <div class="th">
                <table cellspacing="0" cellpadding="0" class="th">
                    <tr>
                        <td align="center" style="width: 20px;">
                        </td>
                        <td>
                            &nbsp;标题(共有<span style="color: red">
                                <asp:Literal ID="ltlCount" runat="server"></asp:Literal>
                            </span>篇帖子)
                        </td>
                        <td style="width: 100px;">
                            &nbsp;板块
                        </td>
                        <td style="width: 100px;">
                            &nbsp;作者
                        </td>
                        <td style="width: 120px;" align="center">
                            &nbsp;发布时间
                        </td>
                    </tr>
                </table>
            </div>
            <div class="thread_out" style="border: 1px solid #dadada; padding: 10px; background: url(images/info_table_bg.gif) repeat-x left top;">
                <table border="0" class="info_table" style="table-layout: fixed">
                    <asp:Repeater ID="rptPosts" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td align="center" style="width: 20px;">
                                    <input type="checkbox" name="IDCollection" value='<%#DataBinder.Eval(Container.DataItem, "ThreadID")%>' />
                                </td>
                                <td style="line-height: 28px;">
                                    <asp:Literal ID="ltlTitle" runat="server"></asp:Literal>
                                    <br />
                                    <asp:Literal ID="ltlContent" runat="server"></asp:Literal>
                                </td>
                                <td style="width: 100px;">
                                    <asp:Literal ID="ltlChannel" runat="server"></asp:Literal>
                                </td>
                                <td style="width: 100px;">
                                    <asp:Literal ID="ltlUserName" runat="server"></asp:Literal>
                                </td>
                                <td style="width: 90px;">
                                    &nbsp;
                                    <asp:Literal ID="ltlAddDate" runat="server"></asp:Literal>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </table>
            </div>
            <div class="post_bar">
                <div class="post_function">
                </div>
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

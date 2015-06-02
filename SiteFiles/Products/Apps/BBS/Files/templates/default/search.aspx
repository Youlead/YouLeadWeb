<%@ Page Language="c#" Inherits="SiteServer.BBS.Pages.SearchPage" EnableViewState="false" %>

<%@ Import Namespace="SiteServer.BBS.Core" %>
<%@ Import Namespace="SiteServer.BBS.Model" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>{bbs.BBSName}</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=8" />
    <link href="css/share.css" rel="stylesheet" type="text/css" />
    <link href="css/theme.css" rel="stylesheet" type="text/css" />
    <bbs:include file="include/css_js.html"></bbs:include>
    <script type="text/javascript">
        $(document).ready(function () {
            $('.searchIpt').focus(function () {
                if (this.value == '请输入搜索条件') this.value = '';
            }).blur(function () {
                if (this.value == '') this.value = '请输入搜索条件';
            });
        });
    </script>
    <style type="text/css">
        .searchIpt
        {
            width: 20em;
            font-size: 1.5em;
            height: 26px;
            padding-left: 5px;
            margin-right: 5px;
        }
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
</head>
<body>
    <bbs:include file="include/header.html"></bbs:include>
    <div class="hd">
        <div id="ad_navbanner" class="adv_area">
        </div>
    </div>
    <div class="hd">
        <div class="share_position">
            <bbs:include file="include/shareRight.html"></bbs:include>
            <div class="share_p">
                <img src="images/ico_position.gif" /><a href="#">论坛</a>><a href="search.aspx">搜索</a>
            </div>
        </div>
        <bbs:if testtype="ParentsCount" testoperate="NotEquals" testvalue="1">
    <div class="main thread">
      <div class="post_bar">
        <div class="post_function">
          <form action="{bbs.bbsUrl}/search.aspx">
            <table border="0" cellspacing="2" cellpadding="2" width="500">
              <tr>
                <td width="400"><input type="text" id="word" name="word" value="<%=base.word%>" class="searchIpt" /></td>
                <td width="100" align="right" valign="middle"><input type="submit" class="regi_button" value="搜 索" /></td>
              </tr>
            </table>
          </form>
        </div>
        <bbs:include file="include/pager.html"></bbs:include>
      </div>
      <div class="nav_thread">
        <ul>
          <li class="thr_current"><asp:Literal ID="ltlText" runat="server"></asp:Literal></li>
        </ul>
        <div class="nav_rig_info"><a href="?type=digest">精华</a> | <a href="?type=image">图片贴</a>&nbsp;&nbsp;</div>
      </div>
      <div class="th">
        <table cellspacing="0" cellpadding="0" class="th">
          <tr>
            <td width="66%"><div class="tf"> 排序:
                <bbs:run if="base.orderBy == 'addDate'">
                  <bbs:successTemplate><a href="?orderBy=lastDate" class="showmenu" >最后回复</a> <a href="?orderBy=addDate" class="xi4">最新发帖</a> </bbs:successTemplate>
                  <bbs:failureTemplate><a href="?orderBy=lastDate" class="xi4" >最后回复</a> <a href="?orderBy=addDate" class="showmenu">最新发帖</a> </bbs:failureTemplate>
                </bbs:run>
                <span class="pipe">|</span>类型: <a href="#" class="xi4">全部主题</a> <a href="#" class="showmenu">投票</a></div></td>
            <td width="14%" class="by">&nbsp;&nbsp;&nbsp;作者</td>
            <td width="6%" class="num">&nbsp;回复</td>
            <td width="14%" class="by">&nbsp;最后发表</td>
          </tr>
        </table>
      </div>
      <div class="thread_out" style="border:1px solid #dadada;padding:10px; background:url(images/info_table_bg.gif) repeat-x left top;">
        <table border="0" class="info_table">
          <asp:repeater ID="rptThreads" runat="server">
            <itemtemplate>
              <asp:Literal ID="ltlTr" runat="server"></asp:Literal>
              <td class="folder"><asp:Literal ID="ltlIcon" runat="server"></asp:Literal></td>
                <th class="new" id="title_{bbs.item.id}" width="65%"> <asp:Literal ID="ltlTitle" runat="server"></asp:Literal></th>
                <td width="14%" class="by"><em>
                  <asp:HyperLink ID="hlUserName" runat="server"></asp:HyperLink>
                  </em>
                  <div class="thread_number">
                    <asp:Literal ID="ltlAddDate" runat="server"></asp:Literal>
                  </div></td>
                <td width="6%" class="num"><asp:HyperLink ID="hlReplies" CssClass="xg3" runat="server"></asp:HyperLink>
                  <div class="thread_number"> {bbs.item.hits} </div></td>
                <td width="14%" class="by"><em>
                  <asp:HyperLink ID="hlLastUserName" runat="server"></asp:HyperLink>
                  </em>
                  <div class="thread_number">
                    <asp:Literal ID="ltlLastDate" runat="server"></asp:Literal>
                  </div></td>
              </tr>
              <asp:PlaceHolder ID="phContent" runat="server">
                <tr>
                  <td class="folder"></td>
                  <td colspan="6" class="grayTxt"><asp:Literal ID="ltlContent" runat="server"></asp:Literal></td>
                </tr>
              </asp:PlaceHolder>
            </itemtemplate>
          </asp:repeater>
        </table>
      </div>
      <div class="post_bar">
        <bbs:include file="include/pager.html"></bbs:include>
      </div>
    </div>
  </bbs:if>
    </div>
    <bbs:include file="include/footer.html"></bbs:include>
    <bbs:include file="include/dialog.html"></bbs:include>
</body>
</html>
